package riwayat;
import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;

public class RiwayatTempatTinggalBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

public Vector getDataRiwayatTempatTinggal(String nik, int kewarganegaraan,String no_prop,String no_kab,String no_kec) throws RemoteException
  {

    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    PreparedStatement stmt = null;
    String query="";

    PreparedStatement stmtDataKeluarga = null;
    ResultSet rsDataKeluarga = null;
    RiwayatObject obj=null;
    int count=1;

    String nama_lengkp=null, kk_lma=null, kk_bru=null, nama_kepala_lma=null, almt_lma=null, almt_rt_lma;
    String almt_rw_lma=null, dusun_lma=null, almt_kodepos_lma=null, almt_telp_lma=null, renc_tgl=null, tgl_dtng=null, nama_cmat_lma=null;
    String nama_lur_lma=null, nama_pet_lma=null;
    String nama_camat_bru=null, nama_lur_bru=null, nama_pet_bru=null, almt_bru=null, almt_rt_bru=null, almt_rw_bru=null, almt_dusun_bru=null, almt_kdpos_bru=null, almt_telp_bru=null;
    String concat=null ;
    String kwn="";

  try
    {
      conn = connectorDb.getConnection();
   concat="";
       if ((no_kec!=null) && !(no_kec.trim().equals("")))
       {
         concat= " and no_kab=" + no_kab + " and no_kec=" + no_kec;
                     kwn="1";
       }
       else
       {
            concat=" and no_kab=" + no_kab;
            nik=nik.substring(1);
            kwn="2";
       }

   query=" SELECT  *  FROM ( " +
       "SELECT y.NAMA_LENGKP,TO_CHAR(x.no_kk_lma,'0000000000000000') kk_lma, " +
       " TO_CHAR(x.NO_KK_BRU,'0000000000000000') kk_bru,x.NAMA_KEPALA_LMA, x.ALMT_LMA, trim(TO_CHAR(x.ALMT_RT_LMA,'000')) ALMT_RT_LMA," +
       " trim(TO_CHAR(x.ALMT_RW_LMA,'000')) ALMT_RW_LMA, " +
       " x.dusun_lma, x.ALMT_KODEPOS_LMA, x.ALMT_TELP_LMA, " +
       " y.no_prop,y.no_kab,y.no_kec,to_char(x.RENC_TGL,'dd-mm-yyyy') RENC_TGL,to_char(x.TGL_DTNG,'dd-mm-yyyy') TGL_DTNG,  " +
       " x.NAMA_CMAT_LMA, x.NAMA_LUR_LMA, x.NAMA_PET_LMA,x.NAMA_CAMAT_BRU,x.NAMA_LUR_BRU,x.NAMA_PET_BRU,ROWNUM rn " +
       " FROM RIWAYAT_TMPT_MASTER_WNI_WNA x ,RIWAYAT_TMPT_DETAIL_WNI_WNA y " +
       " WHERE x.NO_KK_LMA=y.NO_KK_LMA AND x.TGL_DTNG=y.TGL_DTNG " +
       " AND y.nik=" + nik + " and no_prop=" + no_prop +  concat + " and KWRNGRN=" + kwn +
       " ORDER BY y.TGL_DTNG) a, (SELECT COUNT(1) cn FROM RIWAYAT_TMPT_DETAIL_WNI_WNA " +
       " WHERE nik=" + nik + " ) b WHERE a.rn BETWEEN b.cn-3 AND cn ";

            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            count=1;

      while(rs.next())
      {
        nama_lengkp = rs.getString("NAMA_LENGKP");
        kk_lma = rs.getString("KK_LMA");
        kk_bru = rs.getString("KK_BRU");
        nama_kepala_lma = rs.getString("NAMA_KEPALA_LMA");
        almt_lma = rs.getString("ALMT_LMA");
        almt_rt_lma= rs.getString("ALMT_RT_LMA");
        almt_rw_lma= rs.getString("ALMT_RW_LMA");
        dusun_lma=rs.getString("dusun_lma");
        almt_kodepos_lma=rs.getString("almt_kodepos_lma");
        almt_telp_lma=rs.getString("almt_telp_lma");

      if (count>1)
        {

        tgl_dtng = rs.getString("TGL_DTNG");
        nama_cmat_lma=rs.getString("nama_cmat_lma");
        nama_lur_lma=rs.getString("nama_lur_lma");
        nama_pet_lma=rs.getString("nama_pet_lma");
        }
        renc_tgl= rs.getString("RENC_TGL");
        nama_camat_bru= rs.getString("NAMA_CAMAT_BRU");
        nama_lur_bru= rs.getString("NAMA_LUR_BRU");
        nama_pet_bru= rs.getString("NAMA_PET_BRU");

        obj=new RiwayatObject(nik,nama_lengkp,kk_lma,nama_kepala_lma,almt_lma,
        almt_rt_lma,almt_rw_lma,dusun_lma,almt_kodepos_lma,
        almt_telp_lma,renc_tgl,tgl_dtng,nama_cmat_lma,nama_lur_lma,nama_pet_lma);

        vData.addElement(obj);
        count++;
      }
         rs.close();
         stmt.close();

        stmtDataKeluarga = conn.prepareStatement(
        " select ALAMAT,trim(to_char(NO_RT,'000')) NO_RT," +
        " trim(to_char(NO_RW,'000')) no_rw,DUSUN,KODE_POS,TELP from data_keluarga where no_kk=" + kk_bru);

        rsDataKeluarga = stmtDataKeluarga.executeQuery();

        while(rsDataKeluarga.next())
        {
          almt_bru=rsDataKeluarga.getString("ALAMAT");
          almt_rt_bru=rsDataKeluarga.getString("NO_RT");
          almt_rw_bru=rsDataKeluarga.getString("NO_RW");
          almt_dusun_bru=rsDataKeluarga.getString("dusun");
          almt_kdpos_bru=rsDataKeluarga.getString("KODE_POS");
          almt_telp_bru=rsDataKeluarga.getString("TELP");

         obj=new RiwayatObject(nik,nama_lengkp,kk_bru,nama_kepala_lma,almt_bru,
           almt_rt_bru,almt_rw_bru,almt_dusun_bru,almt_kdpos_bru,almt_telp_bru,
           renc_tgl,tgl_dtng,nama_camat_bru,nama_lur_bru,nama_pet_bru);
           vData.addElement(obj);
        }

        rsDataKeluarga.close();
        stmtDataKeluarga.close();

        rs=null;
        stmt=null;
        rsDataKeluarga = null;
        stmtDataKeluarga = null;
      conn.close();
      conn = null;
    }
    catch(Exception e)
    {
      e.printStackTrace();
      siakWriter.writeFile(e);
    }
    finally
    {
      try
      {
        if (rs != null)
          rs.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (stmt != null)
          stmt.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (rsDataKeluarga != null)
          rsDataKeluarga.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (stmtDataKeluarga != null)
          stmtDataKeluarga.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }

      try
      {
        if (conn != null)
          conn.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
    }
    return vData;
  }

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "RiwayatTempatTinggalBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
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
}