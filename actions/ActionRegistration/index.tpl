{assign var="noSidebar" value=true}
{include file='header_light.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#registration-form').find('input.js-ajax-validate').blur(function(e){
			var aParams={ };
			if ($(e.target).attr('name')=='password_confirm') {
				aParams['password']=$('#registration-user-password').val();
			}
			if ($(e.target).attr('name')=='password') {
				aParams['password']=$('#registration-user-password').val();
				if ($('#registration-user-password-confirm').val()) {
					ls.user.validateRegistrationField('password_confirm',$('#registration-user-password-confirm').val(),$('#registration-form'),{ 'password': $(e.target).val() });
				}
			}
			ls.user.validateRegistrationField($(e.target).attr('name'),$(e.target).val(),$('#registration-form'),aParams);
		});
		$('#registration-form').bind('submit',function(){
			ls.user.registration('registration-form');
			return false;
		});
		$('#registration-form-submit').attr('disabled',false);
	});
</script>


<div class="text-center page-header">
	<h3>{$aLang.registration}</h3>
</div>

{hook run='registration_begin'}

<form action="{router page='registration'}" method="post" id="registration-form">
	{hook run='form_registration_begin'}

	<div class="form-group">
		<label for="registration-login">{$aLang.registration_login}</label>
		<span class="glyphicon glyphicon-question-sign text-muted js-tip-help" title="{$aLang.registration_login_notice}"></span>
		<span class="glyphicon glyphicon-ok text-success validate-ok-field-login" style="display: none"></span>
		<input type="text" name="login" id="registration-login" value="{$_aRequest.login}" class="form-control js-ajax-validate" />
		<p class="help-block"><small class="text-danger validate-error-hide validate-error-field-login"></small></p>
	</div>
	
	<div class="form-group">
		<label for="registration-mail">{$aLang.registration_mail}</label>
		<span class="glyphicon glyphicon-question-sign text-muted js-tip-help" title="{$aLang.registration_mail_notice}"></span>
		<span class="glyphicon glyphicon-ok text-success validate-ok-field-mail" style="display: none"></span>
		<input type="text" name="mail" id="registration-mail" value="{$_aRequest.mail}" class="form-control js-ajax-validate" />
		<p class="help-block"><small class="text-danger validate-error-hide validate-error-field-mail"></small></p>
	</div>
	
	<div class="form-group">
		<label for="registration-user-password">{$aLang.registration_password}</label>
		<span class="glyphicon glyphicon-question-sign text-muted js-tip-help" title="{$aLang.registration_password_notice}"></span>
		<span class="glyphicon glyphicon-ok text-success validate-ok-field-password" style="display: none"></span>
		<input type="password" name="password" id="registration-user-password" value="" class="form-control js-ajax-validate" />
		<p class="help-block"><small class="text-danger validate-error-hide validate-error-field-password"></small></p>
	</div>
	
	<div class="form-group">
		<label for="registration-user-password-confirm">{$aLang.registration_password_retry}</label>
		<span class="glyphicon glyphicon-ok text-success validate-ok-field-password_confirm" style="display: none"></span>
		<input type="password" value="" id="registration-user-password-confirm" name="password_confirm" class="form-control js-ajax-validate" />
		<p class="help-block"><small class="text-danger validate-error-hide validate-error-field-password_confirm"></small></p>
	</div>
	
	{hookb run="registration_captcha"}
		<div class="form-group">
			<label for="captcha" class="captcha">{$aLang.registration_captcha}</label>
			<img src="{cfg name='path.root.engine_lib'}/external/kcaptcha/index.php?{$_sPhpSessionName}={$_sPhpSessionId}" 
				onclick="this.src='{cfg name='path.root.engine_lib'}/external/kcaptcha/index.php?{$_sPhpSessionName}={$_sPhpSessionId}&n='+Math.random();" 
				class="captcha-image" />
			<input type="text" name="captcha" id="captcha" value="" maxlength="3" class="form-control captcha-input js-ajax-validate" />
			<p class="help-block"><small class="text-danger validate-error-hide validate-error-field-captcha"></small></p>
		</div>
	{/hookb}

	{hook run='form_registration_end'}
	<br />
	
	<button type="submit" name="submit_register" class="btn btn-success" id="registration-form-submit" disabled="disabled">{$aLang.registration_submit}</button>
</form>

{hook run='registration_end'}

{include file='footer_light.tpl'}
