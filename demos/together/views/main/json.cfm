<cfset getPageContext().getResponse().setContentType("application/json")>
<cfheader name="Content-length" value="#Len(rc.json)#">
<cfoutput>#rc.json#</cfoutput>
<cfset request.layout = false>