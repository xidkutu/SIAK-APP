package com.db.connection;
import java.sql.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.DataSource;
import siaktools.logwriter.SiakWriter;
import java.util.ResourceBundle;
import java.util.Locale;


/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class ConnectorDB
{
 static Connection con=null;

public ConnectorDB() {
    try{
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String dsname= res.getString("DataSource");
      InitialContext ctx=new InitialContext();
      DataSource dssiak=(DataSource)ctx.lookup(dsname);
      con=dssiak.getConnection();
/*     myDriver  = (Driver) Class.forName("weblogic.jdbc.pool.Driver").newInstance();
     con = myDriver.connect("jdbc:weblogic:pool:" + poolname, null);
  */

  }catch(Exception e)
    {
      System.out.println(e.toString());
       con=null;
    }
  }

public static Connection getConnection()
   {
    return(con);
   }

public static boolean closeConnection()
   {
     boolean flag=false;
        try
        {

          con.close();
           flag=true;
        }catch(Exception err){
          flag=false;
        }
        finally{
          try
          {
            if (con!=null) con.close();
              flag=true;
        }catch(Exception err1)
        {flag=false;
        System.out.println(err1.toString());
        }

        }
        return(flag);
   }
}
