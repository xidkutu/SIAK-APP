package com.monitor;
import com.db.connection.*;
import java.sql.*;
import java.util.*;

public class MonitorBean {
Connection conn=null;
ConnectorDB condb=null;

       public  MonitorBean()
         {
           condb=new ConnectorDB();
           conn=condb.getConnection();
         }

public  Vector pullActiveUsers()
         {
MonitorObj obj=null;
Vector vtobj=new Vector();
ResultSet rs=null;
           try
           {

                rs=conn.prepareStatement("select * from USER_ACTIVE_INFO").executeQuery();
                while(rs.next())
                       {
                         obj=new MonitorObj(rs.getString("USER_ID"),
                                            rs.getString("NAMA_LGKP"),
                                            rs.getString("NIP"),
                                            rs.getString("NAMA_KANTOR"),
                                            rs.getString("ALAMAT_KANTOR"),
                                            rs.getString("TELP"),rs.getString("in_date"),
                                            rs.getString("in_time"),rs.getString("remote_ip"));
                         vtobj.addElement(obj);
                 }
           }catch(Exception rsexcept)
           {

           }
           finally{
             try{
               if (rs!=null) rs.close();
                 rs=null;
             }catch(Exception erp)
             {

             }
             try{
               if (conn!=null) conn.close();
               conn=null;
             }catch(Exception erp)
             {

             }
          }
return vtobj;
    }
}
