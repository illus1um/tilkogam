{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the homepage
 * @uses $issue Issue Current issue
 * @uses $issueIdentificationString string issue identification that relies on user's settings
 *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<main class="container main__content page-home" id="main">
	<section class="home-hero">
		{if $homepageImage}
			<figure class="home-hero__image-wrap">
				<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:'url'}"{if $homepageImage.altText} alt="{$homepageImage.altText|escape}"{/if} class="img-fluid" />
			</figure>
		{/if}

		<div class="home-hero__grid">
			{if $journalDescription}
				<article class="home-hero__about card-shell">
					<p class="eyebrow">{$displayPageHeaderTitle|escape}</p>
					<h1 class="home-hero__title">{translate key="about.aboutContext"}</h1>
					<div class="home-hero__text">
						{$journalDescription|strip_unsafe_html|truncate:520}
					</div>
					<div class="home-hero__actions">
						{capture assign="aboutPageUrl"}{url router=$smarty.const.ROUTE_PAGE page="about"}{/capture}
						<a href="{$aboutPageUrl}" class="btn btn-primary">{translate key="common.more"}</a>
						<a href="{url page='about' op='submissions'}" class="btn btn-secondary">{translate key="about.submissions"}</a>
					</div>
					<ul class="home-hero__facts">
						<li>KZ / RU / EN</li>
						<li>4 issues per year</li>
						<li>Open Access</li>
					</ul>
				</article>
			{/if}

			{if $announcements|@count}
				<aside class="home-hero__announcements card-shell">
					<div class="home-announcements__head">
						<p class="eyebrow">{translate key="announcement.announcements"}</p>
						<h2>{translate key="announcement.announcements"}</h2>
					</div>
					<div class="home-announcements__list">
						{assign var="displayAnnouncements" value=$numAnnouncementsHomepage}
						{if !$displayAnnouncements || $displayAnnouncements < 1}
							{assign var="displayAnnouncements" value=3}
						{/if}
						{foreach name=announcements from=$announcements item=announcement}
							{if $smarty.foreach.announcements.iteration > $displayAnnouncements}
								{break}
							{/if}
							<article class="home-announcement-card{if $announcement@first} is-featured{/if}">
								<p class="metadata">{$announcement->getDatePosted()|date_format:$dateFormatLong}</p>
								<h3>{$announcement->getLocalizedTitle()|escape}</h3>
								<p>{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html|truncate:170}</p>
								{capture assign="announcementPageUrl"}{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}{/capture}
								<a href="{$announcementPageUrl}" class="home-announcement-card__link">{translate key="common.readMore"} &rarr;</a>
							</article>
						{/foreach}
					</div>
				</aside>
			{/if}
		</div>
	</section>

	<section class="home-current-issue">
		{call_hook name="Templates::Index::journal"}
		{if $issue}
			{include file="frontend/objects/issue_toc.tpl"}
		{else}
			<div class="card-shell home-empty-state">
				<h2>{translate key="current.noCurrentIssue"}</h2>
				<p>{translate key="current.noCurrentIssueDesc"}</p>
			</div>
		{/if}
	</section>

	{if ($recentIssues && !empty($recentIssues))}
		<section class="home-recent-issues card-shell">
			<div class="section-heading">
				<p class="eyebrow">{translate key="plugins.themes.pragma.issues.recent"}</p>
				<h2>{translate key="plugins.themes.pragma.issues.recent"}</h2>
			</div>
			<div class="row home-recent-issues__grid">
				{foreach from=$recentIssues item=recentIssue}
					<article class="col-sm-6 col-lg-4 archived-issue archived-issue--recent">
						{include file="frontend/objects/issue_summary.tpl" issue=$recentIssue}
					</article>
				{/foreach}
			</div>
		</section>
	{/if}

	{if $additionalHomeContent}
		<section class="home-additional card-shell">
			{$additionalHomeContent|strip_unsafe_html}
		</section>
	{/if}
</main>

{include file="frontend/components/footer.tpl"}
