						{hook run='content_end'}
					</div> <!-- /content -->

					{if !$noSidebar && $sidebarPosition != 'left'}
						{include file='sidebar.tpl'}
					{/if}
				</div> <!-- /row -->
			</div> <!-- /container -->
		</section> <!-- /wrapper -->

		<footer id="footer">
			{include file='blocks.tpl' group='footer-top'}

			<div class="footer-center">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-lg-6 project-info">
							<h5>
								{if {cfg name='view.config_sitename'} == true}
									{cfg name='view.name'}
								{else}
									{cfg name='view.own_sitename'}
								{/if}
							</h5>
							{$aLang.footer_menu_project_info}
						</div>

						<div class="col-sm-4 col-lg-2">
							{if $oUserCurrent}
								<ul class="list-unstyled footer-list">
									<li class="footer-list-header word-wrap">{$oUserCurrent->getLogin()}</li>
									<li><a href="{$oUserCurrent->getUserWebPath()}">{$aLang.footer_menu_user_profile}</a></li>
									<li><a href="{router page='settings'}profile/">{$aLang.user_settings}</a></li>
									<li><a href="{router page='topic'}add/" class="js-write-window-show">{$aLang.block_create}</a></li>
									{hook run='footer_menu_user_item' oUser=$oUserCurrent}
									<li><a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.exit}</a></li>
								</ul>
							{else}
								<ul class="list-unstyled footer-list">
									<li class="footer-list-header word-wrap">{$aLang.footer_menu_user_quest_title}</li>
									<li><a class="js-registration-form-show" href="{router page='registration'}" class="js-registration-form-show">{$aLang.registration_submit}</a></li>
									<li><a class="js-login-form-show" href="{router page='login'}" class="js-login-form-show sign-in">{$aLang.user_login_submit}</a></li>
									{hook run='footer_menu_user_item' isGuest=true}
								</ul>
							{/if}
						</div>

						<div class="col-sm-4 col-lg-2">
							<ul class="list-unstyled footer-list">
								<li class="footer-list-header">{$aLang.footer_menu_navigate_title}</li>
								<li><a href="{cfg name='path.root.web'}">{$aLang.topic_title}</a></li>
								<li><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
								<li><a href="{router page='people'}">{$aLang.people}</a></li>
								<li><a href="{router page='stream'}">{$aLang.stream_menu}</a></li>
								{hook run='footer_menu_navigate_item'}
							</ul>
						</div>

						<div class="col-sm-4 col-lg-2">
							<ul class="list-unstyled footer-list">
								<li class="footer-list-header">{$aLang.footer_menu_navigate_info}</li>
								<li><a href="#">{$aLang.footer_menu_project_about}</a></li>
								<li><a href="#">{$aLang.footer_menu_project_rules}</a></li>
								<li><a href="#">{$aLang.footer_menu_project_advert}</a></li>
								<li><a href="#">{$aLang.footer_menu_project_help}</a></li>
								{hook run='footer_menu_project_item'}
							</ul>
						</div>
					</div>

					{hook run='footer_end'}
				</div>
			</div>

			<div class="footer-bottom">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							{hook run='copyright'}.
							Template based on "Developer-Kit" by <a href="http://kulesh-vladimir.by/">вOFFка</a>
						</div>

						<div class="col-sm-6 text-right social-icons">
							<a href="#" rel="nofollow"><span class="icon-facebook"></span></a>
							<a href="#" rel="nofollow"><span class="icon-gplus"></span></a>
							<a href="#" rel="nofollow"><span class="icon-twitter"></span></a>
							<a href="#" rel="nofollow"><span class="icon-vkontakte"></span></a>
							<a href="#" rel="nofollow"><span class="icon-youtube-play"></span></a>
							<a href="#" rel="nofollow"><span class="icon-yandex"></span></a>
							<a href="#" rel="nofollow"><span class="icon-odnoklassniki"></span></a>
						</div>
					</div>
				</div>
			</div>
		</footer>

		{include file='toolbar.tpl'}

		{hook run='body_end'}
	</div> <!-- /page-wrapper -->
</body>
</html>
