component  extends="framework" output="false"
{
    this.name = "DI1Demo";

    variables.framework = {
        reloadApplicationOnEveryRequest: true
    };

    public void function setupApplication ()
    {
        var beanFactory = new ioc("./model");
        setBeanFactory(beanFactory);
    }

}