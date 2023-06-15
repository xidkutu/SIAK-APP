package com.db.connection;

import java.util.Map;
import java.util.HashMap;
import javax.ejb.EJBHome;
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

public class ServiceController
{
static int cntr=0;
private static ServiceController instance;
private Map homeInterfaces;
private static Context context;
EJBHome homeInterface;

private ServiceController() throws NamingException{
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
  InitialContext context = new InitialContext(h);
       return context;
 }




public static ServiceController getInstance() throws NamingException {

// Not completely thread-safe, but good enough
// (see note in article)
    if (instance == null) {
    instance =new ServiceController();
    }
    return instance;
}


public EJBHome lookup(String jndiName, Class homeInterfaceClass)
  throws NamingException
  {
// See if we already have this interface cached
try{

     homeInterface =(EJBHome) homeInterfaces.get(homeInterfaceClass);
     //   System.out.println("USING OLD REFERENCE  ----->" + cntr);

      if (homeInterface == null) {
//        System.out.println("INSIDE FIRST LOOK UP  ----->" + cntr++);
               Object obj = context.lookup(jndiName);
          homeInterface =(EJBHome) PortableRemoteObject.narrow(obj, homeInterfaceClass);
         homeInterfaces.put(homeInterfaceClass, homeInterface);
      }
    }catch(Exception err)
    {
      err.printStackTrace();
    }
    return homeInterface;
    }
}