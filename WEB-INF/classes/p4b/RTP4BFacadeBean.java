package p4b;

import javax.ejb.*;
import com.db.connection.ServiceEntity;
import p4b.*;
import javax.naming.*;
import java.util.*;
import java.sql.*;
import com.db.connection.*;
import oracle.jdbc.*;

public class RTP4BFacadeBean implements SessionBean {
  SessionContext sessionContext;
  private ServiceEntity locator;
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
public Vector getDaftarAnggotaRumahTangga(String noProp, String noKab, String noKec, String noKel, int offset, int length) {
    Connection con=null;
    CallableStatement ps = null;
    ResultSet rs=null;
    ConnectorDB con_db=null;
    Vector parent = new Vector();
    Vector child = new Vector();
    String kdprop="",kdkabu="",kdkeca="",kdkelr="",nbs="",nurt="",no_kk="";
  try {
      con_db = new ConnectorDB();
      con = con_db.getConnection();
      String query ="begin ? =: getRTSIAK(?,?,?,?,?,?);end;";
      ps = con.prepareCall(query);
// register the type of the out param - an Oracle specific type
      ps.registerOutParameter(1, OracleTypes.CURSOR);
      ps.setString(2, noProp);
      ps.setString(3, noKab);
      ps.setString(4, noKec);
      ps.setString(5, noKel);
      ps.setInt(6, offset);
      ps.setInt(7,length);
      ps.execute();
//System.out.println("Before Resulset");
      rs = (ResultSet)ps.getObject(1);
      //System.out.println("Entered After Resulset");
      RtDTO dto=null;
      RtArtDTO agdto=null;
      rs.next();
      //System.out.println("KODE PROP----" + rs.getString("KDPROP"));
      kdprop=rs.getString("KDPROP");
      kdkabu=rs.getString("KDKABU");
      kdkeca=rs.getString("KDKECA");
      kdkelr=rs.getString("KDKELR");
      nbs= rs.getString("NBS");
      nurt=rs.getString("NURT");
      dto = new RtDTO(kdprop,kdkabu,kdkeca,kdkelr,nbs,nurt,rs.getString("no_kk"),rs.getString("alamat"));
      agdto=new RtArtDTO(rs.getString("NOART"),
            rs.getString("NAMA"),
            rs.getString("tgl_lahir"),
            rs.getString("TMPLAHIR"),
            rs.getString("JNSKEL"),
            rs.getString("STKAWIN"),
            rs.getString("STDLMRT"));
      child.add(agdto);
      while (rs.next()) {
      if (!kdprop.equals(rs.getString("KDPROP").trim())
            &&
            !kdkabu.equals(rs.getString("KDKABU").trim())
            &&
            !kdkeca.equals(rs.getString("KDKECA").trim())
            &&
            !kdkelr.equals(rs.getString("KDKELR").trim())
            &&
            !nbs.equals(rs.getString("NBS").trim())
            &&
            !nurt.equals(rs.getString("NURT").trim())
            )
        {
          dto.setAnggotaKeluarga(child);
          parent.add(dto);
          dto = new RtDTO(kdprop,kdkabu,kdkeca,kdkelr,nbs,nurt,rs.getString("no_kk"),rs.getString("alamat"));
        }
           agdto=new RtArtDTO(rs.getString("NOART"),
              rs.getString("NAMA"),
              rs.getString("tgl_lahir"),
              rs.getString("TMPLAHIR"),
              rs.getString("JNSKEL"),
              rs.getString("STKAWIN"),
              rs.getString("STDLMRT"));
              child.add(agdto);
              kdprop=rs.getString("KDPROP").trim();
              kdkabu=rs.getString("KDKABU").trim();
              kdkeca=rs.getString("KDKECA").trim();
              kdkelr=rs.getString("KDKELR").trim();
              nbs= rs.getString("NBS").trim();
              nurt=rs.getString("NURT").trim();
          }
        }
      catch (Exception ex) {
      //System.out.println(ex.getMessage());
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