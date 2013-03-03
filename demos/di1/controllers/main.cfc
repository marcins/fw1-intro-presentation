component  output="false" accessors="true"
{
    property name="personService";
    
    public void function default (required any rc)
	{
	   rc.qPeople = getPersonService().getPeople();
	}
}