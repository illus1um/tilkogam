{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedArticles array Lists of articles published in this issue sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $sectionHeading string Tag to use (h2, h3, etc) for section headings
 *}

<section class="issue-toc card-shell">
	<header class="issue-toc__hero">
		<div class="issue-toc__header">
			{if $requestedOp === "index"}
				<p class="eyebrow">{translate key="journal.currentIssue"}</p>
			{/if}

			{capture assign="issueVolumeNumber"}
				{if $issue->getShowVolume()}
					{translate key="issue.volume"} {$issue->getVolume()|escape}
				{/if}
				{if $issue->getShowNumber()}
					{if $issue->getShowVolume()}, {/if}{translate key="issue.no"} {$issue->getNumber()|escape}
				{/if}
			{/capture}

			{if $issueVolumeNumber|trim !== ''}
				<p class="issue-toc__volume-number">{$issueVolumeNumber}</p>
			{/if}

			{if $issue->getShowTitle()}
				{if $requestedPage === "issue"}
					<h1 class="issue-toc__title">{$issue->getLocalizedTitle()|escape}</h1>
				{else}
					<h2 class="issue-toc__title">{$issue->getLocalizedTitle()|escape}</h2>
				{/if}
			{/if}

			{if $issue->getDatePublished()}
				<p class="metadata">{translate key="submissions.published"} {$issue->getDatePublished()|date_format:$dateFormatLong}</p>
			{/if}

			{if $issue->getLocalizedDescription()}
				<div class="issue-toc__description">
					{assign var="stringLenght" value=360}
					{assign var="issueDescription" value=$issue->getLocalizedDescription()|strip_unsafe_html}
					{if $issueDescription|strlen <= $stringLenght || $requestedPage == 'issue'}
						{$issueDescription}
					{else}
						{$issueDescription|substr:0:$stringLenght|mb_convert_encoding:'UTF-8'|replace:'?':''|trim}&hellip;
						<p>
							<a class="btn btn-secondary" href="{url op="view" page="issue" path=$issue->getBestIssueId()}">{translate key="issue.fullIssue"}</a>
						</p>
					{/if}
				</div>
			{/if}
		</div>

		{if $issueGalleys}
			<div class="issue-toc__galleys">
				<p class="eyebrow">{translate key="issue.fullIssue"}</p>
				<div class="issue-toc__galley-links">
					{foreach from=$issueGalleys item=galley}
						{include file="frontend/objects/galley_link.tpl" parent=$issue labelledBy="issueTocGalleyLabel" purchaseFee=$currentJournal->getData('purchaseIssueFee') purchaseCurrency=$currentJournal->getData('currency')}
					{/foreach}
				</div>
			</div>
		{/if}
	</header>

	{assign var="contentTableInserted" value=false}
	<div class="issue-toc__sections">
		{foreach name=sections from=$publishedSubmissions item=section key=sectionNumber}
			{if $section.articles}
				<section class="issue-section">
					{if !$contentTableInserted}
						<div class="issue-section__toc-bar">
							<p class="eyebrow">Table of contents</p>
						</div>
						{assign var="contentTableInserted" value=true}
					{/if}
					<header class="issue-section__header">
						<h3 class="issue-section__title">{$section.title|escape}</h3>
					</header>
					<ol class="issue-section__toc">
						{foreach from=$section.articles item=article}
							<li class="issue-section__toc-item">
								{include file="frontend/objects/article_summary.tpl"}
							</li>
						{/foreach}
					</ol>
				</section>
			{/if}
		{/foreach}
	</div>
</section>
