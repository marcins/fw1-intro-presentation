component  output="false" accessors="true" persistent="true" 
{
	property name="id" fieldtype="id" generator="native";
	property name="name" type="string" required="true";
	property name="position" type="string" required="true";
	property name="isStaff" column="is_staff" type="boolean" default="false" notnull="true";
	
	property name="errors" type="array" persistent="false"; 
	
	public boolean function isValid()
	{
		var errors = [];
		if (getName() == "") arrayAppend(errors, "Name is required");
		if (getPosition() == "") arrayAppend(errors, "Position is required");
		
		setErrors(errors);
		
		return (arrayLen(errors) == 0);		
	}
	
	public void function save()
	{
		entitySave(this);
	}
	
}