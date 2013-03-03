component  extends="framework" output="false"
{
    this.name = "SimpleFW1";
    
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0,0,10,0);
    
    this.datasource = "presentation";
    this.ormEnabled = true;
    this.ormSettings = {
    	dbcreate: "update",
    	cfclocation: "model"
    };
    
    variables.framework.reloadApplicationOnEveryRequest = true;
    
    public void function setupApplication ()
    {        
        var beanFactory = new ioc("./model");
        setBeanFactory(beanFactory);
    }
    
}