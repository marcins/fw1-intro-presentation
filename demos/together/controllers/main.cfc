component  output="false" accessors="true"
{
	property name="personService";

	public any function init (required any fw)
	{
		variables.fw = arguments.fw;
		return this;
	}

	public void function default (required any rc)
	{
		rc.people = getPersonService().getPeople();
	}

    public void function new (required any rc)
	{
	   rc.person = getPersonService().getNewPerson();
	   fw.setView("main.edit");
	}

	public void function show (required any rc)
	{
		param name="rc.format" default="html";
		rc.person = getPersonService().getPersonById(rc.id);
		if (rc.format == "json")
		{
			rc.json = serializeJSON(rc.person);
			fw.setView("main.json");
		}
	}

	public void function edit (required any rc)
	{
		if (! structKeyExists(rc, "person"))
		{
			rc.person = getPersonService().getPersonById(rc.id);
		}
	}

	public void function save (required any rc)
	{
		if (structKeyExists(rc, "cancel"))
		{
			fw.redirect(action=".default");
			return;
		}
		else if(structKeyExists(rc, "delete") && isNumeric(rc.id))
		{
			getPersonService().deletePersonById(rc.id);
			fw.redirect(action=".default",queryString="deleted=1");
			return;
		}

		if (!csrfVerifyToken(rc.token, "person"))
		{
			throw(message="Invalid");
		}

		rc.person = fw.getBeanFactory().getBean("personBean");
		var fields = "name,position,isStaff";
		if (isNumeric(rc.id))
		{
			fields &= ",id";
		}
		fw.populate(rc.person, fields);

		if (rc.person.isValid())
		{
			rc.person.save();
			fw.redirect(action="main.default");
		}
		else
		{
			rc.errors = rc.person.getErrors();
			fw.redirect(action="main.edit", preserve="errors,person");
		}

	}
}