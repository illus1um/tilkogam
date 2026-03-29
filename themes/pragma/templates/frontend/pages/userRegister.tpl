{**
 * templates/frontend/pages/userRegister.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * @uses $primaryLocale string The primary locale for this journal/press
 *}
{include file="frontend/components/header.tpl" pageTitle="user.register"}

<main class="container page_register main__content page-auth page-auth--register" id="main">
	<div class="auth-layout card-shell">
		<section class="auth-layout__intro">
			<p class="eyebrow">{$displayPageHeaderTitle|escape}</p>
			<h1 class="main__title">{translate key="user.register"}</h1>
			<p>{translate key="about.submissions"}</p>
			<ul class="auth-layout__bullets">
				<li>{translate key="user.login.registerNewAccount"}</li>
				<li>{translate key="user.login"}</li>
				<li>{translate key="common.required"}</li>
			</ul>
		</section>

		<section class="auth-layout__form">
			<form class="cmp_form register" id="register" method="post" action="{url op="register"}">
				{csrf}

				{if $source}
					<input type="hidden" name="source" value="{$source|default:""|escape}" />
				{/if}

				{include file="common/formErrors.tpl"}
				{include file="frontend/components/registrationForm.tpl"}

				{* When a user is registering with a specific journal *}
				{if $currentContext}
					<fieldset class="consent">
						<div class="form-group">
							{if $currentContext->getSetting('privacyStatement')}
								<div class="form-check optin optin-privacy">
									<input type="checkbox" class="form-check-input" name="privacyConsent" id="privacyConsent"
										   value="1"{if $privacyConsent} checked="checked"{/if}>
									<label for="privacyConsent" class="form-check-label">
										{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
										{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
									</label>
								</div>
							{/if}

							<div class="form-check optin optin-email">
								<input type="checkbox" class="form-check-input" name="emailConsent" id="emailConsent"
									   value="1"{if $emailConsent} checked="checked"{/if}>
								<label for="emailConsent" class="form-check-label">
									{translate key="user.register.form.emailConsent"}
								</label>
							</div>
						</div>
					</fieldset>

					{assign var=contextId value=$currentContext->getId()}
					{assign var=userCanRegisterReviewer value=0}
					{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
						{if $userGroup->getPermitSelfRegistration()}
							{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
						{/if}
					{/foreach}
					{if $userCanRegisterReviewer}
						<fieldset class="reviewer">
							{if $userCanRegisterReviewer > 1}
								<legend>{translate key="user.reviewerPrompt"}</legend>
								{capture assign="checkboxLocaleKey"}user.reviewerPrompt.userGroup{/capture}
							{else}
								{capture assign="checkboxLocaleKey"}user.reviewerPrompt.optin{/capture}
							{/if}
							<div class="form-group">
								<div id="reviewerOptinGroup" class="form-check optin">
									{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
										{if $userGroup->getPermitSelfRegistration()}
											{assign var="userGroupId" value=$userGroup->getId()}
											<input type="checkbox" class="form-check-input" id="checkbox-reviewer-interests" name="reviewerGroup[{$userGroupId}]" value="1"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
											<label for="checkbox-reviewer-interests" class="form-check-label">
												{translate key=$checkboxLocaleKey userGroup=$userGroup->getLocalizedName()}
											</label>
										{/if}
									{/foreach}
								</div>

								<div id="reviewerInterests" class="reviewer_interests hidden">
									<div class="label">{translate key="user.interests"}</div>
									<input type="text" name="interests" id="interests" value="{$interests|default:""|escape}">
								</div>
							</div>
						</fieldset>
					{/if}
				{/if}

				{include file="frontend/components/registrationFormContexts.tpl"}

				{if $recaptchaPublicKey}
					<fieldset class="recaptcha_wrapper">
						<div class="fields">
							<div class="recaptcha">
								<div class="g-recaptcha" data-sitekey="{$recaptchaPublicKey|escape}"></div><label for="g-recaptcha-response" style="display:none;" hidden>Recaptcha response</label>
							</div>
						</div>
					</fieldset>
				{/if}

				<div class="form-group auth-form__actions">
					<button class="btn btn-primary" type="submit">{translate key="user.register"}</button>

					{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
					<a href="{url page="login" source=$rolesProfileUrl}" class="btn btn-secondary">{translate key="user.login"}</a>
				</div>
			</form>
		</section>
	</div>
</main>

{include file="frontend/components/footer.tpl"}
