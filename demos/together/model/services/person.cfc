component output="false"
{
    public array function getPeople ()
    {
        return entityLoad("Person", {}, "name ASC");
    }

    public any function getNewPerson ()
    {
        return entityNew("person");
    }

    public any function getPersonById (required numeric id)
    {
        return entityLoadByPK("Person", arguments.id);
    }

    public void function deletePersonById (required numeric id)
    {
        var person = entityLoadByPK("Person", rc.id);
        entityDelete(person);
    }
}