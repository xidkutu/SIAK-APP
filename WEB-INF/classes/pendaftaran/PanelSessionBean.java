package pendaftaran;

import javax.ejb.*;
import java.util.*;
import com.db.connection.ConnectorDB;
import java.math.BigDecimal;
import java.sql.*;

public class PanelSessionBean implements SessionBean {
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
  public String insertAkses(Vector v,String status)
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    int [] i = {2,3,4,5,6,7,8,9};

    String s=null,kodeUser=null,s1=null;

       for(int g = 0;g < v.size();g++)
       {
          System.out.println("V["+g+"]=" + v.elementAt(g));
       }

       s1=(v.elementAt(0).toString().equals(""))?"":
       v.elementAt(0).toString();
       if(v.elementAt(6).toString().equals("1"))
       {
         s="umm1";
       }
       if(v.elementAt(6).toString().equals("2"))
       {
         s="opr2";
       }
       if(v.elementAt(6).toString().equals("3"))
       {
         s="opr3";
       }
       if(v.elementAt(6).toString().equals("4"))
       {
         s="supv4";
       }
       if(v.elementAt(6).toString().equals("5"))
       {
         s="supv5";
       }
       if(v.elementAt(6).toString().equals("6"))
       {
         s="supv6";
       }
       if(v.elementAt(6).toString().equals("7"))
       {
         s="reset";
       }

       CallableStatement cs = null;
       try {
         conn = connectorDb.getConnection();
System.out.println("status->" + status);
         if (status.equals("0"))
           cs = conn.prepareCall("{ call autogenuser(?,?,?,?,?,?,?,?,?,?)}");
          else
           cs = conn.prepareCall("{ call create_new_user(?,?,?,?,?,?,?,?,?,?)}");

         cs.registerOutParameter(10,java.sql.Types.VARCHAR);
         cs.setString(1,s);
         System.out.println("Value = " + v.elementAt(6));
         cs.setString(2 ,v.elementAt(0).toString());
         cs.setString(3 ,v.elementAt(1).toString());
         cs.setString(4 ,v.elementAt(2).toString());
         cs.setString(5 ,v.elementAt(6).toString());
         cs.setString(6 ,v.elementAt(3).toString());
         cs.setString(7 ,v.elementAt(4).toString());
         cs.setString(8 ,v.elementAt(5).toString());
         cs.setString(9 ,v.elementAt(7).toString());
         cs.execute();
         kodeUser = cs.getString(10);
         cs.close();
         conn.close();
         System.out.println("New Kode User=" + kodeUser);
       }
       catch (Exception ee) {
          System.out.println("Exception in KodeUser : " + ee);
        }
        finally
        {
          try {
              if (cs != null) cs.close();
            }catch(Exception a1){}

          try{
             if (conn != null) conn.close();
            }catch(Exception c1){}
        }

        return kodeUser;
  }
}
