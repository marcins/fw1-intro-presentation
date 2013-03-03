<cfoutput>
<cfif structKeyExists(rc, "errors") AND arraylen(rc.errors)>
<p>The following errors were found:<ul>
	<cfloop array="#rc.errors#" index="error">
	<li>#error#</li>
	</cfloop>
</ul></p>
</cfif>
<form name="input" action="<cfoutput>#buildUrl('main.save')#</cfoutput>" method="post">
	<fieldset>
		<p><label for="name">Name:</label> <input type="text" id="name" name="name" value="#rc.person.getName()#" /></p>
		<p><label for="name">Position:</label> <input type="text" id="position" name="position" value="#rc.person.getPosition()#" /></p>
		<p>
			<label for="staff-yes"><input id="staff-yes" type="radio" name="isStaff" value="1" <cfif rc.person.getIsStaff()>checked="checked"</cfif> /> Yes</label>
			<label for="staff-no"><input id="staff-no" type="radio" name="isStaff" value="0" <cfif NOT rc.person.getIsStaff()>checked="checked"</cfif> /> No</label>
		</p>
		<input type="hidden" name="id" value="#rc.person.getId()#" />
		<input type="hidden" name="token" value="#csrfGenerateToken("person")#" />
		<p><input type="submit" value="<cfif isNull(rc.person.getId())>Create<cfelse>Save</cfif>" /></p>
	</fieldset>
</form>
<p><a href="<cfoutput>#buildUrl('main.about')#</cfoutput>">About</a></p>
</cfoutput>