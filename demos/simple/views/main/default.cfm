<form name="input" action="<cfoutput>#buildUrl('main.hello')#</cfoutput>" method="post">
	<fieldset>
		<p><label for="name">Name:</label> <input type="text" id="name" name="name" value="" /></p>
		<p><input type="submit" value="Say Hello" /></p>
	</fieldset>
</form>
<p><a href="<cfoutput>#buildUrl('main.about')#</cfoutput>">About</a></p>