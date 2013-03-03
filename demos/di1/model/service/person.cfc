component  output="false" accessors="true"
{
    property name="personDAO";
    
    public query function getPeople ()
    {
        var qry = getPersonDAO().getPeople();
        return qry;
    }
}