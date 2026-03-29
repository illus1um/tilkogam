{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for the site.
 *}

<footer class="main-footer" id="pragma_content_footer">
	<div class="container">
		{if $hasSidebar}
			<div class="main-footer__sidebar" role="complementary">
				{call_hook name="Templates::Common::Sidebar"}
			</div>
		{/if}

		<div class="main-footer__content">
			<div class="main-footer__primary">
				{if $pageFooter}
					{$pageFooter}
				{/if}
			</div>

			<div class="main-footer__secondary" role="complementary">
				<a class="main-footer__ojs-link" href="{url page="about" op="aboutThisPublishingSystem"}">
					<img class="img-fluid" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
				</a>
			</div>
		</div>
	</div>
</footer>

{* Login modal *}
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				{include file="frontend/components/loginForm.tpl" formType = "loginModal"}
			</div>
		</div>
	</div>
</div>

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}

</body>
</html>
