<cfoutput>
<cfif structKeyExists(rc, "deleted")>
    <p class="alert alert-success">Record deleted</p>
</cfif>
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Staff?</th>
        </tr>
    </thead>
    <tbody>
<cfloop array="#rc.people#" index="person">
    <tr>
<td><a href="#buildUrl(action="main.edit", queryString="id=#person.getId()#")#">#person.getName()#</a></td>
<td>#person.getPosition()#</td>
<td><cfif person.getIsStaff()><i class="icon-user"></i></cfif></td>
    </tr>
</cfloop>
</tbody>
</table>
<p><a href="#buildUrl('.new')#" class="btn">Add person</a></p>
</cfoutput>