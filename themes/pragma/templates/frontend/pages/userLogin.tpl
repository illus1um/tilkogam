{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<main class="container main__content page-auth page-auth--login" id="main">
	<div class="auth-layout card-shell">
		<section class="auth-layout__intro">
			<p class="eyebrow">{$displayPageHeaderTitle|escape}</p>
			<h1 class="main__title">{translate key="user.login"}</h1>
			<p>{translate key="about.submissions"}</p>
			<ul class="auth-layout__bullets">
				<li>{translate key="about.submissions"}</li>
				<li>{translate key="journal.currentIssue"}</li>
				<li>{translate key="archive.archives"}</li>
			</ul>
		</section>

		<section class="auth-layout__form">
			{if $loginMessage}
				<p class="auth-layout__message">{translate key=$loginMessage}</p>
			{/if}

			<form id="login" method="post" action="{$loginUrl}">
				{csrf}

				{if $error}
					<p class="auth-layout__error">{translate key=$error reason=$reason}</p>
				{/if}

				<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}"/>

				<fieldset>
					<div class="form-group">
						<label for="username">
							{translate key="user.username"}
							<span class="required">*</span>
							<span class="visually-hidden">{translate key="common.required"}</span>
						</label>
						<input class="form-control" type="text" name="username" id="username" value="{$username|default:""|escape}" maxlength="32" required>
					</div>

					<div class="form-group">
						<label for="password">
							{translate key="user.password"}
							<span class="required">*</span>
							<span class="visually-hidden">{translate key="common.required"}</span>
						</label>
						<input class="form-control" type="password" name="password" id="password" value="{$password|default:""|escape}" password="true" maxlength="32" required>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="remember" id="remember" value="1" checked="$remember">
							<label class="form-check-label" for="remember">
								{translate key="user.login.rememberUsernameAndPassword"}
							</label>
						</div>
					</div>

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
						<button class="btn btn-primary" type="submit">{translate key="user.login"}</button>

						{if !$disableUserReg}
							{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
							<a href="{$registerUrl}" class="btn btn-secondary">{translate key="user.login.registerNewAccount"}</a>
						{/if}

						<a class="auth-form__forgot" href="{url page="login" op="lostPassword"}">{translate key="user.login.forgotPassword"}</a>
					</div>
				</fieldset>
			</form>
		</section>
	</div>
</main>

{include file="frontend/components/footer.tpl"}
