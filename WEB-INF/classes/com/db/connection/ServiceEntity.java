package com.db.connection;

import java.util.Map;
import java.util.HashMap;
import javax.ejb.EJBLocalHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.util.Properties;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class ServiceEntity
{
static int cntr=0;
private static ServiceEntity instance;
private Map homeInterfaces;
private static Context context;
private ServiceEntity() throws NamingException{
        homeInterfaces = new HashMap();

// Get the context for caching purposes
 if (context==null)
  context = getInitialContext();
      /**
    * In non-J2EE applications, you might need to load up
    * a properties file and get this context manually. I've
    * kept this simple for demonstration purposes.
    */
}

private Context getInitialContext() throws NamingException
 {
 Properties h = null;
         try
         {

           h = new Properties();
           h.put(Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory");
           //h.put(Context.PROVIDER_URL, "t3://siakbc.depdagri.go.id:80");
           h.put(Context.PROVIDER_URL, "t3://localhost");
          }
          catch (Exception ne) {

          System.out.println("Error in Service Controller=" + ne.toString());
          }
       return new InitialContext(h);
 }




public static ServiceEntity getInstance() throws NamingException {

// Not completely thread-safe, but good enough
// (see note in article)

    if (instance == null) {
    instance =new ServiceEntity();
    }
    return instance;
}


public EJBLocalHome lookup(String jndiName, Class homeInterfaceClass)

  throws NamingException
  {
      EJBLocalHome   homeInterface=null;
// See if we already have this interface cached
try{
     homeInterface =
          (EJBLocalHome) homeInterfaces.get(homeInterfaceClass);
// If not, look up with the supplied JNDI name

if (homeInterface == null) {
 Object obj = context.lookup(jndiName);
homeInterface=(EJBLocalHome) PortableRemoteObject.narrow(obj, homeInterfaceClass);
// If this is a new ref, save for caching purposes
 homeInterfaces.put(homeInterfaceClass, homeInterface);
      }
    }catch(Exception err)
    {
       err.printStackTrace();
    }
    return homeInterface;
    }
}