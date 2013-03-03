<cfoutput>
<ul>
<cfloop array="#rc.people#" index="person">
<li><a href="#buildUrl(action="main.edit", queryString="id=#person.getId()#")#">#person.getName()#</a></li>
</cfloop>
</ul>
<p><a href="#buildUrl('.new')#">Add person</a></p>
</cfoutput>