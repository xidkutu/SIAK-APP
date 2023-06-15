package com.penan;
import javax.ejb.*;
import java.sql.*;
import com.db.connection.*;
import oracle.jdbc.driver.*;
import siaktools.logwriter.SiakWriter;

public class SetupPenanBean implements SessionBean {
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

  public boolean setupKec(String nokec, String nokab, String noprop, String jabatan, String namapej, String status, String nippej) {
    Connection conn = null;
    PreparedStatement st = null;
    boolean flag=false;
    String query="";
    try{
    ConnectorDB connectorDb = new ConnectorDB();
    conn = connectorDb.getConnection();
    query="update setup_kec set jabatan='" + jabatan + "',nama_pej='" + namapej + "',STAT_PNDTNG='" + status + "',NIP_PEJ='" + nippej + "' where no_prop=" + noprop + " and no_kab=" + nokab + " and no_kec=" + nokec;
    System.out.println(query);
    st = conn.prepareStatement(query);
    st.execute();
    flag=true;
    st.close();
    conn.close();

    }catch(Exception err)
    {
      flag=false;
      err.printStackTrace();
    }
    finally{
      try
      {
        if (st!=null) st.close();
        st=null;
      }catch(Exception err)
      {

      }
      try
      {
        if (conn!=null) conn.close();
        conn=null;
      }catch(Exception err)
      {

      }
    }
    /**@todo Complete this method*/
    return flag;
}

  public boolean setupKel(String nokel, String nokec, String nokab, String noprop, String jabakel, String namapejkel, String niplur) {
   Connection conn = null;
   PreparedStatement st = null;
   boolean flag=false;
   String query="";

    try{
       ConnectorDB connectorDb = new ConnectorDB();
       conn = connectorDb.getConnection();
       query="update setup_kel set jabatan='" + jabakel + "',nama_lur='" + namapejkel + "',NIP_LUR='" + niplur + "' where no_prop=" + noprop + " and no_kab=" + nokab + " and no_kec=" + nokec + " and no_kel=" + nokel;
       System.out.println(query);
       st = conn.prepareStatement(query);
       st.execute();
       flag=true;
       st.close();
       conn.close();

       }catch(Exception err)
       {
         flag=false;
       }
       finally{
         try
         {
           if (st!=null) st.close();
           st=null;
         }catch(Exception err)
         {

         }
         try
         {
           if (conn!=null) conn.close();
           conn=null;
         }catch(Exception err)
         {

         }
       }
       /**@todo Complete this method*/
       return flag;

  }
  public boolean setupKab(String nokab, String noprop, String jabatan, String namapej, String status, String nippej) {
    Connection conn = null;
   PreparedStatement st = null;
   boolean flag=false;
   String query="";

    try{
       ConnectorDB connectorDb = new ConnectorDB();
       conn = connectorDb.getConnection();
       query="update setup_kab set jabatan='" + jabatan + "',nama_pej='" + namapej + "',NIP_PEJ='" + nippej + "',STAT_PNDTNG='" + status + "'   where no_prop=" + noprop + " and no_kab=" + nokab;
       System.out.println(query);
       st = conn.prepareStatement(query);
       st.execute();
       flag=true;
       st.close();
       conn.close();

       }catch(Exception err)
       {
         flag=false;
       }
       finally{
         try
         {
           if (st!=null) st.close();
           st=null;
         }catch(Exception err)
         {

         }
         try
         {
           if (conn!=null) conn.close();
           conn=null;
         }catch(Exception err)
         {

         }
       }
       return flag;
  }
  public boolean setupKec2(String nokec, String nokab, String noprop, String jabatan, String namapej, String status, String nippej, String flttd) {
    Connection conn = null;
    PreparedStatement st = null;
    boolean flag=false;
    String query="";
    try{
    ConnectorDB connectorDb = new ConnectorDB();
    conn = connectorDb.getConnection();
    query="update setup_kec set jabatan='" + jabatan + "',nama_pej='" + namapej + "',STAT_PNDTNG='" + status + "',NIP_PEJ='" + nippej + "',FILE_TTD='" + flttd + "' where no_prop=" + noprop + " and no_kab=" + nokab + " and no_kec=" + nokec;
    System.out.println(query);
    st = conn.prepareStatement(query);
    st.execute();
    flag=true;
    st.close();
    conn.close();

    }catch(Exception err)
    {
      flag=false;
      err.printStackTrace();
    }
    finally{
      try
      {
        if (st!=null) st.close();
        st=null;
      }catch(Exception err)
      {

      }
      try
      {
        if (conn!=null) conn.close();
        conn=null;
      }catch(Exception err)
      {

      }
    }
    /**@todo Complete this method*/
    return flag;

  }
  public boolean setup_kel2(String nokel, String nokec, String nokab, String noprop, String jabakel, String namapejkel, String niplur, String flttd) {
    Connection conn = null;
    PreparedStatement st = null;
    boolean flag=false;
    String query="";

     try{
        ConnectorDB connectorDb = new ConnectorDB();
        conn = connectorDb.getConnection();
        query="update setup_kel set jabatan='" + jabakel + "',nama_lur='" + namapejkel + "',NIP_LUR='" + niplur + "',FILE_TTD='" + flttd + "' where no_prop=" + noprop + " and no_kab=" + nokab + " and no_kec=" + nokec + " and no_kel=" + nokel;
        System.out.println(query);
        st = conn.prepareStatement(query);
        st.execute();
        flag=true;
        st.close();
        conn.close();

        }catch(Exception err)
        {
          flag=false;
        }
        finally{
          try
          {
            if (st!=null) st.close();
            st=null;
          }catch(Exception err)
          {

          }
          try
          {
            if (conn!=null) conn.close();
            conn=null;
          }catch(Exception err)
          {

          }
        }
        /**@todo Complete this method*/
        return flag;

  }
  public String FileTandaTangan(String deprop,String dekab,String dekec,String dekel) {
    String kembali="";
     Connection conn=null;
     ConnectorDB connectorDb = new ConnectorDB();
     ResultSet rs = null;
     Statement stmt = null;
     try
     {
       conn = connectorDb.getConnection();
       stmt = conn.createStatement();

       String query = "select FILE_TTD from setup_kel where no_prop=" + deprop + "and no_kab=" +
       dekab + "and no_kec=" + dekec + "and no_kel=" + dekel;

       rs = stmt.executeQuery(query.trim());
       while (rs.next()) {
        kembali = rs.getString("FILE_TTD");
        }

        if(rs!=null) {rs.close();}

        if(stmt!=null) {stmt.close();}

     }
     catch(Exception e) {
       e.printStackTrace();
       //siakWriter.writeFile(e);
     }


     return kembali;

  }
}