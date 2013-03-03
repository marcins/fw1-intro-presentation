component  output="false"
{
    public void function hello(required any rc)
	{
	   rc.name = UCase(rc.name);
	}
}