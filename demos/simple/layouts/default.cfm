<!DOCTYPE html>
<html>
    <head>
        <title><cfoutput><cfif structKeyExists(rc, "pageTitle")>#rc.pageTitle#<cfelse>Simple FW/1 Demo</cfif></cfoutput></title>
    </head>
	<h1>Simple FW/1 Demo</h1>
    <body><cfoutput>#body#</cfoutput></body>	
</html>
