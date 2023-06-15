package p4b;
import javax.naming.*;
import java.util.*;
import java.sql.*;
import com.db.connection.*;
import oracle.jdbc.driver.*;
import com.db.connection.ServiceEntity;

public class ReadRT {
public Vector getDaftarAnggotaRumahTangga(String noProp, String noKab, String noKec, String noKel) {
    Connection con=null;
    CallableStatement ps = null;
    ResultSet rs=null;
    ConnectorDB con_db=null;
    Vector parent = new Vector();
    Vector child = new Vector();
    String kdprop="",kdkabu="",kdkeca="",kdkelr="",nbs="",nurt="",no_kk="";
   java.text.SimpleDateFormat fmt=new    java.text.SimpleDateFormat("hh:mm:ss");
  try {
      con_db = new ConnectorDB();
      con = con_db.getConnection();
     String query ="begin ? := getRTSIAK(?,?,?,?);end;";
      ps = con.prepareCall(query);
// register the type of the out param - an Oracle specific type
      ps.registerOutParameter(1, OracleTypes.CURSOR);
      ps.setString(2, noProp);
      ps.setString(3, noKab);
      ps.setString(4, noKec);
      ps.setString(5, noKel);
      ps.execute();
   //System.out.println("Start Time->" + fmt.format(new java.util.Date()));
      rs = (ResultSet)ps.getObject(1);
      RtDTO dto=null;
      RtArtDTO agdto=null;
      rs.next();
      kdprop=rs.getString("KDPROP");
      kdkabu=rs.getString("KDKABU");
      kdkeca=rs.getString("KDKECA");
      kdkelr=rs.getString("KDKELR");
      nbs= rs.getString("NBS");
      nurt=rs.getString("NURT");
      dto = new RtDTO(kdprop,kdkabu,kdkeca,kdkelr,nbs,nurt,rs.getString("NO_KK"),rs.getString("ALAMAT"));
      agdto=new RtArtDTO(rs.getString("NOART"),
            rs.getString("NAMA"),
            rs.getString("TGLLHR"),
            rs.getString("TMPLAHIR"),
            rs.getString("JENIS_KL"),
            rs.getString("STKAWIN"),
            rs.getString("STDLMRT"));
  int cntr=1;
      while (rs.next()) {
      if (kdprop.trim().equals(rs.getString("KDPROP").trim())
            &&
            kdkabu.trim().equals(rs.getString("KDKABU").trim())
            &&
            kdkeca.trim().equals(rs.getString("KDKECA").trim())
            &&
            kdkelr.trim().equals(rs.getString("KDKELR").trim())
            &&
            nbs.trim().equals(rs.getString("NBS").trim())
            &&
            nurt.trim().equals(rs.getString("NURT").trim()))
        {
          child.addElement(agdto);
        }
        else
        {
          child.addElement(agdto);
          dto.setAnggotaKeluarga(child);
          child=new Vector();
          parent.addElement(dto);
          dto = new RtDTO(rs.getString("KDPROP"),rs.getString("KDKABU"),rs.getString("KDKECA"),rs.getString("KDKELR"),rs.getString("NBS"),rs.getString("NURT"),rs.getString("no_kk"),rs.getString("alamat"));
        }
        agdto=new RtArtDTO(rs.getString("NOART"),
                           rs.getString("NAMA"),
                           rs.getString("TGLLHR"),
                           rs.getString("TMPLAHIR"),
                           rs.getString("JENIS_KL"),
                           rs.getString("STKAWIN"),
                           rs.getString("STDLMRT"));

              kdprop=rs.getString("KDPROP").trim();
              kdkabu=rs.getString("KDKABU").trim();
              kdkeca=rs.getString("KDKECA").trim();
              kdkelr=rs.getString("KDKELR").trim();
              nbs= rs.getString("NBS").trim();
              nurt=rs.getString("NURT").trim();
          }

          rs.close();
          con.close();
     //System.out.println("End Time->" + fmt.format(new java.util.Date()));
        }
      catch (Exception ex) {
      System.out.println(ex.getMessage());
      ex.printStackTrace();

    } finally {
      try {
        rs.close();
      }
      catch (SQLException ex1) {
      }
      try {
        con.close();
        con=null;
      }
      catch (SQLException ex2) {
      }

    }
    //System.out.println(parent.size());
    return parent;
  }
  public Vector getDaftarAnggotaRumahTangga(String noProp, String noKab, String noKec, String noKel,String name) {
      Connection con=null;
      CallableStatement ps = null;
      ResultSet rs=null;
      ConnectorDB con_db=null;
      Vector parent = new Vector();
      Vector child = new Vector();
      boolean readanother=false;
      String kdprop="",kdkabu="",kdkeca="",kdkelr="",nbs="",nurt="",no_kk="";
        java.text.SimpleDateFormat fmt=new    java.text.SimpleDateFormat("hh:mm:ss");
    try {
        con_db = new ConnectorDB();
        con = con_db.getConnection();

       String query ="begin ? := getRTSIAKName(?,?,?,?,?);end;";
        ps = con.prepareCall(query);
// register the type of the out param - an Oracle specific type
        ps.registerOutParameter(1, OracleTypes.CURSOR);
        ps.setString(2, noProp);
        ps.setString(3, noKab);
        ps.setString(4, noKec);
        ps.setString(5, noKel);
        ps.setString(6, name);
        ps.execute();
   //System.out.println("Start Time->" + fmt.format(new java.util.Date()));
        rs = (ResultSet)ps.getObject(1);
        RtDTO dto=null;
        RtArtDTO agdto=null;
        rs.next();
        kdprop=rs.getString("KDPROP");
        kdkabu=rs.getString("KDKABU");
        kdkeca=rs.getString("KDKECA");
        kdkelr=rs.getString("KDKELR");
        nbs= rs.getString("NBS");
        nurt=rs.getString("NURT");
        dto = new RtDTO(kdprop,kdkabu,kdkeca,kdkelr,nbs,nurt,rs.getString("NO_KK"),rs.getString("ALAMAT"));
        agdto=new RtArtDTO(rs.getString("NOART"),
              rs.getString("NAMA"),
              rs.getString("TGLLHR"),
              rs.getString("TMPLAHIR"),
              rs.getString("JENIS_KL"),
              rs.getString("STKAWIN"),
              rs.getString("STDLMRT"));
      readanother=rs.next();
      if (!readanother)
      {
        //System.out.println(1);
        child.addElement(agdto);
        dto.setAnggotaKeluarga(child);
        parent.addElement(dto);
      }
        while (readanother) {
          if (kdprop.trim().equals(rs.getString("KDPROP").trim())
              &&
              kdkabu.trim().equals(rs.getString("KDKABU").trim())
              &&
              kdkeca.trim().equals(rs.getString("KDKECA").trim())
              &&
              kdkelr.trim().equals(rs.getString("KDKELR").trim())
              &&
              nbs.trim().equals(rs.getString("NBS").trim())
              &&
              nurt.trim().equals(rs.getString("NURT").trim()))
          {
            //System.out.println(2);
            child.addElement(agdto);
          }
          else
          {
            //System.out.println(3);
            child.addElement(agdto);
            dto.setAnggotaKeluarga(child);
            child=new Vector();
            parent.addElement(dto);
            dto = new RtDTO(rs.getString("KDPROP"),rs.getString("KDKABU"),rs.getString("KDKECA"),rs.getString("KDKELR"),rs.getString("NBS"),rs.getString("NURT"),rs.getString("no_kk"),rs.getString("alamat"));
          }
          agdto=new RtArtDTO(rs.getString("NOART"),
                             rs.getString("NAMA"),
                             rs.getString("TGLLHR"),
                             rs.getString("TMPLAHIR"),
                             rs.getString("JENIS_KL"),
                             rs.getString("STKAWIN"),
                             rs.getString("STDLMRT"));
        //System.out.println(4);
          kdprop=rs.getString("KDPROP").trim();
          kdkabu=rs.getString("KDKABU").trim();
          kdkeca=rs.getString("KDKECA").trim();
          kdkelr=rs.getString("KDKELR").trim();
          nbs= rs.getString("NBS").trim();
          nurt=rs.getString("NURT").trim();
          readanother=rs.next();
          if (!readanother)
          {
            //System.out.println(1);
            child.addElement(agdto);
            dto.setAnggotaKeluarga(child);
            parent.addElement(dto);
          }
        }

        rs.close();
        con.close();
   //System.out.println("END Time->" + fmt.format(new java.util.Date()));
      }
      catch (Exception ex) {
                //System.out.println(5);
        System.out.println(ex.getMessage());
        ex.printStackTrace();

      } finally {
        try {
          rs.close();
        }
        catch (SQLException ex1) {
        }
        try {
          con.close();
          con=null;
        }
        catch (SQLException ex2) {
        }

      }
      return parent;
    }

 }