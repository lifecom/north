{include file='header.tpl'}

<div class="action-header">
	{include file='actions/ActionProfile/profile_top.tpl'}
	{include file='menu.profile_created.tpl'}
</div>


{if $aNotes}
	<div class="profile-notes">
		<table class="table table-profile-notes" cellspacing="0">
			{foreach from=$aNotes item=oNote}
				<tr>
					<td class="cell-username"><a href="{$oNote->getTargetUser()->getUserWebPath()}" class="user">{$oNote->getTargetUser()->getLogin()}</a></td>
					<td class="cell-note">{$oNote->getText()}</td>
					<td class="hidden-xs small text-muted cell-date">{date_format date=$oNote->getDateAdd() format="j F Y"}</td>
				</tr>
			{/foreach}
		</table>
	</div>
{else}
	<div class="notice-empty">{$aLang.user_note_list_empty}</div>
{/if}

{include file='paging.tpl' aPaging=$aPaging}


{include file='footer.tpl'}
