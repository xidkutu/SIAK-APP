package com.helpdesk;

import javax.ejb.*;
import java.sql.*;
import com.db.connection.*;

public class HelpDeskBean implements SessionBean {
  SessionContext sessionContext;
  public void ejbCreate() throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbRemove() {
    /**@todo Complete this method*/
  }
  public void ejbActivate() {
    /**@todo Complete this method*/
  }
  public void ejbPassivate() {
    /**@todo Complete this method*/
  }
  public void setSessionContext(SessionContext sessionContext) {
    this.sessionContext = sessionContext;
  }

public boolean postMessage(String id,String prop,String kab,String kec,String mod_code,String prio,String catgry,String ins_date,String pr_desc,String sample,String note)
  {
   Connection con=null;
   CallableStatement ps = null;
   ConnectorDB con_db=null;
   boolean check_flag=false;
try {
   con_db = new ConnectorDB();
   con = con_db.getConnection();
   String query = "{call proc_user_comment(?,?,?,?,?,?,?,?,?,?,?)}";
   ps = con.prepareCall(query);
// register the type of the out param - an Oracle specific type
   ps.setString(1, id);
   ps.setString(2, prop);
   ps.setString(3, kab);
   ps.setString(4, kec);
   ps.setString(5, mod_code);
   ps.setString(6, prio);
   ps.setString(7, catgry);
   ps.setString(8, ins_date);
   ps.setString(9,pr_desc);
   ps.setString(10,sample);
   ps.setString(11,note);
   ps.execute();
   check_flag=true;
 }catch(Exception err)
 {
   err.printStackTrace();
 }
 finally{

   try{
     if (con!=null) con.close();
   }catch(Exception err)
   {

   }
 }
 return check_flag;
  }
}