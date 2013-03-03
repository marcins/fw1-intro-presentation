component  output="false"
{
	public any function init (required any fw)
	{
		variables.fw = arguments.fw;
		return this;
	}
	
	public void function default (required any rc)
	{
		rc.people = entityLoad("Person", {}, "name desc");
	}
	
    public void function new (required any rc)
	{
	   rc.person = entityNew("person");
	   fw.setView("main.edit");
	}
	
	public void function edit (required any rc)
	{
		rc.person = entityLoadByPK("Person",rc.id);
	}
	
	public void function save (required any rc)
	{
		if (!csrfVerifyToken(rc.token, "person"))
		{
			throw(message="Invalid");
		}
		
		rc.person = fw.getBeanFactory().getBean("person");
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