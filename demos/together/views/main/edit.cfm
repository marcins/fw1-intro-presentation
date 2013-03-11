<cfif isNull(rc.id)>
	<cfset rc.subTitle = "New Person">
<cfelse>
	<cfset rc.subTitle = "Edit Person">
</cfif>
<cfoutput>
<cfif structKeyExists(rc, "errors") AND arraylen(rc.errors)>
<div class="alert alert-error">
<p>The following errors were found:<ul>
	<cfloop array="#rc.errors#" index="error">
	<li>#error#</li>
	</cfloop>
</ul></p>
</div>
</cfif>
<form name="input" action="<cfoutput>#buildUrl('main.save')#</cfoutput>" method="post">
	<fieldset>
		<p><label for="name">Name:</label> <input type="text" id="name" name="name" value="#rc.person.getName()#" /></p>
		<p><label for="name">Position:</label> <input type="text" id="position" name="position" value="#rc.person.getPosition()#" /></p>
		<div class="control-group">
			<div class="controls">
				<label class="inline">Is Staff?</label>
				<label for="staff-yes" class="radio inline"><input id="staff-yes" type="radio" name="isStaff" value="1" <cfif rc.person.getIsStaff()>checked="checked"</cfif> /> Yes</label>
				<label for="staff-no" class="radio inline"><input id="staff-no" type="radio" name="isStaff" value="0" <cfif NOT rc.person.getIsStaff()>checked="checked"</cfif> /> No</label>
			</div>
		</div>
		<input type="hidden" name="id" value="#rc.person.getId()#" />
		<input type="hidden" name="token" value="#csrfGenerateToken("person")#" />
		<div class="control-group">
			<div class="controls">
				<cfif NOT isNull(rc.id)>
					<input type="submit" class="btn btn-danger" value="Delete" name="delete" />
				</cfif>
				<input type="submit" class="btn" name="cancel" value="Cancel" />
				<input type="submit" class="btn btn-primary" value="<cfif isNull(rc.person.getId())>Create<cfelse>Save</cfif>" />
			</div>
		</div>
	</fieldset>
</form>
</cfoutput>