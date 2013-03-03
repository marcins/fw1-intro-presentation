<ul>
<cfloop query="#rc.qPeople#">
    <cfoutput><li>#rc.qPeople.name# (ID: #rc.qPeople.id#)</li></cfoutput>
</cfloop>
</ul>