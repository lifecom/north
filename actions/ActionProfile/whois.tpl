{assign var="sMenuItemSelect" value='profile'}
{include file='header.tpl'}

{assign var="oSession" value=$oUserProfile->getSession()}
{assign var="oVote" value=$oUserProfile->getVote()}
{assign var="oGeoTarget" value=$oUserProfile->getGeoTarget()}


{include file='actions/ActionProfile/profile_top.tpl'}


{if $oUserProfile->getProfileAbout()}
	<div class="well profile-info-about">
		<h3>{$aLang.profile_about}</h3>
		{$oUserProfile->getProfileAbout()}
	</div>
{/if}


<div class="row">

	<div class="col-sm-6">
		{assign var="aUserFieldValues" value=$oUserProfile->getUserFieldValues(true,array(''))}
		{if $oUserProfile->getProfileSex()!='other' || $oUserProfile->getProfileBirthday() || $oGeoTarget || $oUserProfile->getProfileAbout() || count($aUserFieldValues)}

			<h4>{$aLang.profile_privat}</h4>

			<table class="table table-profile-info">
				{if $oUserProfile->getProfileSex()!='other'}
					<tr>
						<td class="text-muted cell-label">{$aLang.profile_sex}:</td>
						<td>
							{if $oUserProfile->getProfileSex()=='man'}
								{$aLang.profile_sex_man}
							{else}
								{$aLang.profile_sex_woman}
							{/if}
						</td>
					</tr>
				{/if}


				{if $oUserProfile->getProfileBirthday()}
					<tr>
						<td class="text-muted cell-label">{$aLang.profile_birthday}:</td>
						<td>{date_format date=$oUserProfile->getProfileBirthday() format="j F Y"}</td>
					</tr>
				{/if}


				{if $oGeoTarget}
					<tr>
						<td class="text-muted cell-label">{$aLang.profile_place}:</td>
						<td itemprop="address" itemscope itemtype="http://data-vocabulary.org/Address">
							{if $oGeoTarget->getCountryId()}
								<a href="{router page='people'}country/{$oGeoTarget->getCountryId()}/" itemprop="country-name">{$oUserProfile->getProfileCountry()|escape:'html'}</a>{if $oGeoTarget->getCityId()},{/if}
							{/if}

							{if $oGeoTarget->getCityId()}
								<a href="{router page='people'}city/{$oGeoTarget->getCityId()}/" itemprop="locality">{$oUserProfile->getProfileCity()|escape:'html'}</a>
							{/if}
						</td>
					</tr>
				{/if}

				{if $aUserFieldValues}
					{foreach from=$aUserFieldValues item=oField}
						<tr>
							<td class="text-muted cell-label"><span class="icon-contact icon-contact-{$oField->getName()}"></span> {$oField->getTitle()|escape:'html'}:</td>
							<td>{$oField->getValue(true,true)}</td>
						</tr>
					{/foreach}
				{/if}

				{hook run='profile_whois_privat_item' oUserProfile=$oUserProfile}
			</table>
		{/if}


		{hook run='profile_whois_item_after_privat' oUserProfile=$oUserProfile}
	</div>


	<div class="col-sm-6">
		{assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('contact'))}
		{if $aUserFieldContactValues}
			<h4>{$aLang.profile_contacts}</h4>

			<table class="table table-profile-info">
				{foreach from=$aUserFieldContactValues item=oField}
					<tr>
						<td class="text-muted cell-label"><span class="icon-contact icon-contact-{$oField->getName()}"></span> {$oField->getTitle()|escape:'html'}:</td>
						<td>{$oField->getValue(true,true)}</td>
					</tr>
				{/foreach}
			</table>
		{/if}


		{assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('social'))}
		{if $aUserFieldContactValues}
			<h4>{$aLang.profile_social}</h4>

			<table class="table table-profile-info">
				{foreach from=$aUserFieldContactValues item=oField}
					<tr>
						<td class="text-muted cell-label"><span class="icon-contact icon-contact-{$oField->getName()}"></span> {$oField->getTitle()|escape:'html'}:</td>
						<td>{$oField->getValue(true,true)}</td>
					</tr>
				{/foreach}
			</table>
		{/if}
	</div>

</div>


{hook run='profile_whois_item' oUserProfile=$oUserProfile}


<h4>{$aLang.profile_activity}</h4>

<table class="table table-profile-info">

	{if $oConfig->GetValue('general.reg.invite') and $oUserInviteFrom}
		<tr>
			<td class="text-muted cell-label">{$aLang.profile_invite_from}:</td>
			<td>
				<a href="{$oUserInviteFrom->getUserWebPath()}">{$oUserInviteFrom->getLogin()}</a>&nbsp;
			</td>
		</tr>
	{/if}

	{if $oConfig->GetValue('general.reg.invite') and $aUsersInvite}
		<tr>
			<td class="text-muted cell-label">{$aLang.profile_invite_to}:</td>
			<td>
				{foreach from=$aUsersInvite item=oUserInvite}
					<a href="{$oUserInvite->getUserWebPath()}">{$oUserInvite->getLogin()}</a>&nbsp;
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogsOwner}
		<tr>
			<td class="text-muted cell-label">{$aLang.profile_blogs_self}:</td>
			<td>
				{foreach from=$aBlogsOwner item=oBlog name=blog_owner}
					<a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_owner.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogAdministrators}
		<tr>
			<td class="text-muted cell-label">{$aLang.profile_blogs_administration}:</td>
			<td>
				{foreach from=$aBlogAdministrators item=oBlogUser name=blog_user}
					{assign var="oBlog" value=$oBlogUser->getBlog()}
					<a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogModerators}
		<tr>
			<td class="text-muted cell-label">{$aLang.profile_blogs_moderation}:</td>
			<td>
				{foreach from=$aBlogModerators item=oBlogUser name=blog_user}
					{assign var="oBlog" value=$oBlogUser->getBlog()}
					<a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogUsers}
		<tr>
			<td class="text-muted cell-label">{$aLang.profile_blogs_join}:</td>
			<td>
				{foreach from=$aBlogUsers item=oBlogUser name=blog_user}
					{assign var="oBlog" value=$oBlogUser->getBlog()}
					<a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{hook run='profile_whois_activity_item' oUserProfile=$oUserProfile}

	<tr>
		<td class="text-muted cell-label">{$aLang.profile_date_registration}:</td>
		<td>{date_format date=$oUserProfile->getDateRegister()}</td>
	</tr>

	{if $oSession}
		<tr>
			<td class="text-muted cell-label">{$aLang.profile_date_last}:</td>
			<td>{date_format date=$oSession->getDateLast()}</td>
		</tr>
	{/if}
</table>


{if $aUsersFriend}
	<h4><a href="{$oUserProfile->getUserWebPath()}friends/" class="user-friends">{$aLang.profile_friends}</a> <span class="text-muted">({$iCountFriendsUser})<span></h4>

	{include file='user_list_avatar.tpl' aUsersList=$aUsersFriend}
{/if}

{hook run='profile_whois_item_end' oUserProfile=$oUserProfile}

{include file='footer.tpl'}
