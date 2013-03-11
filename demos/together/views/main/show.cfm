<cfoutput>
<h2>#rc.person.getName()#</h2>
<p>Position: #rc.person.getPosition()# <cfif rc.person.getIsStaff()>(Staff)</cfif></p>
<p>
    <a href="#buildUrl(action='.edit', queryString='id=#rc.person.getId()#')#" class="btn btn-primary">Edit</a>
    <a href="#buildUrl(action=".show", queryString='id=#rc.person.getId()#&format=json')#" class="btn">View as JSON</a></p>
</cfoutput>