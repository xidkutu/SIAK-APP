<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%
    String no_kel,nama_kel,select,id1=null,kel=null,nik_sksi1=null,nik_sksi2=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factory1;

    Login remote;

    WNIBiodataHome home = null;
    WNIBiodata remote2;
    Vector v1;
    MatiKabData lahirData=null;

String edit = "";
       boolean allowed = true;
String nik_jenasah = null;
int wn_ibu = 0;
String nik_ibu = null;
String nama_ibu = null;
String getDDTglLahirIbu = null;
String getMMTglLahirIbu = null;
String getYYTglLahirIbu = null;
int jenis_pkrjn_ibu = 0;
String alamat_ibu = null;
String no_rt_ibu = null;
String no_rw_ibu = null;
String dusun_ibu = null;
String kodepos_ibu = null;
String telp_ibu = null;
String nama_prop_ibu = null;
String nama_kab_ibu = null;
String nama_kec_ibu = null;
String nkelibu = null;
int ketrunan_ibu = 0;
String bangsa_ibu = null;
String getDDTglKawinIbu = null;
String getMMTglKawinIbu = null;
String getYYTglKawinIbu = null;

int wn_ayah = 0;
String nik_ayah = null;
String nama_ayh = null;
String getDDTglLahirAyah = null;
String getMMTglLahirAyah = null;
String getYYTglLahirAyah = null;
int jenis_pkrjn_ayh = 0;
String alamat_ayh = null;
String no_rt_ayh = null;
String no_rw_ayh = null;
String dusun_ayh = null;
String kodepos_ayh = null;
String telp_ayh = null;
String nama_prop_ayh = null;
String nama_kab_ayh = null;
String nama_kec_ayh = null;
String nkelayh = null;
int ketrunan_ayh = 0;
String bangsa_ayh = null;
String getDDTglKawinAyah = null;
String getMMTglKawinAyah = null;
String getYYTglKawinAyah = null;

int wn_pelapor = 0;
String nik_pelapor = null;
String nama_pelapor = null;
String tgl_lahir_pelapor = null;
int jenis_pkrjn_plpor = 0;
String alamat_pelapor = null;
String rt_pelapor = null;
String rw_pelapor = null;
String dusun_pelapor = null;
String kodepos_pelapor = null;
String telp_pelapor = null;
String no_akta_lhr_dd2 = null;
String no_akta_lhr_mm2 = null;
String no_akta_lhr_yy2 = null;
	 boolean kecInput = false;
int wn_saksi_1 = 0;
int wn_saksi_2 = 0;
WniWnaObj wniWnaObj = null;

int statusReqIbu = TIDAKADA;
int statusReqAyah = TIDAKADA;

int radiobutton = -1;
radiobutton = -1;
int radiobutton1 = -1;
radiobutton1 = -1;
int radiobutton3 = -1;
radiobutton3 = -1;
int radiobutton4 = -1;
radiobutton4 = -1;

%>

<%

 try
   {
     Vector errors = new Vector();
     factory=ServiceController.getInstance();

     nik_jenasah = (request.getParameter("nik_jnsah")==null?"":request.getParameter("nik_jnsah"));
     nik_ibu = (request.getParameter("nik_ibu")==null?"":request.getParameter("nik_ibu"));
     nik_ayah = (request.getParameter("nik_ayh")==null?"":request.getParameter("nik_ayh"));
     nik_pelapor = (request.getParameter("nik_plpor")==null?"":request.getParameter("nik_plpor"));
     nik_sksi1 = (request.getParameter("nik_sksi1")==null?"":request.getParameter("nik_sksi1"));
     nik_sksi2 = (request.getParameter("nik_sksi2")==null?"":request.getParameter("nik_sksi2"));

     kel = new String("KELUAR");

     v = new Vector();
         record = (UserInfo1)session.getAttribute("remoteRef");

      home = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);

      if(home != null)
      {
          remote2 = home.create();
if (!nik_jenasah.equals("") && !nik_sksi1.equals("") && !nik_sksi2.equals("")) {
        if (!nik_jenasah.equals("") || !nik_ibu.equals("") || !nik_ayah.equals("") || !nik_pelapor.equals("")) {
           wniWnaObj = remote2.getMatiKec(nik_jenasah, nik_ibu, nik_ayah, nik_pelapor, Integer.parseInt(record.getLevelId()));
        }
          lahirData=(MatiKabData)remote2.getMatiData(nik_jenasah, nik_sksi1, nik_sksi2);
          if (lahirData!=null) {
           if (allowed) {
                if (lahirData.getRecordJnsah()==null) {
                  errors.add("NIK Jenazah Salah/Tidak Ada");
                }
              if (lahirData.getRecordJnsah()!=null && lahirData.getRecordPelapor()==null) {
                 //errors.add("NIK Pelapor tidak ada ");
                 kecInput = true;
              }
                if (lahirData.getRecordSaksi()!=null) {
                   if (lahirData.getRecordSaksi().getSaksi1Record()==null) {
                      errors.add("NIK Saksi I Salah/Tidak Ada");
                   }
                   if (lahirData.getRecordSaksi().getSaksi2Record()==null) {
                      errors.add("NIK Saksi II Salah/Tidak Ada");
                   }
              } else {
                 errors.add("NIK Saksi I Salah/Tidak Ada");
                 errors.add("NIK Saksi II Salah/Tidak Ada");
              }
             } else {
                 errors.add("Data Kematian sudah tercatat");
             }
         } else {
		    kecInput = true;

         }
       }
      }

if (kecInput) {
   statusReqIbu = TIDAKADA;
   statusReqAyah = TIDAKADA;
   if (wniWnaObj!=null &&
       wniWnaObj.getWniObj()!=null &&
       wniWnaObj.getWnaObj()!=null) {
       if (!"0".equals(nik_ibu) && !"".equals(nik_ibu) && wniWnaObj.getWniObj().getRecord2()==null &&
           wniWnaObj.getWnaObj().getRecord2()==null) { // ADANOTEXIST
           statusReqIbu = ADANOTEXIST;
       } else if (!"0".equals(nik_ibu) && !"".equals(nik_ibu) && wniWnaObj.getWniObj().getRecord2()!=null ||
           wniWnaObj.getWnaObj().getRecord2()!=null) { // ADAEXIST
           statusReqIbu = ADAEXIST;
       }
       if (!"0".equals(nik_ayah) && !"".equals(nik_ayah) && wniWnaObj.getWniObj().getRecord3()==null &&
           wniWnaObj.getWnaObj().getRecord3()==null) { // ADANOTEXIST
           statusReqAyah = ADANOTEXIST;
       } else if (!"0".equals(nik_ayah) && !"".equals(nik_ayah) && wniWnaObj.getWniObj().getRecord3()!=null ||
           wniWnaObj.getWnaObj().getRecord3()!=null) { // ADAEXIST
           statusReqAyah = ADAEXIST;
       }
   }
/*
   if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton"))) {
      radiobutton = 0;
  } else if ("Tidak Ada".equalsIgnoreCase(request.getParameter("radiobutton"))) {
     radiobutton = 1;
  }

   if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton3"))) {
      radiobutton3 = 0;
  } else if ("Tidak Ada".equalsIgnoreCase(request.getParameter("radiobutton3"))) {
     radiobutton3 = 1;
  }
*/

} else {
   statusReqIbu = ADANOTEXIST;
   statusReqAyah = ADANOTEXIST;
   if (lahirData!=null &&
       lahirData.getRecordJnsah()!=null) {
       if (lahirData.getRecordJnsah().getNikIbu()!=null && !lahirData.getRecordJnsah().getNikIbu().equals("0")) {
          statusReqIbu = ADAEXIST;
       } else if (lahirData.getRecordJnsah().getNamaLgkpIbu()!=null) {
          statusReqIbu = TIDAKADA;
       } else {// ADANOTEXIST
          statusReqIbu = ADANOTEXIST;
       }
       if (lahirData.getRecordJnsah().getNikAyh()!=null && !lahirData.getRecordJnsah().getNikAyh().equals("0")) {
          statusReqAyah = ADAEXIST;
       } else if (lahirData.getRecordJnsah().getNamaLgkpAyh()!=null) {
          statusReqAyah = TIDAKADA;
       } else {// ADANOTEXIST
          statusReqAyah = ADANOTEXIST;
       }
   }
}


if (kecInput) {
    wn_ibu = ("".equals(nik_ibu) || "0".equals(nik_ibu)?(request.getParameter("radiobutton1")==null?0:Integer.parseInt(request.getParameter("radiobutton1"))):(nik_ibu.startsWith("A")?2:1));
//(request.getParameter("radiobutton1")==null?0:Integer.parseInt(request.getParameter("radiobutton1")));
  radiobutton1 = wn_ibu-1;

  wn_ayah = ("".equals(nik_ayah) || "0".equals(nik_ayah)?(request.getParameter("radiobutton4")==null?0:Integer.parseInt(request.getParameter("radiobutton4"))):(nik_ayah.startsWith("A")?2:1));
  radiobutton4 = wn_ayah-1;


  wn_pelapor = ("".equals(nik_pelapor)?0:(nik_pelapor.startsWith("A")?2:1));

} else if (lahirData!=null && lahirData.getRecordJnsah()!=null /*&& lahirData.getRecordJnsah().getNikIbu()!=null*/) {

if (statusReqIbu!=ADANOTEXIST) {
wn_ibu =lahirData.getRecordJnsah().getKwrngrnIbu().intValue();
//(lahirData.getRecordJnsah().getNikIbu().startsWith("A")?2:1);
radiobutton1 = wn_ibu-1;
}
if (statusReqAyah!=ADANOTEXIST) {
wn_ayah = lahirData.getRecordJnsah().getKwrngrnAyh().intValue();
//wn_ayah = (lahirData.getRecordJnsah().getNikAyh().startsWith("A")?2:1);
radiobutton4 = wn_ayah-1;
}
if (lahirData.getRecordPelapor()!=null) {
  wn_pelapor = (lahirData.getRecordJnsah().getNikPlpor()==null?0:(lahirData.getRecordJnsah().getNikPlpor().toString().startsWith("A")?2:1));
}
}


 int step = 0;
 step = 0;
/*
   if (lahirData!=null) {
     step = 1;
     if (lahirData.getRecordJnsah()!=null &&
         (kecInput || lahirData.getRecordPelapor()!=null) &&
         lahirData.getRecordSaksi()!=null &&
         lahirData.getRecordSaksi().getSaksi1Record()!=null &&
         lahirData.getRecordSaksi().getSaksi2Record()!=null) {
        step = 2;
     }
   }
*/
   if (errors.isEmpty() &&
       lahirData!=null &&
       lahirData.getRecordSaksi()!=null &&
       lahirData.getRecordSaksi().getSaksi1Record()!=null &&
       lahirData.getRecordSaksi().getSaksi2Record()!=null) {
       if (kecInput ||
           (lahirData.getRecordJnsah()!=null &&
            lahirData.getRecordJnsah().getNikJnsah()!=null &&
            statusReqIbu!=ADANOTEXIST &&
            statusReqAyah!=ADANOTEXIST)) {
          step = 1;
       }

       if (step>=1) {
          if (kecInput) {
            if (wniWnaObj!=null) {
               if (wniWnaObj.getWniObj()!=null && wniWnaObj.getWnaObj()!=null) {
                 if (errors==null) errors = new Vector();
                 if (!("".equals(nik_jenasah)) && wniWnaObj.getWniObj().getRecord1()==null && wniWnaObj.getWnaObj().getRecord1()==null) {
                    errors.add("NIK Bayi tidak ada ");
                 }
                 if (statusReqIbu==ADANOTEXIST) {
                    errors.add("NIK Ibu tidak ada ");
                 }
                 if (statusReqAyah==ADANOTEXIST) {
                    errors.add("NIK Ayah tidak ada ");
                 }
                 if (!("".equals(nik_pelapor)) && wniWnaObj.getWniObj().getRecord4()==null && wniWnaObj.getWnaObj().getRecord4()==null) {
                    errors.add("NIK Pelapor tidak ada ");
                 }
                 if (errors.isEmpty()) {
                    step = 2;
                 }
               }
            } else {
            }
          } else if (lahirData.getRecordJnsah()!=null &&
            lahirData.getRecordJnsah().getNikJnsah()!=null &&
            statusReqIbu!=ADANOTEXIST &&
            statusReqAyah!=ADANOTEXIST) {
               step = 3;
          }
       }
   }

if(errors.isEmpty()) { errors= null;}

if (step>0) {
  if (wn_ibu>0) {
  if (statusReqIbu>TIDAKADA) {
      radiobutton = 0;
  } else if (statusReqIbu==TIDAKADA) {
     radiobutton = 1;
  }
  }
  if (wn_ayah>0) {
  if (statusReqAyah>TIDAKADA) {
      radiobutton3 = 0;
  } else if (statusReqAyah==TIDAKADA) {
     radiobutton3 = 1;
  }
  }
}
%>
<html>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<link type="text/css" rel="StyleSheet" href="Templates/tab.webfx.css" />
<script type="text/javascript" src="Templates/tabpane.js"></script>
<SCRIPT language="JavaScript" src="scripts/util.js"></SCRIPT>
<SCRIPT language="JavaScript" src="scripts/Kematian.js"></SCRIPT>
<SCRIPT language="JavaScript" src="scripts/SaksiMatiNik.js"></SCRIPT>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post">
<script language="text/javaScript">
var tp1;
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="topcapil.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20">
                  <div align="center"><span class="submenu">Pencatatan Kematian</span><br>
                    <br>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
                <td>
<% String jsp = "data_wilayah.jsp?level=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();
%>
                          <jsp:include page="<%=jsp%>"/>
                  </td>
        </tr>
		<%
                         if (errors!=null) {
                           for (int i=0; i<errors.size(); i++)  {
                   %>
                           <tr><td><%=printError(errors.elementAt(i).toString(), "left")%></td></tr>
                   <%
                           }
    		         }
                    %>
      </table>
    </td>
  </tr>
</table width="100%" border="0" cellspacing="5" cellpadding="5">
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
  <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td valign="top">
                  <div align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                      <tr>

              <td align="center">
<div class="tab-pane" id="tab-pane-1">
<script type="text/javascript">
tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);
</script>
<%
int wn_jenasah = ("".equals(nik_jenasah)?0:(nik_jenasah.substring(0,1).equals("A")?2:1));
//if(lahirData!=nik_jenasah && lahirData.getRecordJnsah() == null
if ("".equals(nik_jenasah) &&
    ((kecInput &&
      (wniWnaObj!=null ||
       wniWnaObj.getWniObj()!=null ||
       wniWnaObj.getWnaObj()!=null ||
       (wniWnaObj.getWniObj().getRecord1()==null &&
        wniWnaObj.getWnaObj().getRecord1()==null))) ||
     (!kecInput && lahirData!=null && lahirData.getRecordJnsah()==null))) {
edit="disabled";
}

String nama_jenasah = "-";
String alamat_jenasah = "-";
String rt_jenasah = "-";

String rw_jenasah = "-";
String dusun_jenasah = "-";
String kodepos_jenasah = "-";
String telp_jenasah = "-";
String jenis_kelamin_jenasah = "-";
String tanggal_lahir_jenasah = "-";
String tempat_lahir_jenasah = "-";
String jenis_pekerjaan_jenasah = "-";
int ktrunan_jnsah = ((request.getParameter("ktrunan_jnsah")==null)?0:Integer.parseInt(request.getParameter("ktrunan_jnsah")));
String bangsa_jenasah = "-";
String anak_ke_mt = ((request.getParameter("anak_ke_mt")==null)?"":request.getParameter("anak_ke_mt"));
String tgl_mati_dd = ((request.getParameter("tgl_mati_dd")==null)?"":request.getParameter("tgl_mati_dd"));
String tgl_mati_mm = ((request.getParameter("tgl_mati_mm")==null)?"":request.getParameter("tgl_mati_mm"));
String tgl_mati_yy = ((request.getParameter("tgl_mati_yy")==null)?"":request.getParameter("tgl_mati_yy"));
String pukul_mt1 = ((request.getParameter("pukul_mt1")==null)?"":request.getParameter("pukul_mt1"));
String pukul_mt2 = ((request.getParameter("pukul_mt2")==null)?"":request.getParameter("pukul_mt2"));
int wkt_pkl_mt = ((request.getParameter("wkt_pkl_mt")==null)?0:Integer.parseInt(request.getParameter("wkt_pkl_mt")));
int sbab_mati = ((request.getParameter("sbab_mati")==null)?0:Integer.parseInt(request.getParameter("sbab_mati")));
String tmpt_mati = ((request.getParameter("tmpt_mati")==null)?"":request.getParameter("tmpt_mati"));
int yg_mnerang = ((request.getParameter("yg_mnerang")==null)?0:Integer.parseInt(request.getParameter("yg_mnerang")));
String pnetap_pn = ((request.getParameter("pnetap_pn")==null)?"":request.getParameter("pnetap_pn"));
String no_pnetap = ((request.getParameter("no_pnetap")==null)?"":request.getParameter("no_pnetap"));
String tgl_pnetap = ((request.getParameter("tgl_pnetap")==null)?"":request.getParameter("tgl_pnetap"));
String bln_pnetap = ((request.getParameter("bln_pnetap")==null)?"":request.getParameter("bln_pnetap"));
String thn_pnetap = ((request.getParameter("thn_pnetap")==null)?"":request.getParameter("thn_pnetap"));
String tanggal_entri = "-";
int no_kec = -1;
//if (lahirData!=null && lahirData.getRecordJnsah()!=null) {
if (!kecInput && step>0 && lahirData!=null && lahirData.getRecordJnsah()!=null) {
   nama_jenasah = (lahirData.getRecordJnsah().getNamaLgkp()==null?"-":lahirData.getRecordJnsah().getNamaLgkp().toUpperCase());
   alamat_jenasah = (lahirData.getRecordJnsah().getAlamat()==null?"-":lahirData.getRecordJnsah().getAlamat());
   rt_jenasah = (lahirData.getRecordJnsah().getNoRt()==null?"-":lahirData.getRecordJnsah().getNoRt().toString());
   rw_jenasah = (lahirData.getRecordJnsah().getNoRw()==null?"-":lahirData.getRecordJnsah().getNoRw().toString());
   dusun_jenasah = (lahirData.getRecordJnsah().getDusun()==null?"-":lahirData.getRecordJnsah().getDusun());
   kodepos_jenasah = (lahirData.getRecordJnsah().getKodePos()==null?"-":lahirData.getRecordJnsah().getKodePos().toString());
   telp_jenasah = (lahirData.getRecordJnsah().getTelp()==null?"-":lahirData.getRecordJnsah().getTelp());
   jenis_kelamin_jenasah = (lahirData.getRecordJnsah().getJenisKlmin()==null?"-":(lahirData.getRecordJnsah().getJenisKlmin().intValue()==1?"LAKI-LAKI":"PEREMPUAN")); //(bayiObj.getJenisKlmin().intValue()==1?"LAKI-LAKI":"PEREMPUAN");
   tanggal_lahir_jenasah = lahirData.getRecordJnsah().getTglLhr();
   tempat_lahir_jenasah = (lahirData.getRecordJnsah().getTmptLhr()==null?"-":lahirData.getRecordJnsah().getTmptLhr());
   jenis_pekerjaan_jenasah = (lahirData.getRecordJnsah().getJenisPkrjn()==null?"-":lahirData.getRecordJnsah().getJenisPkrjn().toString());

   ktrunan_jnsah = ((lahirData.getRecordJnsah().getKtrunanJnsah()==null)?0:lahirData.getRecordJnsah().getKtrunanJnsah().intValue());
   bangsa_jenasah = ((lahirData.getRecordJnsah().getBagi()==null)?"-":lahirData.getRecordJnsah().getBagi());
   anak_ke_mt = ((lahirData.getRecordJnsah().getAnakKe()==null)?"":lahirData.getRecordJnsah().getAnakKe().toString());
   tgl_mati_dd = getDD(lahirData.getRecordJnsah().getTglMati());
   tgl_mati_mm = getMM(lahirData.getRecordJnsah().getTglMati());
   tgl_mati_yy = getYY(lahirData.getRecordJnsah().getTglMati());
   pukul_mt1 = (lahirData.getRecordJnsah().getPukul()==null?"":lahirData.getRecordJnsah().getPukul().substring(0,2));
   pukul_mt2 = (lahirData.getRecordJnsah().getPukul()==null?"":lahirData.getRecordJnsah().getPukul().substring(3,5));
   wkt_pkl_mt = (lahirData.getRecordJnsah().getWktPukul()==null?0:lahirData.getRecordJnsah().getWktPukul().intValue());
   sbab_mati = (lahirData.getRecordJnsah().getSbabMati()==null?0:lahirData.getRecordJnsah().getSbabMati().intValue());
   tmpt_mati = (lahirData.getRecordJnsah().getTmptMati()==null?"":lahirData.getRecordJnsah().getTmptMati().toUpperCase());
   yg_mnerang = (lahirData.getRecordJnsah().getYgMnerang()==null?0:lahirData.getRecordJnsah().getYgMnerang().intValue());
   pnetap_pn = ((lahirData.getRecordJnsah().getPnetapPn()==null)?"":lahirData.getRecordJnsah().getPnetapPn());
   no_pnetap = ((lahirData.getRecordJnsah().getNoPnetap()==null)?"":lahirData.getRecordJnsah().getNoPnetap());
   tgl_pnetap = getDD(lahirData.getRecordJnsah().getTglPnetap());
   bln_pnetap = getMM(lahirData.getRecordJnsah().getTglPnetap());
   thn_pnetap = getYY(lahirData.getRecordJnsah().getTglPnetap());
   tanggal_entri = ((lahirData.getRecordJnsah().getTglEntri()==null)?"-":lahirData.getRecordJnsah().getTglEntri());
    no_kec = ((lahirData.getRecordJnsah().getNoKec()==null)?-1:lahirData.getRecordJnsah().getNoKec().intValue());
} else if (kecInput && wniWnaObj!=null && (wniWnaObj.getWniObj()!=null || wniWnaObj.getWnaObj()!=null) && (wniWnaObj.getWniObj().getRecord1()!=null || wniWnaObj.getWnaObj().getRecord1()!=null)) {
   BayiData bayiObj = wniWnaObj.getWniObj().getRecord1();
   if (bayiObj!=null) {
      nama_jenasah = (bayiObj.getNamaLgkp()==null?"-":bayiObj.getNamaLgkp().toUpperCase());
      alamat_jenasah = (bayiObj.getAlamat()==null?"-":bayiObj.getAlamat());
      rt_jenasah = (bayiObj.getNoRt()==null?"-":bayiObj.getNoRt().toString());
      rw_jenasah = (bayiObj.getNoRw()==null?"-":bayiObj.getNoRw().toString());
      dusun_jenasah = (bayiObj.getDusun()==null?"-":bayiObj.getDusun());
      kodepos_jenasah = (bayiObj.getKodePos()==null?"-":bayiObj.getKodePos().toString());
      telp_jenasah = (bayiObj.getTelp()==null?"-":bayiObj.getTelp());
      jenis_kelamin_jenasah = (bayiObj.getJenisKlmin()==null?"-":(Integer.parseInt(bayiObj.getJenisKlmin())==1?"LAKI-LAKI":"PEREMPUAN")); //(bayiObj.getJenisKlmin().intValue()==1?"LAKI-LAKI":"PEREMPUAN");
      tanggal_lahir_jenasah = (bayiObj.getTglLhr()==null?"-":bayiObj.getTglLhr().toUpperCase());
      tempat_lahir_jenasah = (bayiObj.getTmptLhr()==null?"-":bayiObj.getTmptLhr().toUpperCase());
      jenis_pekerjaan_jenasah = (bayiObj.getJenisPkrjn()==null?"-":bayiObj.getJenisPkrjn().toUpperCase());

      ktrunan_jnsah = 0;//????????????((bayiObj.getKtrunanJnsah()==null)?0:Integer.parseInt(bayiObj.getKtrunanJnsah()));
      bangsa_jenasah = "-";//????????????((bayiObj.getBagi()==null)?"-":bayiObj.getBagi());
      anak_ke_mt = "";//????????????((bayiObj.getAnakKe()==null)?"":bayiObj.getAnakKe());
      tgl_mati_dd = "";//????????????getDD(bayiObj.getTglMati());
      tgl_mati_mm = "";//????????????getMM(bayiObj.getTglMati());
      tgl_mati_yy = "";//????????????getYY(bayiObj.getTglMati());
      pukul_mt1 = "";//????????????(bayiObj.getPukul()==null?"":bayiObj.getPukul().substring(0,2));
      pukul_mt2 = "";//????????????(bayiObj.getPukul()==null?"":bayiObj.getPukul().substring(3,5));
      wkt_pkl_mt =0;//????????????(bayiObj.getWktPukul()==null?0:bayiObj.getWktPukul().intValue());
      sbab_mati = 0;//????????????(bayiObj.getSbabMati()==null?0:bayiObj.getSbabMati().intValue());
      tmpt_mati = "";//????????????(bayiObj.getTmptMati()==null?"":bayiObj.getTmptMati().toUpperCase());
      yg_mnerang = 0;//????????????(bayiObj.getYgMnerang()==null?0:bayiObj.getYgMnerang());
      pnetap_pn = "";//????????????((bayiObj.getPnetapPn()==null)?"":bayiObj.getPnetapPn());
      no_pnetap = "";//????????????((bayiObj.getNoPnetap()==null)?"":bayiObj.getNoPnetap());
      tgl_pnetap = "";//????????????getDD(bayiObj.getTglPnetap());
      bln_pnetap = "";//????????????getMM(bayiObj.getTglPnetap());
      thn_pnetap = "";//????????????getYY(bayiObj.getTglPnetap());
      tanggal_entri = ((bayiObj.getTglEntri()==null)?"-":bayiObj.getTglEntri());
      no_kec = ((bayiObj.getNoKec()==null)?-1:Integer.parseInt(bayiObj.getNoKec()));
   }
   BayiDataWna bayiWnaObj = wniWnaObj.getWnaObj().getRecord1();
   if (bayiWnaObj!=null) {
      nama_jenasah = (bayiWnaObj.getNamaPertma()==null?"-":bayiWnaObj.getNamaPertma().toUpperCase());
      alamat_jenasah = (bayiWnaObj.getAlamat()==null?"-":bayiWnaObj.getAlamat());
      rt_jenasah = (bayiWnaObj.getNoRt()==null?"-":bayiWnaObj.getNoRt().toString());
      rw_jenasah = (bayiWnaObj.getNoRw()==null?"-":bayiWnaObj.getNoRw().toString());
      dusun_jenasah = (bayiWnaObj.getDusun()==null?"-":bayiWnaObj.getDusun());
      kodepos_jenasah = (bayiWnaObj.getKodePos()==null?"-":bayiWnaObj.getKodePos().toString());
      telp_jenasah = (bayiWnaObj.getTelp()==null?"-":bayiWnaObj.getTelp());
      jenis_kelamin_jenasah = (bayiWnaObj.getJnsKlm()==null?"-":(Integer.parseInt(bayiWnaObj.getJnsKlm())==1?"LAKI-LAKI":"PEREMPUAN")); //(bayiObj.getJenisKlmin().intValue()==1?"LAKI-LAKI":"PEREMPUAN");
      tanggal_lahir_jenasah = (bayiWnaObj.getTglLhr()==null?"-":bayiWnaObj.getTglLhr().toUpperCase());
      tempat_lahir_jenasah = (bayiWnaObj.getTmpLhr()==null?"-":bayiWnaObj.getTmpLhr().toUpperCase());
      jenis_pekerjaan_jenasah = (bayiWnaObj.getJenisPkrjn()==null?"-":bayiWnaObj.getJenisPkrjn().toUpperCase());

      ktrunan_jnsah = 0;//????????????((bayiWnaObj.getKtrunanJnsah()==null)?0:Integer.parseInt(bayiWnaObj.getKtrunanJnsah()));
      bangsa_jenasah = "-";//????????????((bayiWnaObj.getBagi()==null)?"-":bayiWnaObj.getBagi());
      anak_ke_mt = "";//????????????((bayiWnaObj.getAnakKe()==null)?"":bayiWnaObj.getAnakKe());
      tgl_mati_dd = "";//????????????getDD(bayiWnaObj.getTglMati());
      tgl_mati_mm = "";//????????????getMM(bayiWnaObj.getTglMati());
      tgl_mati_yy = "";//????????????getYY(bayiWnaObj.getTglMati());
      pukul_mt1 = "";//????????????(bayiWnaObj.getPukul()==null?"":bayiWnaObj.getPukul().substring(0,2));
      pukul_mt2 = "";//????????????(bayiWnaObj.getPukul()==null?"":bayiWnaObj.getPukul().substring(3,5));
      wkt_pkl_mt = 0;//????????????(bayiWnaObj.getWktPukul()==null?0:bayiWnaObj.getWktPukul().intValue());
      sbab_mati = 0;//????????????(bayiWnaObj.getSbabMati()==null?0:bayiWnaObj.getSbabMati().intValue());
      tmpt_mati = "";//????????????(bayiWnaObj.getTmptMati()==null?"":bayiWnaObj.getTmptMati().toUpperCase());
      yg_mnerang = 0;//????????????(bayiWnaObj.getYgMnerang()==null?0:bayiWnaObj.getYgMnerang());
      pnetap_pn = "";//????????????((bayiWnaObj.getPnetapPn()==null)?"":bayiWnaObj.getPnetapPn());
      no_pnetap = "";//????????????((bayiWnaObj.getNoPnetap()==null)?"":bayiWnaObj.getNoPnetap());
      tgl_pnetap = "";//????????????getDD(bayiWnaObj.getTglPnetap());
      bln_pnetap = "";//????????????getMM(bayiWnaObj.getTglPnetap());
      thn_pnetap = "";//????????????getYY(bayiWnaObj.getTglPnetap());
      tanggal_entri = "-";//??????????((bayiWnaObj.getTglEntri()==null)?"-":bayiWnaObj.getTglEntri());
      no_kec = ((bayiWnaObj.getNoKec()==null)?-1:Integer.parseInt(bayiWnaObj.getNoKec()));

   }
}
/*
if (wn_jenasah==1 && lahirData!=null && lahirData.getRecordJnsah()!=null) {
   nik_jenasah =  lahirData.getRecordJnsah().getNikJnsah();
} else if (wn_jenasah==2 && lahirData!=null && lahirData.getRecordJnsah()!=null) {
   nik_jenasah =  "A" + lahirData.getRecordJnsah().getNikJnsah();

   }
*/
%>
<div class="tab-page" style="postion:absolute"  id="tabPage1">
                    <h2 class="tab">Data Jenazah</h2>
		<script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage1"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="5" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Jenazah<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_jnsah" size="17" value="<%=nik_jenasah%>" class="boxdefault" maxlength="17"   onKeyUp="return num1(form1.nik_jnsah)">

                                  </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=nama_jenasah%>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat</td>
                              <td width="1%"> :</td>
                              <td colspan="5"><%=alamat_jenasah%><br>
   RT <%=rt_jenasah%>
   RW <%=rw_jenasah%>
   Dusun <%=dusun_jenasah%>
   Kodepos <%=kodepos_jenasah%>
   Telp <%=telp_jenasah%>
</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Jenis Kelamin</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%"><%=jenis_kelamin_jenasah%></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=tanggal_lahir_jenasah%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tempat Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%"> <%=tempat_lahir_jenasah%></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=jenis_pekerjaan_jenasah%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=(wn_jenasah==0?"-":(wn_jenasah==2?"WNA":"WNI"))%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ktrunan_jnsah" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=bangsa_jenasah%>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Anak ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="anak_ke_mt" size="2" value="<%=anak_ke_mt%>" class="boxdefault" maxlength="2" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tanggal Kematian<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_mati_dd maxlength="2" value="<%=tgl_mati_dd%>" onKeyUp="return tab31()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_mati_mm maxlength="2" value="<%=tgl_mati_mm%>" onKeyUp="return tab41()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_mati_yy maxlength="4" value="<%=tgl_mati_yy%>" onKeyUp="return tab51()" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pukul<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%" valign="middle">
                                <input type="text" name="pukul_mt1" size="2" value="<%=pukul_mt1%>" class="boxdefault" maxlength="2" onKeyUp="return tab()" disabled>
                                <b>:</b>
                                <input type="text" name="pukul_mt2" size="2" value="<%=pukul_mt2%>" class="boxdefault" maxlength="2" onKeyUp="return tab1()" disabled>
                                <select size="1" name="wkt_pkl_mt" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Waktu --</option>
                                  <option value="1">WIB</option>
                                  <option value="2">WITA</option>
                                  <option value="3">WIT</option>
                                </select>
                              </td>
                            </tr>
                            <tr>

                              <td width="22%">
                                <p style="line-height: 100%">Sebab Kematian<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <select size="1" name="sbab_mati"  class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Sebab
                                    Kematian --</option>
                                    <option value="1">1 - Sakit Biasa/Tua</option>
                                    <option value="2">2 - Wabah Penyakit</option>
                                    <option value="3">3 - Kecelakaan</option>
                                    <option value="4">4 - Kriminalitas</option>
                                    <option value="5">5 - Bunuh Diri</option>
                                    <option value="6">6 - Melahirkan</option>
                                    <option value="7">7 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tempat Kematian <font color="#000099" class="asterish">*
                                  <font size="1" color="#000000" face="Verdana, Arial, Helvetica, sans-serif">(Contoh
                                  :</font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
                                  <font color="#000000">RS Pancaran Kasih - Manado)</font></font></font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="tmpt_mati" value="<%=tmpt_mati%>" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Yang Menerangkan
                                  Kematian<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <select size="1" name="yg_mnerang" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Yang Menerangkan
                                    --</option>
                                    <option value="1">1 - Dokter</option>
                                    <option value="2">2 - Tenaga Kesehatan Lain</option>
                                    <option value="3">3 - Kepolisian</option>
                                    <option value="4">4 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tempat Penetapan
                                  Pengadilan Negeri </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="pnetap_pn" value="<%=pnetap_pn%>" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nomor Penetapan Pengadilan Negeri
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="no_pnetap" value="<%=no_pnetap%>" size="22" class="boxdefault" maxlength="40" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Penetapan Pengadilan Negeri</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input class=boxdefault size=2 name=tgl_pnetap value="<%=tgl_pnetap%>" maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=bln_pnetap value="<%=bln_pnetap%>" maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=thn_pnetap value="<%=thn_pnetap%>" maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
  </tr>
</table>

   </div>
<%
/*
if (lahirData==null) {
  lahirData = new KabNikData();
  lahirData.setRecordBayi(new LahiObject());
  lahirData.setRecordPelapor(new PelaporNikData());
}
*/
//if (kecInput || (lahirData!=null )) {
/*if (step>0) */{

if(statusReqIbu==ADANOTEXIST)
{
  if (statusReqIbu==0) {
    edit="disabled";
  }
}



 nama_ibu = (request.getParameter("nama_ibu")==null?"":request.getParameter("nama_ibu"));
 getDDTglLahirIbu = (request.getParameter("no_akta_lhr_dd")==null?"":request.getParameter("no_akta_lhr_dd"));
 getMMTglLahirIbu = (request.getParameter("no_akta_lhr_mm")==null?"":request.getParameter("no_akta_lhr_mm"));
 getYYTglLahirIbu = (request.getParameter("no_akta_lhr_yy")==null?"":request.getParameter("no_akta_lhr_yy"));

 alamat_ibu = (request.getParameter("alamat_ibu")==null?"":request.getParameter("alamat_ibu"));
 no_rt_ibu = (request.getParameter("no_rt_ibu")==null?"":request.getParameter("no_rt_ibu"));
 no_rw_ibu = (request.getParameter("no_rw_ibu")==null?"":request.getParameter("no_rw_ibu"));
 dusun_ibu = (request.getParameter("dusun_ibu")==null?"":request.getParameter("dusun_ibu"));
 kodepos_ibu = (request.getParameter("kodepos_ibu")==null?"":request.getParameter("kodepos_ibu"));
 telp_ibu = (request.getParameter("telp_ibu")==null?"":request.getParameter("telp_ibu"));
 nama_prop_ibu = (request.getParameter("nama_prop_ibu")==null?"":request.getParameter("nama_prop_ibu"));
 nama_kab_ibu = (request.getParameter("nama_kab_ibu")==null?"":request.getParameter("nama_kab_ibu"));
 nama_kec_ibu = (request.getParameter("nama_kec_ibu")==null?"":request.getParameter("nama_kec_ibu"));
 nkelibu = (request.getParameter("nkelibu")==null?"":request.getParameter("nkelibu"));


if (kecInput && statusReqIbu==ADAEXIST && step >=1) {
//wniwna

      if (wniWnaObj!=null) {

         if (wniWnaObj.getWniObj()!=null) {

            IbuData ibuObj = wniWnaObj.getWniObj().getRecord2();
            if (ibuObj!=null) {

               nama_ibu = (ibuObj.getNamaLgkp()==null?"":ibuObj.getNamaLgkp());
               getDDTglLahirIbu = getDD(ibuObj.getTglLhr());
               getMMTglLahirIbu = getMM(ibuObj.getTglLhr());
               getYYTglLahirIbu = getYY(ibuObj.getTglLhr());
               alamat_ibu = (ibuObj.getAlamat()==null?"":ibuObj.getAlamat());
               no_rt_ibu = (ibuObj.getNoRt()==null?"":ibuObj.getNoRt().toString());
               no_rw_ibu = (ibuObj.getNoRw()==null?"":ibuObj.getNoRw().toString());
               dusun_ibu = (ibuObj.getDusun()==null?"":ibuObj.getDusun());
               kodepos_ibu = (ibuObj.getKodePos()==null?"":ibuObj.getKodePos().toString());
               telp_ibu = (ibuObj.getTelp()==null?"":ibuObj.getTelp());
               nama_prop_ibu = (ibuObj.getNoProp()==null?"":ibuObj.getNoProp());
               nama_kab_ibu = (ibuObj.getNoKab()==null?"":ibuObj.getNoKab());
               nama_kec_ibu = (ibuObj.getNoKec()==null?"":ibuObj.getNoKec());
               nkelibu = ibuObj.getNoKel();
               jenis_pkrjn_ibu = ((ibuObj.getJenisPkrjn()==null)?0:Integer.parseInt(ibuObj.getJenisPkrjn()));
            }
         } if (wniWnaObj.getWnaObj()!=null) {

            IbuDataWna ibuObj = wniWnaObj.getWnaObj().getRecord2();
            if (ibuObj!=null) {

               nama_ibu = ibuObj.getNamaPertma();
               getDDTglLahirIbu = getDD(ibuObj.getTglLhr());
               getMMTglLahirIbu = getMM(ibuObj.getTglLhr());
               getYYTglLahirIbu = getYY(ibuObj.getTglLhr());
               alamat_ibu = (ibuObj.getAlamat()==null?"":ibuObj.getAlamat());
               no_rt_ibu = (ibuObj.getNoRt()==null?"":ibuObj.getNoRt().toString());
               no_rw_ibu = (ibuObj.getNoRw()==null?"":ibuObj.getNoRw().toString());
               dusun_ibu = (ibuObj.getDusun()==null?"":ibuObj.getDusun());
               kodepos_ibu = (ibuObj.getKodePos()==null?"":ibuObj.getKodePos().toString());
               telp_ibu = (ibuObj.getTelp()==null?"":ibuObj.getTelp());
               nama_prop_ibu = ibuObj.getNoProp();
               nama_kab_ibu = ibuObj.getNoKab();
               nama_kec_ibu = ibuObj.getNoKec();
               nkelibu = ibuObj.getNoKel();
               jenis_pkrjn_ibu = ((ibuObj.getJenisPkrjn()==null)?0:Integer.parseInt(ibuObj.getJenisPkrjn()));
            }
         }
      }
   } else if (!kecInput && step >=1 && statusReqIbu!=ADANOTEXIST && lahirData!=null && lahirData.getRecordJnsah()!=null) {

      nama_ibu = (lahirData.getRecordJnsah().getNamaLgkpIbu()==null?"":lahirData.getRecordJnsah().getNamaLgkpIbu());
      getDDTglLahirIbu = getDD(lahirData.getRecordJnsah().getTglLhrIbu());
      getMMTglLahirIbu = getMM(lahirData.getRecordJnsah().getTglLhrIbu());
      getYYTglLahirIbu = getYY(lahirData.getRecordJnsah().getTglLhrIbu());
      alamat_ibu = (lahirData.getRecordJnsah().getAlamatIbu()==null?"":lahirData.getRecordJnsah().getAlamatIbu());
      no_rt_ibu = (lahirData.getRecordJnsah().getNoRtIbu()==null?"":lahirData.getRecordJnsah().getNoRtIbu().toString());
      no_rw_ibu = (lahirData.getRecordJnsah().getNoRwIbu()==null?"":lahirData.getRecordJnsah().getNoRwIbu().toString());
      dusun_ibu = (lahirData.getRecordJnsah().getDusunIbu()==null?"":lahirData.getRecordJnsah().getDusunIbu());
      kodepos_ibu = (lahirData.getRecordJnsah().getKodeposIbu()==null?"":lahirData.getRecordJnsah().getKodeposIbu().toString());
      telp_ibu = (lahirData.getRecordJnsah().getTelpIbu()==null?"":lahirData.getRecordJnsah().getTelpIbu());
      nama_prop_ibu = (lahirData.getRecordJnsah().getNoPropIbu()==null?"":lahirData.getRecordJnsah().getNoPropIbu());
      nama_kab_ibu = (lahirData.getRecordJnsah().getNoKabIbu()==null?"":lahirData.getRecordJnsah().getNoKabIbu());
      nama_kec_ibu = (lahirData.getRecordJnsah().getNoKecIbu()==null?"":lahirData.getRecordJnsah().getNoKecIbu());
      nkelibu = (lahirData.getRecordJnsah().getNoKelIbu()==null?"":lahirData.getRecordJnsah().getNoKelIbu());
if (radiobutton==0) {
   if (wn_ibu==1) {
      nik_ibu = (lahirData.getRecordJnsah().getNikIbu()==null || lahirData.getRecordJnsah().getNikIbu().intValue()==0?"":lahirData.getRecordJnsah().getNikIbu().toString());

   } else if (wn_ibu==2) {
      nik_ibu = (lahirData.getRecordJnsah().getNikIbu()==null || lahirData.getRecordJnsah().getNikIbu().intValue()==0?"":"A" + lahirData.getRecordJnsah().getNikIbu().toString());
   }
}
   jenis_pkrjn_ibu = ((lahirData.getRecordJnsah().getJenisPkrjnIbu()==null)?0:lahirData.getRecordJnsah().getJenisPkrjnIbu().intValue());

}
 jenis_pkrjn_ibu = (request.getParameter("jenis_pkrjn_ibu")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_ibu"))==0?jenis_pkrjn_ibu:Integer.parseInt(request.getParameter("jenis_pkrjn_ibu")));

%>
<div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
                    <h2 class="tab">Data Ibu</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage2"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="21%">NIK Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton" value="Ada" onClick="return radioValid3()" <%if (radiobutton==0) {%> checked <%}%> onChange="resetFieldIbu()">
                                Ada<br>
                                <input type="radio" name="radiobutton" value="Tidak Ada" onClick="return radioValid4()" <%if (radiobutton==1) {%> checked <%}%> onChange="resetFieldIbu()">
                                Tidak Ada</td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton1" value="1" onClick="return radioValid1()" onChange="resetFieldIbu()"
								   <%if (wn_ibu==1) {%> checked <%}
								   %>>
                                WNI<br>
                                <input type="radio" name="radiobutton1" value="2" onClick="return radioValid2()" onChange="resetFieldIbu()"
								   <%if (wn_ibu==2) {%> checked <%}
								   %>>
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu" size="18" class="boxdefault" maxlength="17"  value="<%=nik_ibu%>" onKeyUp="return num1(form1.nik_ibu);" onBlur="validateWNIbu(form1.nik_ibu,form1.radiobutton1);setSaveEnabled(false)">
                                  </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu" size="27" value="<%=nama_ibu%>" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input class=boxdefault size=2 name=no_akta_lhr_dd maxlength="2" value="<%=getDDTglLahirIbu%>" onKeyUp="return checkTanggal(form1.no_akta_lhr_dd, form1.no_akta_lhr_mm)" /*onFocus="this.blur()"*/>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
 class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2" value="<%=getMMTglLahirIbu%>" onKeyUp="return checkBulan(form1.no_akta_lhr_mm, form1.no_akta_lhr_yy)" /*onFocus="this.blur()"*/>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4" value="<%=getYYTglLahirIbu%>" onKeyUp="return checkTahun(form1.no_akta_lhr_dd, form1.no_akta_lhr_mm, form1.no_akta_lhr_yy)" /*onFocus="this.blur()"*/>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  name=jenis_pkrjn_ibu boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="3">
                                <input type="text" name="alamat_ibu" size="30" class="boxdefault" value="<%=alamat_ibu%>" maxlength="120" /*onFocus="this.blur()"*/>
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="no_rt_ibu" value="<%=no_rt_ibu%>" size="3" class="boxdefault" maxlength="3"  onKeyUp="return num(form1.no_rt_ibu)" /*onFocus="this.blur()"*/>
                                RW
                                <input type="text" name="no_rw_ibu" size="3" class="boxdefault" value="<%=no_rw_ibu%>" maxlength="3" onKeyUp="return num(form1.no_rw_ibu)" /*onFocus="this.blur()"*/>
                                Ds/Kpng/Dukuh </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="text" name="dusun_ibu" size="22" class="boxdefault" value="<%=dusun_ibu%>" maxlength="60" /*onFocus="this.blur()"*/>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <div align="left">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="kodepos_ibu" size="7" value="<%=kodepos_ibu%>" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kodepos_ibu)" /*onFocus="this.blur()"*/>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <div align="left">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ibu" value="<%=telp_ibu%>" size="20" class="boxdefault" maxlength="20" /*onFocus="this.blur()"*/>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <div align="left">Nama Provinsi<font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_prop_ibu" maxlength="60" onKeyUp="" value="<%=nama_prop_ibu%>">

                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_kab_ibu" maxlength="60" onKeyUp="" value="<%=nama_kab_ibu%>">

                              </td>
                            </tr>
                            <tr>
                              <td width="21%" height="40">
                                <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%" height="40">:</td>
                              <td width="26%" height="40">
                                <input class="boxdefault" size=30 name="nama_kec_ibu" maxlength="60" onKeyUp="" value="<%=nama_kec_ibu%>">

                              </td>
                              <td width="1%" height="40">&nbsp;</td>
                              <td width="24%" height="40">
                                <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%" height="40">:</td>
                              <td width="26%" height="40">
                                <input class="boxdefault" size=30 name="nkelibu" maxlength="60" onKeyUp="" value="<%=nkelibu%>">
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <%



if(statusReqAyah==ADANOTEXIST)
{

  if (statusReqAyah==0) {
    edit="disabled";

  }
}




 nama_ayh = (request.getParameter("nama_ayh")==null?"":request.getParameter("nama_ayh"));
 getDDTglLahirAyah = (request.getParameter("no_akta_lhr_dd1")==null?"":request.getParameter("no_akta_lhr_dd1"));
 getMMTglLahirAyah = (request.getParameter("no_akta_lhr_mm1")==null?"":request.getParameter("no_akta_lhr_mm1"));
 getYYTglLahirAyah = (request.getParameter("no_akta_lhr_yy1")==null?"":request.getParameter("no_akta_lhr_yy1"));
 jenis_pkrjn_ayh = (request.getParameter("jenis_pkrjn_ayh")==null?0:Integer.parseInt(request.getParameter("jenis_pkrjn_ayh")));

 alamat_ayh = (request.getParameter("alamat_ayh")==null?"":request.getParameter("alamat_ayh"));
 no_rt_ayh = (request.getParameter("no_rt_ayh")==null?"":request.getParameter("no_rt_ayh"));
 no_rw_ayh = (request.getParameter("no_rw_ayh")==null?"":request.getParameter("no_rw_ayh"));
 dusun_ayh = (request.getParameter("dusun_ayh")==null?"":request.getParameter("dusun_ayh"));
 kodepos_ayh = (request.getParameter("kodepos_ayh")==null?"":request.getParameter("kodepos_ayh"));
 telp_ayh = (request.getParameter("telp_ayh")==null?"":request.getParameter("telp_ayh"));
 nama_prop_ayh = (request.getParameter("nama_prop_ayh")==null?"":request.getParameter("nama_prop_ayh"));
 nama_kab_ayh = (request.getParameter("nama_kab_ayh")==null?"":request.getParameter("nama_kab_ayh"));
 nama_kec_ayh = (request.getParameter("nama_kec_ayh")==null?"":request.getParameter("nama_kec_ayh"));
 nkelayh = (request.getParameter("nkelayh")==null?"":request.getParameter("nkelayh"));
 ketrunan_ayh = (request.getParameter("ketrunan_ayh")==null?0:Integer.parseInt(request.getParameter("ketrunan_ayh")));
 bangsa_ayh = (request.getParameter("bangsa_ayh")==null?"":request.getParameter("bangsa_ayh"));
 getDDTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_dd")==null?"":request.getParameter("tgl_ctt_kwn_ayh_dd"));
 getMMTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_mm")==null?"":request.getParameter("tgl_ctt_kwn_ayh_mm"));
 getYYTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_yy")==null?"":request.getParameter("tgl_ctt_kwn_ayh_yy"));


   if (kecInput && statusReqAyah==ADAEXIST && step >=1) {



      if (wniWnaObj!=null) {

         if (wniWnaObj.getWniObj()!=null) {

            AyahData ayahObj = wniWnaObj.getWniObj().getRecord3();
            if (ayahObj!=null) {

               nama_ayh = ayahObj.getNamaLgkp();
               getDDTglLahirAyah = getDD(ayahObj.getTglLhr());
               getMMTglLahirAyah = getMM(ayahObj.getTglLhr());
               getYYTglLahirAyah = getYY(ayahObj.getTglLhr());
               alamat_ayh = ayahObj.getAlamat();
               no_rt_ayh = (ayahObj.getNoRt()==null?"":ayahObj.getNoRt());
               no_rw_ayh = (ayahObj.getNoRw()==null?"":ayahObj.getNoRw());
               dusun_ayh = (ayahObj.getDusun()==null?"":ayahObj.getDusun());
               kodepos_ayh = (ayahObj.getKodePos()==null?"":ayahObj.getKodePos().toString());
               telp_ayh = (ayahObj.getTelp()==null?"":ayahObj.getTelp());
               nama_prop_ayh = ayahObj.getNoProp();
               nama_kab_ayh = ayahObj.getNoKab();
               nama_kec_ayh = ayahObj.getNoKec();
               nkelayh = ayahObj.getNoKel();
     // ketrunan_ayh = (lahirData.getRecordJnsah().getKetrunanAyh()==null?"":lahirData.getRecordJnsah().getKetrunanAyh());
     // bangsa_ayh = (lahirData.getRecordJnsah().getBangsaAyh()==null?"":lahirData.getRecordJnsah().getBangsaAyh());
               getDDTglKawinAyah = getDD(ayahObj.getTglKwn());
               getMMTglKawinAyah = getMM(ayahObj.getTglKwn());
               getYYTglKawinAyah = getYY(ayahObj.getTglKwn());
               jenis_pkrjn_ayh = ((ayahObj.getJenisPkrjn()==null)?0:Integer.parseInt(ayahObj.getJenisPkrjn()));
            }
         }  if (wniWnaObj.getWnaObj()!=null) {

            AyahDataWna ayahObj = wniWnaObj.getWnaObj().getRecord3();
            if (ayahObj!=null) {

               nama_ayh = ayahObj.getNamaPertma();

               getDDTglLahirAyah = getDD(ayahObj.getTglLhr());
               getMMTglLahirAyah = getMM(ayahObj.getTglLhr());
               getYYTglLahirAyah = getYY(ayahObj.getTglLhr());
               alamat_ayh = ayahObj.getAlamat();
               no_rt_ayh = (ayahObj.getNoRt()==null?"":ayahObj.getNoRt().toString());
               no_rw_ayh = (ayahObj.getNoRw()==null?"":ayahObj.getNoRw().toString());
               dusun_ayh = (ayahObj.getDusun()==null?"":ayahObj.getDusun());
               kodepos_ayh = (ayahObj.getKodePos()==null?"":ayahObj.getKodePos().toString());
               telp_ayh = (ayahObj.getTelp()==null?"":ayahObj.getTelp());
               nama_prop_ayh = (ayahObj.getNoProp()==null?"":ayahObj.getNoProp().toString());
               nama_kab_ayh = (ayahObj.getNoKab()==null?"":ayahObj.getNoKab().toString());
               nama_kec_ayh = (ayahObj.getNoKec()==null?"":ayahObj.getNoKec().toString());
               nkelayh = (ayahObj.getNoKel()==null?"":ayahObj.getNoKel().toString());
     // ketrunan_ayh = (lahirData.getRecordJnsah().getKetrunanAyh()==null?"":lahirData.getRecordJnsah().getKetrunanAyh());
     // bangsa_ayh = (lahirData.getRecordJnsah().getBangsaAyh()==null?"":lahirData.getRecordJnsah().getBangsaAyh());
               jenis_pkrjn_ayh = ((ayahObj.getJenisPkrjn()==null)?0:ayahObj.getJenisPkrjn().intValue());
            }
         }
      }
   } else if (!kecInput && step >=1 && statusReqAyah!=ADANOTEXIST && lahirData!=null && lahirData.getRecordJnsah()!=null) {

      nama_ayh = (lahirData.getRecordJnsah().getNamaLgkpAyh()==null?"":lahirData.getRecordJnsah().getNamaLgkpAyh());
      getDDTglLahirAyah = getDD(lahirData.getRecordJnsah().getTglLhrAyh());
      getMMTglLahirAyah = getMM(lahirData.getRecordJnsah().getTglLhrAyh());
      getYYTglLahirAyah = getYY(lahirData.getRecordJnsah().getTglLhrAyh());
      alamat_ayh = (lahirData.getRecordJnsah().getAlamatAyh()==null?"":lahirData.getRecordJnsah().getAlamatAyh());
      no_rt_ayh = (lahirData.getRecordJnsah().getNoRtAyh()==null?"":lahirData.getRecordJnsah().getNoRtAyh().toString());
      no_rw_ayh = (lahirData.getRecordJnsah().getNoRwAyh()==null?"":lahirData.getRecordJnsah().getNoRwAyh().toString());
      dusun_ayh = (lahirData.getRecordJnsah().getDusunAyh()==null?"":lahirData.getRecordJnsah().getDusunAyh());
      kodepos_ayh = (lahirData.getRecordJnsah().getKodeposAyh()==null?"":lahirData.getRecordJnsah().getKodeposAyh().toString());
      telp_ayh = (lahirData.getRecordJnsah().getTelpAyh()==null?"":lahirData.getRecordJnsah().getTelpAyh());
      nama_prop_ayh = (lahirData.getRecordJnsah().getNoPropAyh()==null?"":lahirData.getRecordJnsah().getNoPropAyh());
      nama_kab_ayh = (lahirData.getRecordJnsah().getNoKabAyh()==null?"":lahirData.getRecordJnsah().getNoKabAyh());
      nama_kec_ayh = (lahirData.getRecordJnsah().getNoKecAyh()==null?"":lahirData.getRecordJnsah().getNoKecAyh());
      nkelayh = (lahirData.getRecordJnsah().getNoKelAyh()==null?"":lahirData.getRecordJnsah().getNoKelAyh());

      if (radiobutton3==0) {
   if (wn_ayah==1) {
      nik_ayah = (lahirData.getRecordJnsah().getNikAyh()==null || lahirData.getRecordJnsah().getNikAyh().intValue()==0?"":lahirData.getRecordJnsah().getNikAyh().toString());

   } else if (wn_ayah==2) {
      nik_ayah = (lahirData.getRecordJnsah().getNikAyh()==null || lahirData.getRecordJnsah().getNikAyh().intValue()==0?"":"A" + lahirData.getRecordJnsah().getNikAyh().toString());
   }
      }
  jenis_pkrjn_ayh = ((lahirData.getRecordJnsah().getJenisPkrjnAyh()==null)?0:lahirData.getRecordJnsah().getJenisPkrjnAyh().intValue());

}
jenis_pkrjn_ayh = (request.getParameter("jenis_pkrjn_ayh")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_ayh"))==0?jenis_pkrjn_ayh:Integer.parseInt(request.getParameter("jenis_pkrjn_ayh")));

%>
  <div class="tab-page"  id="tabPage3">
                    <h2 class="tab">Data Ayah</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage3"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="21%" height="43">NIK Ayah<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" height="43">:</td>
                                <td width="26%" height="43">
                                  <input type="radio" name="radiobutton3" value="Ada"  onClick="return radioValid5()" <%if (radiobutton3==0) {%> checked <%}%> onChange="resetFieldAyah()">
                                Ada<br>
                                <input type="radio" name="radiobutton3" value="Tidak Ada"  onClick="return radioValid6()" <%if (radiobutton3==1) {%> checked <%}%> onChange="resetFieldAyah()">
                                Tidak Ada</td>
                                <td width="1%" height="43">&nbsp;</td>
                                <td width="24%" height="43">Warga Negara Ayah<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" height="43">:</td>
                                <td width="26%" height="43">
                                  <input type="radio" name="radiobutton4" value="1" onClick="return radioValid7()" onChange="resetFieldAyah()"
								   <%if (wn_ayah==1) {%> checked <%}
								   %>>
                                WNI<br>
                                <input type="radio" name="radiobutton4" value="2" onClick="return radioValid8()" onChange="resetFieldAyah()"
								   <%if (wn_ayah==2) {%> checked <%}
								   %>>

                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">

                <input type="text" name="nik_ayh" size="18" value="<%=nik_ayah%>" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh)" onBlur="validateWNAyah(form1.nik_ayh, form1.radiobutton4); setSaveEnabled(false)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>

                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh" size="27" value="<%=nama_ayh%>" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                                <td width="26%">

                                  <table width="100" border="0" cellspacing="3" cellpadding="0">
                                    <tr>

                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd1 maxlength="2" value="<%=getDDTglLahirAyah%>" onKeyUp="return checkTanggal(form1.no_akta_lhr_dd1, form1.no_akta_lhr_mm1)" /*onFocus="this.blur()"*/>
                                      </td>
                                      <td>/ </td>

                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm1 maxlength="2" value="<%=getMMTglLahirAyah%>" onKeyUp="return checkBulan(form1.no_akta_lhr_mm1, form1.no_akta_lhr_yy1)" /*onFocus="this.blur()"*/>
                                      </td>
                                      <td>/</td>

                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy1 maxlength="4" value="<%=getYYTglLahirAyah%>" onKeyUp="return checkTahun(form1.no_akta_lhr_dd1, form1.no_akta_lhr_mm1, form1.no_akta_lhr_yy1)" /*onFocus="this.blur()"*/>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                        name=jenis_pkrjn_ayh boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis Pekerjaan
                                      --</option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="3">
                                <div align="left">
                                  <input type="text" name="alamat_ayh" size="30" value="<%=alamat_ayh%>" class="boxdefault"  maxlength="120" /*onFocus="this.blur()"*/>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="no_rt_ayh" size="3" value="<%=no_rt_ayh%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rt_ayh)" /*onFocus="this.blur()"*/>
                                  RW
                                  <input type="text" name="no_rw_ayh" size="3" value="<%=no_rw_ayh%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rw_ayh)" /*onFocus="this.blur()"*/>
                                  Ds/Kpng/Dukuh</div>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="text" name="dusun_ayh" size="22"  value="<%=dusun_ayh%>" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Kode Pos</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="kodepos_ayh"  value="<%=kodepos_ayh%>" size="7" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kodepos_ayh)" /*onFocus="this.blur()"*/>
                              </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Telepon</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ayh"  value="<%=telp_ayh%>" size="20" class="boxdefault" maxlength="20" /*onFocus="this.blur()"*/>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Provinsi<font color="#000099" class="asterish"></font><font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_prop_ayh" maxlength="60" onKeyUp="" value="<%=nama_prop_ayh%>">
                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_kab_ayh" maxlength="60" onKeyUp="" value="<%=nama_kab_ayh%>">
                                </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_kec_ayh" maxlength="60" onKeyUp="" value="<%=nama_kec_ayh%>">
                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nkelayh" maxlength="60" onKeyUp="" value="<%=nkelayh%>">
                                </td>
                            </tr>
                          </table>

                        </td>
      </tr>
    </table>
  </div>
<%

if ("".equals(nik_pelapor) &&
    ((kecInput &&
      (wniWnaObj!=null ||
       wniWnaObj.getWniObj()!=null ||
       wniWnaObj.getWnaObj()!=null ||
       (wniWnaObj.getWniObj().getRecord4()==null &&
        wniWnaObj.getWnaObj().getRecord4()==null))) ||
     (!kecInput && lahirData!=null && lahirData.getRecordPelapor()==null))) {
edit="disabled";

}
/*
 else if (kecInput && wniWnaObj!=null && wniWnaObj.getWniObj().getRecord4() == null && wniWnaObj.getWnaObj().getRecord4() == null)
{
edit="disabled";

}
*/



 nama_pelapor = "-";
 tgl_lahir_pelapor = "-";
 jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")==null?0:Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")));
 alamat_pelapor = "-";
 rt_pelapor = "-";
 rw_pelapor = "-";
 dusun_pelapor = "-";
 kodepos_pelapor = "-";
 telp_pelapor = "-";
 no_akta_lhr_dd2 = (request.getParameter("no_akta_lhr_dd2")==null?"":request.getParameter("no_akta_lhr_dd2"));
 no_akta_lhr_mm2 = (request.getParameter("no_akta_lhr_mm2")==null?"":request.getParameter("no_akta_lhr_mm2"));
 no_akta_lhr_yy2 = (request.getParameter("no_akta_lhr_yy2")==null?"":request.getParameter("no_akta_lhr_yy2"));


   if (kecInput && step >=1) {



      if (wniWnaObj!=null) {

         if (wniWnaObj.getWniObj()!=null) {

            PelaporData pelaporObj = wniWnaObj.getWniObj().getRecord4();
            if (pelaporObj!=null) {

               nama_pelapor = (pelaporObj.getNamaLgkp()==null?"-":pelaporObj.getNamaLgkp());
               tgl_lahir_pelapor = (pelaporObj.getTglLhr()==null?"-":pelaporObj.getTglLhr());
               alamat_pelapor = ((pelaporObj.getAlamat()==null)?"-":pelaporObj.getAlamat());
               rt_pelapor = ((pelaporObj.getNoRt()==null)?"-":pelaporObj.getNoRt().toString());
               rw_pelapor = ((pelaporObj.getNoRw()==null)?"-":pelaporObj.getNoRw().toString());
               dusun_pelapor = ((pelaporObj.getDusun()==null)?"-":pelaporObj.getDusun());
               kodepos_pelapor = ((pelaporObj.getKodePos()==null)?"-":pelaporObj.getKodePos().toString());
               telp_pelapor = ((pelaporObj.getTelp()==null)?"-":pelaporObj.getTelp());
               jenis_pkrjn_plpor = ((pelaporObj.getJenisPkrjn()==null)?0:Integer.parseInt(pelaporObj.getJenisPkrjn()));
            }
         }  if (wniWnaObj.getWnaObj()!=null) {

            PelaporDataWna pelaporObj = wniWnaObj.getWnaObj().getRecord4();
            if (pelaporObj!=null) {

               nama_pelapor = pelaporObj.getNamaPertma();
               tgl_lahir_pelapor = pelaporObj.getTglLhr();
               alamat_pelapor = ((pelaporObj.getAlamat()==null)?"-":pelaporObj.getAlamat());
               rt_pelapor = ((pelaporObj.getNoRt()==null)?"-":pelaporObj.getNoRt().toString());
               rw_pelapor = ((pelaporObj.getNoRw()==null)?"-":pelaporObj.getNoRw().toString());
               dusun_pelapor = ((pelaporObj.getDusun()==null)?"-":pelaporObj.getDusun());
               kodepos_pelapor = ((pelaporObj.getKodePos()==null)?"-":pelaporObj.getKodePos().toString());
               telp_pelapor = ((pelaporObj.getTelp()==null)?"-":pelaporObj.getTelp());
               jenis_pkrjn_plpor = ((pelaporObj.getJenisPkrjn()==null)?0:Integer.parseInt(pelaporObj.getJenisPkrjn()));
            }
         }
      }
   } else if (!kecInput && step >=1 && lahirData!=null && lahirData.getRecordJnsah()!=null && lahirData.getRecordPelapor()!=null) {

 nik_pelapor = (lahirData.getRecordJnsah().getNikPlpor()==null?"":lahirData.getRecordJnsah().getNikPlpor().toString());
   nama_pelapor = (lahirData.getRecordPelapor().getNamaLgkp()==null?"-":lahirData.getRecordPelapor().getNamaLgkp());
   tgl_lahir_pelapor = (lahirData.getRecordPelapor().getTglLhr()==null?"-":lahirData.getRecordPelapor().getTglLhr());
 alamat_pelapor = ((lahirData.getRecordPelapor().getAlamat()==null)?"-":lahirData.getRecordPelapor().getAlamat());
 rt_pelapor = ((lahirData.getRecordPelapor().getNoRt()==null)?"-":lahirData.getRecordPelapor().getNoRt().toString());
 rw_pelapor = ((lahirData.getRecordPelapor().getNoRw()==null)?"-":lahirData.getRecordPelapor().getNoRw().toString());
 dusun_pelapor = ((lahirData.getRecordPelapor().getDusun()==null)?"-":lahirData.getRecordPelapor().getDusun());
 kodepos_pelapor = ((lahirData.getRecordPelapor().getKodePos()==null)?"-":lahirData.getRecordPelapor().getKodePos().toString());
 telp_pelapor = ((lahirData.getRecordPelapor().getTelp()==null)?"-":lahirData.getRecordPelapor().getTelp());

jenis_pkrjn_plpor = ((lahirData.getRecordPelapor().getJenisPkrjn()==null)?0:lahirData.getRecordPelapor().getJenisPkrjn().intValue());
 no_akta_lhr_dd2 = getDD(lahirData.getRecordJnsah().getTglMlpor());
 no_akta_lhr_mm2 = getMM(lahirData.getRecordJnsah().getTglMlpor());
 no_akta_lhr_yy2 = getYY(lahirData.getRecordJnsah().getTglMlpor());

   }

/*
if (wn_pelapor==1 && lahirData.getRecordPelapor()!=null) {
} else if (wn_pelapor==2 && lahirData.getRecordPelapor()!=null) {
   }
*/
jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_plpor"))==0?jenis_pkrjn_plpor:Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")));

%>

<div class="tab-page"   id="tabPage4">
                    <h2 class="tab">Data Pelapor</h2>


                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">NIK Pelapor<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_plpor" size="18" value='<%=nik_pelapor%>' class="boxdefault" maxlength="17"   onKeyUp="return num1(form1.nik_plpor)" onBlur="setupPekerjaan(form1.jenis_pkrjn_plpor, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
   <%=nama_pelapor%>
								</p>
                              </td>
                            </tr>
                            <tr>

            <td width="21%" height="40">
              <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>

            <td width="1%" height="40">:</td>

            <td width="26%" height="40">
              <p style="line-height: 100%">
                 <%=tgl_lahir_pelapor%>
			  </p>
                              </td>

            <td width="1%" height="40">&nbsp;</td>

            <td width="24%" height="40">
              <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                                </td>

            <td width="1%" height="40">:</td>

            <td width="26%" height="40">
              <p style="line-height: 100%">
                <select
                    name="jenis_pkrjn_plpor" class="boxdefault">
                  <option value="0" selected>-- Pilih Jenis Pekerjaan --</option>
                </select>
              </p>
              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5">
   <%=alamat_pelapor%><br>
   RT <%=rt_pelapor%>
   RW <%=rw_pelapor%>
   Dusun <%=dusun_pelapor%>
   Kodepos <%=kodepos_pelapor%>
   Telp <%=telp_pelapor%>
							  </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Melapor<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd2 maxlength="2" value='<%=no_akta_lhr_dd2%>'  onKeyUp="return checkTanggal(form1.no_akta_lhr_dd2, form1.no_akta_lhr_mm2)">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm2 maxlength="2" value='<%=no_akta_lhr_mm2%>' onKeyUp="return checkBulan(form1.no_akta_lhr_mm2, form1.no_akta_lhr_yy2)">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy2 maxlength="4" value='<%=no_akta_lhr_yy2%>' onKeyUp="return checkTahun(form1.no_akta_lhr_dd2, form1.no_akta_lhr_mm2, form1.no_akta_lhr_yy2)">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<%
}

wn_saksi_1 = ("".equals(nik_sksi1)?0:(nik_sksi1.substring(0,1).equals("A")?2:1));

if(lahirData==null || lahirData.getRecordSaksi()==null || lahirData.getRecordSaksi().getSaksi1Record() == null)
{
edit="disabled";

}

String nama_saksi_1 = "-";
String tempat_lahir_saksi_1 = "-";
String tgl_lahir_saksi_1 = "-";
String alamat_saksi_1 = "-";
String rt_saksi_1 = "-";
String rw_saksi_1 = "-";
String dusun_saksi_1 = "-";
String kodepos_saksi_1 = "-";
String telp_saksi_1 = "-";
String agama_saksi_1 = "-";
int jenis_pekerjaan_saksi1 = (request.getParameter("jenis_pekerjaan_saksi1")==null?0:Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi1")));

if (step>0 && lahirData!=null && lahirData.getRecordSaksi()!=null && lahirData.getRecordSaksi().getSaksi1Record()!=null) {


   nama_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getNamaLgkp();
   tempat_lahir_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getTmptLhr();
   tgl_lahir_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getTglLhr();
 alamat_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getAlamat()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getAlamat());
 rt_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getNoRt()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getNoRt().toString());
 rw_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getNoRw()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getNoRw().toString());
 dusun_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getDusun()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getDusun());
 kodepos_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getKodePos()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getKodePos().toString());
 telp_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getTelp()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getTelp());
agama_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getAgama();


  // nik_sksi1 = lahirData.getRecordSaksi().getSaksi1Record().getNikSaksi();
jenis_pekerjaan_saksi1 = ((lahirData.getRecordSaksi().getSaksi1Record().getJenisPkrjn()==null)?0:lahirData.getRecordSaksi().getSaksi1Record().getJenisPkrjn().intValue());

}
jenis_pekerjaan_saksi1 = (request.getParameter("jenis_pekerjaan_saksi1")!=null && Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi1"))!=0 ?Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi1")):jenis_pekerjaan_saksi1);

%>
   <div class="tab-page"  id="tabPage5">
                    <h2 class="tab">Data Saksi I</h2>

               <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">

                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi I<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi1" size="17" class="boxdefault" maxlength="17" value="<%=nik_sksi1%>"   onKeyUp="return num1(form1.nik_sksi1)" onBlur="setupPekerjaan(form1.jenis_pekerjaan_saksi1, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=nama_saksi_1%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=tempat_lahir_saksi_1%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=tgl_lahir_saksi_1%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                                <td colspan="5">
   <%=alamat_saksi_1%><br>
   RT <%=rt_saksi_1%>
   RW <%=rw_saksi_1%>
   Dusun <%=dusun_saksi_1%>
   Kodepos <%=kodepos_saksi_1%>
   Telp <%=telp_saksi_1%>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=agama_saksi_1%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pekerjaan_saksi1 boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

  <%

wn_saksi_2 = ("".equals(nik_sksi2)?0:(nik_sksi2.substring(0,1).equals("A")?2:1));

if(lahirData==null || lahirData.getRecordSaksi()==null || lahirData.getRecordSaksi().getSaksi2Record() == null)
{
edit="disabled";

}

String nama_saksi_2 = "-";
String tempat_lahir_saksi_2 = "-";
String tgl_lahir_saksi_2 = "-";
String alamat_saksi_2 = "-";
String rt_saksi_2 = "-";
String rw_saksi_2 = "-";
String dusun_saksi_2 = "-";
String kodepos_saksi_2 = "-";
String telp_saksi_2 = "-";
String agama_saksi_2 = "-";
int jenis_pekerjaan_saksi2 = (request.getParameter("jenis_pekerjaan_saksi2")==null?0:Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi2")));



if (lahirData!=null && lahirData.getRecordSaksi()!=null && lahirData.getRecordSaksi().getSaksi2Record()!=null) {

   nama_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getNamaLgkp();
   tempat_lahir_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getTmptLhr();
   tgl_lahir_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getTglLhr();
 alamat_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getAlamat()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getAlamat());
 rt_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getNoRt()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getNoRt().toString());
 rw_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getNoRw()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getNoRw().toString());
 dusun_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getDusun()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getDusun());
 kodepos_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getKodePos()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getKodePos().toString());
 telp_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getTelp()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getTelp());
agama_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getAgama();
   //nik_sksi2 = lahirData.getRecordSaksi().getSaksi2Record().getNikSaksi();
jenis_pekerjaan_saksi2 = ((lahirData.getRecordSaksi().getSaksi2Record().getJenisPkrjn()==null)?0:lahirData.getRecordSaksi().getSaksi2Record().getJenisPkrjn().intValue());

}

jenis_pekerjaan_saksi2 = (request.getParameter("jenis_pekerjaan_saksi1")!=null && Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi2"))!=0 ?Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi2")):jenis_pekerjaan_saksi2);
%>
   <div class="tab-page"  id="tabPage6">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="javascript">
                	tp1.addTabPage(document.getElementById("tabPage6"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">

                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" size="17" class="boxdefault" maxlength="17"  value="<%=nik_sksi2%>"   onKeyUp="return num1(form1.nik_sksi2)" onBlur="setupPekerjaan(form1.jenis_pekerjaan_saksi2, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=nama_saksi_2%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=tempat_lahir_saksi_2%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=tgl_lahir_saksi_2%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                                <td colspan="5">
   <%=alamat_saksi_2%><br>
   RT <%=rt_saksi_2%>
   RW <%=rw_saksi_2%>
   Dusun <%=dusun_saksi_2%>
   Kodepos <%=kodepos_saksi_2%>
   Telp <%=telp_saksi_2%>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=agama_saksi_2%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pekerjaan_saksi2 boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

  <%
/*
if (kecInput) {
  if (step>=2 && radiobutton<0 && radiobutton3<0) {
     step = 1;
     edit = "disabled";
  }
}
*/
   if (step>=2 && errors==null) {%>
  <div class="tab-page"  id="tabPage7">
                    <h2 class="tab">Data Administrasi</h2>
                <script type="javascript">
                	tp1.addTabPage(document.getElementById("tabPage7"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Jenis Daftar Kematian<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_dft_mt" class="boxdefault" >
                                    <option value="0" selected>-- Pilih Daftar
                                    Kematian --</option>
                                    <option value="1">1 - Umum</option>
                                    <option value="2">2 - Istimewa</option>
                                    <option value="3">3 - Dispensasi</option>
                                  </select>
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Dasar Hukum Pencatatan
                                  Kematian<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="dsrhk_cttmt" class="boxdefault"  >
                                    <option value="0" selected>-- Pilih Dasar
                                    Hukum --</option>
                                    <option value="1">1 - Stbld 1849 No. 25</option>
                                    <option value="2">2 - Stbld 1917 No.130 jo
                                    1919 No.81</option>
                                    <option value="3">3 - Stbld 1920 No.751 jo
                                    1927 No.584</option>
                                    <option value="4">4 - Stbld 1933 No.75 jo
                                    1936 No.607</option>
                                    <option value="5">5 - Non Stbld</option>
									<option value="6">6 - UU No.23 Tahun 2006</option>
									<option value="7">7 - ----------</option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Dokumen Persyaratan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5" valign="top">
                                <p>
                                  <select name="doc_per" size="6" multiple >
                                    <option value="1">Surat Keterangan Pemeriksaan
                                    Mayat</option>
                                    <option value="2">Surat Laporan Kematian dari
                                    Desa/Kelurahan</option>
                                    <option value="3">Surat Ijin Penggunaan Tanah
                                    Makam</option>
                                    <option value="4">Copy KTP/KK yang Dilegalisir
                                    Kades/Lurah</option>
                                    <option value="5">Akta Kelahiran</option>
                                    <option value="6">Akta Perkawinan</option>
                                    <option value="7">Akta Perceraian</option>
                                    <option value="8">Paspor</option>
                                    <option value="9">STMD dari Kepolisian</option>
                                    <option value="10">SKK dari Imigrasi</option>
                                    <option value="11">Surat dari Kedutaan/Konsul/Perwakilan
                                    Negara Asing yang Bersangkutan</option>
                                  </select>
                                  <br>
                                </p>
                                </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Akta Kematian</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%"> </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tanggal Akta Kematian<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%"> <%=record.getToday()%> </td>
                            </tr>
                            <tr>
                              <td width="22%">Tanggal Cetak Kutipan Akta</td>
                              <td width="1%">:</td>
                              <td width="23%"> <%=record.getToday()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jabatan pada Kantor/Dinas</td>
                              <td width="1%">:</td>
                              <td width="26%"> <%=record.getKabJabatan()%></td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Pejabat</td>
                              <td width="1%">:</td>
                              <td width="23%"> <%=record.getKabNamaPej() %></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">NIP Pejabat</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=record.getKabNipPej()%> </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nama Kepala Desa/Lurah
  <font color="#000099" class="asterish"></font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_kep_des" size="26" class="boxdefault" maxlength="60"  value=<%=(request.getParameter("nama_kep_des")==null?"":request.getParameter("nama_kep_des"))%>>
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">NIP Lurah</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nip_lrh" size="9" class="boxdefault" maxlength="9"  value=<%=(request.getParameter("nip_lrh")==null?"":request.getParameter("nip_lrh"))%>>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nama Petugas Pencatat/
                                  Registrar<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_pet_reg" size="26" class="boxdefault" maxlength="60" value=<%=(request.getParameter("nama_pet_reg")==null?"":request.getParameter("nama_pet_reg"))%>>
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td align="center" width="24%">
                                <p align="left" style="line-height: 100%">NIP
                                  Petugas Pencatat/Registrar<font color="#000099" class="asterish">*</font>
                              </td>
                              <td width="1%">:</td>
                              <td align="center" width="26%">
                                <p align="left" style="line-height: 100%">
                                  <input type="text" name="nip_pet_reg" size="9" class="boxdefault" maxlength="9" value=<%=(request.getParameter("nip_pet_reg")==null?"":request.getParameter("nip_pet_reg"))%>>
                              </td>
                            </tr>
                            <tr>
                              <td align="center" width="22%">
                                <p align="left" style="line-height: 100%">Nama
                                  Petugas Entri Data
                              </td>
                              <td width="1%">:</td>
                              <td align="center" width="23%">
                                <p align="left" style="line-height: 100%"> <%=record.getNamaPetugas()%>
                              </td>
                              <td align="center" width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">NIP Petugas Entri
                                  Data</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"> <%=record.getNipPetugas()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Entri Data</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%"> <%=record.getToday()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
                  </div>
<%}%>
  </div>

<script type="text/javascript">
setupAllTabs();
</script>
</tr>

                    </table>
                  </div>
                </td>
                <td>&nbsp;
</td>
              </tr>

              <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>

<br>
<table width="400" border="0" cellspacing="5" cellpadding="5" align="center">
  <tr>
      <td width="130">
        <div align="center"><b>
        <input class=boxstandard type="button" value="KONFIRMASI"  name="kon" onclick="return konfirmasi(<%=step%>, <%=kecInput%>)">
        </b></div>
    </td>
      <td width="104">
        <div align="center"></div>
      <div align="center"><b>
        <input class=boxstandard type="button" value="SIMPAN" name="sim" onClick="return saksimati()">
        </b></div>
    </td>
      <td width="97">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KELUAR" name="kel" onclick="document.location='Menu_Capil_KabKota.jsp'">
          </b></div>
    </td>
      <td width="4">
        <div align="center"></div>
    </td>
  </tr>
  <tr>
    <td colspan="4">
      <div align="center"><font color="#003399">Keterangan : </font><font color="#000099" class="asterish">*</font><font color="#003399">Data
        harus diisi sesuai kondisi sebenarnya</font></div>
    </td>
  </tr>
</table>
<input type=hidden name="today" value="<%=record.getToday()%>">
<input type="hidden" name="nama_jnsah" value="<%=nama_jenasah%>">
<input type="hidden" name="no_prop_ibu" value="<%=no_prop_ibu%>">
<input type="hidden" name="no_kab_ibu" value="<%=no_kab_ibu%>">
<input type="hidden" name="no_kec_ibu" value="<%=no_kec_ibu%>">
<input type="hidden" name="no_kel_ibu" value="<%=no_kel_ibu%>">
<input type="hidden" name="no_prop_ayh" value="<%=no_prop_ayh%>">
<input type="hidden" name="no_kab_ayh" value="<%=no_kab_ayh%>">
<input type="hidden" name="no_kec_ayh" value="<%=no_kec_ayh%>">
<input type="hidden" name="no_kel_ayh" value="<%=no_kel_ayh%>">
<input type="hidden" name="no_kec" value="<%=no_kec%>">

</form>
<script language="JavaScript">
<% if (kecInput) {%>
               setFieldIbuEnabled(true);
               setFieldAyahEnabled(true);
               setFieldPelaporEnabled(true);
<%}%>
  form1.ktrunan_jnsah.selectedIndex = <%=ktrunan_jnsah%>
  form1.wkt_pkl_mt.selectedIndex = <%=wkt_pkl_mt%>
  form1.sbab_mati.selectedIndex = <%=sbab_mati%>
  form1.yg_mnerang.selectedIndex = <%=yg_mnerang%>

<%
if (lahirData!=null && lahirData.getRecordJnsah()!=null && errors==null) {
  if (wn_ibu>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_ibu, <%=wn_ibu%>);
     form1.jenis_pkrjn_ibu.selectedIndex = <%=jenis_pkrjn_ibu%>
<%
  }
  if (wn_ayah>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_ayh, <%=wn_ayah%>);
     form1.jenis_pkrjn_ayh.selectedIndex = <%=jenis_pkrjn_ayh%>
<%
  }
}

  if (wn_pelapor>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_plpor, <%=wn_pelapor%>);
     form1.jenis_pkrjn_plpor.selectedIndex = <%=jenis_pkrjn_plpor%>
<%
  }
%>
  setupPekerjaan(form1.jenis_pekerjaan_saksi1, <%=wn_saksi_1%>);
  form1.jenis_pekerjaan_saksi1.selectedIndex = <%=jenis_pekerjaan_saksi1%>

  setupPekerjaan(form1.jenis_pekerjaan_saksi2, <%=wn_saksi_2%>);
  form1.jenis_pekerjaan_saksi2.selectedIndex = <%=jenis_pekerjaan_saksi2%>

<% if (step>=2 && errors==null) {
%>
  form1.jenis_dft_mt.selectedIndex = <%=(request.getParameter("jenis_dft_mt")==null?0:Integer.parseInt(request.getParameter("jenis_dft_mt")))%>
  form1.dsrhk_cttmt.selectedIndex = <%=(request.getParameter("dsrhk_cttmt")==null?0:Integer.parseInt(request.getParameter("dsrhk_cttmt")))%>
<%
  String[] selected=request.getParameterValues("doc_per");
  if (selected!=null) {
     for(int j=0; j < selected.length;j++)
        {
%>
           form1.doc_per.options[<%=Integer.parseInt(selected[j])-1%>].selected = true;
<%
        }
  }
  }
%>
<% if (kecInput && !("".equals(edit))) { %>
  alert("Lengkapi Data Ibu, Data Ayah, dan Data Pelapor")
  //tp1.selectedIndex(1)
<% }
%>
  setSaveEnabled(<%=("".equals(edit))%>)
  setupKecamatanInput(<%=kecInput%>)
</script>
</BODY></HTML>
<%
   }
   catch(Exception e)
   {
    e.printStackTrace();
  }
%>