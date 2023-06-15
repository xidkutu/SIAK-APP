<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,java.math.*,com.db.connection.*" %>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>


<%

    String login=null,pwd=null,id1=null,flag=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factoryKlr,factory1Klr;
//    Login remote;
    WNIBiodataHome homeKlr = null;
    WNIBiodata remoteKlr = null;
    WniWnaObj wnidataKlr = null,wnidataKlr1 = null,wnidataKlr2 = null,wnidataKlr3 = null;
    Vector v1,v_prop,v_kab,v_kec,v_kel;
    String nik_jnsah=null,nik_ibu=null,nik_ayah=null,nik_pelapor=null,day=null;
    String edit = "",nama_jnsah = "";
    edit = "";


String dd="",mon="",yy="";
String tgl_lahir="";
String tgl_mlpor="";
String tgl_ctt_kwn="";
String ctt_tgl="";
String day1="";
%>

<% Vector errMsg;
   String infoMsg;
   errMsg = new Vector();
   infoMsg = null;
   boolean sudahAda = false;
   try
   {

     nik_jnsah=(request.getParameter("nik_jnsah")==null?"":request.getParameter("nik_jnsah"));

       //     session.setAttribute("nik_jnsah",nik_jnsah);

     nik_ibu=(request.getParameter("nik_ibu")==null?"":request.getParameter("nik_ibu"));
      //   session.setAttribute("nik_ibu",nik_ibu);

     nik_ayah=(request.getParameter("nik_ayh")==null?"":request.getParameter("nik_ayh"));

       // session.setAttribute("nik_ayah",nik_ayah);

     nik_pelapor=((request.getParameter("nik_plpor")==null)?"":request.getParameter("nik_plpor"));

     v = new Vector();

          record = (UserInfo1)session.getAttribute("remoteRef");

     factoryKlr=ServiceController.getInstance();
     homeKlr = (WNIBiodataHome)factoryKlr.lookup("WNIBiodata",WNIBiodataHome.class);

     if(homeKlr != null)
     {
       remoteKlr = homeKlr.create();
     }


  //   home1=(DataWilayahaListHome)factoryKlr.lookup("DataWilayahaList",DataWilayahaListHome.class);

/*     if(home1 != null)
     {
       remote1 = home1.create();
     }
     else
     {
       remote1 = null;
     }

     obj=(DataWilayahaListInfo)remote1.getWilayahList();

     v_prop=obj.getPropinsi();
     v_kab=obj.getKabupaten();
     v_kec=obj.getKecamtan();
     v_kel=obj.getKelurahan();
*/

    // wnidataKlr = ((WniWnaObj)remoteKlr.getDataKlr(nik_jnsah,nik_ibu,nik_ayah,nik_pelapor) == null)
      //             ?null:(WniWnaObj)remoteKlr.getDataKlr(nik_jnsah,nik_ibu,nik_ayah,nik_pelapor);


     wnidataKlr=(WniWnaObj)remoteKlr.getMatiKec(nik_jnsah,nik_ibu,nik_ayah,nik_pelapor, Integer.parseInt(record.getLevelId()));
     if (wnidataKlr==null) {
       sudahAda = true;
       wnidataKlr = new WniWnaObj(new KelahiranObj(), new KelahiranWnaObj());
     } else {

       if(wnidataKlr.getWniObj().getRecord1() != null) {
         day1 = getLocaleDay(wnidataKlr.getWniObj().getRecord1().getTglLhr());
         nama_jnsah=wnidataKlr.getWniObj().getRecord1().getNamaLgkp().toUpperCase();
       }
       if(wnidataKlr.getWnaObj().getRecord1() != null) {
         day1 = getLocaleDay(wnidataKlr.getWnaObj().getRecord1().getTglLhr());
         nama_jnsah=wnidataKlr.getWnaObj().getRecord1().getNamaPertma().toUpperCase();
       }
     }

      //session.setAttribute("nama_jnsah",nama_jnsah);
%>


<script type="text/javascript" src="Templates/tabpane.js"></script>
<SCRIPT language=JavaScript src="scripts/Kematian.js"></SCRIPT>
<SCRIPT language=JavaScript src="scripts/util.js"></SCRIPT>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
</HEAD>
<link type="text/css" rel="StyleSheet" href="Templates/tab.webfx.css" />

<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post">

 <script language="text/javaScript">
var tp1;
</script>
<input type="hidden" name="nama_jnsah" value="<%=nama_jnsah%>">



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
<% String jsp = "data_wilayah_3.jsp?no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() ;
%>
                          <jsp:include page="<%=jsp%>"/>
            </td>
        </tr>
		<tr>
		   <%  if (sudahAda) {
                         errMsg.add("Data Kematian Sudah Ada/Tersimpan!");
                       } else {
                           if(flag!=null) {
                              if (flag.equals("1")) {
                                infoMsg = "Data sudah disimpan !";
                              } else if (flag.equals("2")){
                                errMsg.add("Data NIK belum ada !");
                              }
                           }
                           if(request.getMethod().equalsIgnoreCase("POST") && wnidataKlr.getWniObj().getRecord1() == null && wnidataKlr.getWnaObj().getRecord1() == null) {
                              errMsg.add("NIK Jenasah tidak ada/salah, periksa kembali !");
                           }
                           if(wnidataKlr.getWniObj().getRecord2() == null && wnidataKlr.getWnaObj().getRecord2() == null &&
                               request.getParameter("radiobutton")!=null && request.getParameter("radiobutton").trim().equalsIgnoreCase("Ada")) {
                              errMsg.add("NIK Ibu tidak ada/salah, periksa kembali !");
                           }
                           if(wnidataKlr.getWniObj().getRecord3() == null && wnidataKlr.getWnaObj().getRecord3() == null &&
                               request.getParameter("radiobutton3")!=null && request.getParameter("radiobutton3").trim().equalsIgnoreCase("Ada")) {
                              errMsg.add("NIK Ayah tidak ada/salah, periksa kembali !");
                           }
                           if(request.getMethod().equalsIgnoreCase("POST") && wnidataKlr.getWniObj().getRecord4() == null && wnidataKlr.getWnaObj().getRecord4() == null) {
                              errMsg.add("NIK Pelapor tidak ada/salah, periksa kembali !");
                           }
                       }
                       %>
                       <% if (infoMsg!=null) { %>
                          <tr><td><%=printInfo(infoMsg)%></td></tr>
                       <%
                          }
                          else {
                              for(int i=0; i<errMsg.size(); i++) {
                                String message = (String) errMsg.elementAt(i);
                       %>
                                <tr><td><%=printError(message, "left")%></td></tr>
                       <%   }
                         }
						 int statusReqIbu = ADANOTEXIST; // Ada but not exist
						 if (errMsg==null || errMsg.size()==0) {
						    if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton"))) { //ada and exist
							//bean
							statusReqIbu = ADAEXIST;
							} else { //Tidak ada
							//request
							statusReqIbu = TIDAKADA;
							}
						 }
						 int statusReqAyah = ADANOTEXIST; // Ada but not exist
						 if (errMsg==null || errMsg.size()==0) {
						    if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton3"))) { //ada and exist
							//bean
							statusReqAyah = ADAEXIST;
							} else { //Tidak ada
							//request
							statusReqAyah = TIDAKADA;
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
<div class="tab-pane" id="tab-pane-1" style="postion:absolute">

<script type="text/javascript">
tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);
</script>


<%
int wn_jenasah = (request.getParameter("nik_jnsah")==null?0:(request.getParameter("nik_jnsah").substring(0,1).equals("A")?2:1));
if(wnidataKlr.getWniObj().getRecord1() == null && wnidataKlr.getWnaObj().getRecord1() == null)
{
//System.out.println(256);
edit="disabled";
//System.out.println("edit="+edit);
//System.out.println(258);
}
//String nik_jnsah = ((request.getParameter("nik_jnsah")==null)?"":request.getParameter("nik_jnsah"));
String nama_jenasah ="-";
String alamat_jenasah = "-";
String rt_jenasah = "-";
String rw_jenasah = "-";
String dusun_jenasah = "-";
String kodepos_jenasah = "-";
String telp_jenasah = "-";
String jenis_kelamin_jenasah = "-";
String tanggal_lahir_jenasah = "-";
String tempat_lahir_jenasah = "-";
int ktrunan_jnsah = ((request.getParameter("ktrunan_jnsah")==null)?0:Integer.parseInt(request.getParameter("ktrunan_jnsah")));
String pekerjaan_jenasah = "-";
String kebangsaan_jenasah = "-";
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

if (wn_jenasah==1 && wnidataKlr.getWniObj().getRecord1()!=null) {
   nama_jenasah = ((wnidataKlr.getWniObj().getRecord1().getNamaLgkp()==null)?"-":wnidataKlr.getWniObj().getRecord1().getNamaLgkp().toUpperCase());
   alamat_jenasah = (wnidataKlr.getWniObj().getRecord1().getAlamat()==null?"-":wnidataKlr.getWniObj().getRecord1().getAlamat());
   rt_jenasah = (wnidataKlr.getWniObj().getRecord1().getNoRt()==null?"":wnidataKlr.getWniObj().getRecord1().getNoRt());
   rw_jenasah = (wnidataKlr.getWniObj().getRecord1().getNoRw()==null?"":wnidataKlr.getWniObj().getRecord1().getNoRw());
   dusun_jenasah = (wnidataKlr.getWniObj().getRecord1().getDusun()==null?"":wnidataKlr.getWniObj().getRecord1().getDusun());
   kodepos_jenasah = (wnidataKlr.getWniObj().getRecord1().getKodePos()==null?"":wnidataKlr.getWniObj().getRecord1().getKodePos());
   telp_jenasah = (wnidataKlr.getWniObj().getRecord1().getTelp()==null?"":wnidataKlr.getWniObj().getRecord1().getTelp());
   jenis_kelamin_jenasah = (wnidataKlr.getWniObj().getRecord1().getJenisKlmin().toString().equals("1")?"Laki-laki":"Perempuan");
   tanggal_lahir_jenasah = (wnidataKlr.getWniObj().getRecord1().getTglLhr()==null?"-":wnidataKlr.getWniObj().getRecord1().getTglLhr());
   tempat_lahir_jenasah = (wnidataKlr.getWniObj().getRecord1().getTmptLhr()==null?"-":wnidataKlr.getWniObj().getRecord1().getTmptLhr().toUpperCase());
   pekerjaan_jenasah = (wnidataKlr.getWniObj().getRecord1().getJenisPkrjn()==null?"-":getPekerjaan(wnidataKlr.getWniObj().getRecord1().getJenisPkrjn()));
} else if (wn_jenasah==2 && wnidataKlr.getWnaObj().getRecord1()!=null) {
   nama_jenasah = ((wnidataKlr.getWnaObj().getRecord1().getNamaPertma()==null)?"-":wnidataKlr.getWnaObj().getRecord1().getNamaPertma().toUpperCase());
   alamat_jenasah = (wnidataKlr.getWnaObj().getRecord1().getAlamat()==null?"-":wnidataKlr.getWnaObj().getRecord1().getAlamat());
   rt_jenasah = (wnidataKlr.getWnaObj().getRecord1().getNoRt()==null?"":wnidataKlr.getWnaObj().getRecord1().getNoRt());
   rw_jenasah = (wnidataKlr.getWnaObj().getRecord1().getNoRw()==null?"":wnidataKlr.getWnaObj().getRecord1().getNoRw());
   dusun_jenasah = (wnidataKlr.getWnaObj().getRecord1().getDusun()==null?"":wnidataKlr.getWnaObj().getRecord1().getDusun());
   kodepos_jenasah = (wnidataKlr.getWnaObj().getRecord1().getKodePos()==null?"":wnidataKlr.getWnaObj().getRecord1().getKodePos());
   telp_jenasah = (wnidataKlr.getWnaObj().getRecord1().getTelp()==null?"":wnidataKlr.getWnaObj().getRecord1().getTelp());
   jenis_kelamin_jenasah = (wnidataKlr.getWnaObj().getRecord1().getJnsKlm().toString().equals("1")?"Laki-laki":"Perempuan");
   tanggal_lahir_jenasah = (wnidataKlr.getWnaObj().getRecord1().getTglLhr()==null?"-":wnidataKlr.getWnaObj().getRecord1().getTglLhr());
   tempat_lahir_jenasah = (wnidataKlr.getWnaObj().getRecord1().getTmpLhr()==null?"-":wnidataKlr.getWnaObj().getRecord1().getTmpLhr().toUpperCase());
   pekerjaan_jenasah = (wnidataKlr.getWnaObj().getRecord1().getJenisPkrjn()==null?"-":getPekerjaanWna(wnidataKlr.getWnaObj().getRecord1().getJenisPkrjn()));
   kebangsaan_jenasah = (wnidataKlr.getWnaObj().getRecord1().getKwrngrn()==null?"-":wnidataKlr.getWnaObj().getRecord1().getKwrngrn());
}

%>
<div class="tab-page" style="postion:absolute" id="tabPage1">
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
                                  <input type="text" name="nik_jnsah" size="17" value='<%=nik_jnsah%>' class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_jnsah)" onChange="setSaveEnabled(false)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>

            <td width="26%">
      <p style="line-height: 100%"><%=nama_jenasah%>
</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat</td>
                              <td width="1%"> :</td>

            <td colspan="5">
			<%=alamat_jenasah%><br>
   RT <%=rt_jenasah%>
   RW <%=rw_jenasah%>
   Dusun <%=dusun_jenasah%>
   Kodepos <%=kodepos_jenasah%>
   Telp <%=telp_jenasah%></td>
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
   <p style="line-height: 100%"><%=tempat_lahir_jenasah%></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=pekerjaan_jenasah%>
</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="23%">
<%if (wn_jenasah!=0)
{
%>
<%=((wn_jenasah==1)?"WNI":"WNA")%>
<%
}
else
{
%>
<%="-"%>
<%
}
%>
</td>
                              <td width="3%">&nbsp;</td>

            <td width="24%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ktrunan_jnsah" class="boxdefault">
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
                       <td width="23%"><%=kebangsaan_jenasah%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Anak ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="anak_ke_mt" value='<%=anak_ke_mt%>' size="2" class="boxdefault" maxlength="2">
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
                                class=boxdefault size=2 name="tgl_mati_dd" value='<%=tgl_mati_dd%>' maxlength="2" onKeyUp="return checkTanggal(form1.tgl_mati_dd, form1.tgl_mati_mm)">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_mati_mm value='<%=tgl_mati_mm%>' maxlength="2" onKeyUp="return checkBulan(form1.tgl_mati_mm, form1.tgl_mati_yy)">
                                    </td>
                                    <td>/</td>
                                    <td>

                                      <input
                                class=boxdefault size=4 name=tgl_mati_yy value='<%=tgl_mati_yy%>' maxlength="4" onKeyUp="return checkTahun(form1.tgl_mati_dd, form1.tgl_mati_mm, form1.tgl_mati_yy)">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pukul<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%" valign="middle">
                                <input type="text" name="pukul_mt1" value='<%=pukul_mt1%>' size="2" class="boxdefault" maxlength="2" onKeyUp="return tab()">
                                <b>:</b>
                                <input type="text" name="pukul_mt2" value='<%=pukul_mt2%>' size="2" class="boxdefault" maxlength="2" onKeyUp="return tab1()">
                                <select size="1" name="wkt_pkl_mt" class="boxdefault">
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
                                  <select size="1" name="sbab_mati" class="boxdefault">
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
                                <p style="line-height: 100%">Tempat Kematian<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                 <input type="text" name="tmpt_mati" value='<%=tmpt_mati%>' size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_mati)">
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
                                  <select size="1" name="yg_mnerang" class="boxdefault">
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
                                  <input type="text" name="pnetap_pn" size="22" value='<%=pnetap_pn%>' class="boxdefault" maxlength="60">
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nomor Penetapan Pengadilan Negeri
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="no_pnetap" value='<%=no_pnetap%>' size="22" class="boxdefault" maxlength="40">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Penetapan Pengadilan Negeri</td>
                              <td width="1%">:</td>
                              <td width="26%">
 <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_pnetap maxlength="2" value='<%=tgl_pnetap%>' onKeyUp="return checkTanggal(form1.tgl_pnetap, form1.bln_pnetap)">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=bln_pnetap maxlength="2" value='<%=bln_pnetap%>' onKeyUp="return checkBulan(form1.bln_pnetap, form1.thn_pnetap)">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=thn_pnetap maxlength="4" value='<%=thn_pnetap%>' onKeyUp="return checkTahun(form1.tgl_pnetap, form1.bln_pnetap, form1.thn_pnetap)">
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
//System.out.println("edit="+edit);
//System.out.println(495);

int wn_ibu = (request.getParameter("radiobutton1")==null?0:Integer.parseInt(request.getParameter("radiobutton1")));if(statusReqIbu==ADANOTEXIST)
{
  //System.out.println(366);
  //System.out.println("radiobutton="+request.getParameter("radiobutton"));
  if (statusReqIbu==0) {
//System.out.println(579);
    edit="disabled";
    //System.out.println("radiobutton edit="+edit);
//System.out.println(582);
  }
}

//System.out.println(514);
int radiobutton = -1;
if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton")))
  radiobutton = 0;
else if ("Tidak Ada".equalsIgnoreCase(request.getParameter("radiobutton")))
  radiobutton = 1;

int radiobutton1 = -1;
if ("1".equals(request.getParameter("radiobutton1")))
  radiobutton1 = 0;
else if ("2".equals(request.getParameter("radiobutton1")))
  radiobutton1 = 1;
//System.out.println("request.getParameter(radiobutton)"+request.getParameter("radiobutton"));
//System.out.println("request.getParameter(radiobutton1)"+request.getParameter("radiobutton1"));
//System.out.println("radiobutton"+radiobutton);
//System.out.println("radiobutton1"+radiobutton1);
//String nik_ibu = (request.getParameter("nik_ibu")==null?"":request.getParameter("nik_ibu"));
String nama_ibu = (request.getParameter("nama_ibu")==null?"":request.getParameter("nama_ibu"));
String getDDTglLahirIbu = (request.getParameter("no_akta_lhr_dd")==null?"":request.getParameter("no_akta_lhr_dd"));
String getMMTglLahirIbu = (request.getParameter("no_akta_lhr_mm")==null?"":request.getParameter("no_akta_lhr_mm"));
String getYYTglLahirIbu = (request.getParameter("no_akta_lhr_yy")==null?"":request.getParameter("no_akta_lhr_yy"));
int jenis_pkrjn_ibu = 0;
//System.out.println("jenis_pkrjn_ibu"+jenis_pkrjn_ibu);
String alamat_ibu = (request.getParameter("alamat_ibu")==null?"":request.getParameter("alamat_ibu"));
String no_rt_ibu = (request.getParameter("no_rt_ibu")==null?"":request.getParameter("no_rt_ibu"));
String no_rw_ibu = (request.getParameter("no_rw_ibu")==null?"":request.getParameter("no_rw_ibu"));
String dusun_ibu = (request.getParameter("dusun_ibu")==null?"":request.getParameter("dusun_ibu"));
String kodepos_ibu = (request.getParameter("kodepos_ibu")==null?"":request.getParameter("kodepos_ibu"));
String telp_ibu = (request.getParameter("telp_ibu")==null?"":request.getParameter("telp_ibu"));
String nama_prop_ibu = (request.getParameter("nama_prop_ibu")==null?"":request.getParameter("nama_prop_ibu"));
String nama_kab_ibu = (request.getParameter("nama_kab_ibu")==null?"":request.getParameter("nama_kab_ibu"));
String nama_kec_ibu = (request.getParameter("nama_kec_ibu")==null?"":request.getParameter("nama_kec_ibu"));
String nkelibu = (request.getParameter("nkelibu")==null?"":request.getParameter("nkelibu"));
int ketrunan_ibu = (request.getParameter("ketrunan_ibu")==null?0:Integer.parseInt(request.getParameter("ketrunan_ibu")));
String bangsa_ibu = (request.getParameter("bangsa_ibu")==null?"":request.getParameter("bangsa_ibu"));
String getDDTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_dd")==null?"":request.getParameter("tgl_ctt_kwn_ibu_dd"));
String getMMTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_mm")==null?"":request.getParameter("tgl_ctt_kwn_ibu_mm"));
String getYYTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_yy")==null?"":request.getParameter("tgl_ctt_kwn_ibu_yy"));
//System.out.println(552);
if (statusReqIbu==ADAEXIST) {
   if (wn_ibu==1) {
      nama_ibu = (wnidataKlr.getWniObj().getRecord2().getNamaLgkp()==null?"":wnidataKlr.getWniObj().getRecord2().getNamaLgkp());
      jenis_pkrjn_ibu = (wnidataKlr.getWniObj().getRecord2().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord2().getJenisPkrjn()));
      getDDTglLahirIbu = getDD(wnidataKlr.getWniObj().getRecord2().getTglLhr());
      getMMTglLahirIbu = getMM(wnidataKlr.getWniObj().getRecord2().getTglLhr());
      getYYTglLahirIbu = getYY(wnidataKlr.getWniObj().getRecord2().getTglLhr());
      alamat_ibu = (wnidataKlr.getWniObj().getRecord2().getAlamat()==null?"":wnidataKlr.getWniObj().getRecord2().getAlamat());
      no_rt_ibu = (wnidataKlr.getWniObj().getRecord2().getNoRt()==null?"":wnidataKlr.getWniObj().getRecord2().getNoRt());
      no_rw_ibu = (wnidataKlr.getWniObj().getRecord2().getNoRw()==null?"":wnidataKlr.getWniObj().getRecord2().getNoRw());
      dusun_ibu = (wnidataKlr.getWniObj().getRecord2().getDusun()==null?"":wnidataKlr.getWniObj().getRecord2().getDusun());
      kodepos_ibu = (wnidataKlr.getWniObj().getRecord2().getKodePos()==null?"":wnidataKlr.getWniObj().getRecord2().getKodePos());
      telp_ibu = (wnidataKlr.getWniObj().getRecord2().getTelp()==null?"":wnidataKlr.getWniObj().getRecord2().getTelp());
      nama_prop_ibu = (wnidataKlr.getWniObj().getRecord2().getNoProp()==null?"":wnidataKlr.getWniObj().getRecord2().getNoProp());
      nama_kab_ibu = (wnidataKlr.getWniObj().getRecord2().getNoKab()==null?"":wnidataKlr.getWniObj().getRecord2().getNoKab());
      nama_kec_ibu = (wnidataKlr.getWniObj().getRecord2().getNoKec()==null?"":wnidataKlr.getWniObj().getRecord2().getNoKec());
      nkelibu = (wnidataKlr.getWniObj().getRecord2().getNoKel()==null?"":wnidataKlr.getWniObj().getRecord2().getNoKel());

   getDDTglKawinIbu = getDD(wnidataKlr.getWniObj().getRecord2().getTglKwn());
   getMMTglKawinIbu = getMM(wnidataKlr.getWniObj().getRecord2().getTglKwn());
   getYYTglKawinIbu = getYY(wnidataKlr.getWniObj().getRecord2().getTglKwn());

jenis_pkrjn_ibu = (wnidataKlr.getWniObj().getRecord2().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord2().getJenisPkrjn()));

   } else if (wn_ibu==2) {
      nama_ibu = (wnidataKlr.getWnaObj().getRecord2().getNamaPertma()==null?"":wnidataKlr.getWnaObj().getRecord2().getNamaPertma());
      jenis_pkrjn_ibu = (wnidataKlr.getWnaObj().getRecord2().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWnaObj().getRecord2().getJenisPkrjn()));
      getDDTglLahirIbu = getDD(wnidataKlr.getWnaObj().getRecord2().getTglLhr());
      getMMTglLahirIbu = getMM(wnidataKlr.getWnaObj().getRecord2().getTglLhr());
      getYYTglLahirIbu = getYY(wnidataKlr.getWnaObj().getRecord2().getTglLhr());
      alamat_ibu = (wnidataKlr.getWnaObj().getRecord2().getAlamat()==null?"":wnidataKlr.getWnaObj().getRecord2().getAlamat());
      no_rt_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoRt()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoRt());
      no_rw_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoRw()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoRw());
   dusun_ibu = (wnidataKlr.getWnaObj().getRecord2().getDusun()==null?"":wnidataKlr.getWnaObj().getRecord2().getDusun());
   kodepos_ibu = (wnidataKlr.getWnaObj().getRecord2().getKodePos()==null?"":wnidataKlr.getWnaObj().getRecord2().getKodePos());
   telp_ibu = (wnidataKlr.getWnaObj().getRecord2().getTelp()==null?"":wnidataKlr.getWnaObj().getRecord2().getTelp());
   nama_prop_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoProp()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoProp());
   nama_kab_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoKab()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoKab());
   nama_kec_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoKec()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoKec());
   nkelibu = (wnidataKlr.getWnaObj().getRecord2().getNoKel()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoKel());
jenis_pkrjn_ibu = (wnidataKlr.getWnaObj().getRecord2().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWnaObj().getRecord2().getJenisPkrjn()));
   }
}
//System.out.println(592);
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
                          <table align="center" width="100%" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>

            <td width="23%">
              <input type="radio" name="radiobutton" value="Ada" onClick="return radioValid3()" <%if (radiobutton==0) {%> checked <%}%> onChange="resetFieldIbu()">
              Ada<br>
              <input type="radio" name="radiobutton" value="Tidak Ada" onClick="return radioValid4()" <%if (radiobutton==1) {%> checked <%}%> onChange="resetFieldIbu()">
              Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">&nbsp;</td>

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
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>

            <td width="23%">
              <p style="line-height: 100%">
                <input type="text" name="nik_ibu" size="18" class="boxdefault" maxlength="17"  value="<%=nik_ibu%>" onKeyUp="return num1(form1.nik_ibu);" onBlur="validateWNIbu(form1.nik_ibu,form1.radiobutton1);setSaveEnabled(false)">
                <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
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
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>

            <td width="23%">
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
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>

            <td width="26%">
              <p style="line-height: 100%">
                <select
                  name=jenis_pkrjn_ibu boxdefault2 class="boxdefault">
                  <option value="0" selected>-- Pilih Jenis Pekerjaan --</option>
                </select>
              </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>

            <td colspan="5">
              <p style="line-height: 100%">
                <input type="text" name="alamat_ibu" size="30" class="boxdefault" value="<%=alamat_ibu%>" maxlength="120" /*onFocus="this.blur()"*/>
                RT<font color="#000099" class="asterish"> </font>
                <input type="text" name="no_rt_ibu" value="<%=no_rt_ibu%>" size="3" class="boxdefault" maxlength="3"  onKeyUp="return num(form1.no_rt_ibu)" /*onFocus="this.blur()"*/>
                RW
                <input type="text" name="no_rw_ibu" size="3" class="boxdefault" value="<%=no_rw_ibu%>" maxlength="3" onKeyUp="return num(form1.no_rw_ibu)" /*onFocus="this.blur()"*/>
                Dusun/Kampung/Dukuh
                <input type="text" name="dusun_ibu" size="22" class="boxdefault" value="<%=dusun_ibu%>" maxlength="60" /*onFocus="this.blur()"*/>
              </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>

            <td width="23%">
              <input type="text" name="kodepos_ibu" size="7" value="<%=kodepos_ibu%>" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kodepos_ibu)" /*onFocus="this.blur()"*/>
            </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>

            <td width="26%">
              <input type="text" name="telp_ibu" value="<%=telp_ibu%>" size="20" class="boxdefault" maxlength="20" /*onFocus="this.blur()"*/>
            </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="hidden" name="no_prop_ibu" value="">
              <input class="boxdefault" size=30 name="nama_prop_ibu" maxlength="60" onKeyUp="" value="<%=nama_prop_ibu%>">
            </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="hidden" name="no_kab_ibu" value="">
              <input class="boxdefault" size=30 name="nama_kab_ibu" maxlength="60" onKeyUp="" value="<%=nama_kab_ibu%>">
            </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="hidden" name="no_kec_ibu" value="">
              <input class="boxdefault" size=30 name="nama_kec_ibu" maxlength="60" onKeyUp="" value="<%=nama_kec_ibu%>">
            </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">

              <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
   <input type="hidden" name="no_kel_ibu" value="">
  <input class="boxdefault" size=30 name="nkelibu" maxlength="60" onKeyUp="" value="<%=nkelibu%>">
                           </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<%
//System.out.println(831);
//System.out.println("edit="+edit);
int wn_ayah = (request.getParameter("radiobutton4")==null?0:Integer.parseInt(request.getParameter("radiobutton4")));
if(statusReqAyah==ADANOTEXIST)
{
  //System.out.println(837);
  //System.out.println("radiobutton3="+request.getParameter("radiobutton3"));
  if (statusReqAyah==0) {
  //System.out.println(861);
    edit="disabled";
    //System.out.println("radiobutton edit="+edit);
  //System.out.println(864);
  }
}

//System.out.println(839);
int radiobutton3 = -1;
if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton3")))
  radiobutton3 = 0;
else if ("Tidak Ada".equalsIgnoreCase(request.getParameter("radiobutton3")))
  radiobutton3 = 1;

int radiobutton4 = -1;
if ("1".equals(request.getParameter("radiobutton4")))
  radiobutton4 = 0;
else if ("2".equals(request.getParameter("radiobutton4")))
  radiobutton4 = 1;
//System.out.println("request.getParameter(radiobutton3)"+request.getParameter("radiobutton3"));
//System.out.println("request.getParameter(radiobutton4)"+request.getParameter("radiobutton4"));
//System.out.println("radiobutton3"+radiobutton3);
//System.out.println("radiobutton4"+radiobutton4);
//String nik_ayh = (request.getParameter("nik_ayh")==null?"":request.getParameter("nik_ayh"));
String nama_ayh = (request.getParameter("nama_ayh")==null?"":request.getParameter("nama_ayh"));
String getDDTglLahirAyah = (request.getParameter("no_akta_lhr_dd1")==null?"":request.getParameter("no_akta_lhr_dd1"));
String getMMTglLahirAyah = (request.getParameter("no_akta_lhr_mm1")==null?"":request.getParameter("no_akta_lhr_mm1"));
String getYYTglLahirAyah = (request.getParameter("no_akta_lhr_yy1")==null?"":request.getParameter("no_akta_lhr_yy1"));
int jenis_pkrjn_ayh = 0;
//System.out.println("jenis_pkrjn_ayh"+jenis_pkrjn_ayh);
String alamat_ayh = (request.getParameter("alamat_ayh")==null?"":request.getParameter("alamat_ayh"));
String no_rt_ayh = (request.getParameter("no_rt_ayh")==null?"":request.getParameter("no_rt_ayh"));
String no_rw_ayh = (request.getParameter("no_rw_ayh")==null?"":request.getParameter("no_rw_ayh"));
String dusun_ayh = (request.getParameter("dusun_ayh")==null?"":request.getParameter("dusun_ayh"));
String kodepos_ayh = (request.getParameter("kodepos_ayh")==null?"":request.getParameter("kodepos_ayh"));
String telp_ayh = (request.getParameter("telp_ayh")==null?"":request.getParameter("telp_ayh"));
String nama_prop_ayh = (request.getParameter("nama_prop_ayh")==null?"":request.getParameter("nama_prop_ayh"));
String nama_kab_ayh = (request.getParameter("nama_kab_ayh")==null?"":request.getParameter("nama_kab_ayh"));
String nama_kec_ayh = (request.getParameter("nama_kec_ayh")==null?"":request.getParameter("nama_kec_ayh"));
String nkelayh = (request.getParameter("nkelayh")==null?"":request.getParameter("nkelayh"));
int ketrunan_ayh = (request.getParameter("ketrunan_ayh")==null?0:Integer.parseInt(request.getParameter("ketrunan_ayh")));
String bangsa_ayh = (request.getParameter("bangsa_ayh")==null?"":request.getParameter("bangsa_ayh"));
String getDDTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_dd")==null?"":request.getParameter("tgl_ctt_kwn_ayh_dd"));
String getMMTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_mm")==null?"":request.getParameter("tgl_ctt_kwn_ayh_mm"));
String getYYTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_yy")==null?"":request.getParameter("tgl_ctt_kwn_ayh_yy"));
//System.out.println(877);
if (statusReqAyah==ADAEXIST) {
   if (wn_ayah==1) {
      nama_ayh = (wnidataKlr.getWniObj().getRecord3().getNamaLgkp()==null?"":wnidataKlr.getWniObj().getRecord3().getNamaLgkp());
      jenis_pkrjn_ayh = (wnidataKlr.getWniObj().getRecord3().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord3().getJenisPkrjn()));
      getDDTglLahirAyah = getDD(wnidataKlr.getWniObj().getRecord3().getTglLhr());
      getMMTglLahirAyah = getMM(wnidataKlr.getWniObj().getRecord3().getTglLhr());
      getYYTglLahirAyah = getYY(wnidataKlr.getWniObj().getRecord3().getTglLhr());
      alamat_ayh = (wnidataKlr.getWniObj().getRecord3().getAlamat()==null?"":wnidataKlr.getWniObj().getRecord3().getAlamat());
      no_rt_ayh = (wnidataKlr.getWniObj().getRecord3().getNoRt()==null?"":wnidataKlr.getWniObj().getRecord3().getNoRt());
      no_rw_ayh = (wnidataKlr.getWniObj().getRecord3().getNoRw()==null?"":wnidataKlr.getWniObj().getRecord3().getNoRw());

      dusun_ayh = (wnidataKlr.getWniObj().getRecord3().getDusun()==null?"":wnidataKlr.getWniObj().getRecord3().getDusun());
      kodepos_ayh = (wnidataKlr.getWniObj().getRecord3().getKodePos()==null?"":wnidataKlr.getWniObj().getRecord3().getKodePos());
      telp_ayh = (wnidataKlr.getWniObj().getRecord3().getTelp()==null?"":wnidataKlr.getWniObj().getRecord3().getTelp());
      nama_prop_ayh = (wnidataKlr.getWniObj().getRecord3().getNoProp()==null?"":wnidataKlr.getWniObj().getRecord3().getNoProp());
      nama_kab_ayh = (wnidataKlr.getWniObj().getRecord3().getNoKab()==null?"":wnidataKlr.getWniObj().getRecord3().getNoKab());
      nama_kec_ayh = (wnidataKlr.getWniObj().getRecord3().getNoKec()==null?"":wnidataKlr.getWniObj().getRecord3().getNoKec());
      nkelayh = (wnidataKlr.getWniObj().getRecord3().getNoKel()==null?"":wnidataKlr.getWniObj().getRecord3().getNoKel());

   getDDTglKawinAyah = getDD(wnidataKlr.getWniObj().getRecord3().getTglKwn());
   getMMTglKawinAyah = getMM(wnidataKlr.getWniObj().getRecord3().getTglKwn());
   getYYTglKawinAyah = getYY(wnidataKlr.getWniObj().getRecord3().getTglKwn());
     jenis_pkrjn_ayh = (wnidataKlr.getWniObj().getRecord3().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord3().getJenisPkrjn()));

   } else if (wn_ayah==2) {
      nama_ayh = (wnidataKlr.getWnaObj().getRecord3().getNamaPertma()==null?"":wnidataKlr.getWnaObj().getRecord3().getNamaPertma());
      jenis_pkrjn_ayh = (wnidataKlr.getWnaObj().getRecord3().getJenisPkrjn()==null?0:wnidataKlr.getWnaObj().getRecord3().getJenisPkrjn().intValue());
      getDDTglLahirAyah = getDD(wnidataKlr.getWnaObj().getRecord3().getTglLhr());
      getMMTglLahirAyah = getMM(wnidataKlr.getWnaObj().getRecord3().getTglLhr());
      getYYTglLahirAyah = getYY(wnidataKlr.getWnaObj().getRecord3().getTglLhr());
      alamat_ayh = (wnidataKlr.getWnaObj().getRecord3().getAlamat()==null?"":wnidataKlr.getWnaObj().getRecord3().getAlamat());
      no_rt_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoRt()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoRt().toString());
      no_rw_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoRw()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoRw().toString());
   dusun_ayh = (wnidataKlr.getWnaObj().getRecord3().getDusun()==null?"":wnidataKlr.getWnaObj().getRecord3().getDusun());
   kodepos_ayh = (wnidataKlr.getWnaObj().getRecord3().getKodePos()==null?"":wnidataKlr.getWnaObj().getRecord3().getKodePos().toString());
   telp_ayh = (wnidataKlr.getWnaObj().getRecord3().getTelp()==null?"":wnidataKlr.getWnaObj().getRecord3().getTelp());
   nama_prop_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoProp()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoProp().toString());
   nama_kab_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoKab()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoKab().toString());
   nama_kec_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoKec()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoKec().toString());
   nkelayh = (wnidataKlr.getWnaObj().getRecord3().getNoKel()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoKel().toString());
jenis_pkrjn_ayh = (wnidataKlr.getWnaObj().getRecord3().getJenisPkrjn()==null?0:wnidataKlr.getWnaObj().getRecord3().getJenisPkrjn().intValue());

   }
}
//System.out.println(918);
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
                          <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>

            <td width="23%">
              <input type="radio" name="radiobutton3" value="Ada"  onClick="return radioValid5()" <%if (radiobutton3==0) {%> checked <%}%> onChange="resetFieldAyah()">
              Ada<br>
              <input type="radio" name="radiobutton3" value="Tidak Ada"  onClick="return radioValid6()" <%if (radiobutton3==1) {%> checked <%}%> onChange="resetFieldAyah()">
              Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ayah<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>

            <td width="26%">
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
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>

            <td width="23%">
              <p style="line-height: 100%">
                <input type="text" name="nik_ayh" size="18" value="<%=nik_ayah%>" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh)" onBlur="validateWNAyah(form1.nik_ayh, form1.radiobutton4); setSaveEnabled(false)">
                <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
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
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>

            <td width="23%">
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
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>

            <td width="26%">
              <p style="line-height: 100%">
                <select
                        name=jenis_pkrjn_ayh boxdefault2 class="boxdefault">
                  <option value="0" selected>-- Pilih Jenis Pekerjaan --</option>
                </select>
              </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>

            <td colspan="5">
              <p style="line-height: 100%">
                <input type="text" name="alamat_ayh" size="30" value="<%=alamat_ayh%>" class="boxdefault"  maxlength="120" /*onFocus="this.blur()"*/>
                RT<font color="#000099" class="asterish"> </font>
                <input type="text" name="no_rt_ayh" size="3" value="<%=no_rt_ayh%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rt_ayh)" /*onFocus="this.blur()"*/>
                RW
                <input type="text" name="no_rw_ayh" size="3" value="<%=no_rw_ayh%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rw_ayh)" /*onFocus="this.blur()"*/>
                Dusun/Kampung/Dukuh
                <input type="text" name="dusun_ayh" size="22"  value="<%=dusun_ayh%>" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
              </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>

            <td width="23%">
              <input type="text" name="kodepos_ayh"  value="<%=kodepos_ayh%>" size="7" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kodepos_ayh)" /*onFocus="this.blur()"*/>
            </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>

            <td width="26%">
              <input type="text" name="telp_ayh"  value="<%=telp_ayh%>" size="20" class="boxdefault" maxlength="20" /*onFocus="this.blur()"*/>
            </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi<font color="#000099" class="asterish"></font><font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="hidden" name="no_prop_ayh" value="">
              <input class="boxdefault" size=30 name="nama_prop_ayh" maxlength="60" onKeyUp="" value="<%=nama_prop_ayh%>">
            </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="hidden" name="no_kab_ayh" value="">
              <input class="boxdefault" size=30 name="nama_kab_ayh" maxlength="60" onKeyUp="" value="<%=nama_kab_ayh%>">
            </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="hidden" name="no_kec_ayh" value="">
              <input class="boxdefault" size=30 name="nama_kec_ayh" maxlength="60" onKeyUp="" value="<%=nama_kec_ayh%>">
            </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="hidden" name="no_kel_ayh" value="" >
              <input class="boxdefault" size=30 name="nkelayh" maxlength="60" onKeyUp="" value="<%=nkelayh%>">
            </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
<%
//System.out.println(1330);
//System.out.println("edit="+edit);
int wn_pelapor = (request.getParameter("nik_plpor")==null?0:(request.getParameter("nik_plpor").substring(0,1).equals("A")?2:1));

if(wnidataKlr.getWniObj().getRecord4() == null && wnidataKlr.getWnaObj().getRecord4() == null)
{
  //System.out.println(1140);
edit="disabled";
//System.out.println("pelapor edit="+edit);
  //System.out.println(1143);
}
//System.out.println(1178);
String nama_pelapor = "-";
String tgl_lahir_pelapor = "-";
int jenis_pkrjn_plpor = 0;
String alamat_pelapor = "-";
String rt_pelapor = "-";
String rw_pelapor = "-";
String dusun_pelapor = "-";
String kodepos_pelapor = "-";
String telp_pelapor = "-";
String no_akta_lhr_dd2 = (request.getParameter("no_akta_lhr_dd2")==null?"":request.getParameter("no_akta_lhr_dd2"));
String no_akta_lhr_mm2 = (request.getParameter("no_akta_lhr_mm2")==null?"":request.getParameter("no_akta_lhr_mm2"));
String no_akta_lhr_yy2 = (request.getParameter("no_akta_lhr_yy2")==null?"":request.getParameter("no_akta_lhr_yy2"));
//System.out.println(1191);
if (wn_pelapor==1 && wnidataKlr.getWniObj().getRecord4()!=null) {
   nama_pelapor = (wnidataKlr.getWniObj().getRecord4().getNamaLgkp()==null?"":wnidataKlr.getWniObj().getRecord4().getNamaLgkp());
   jenis_pkrjn_plpor = (wnidataKlr.getWniObj().getRecord4().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord4().getJenisPkrjn()));
   tgl_lahir_pelapor = wnidataKlr.getWniObj().getRecord4().getTglLhr();
 alamat_pelapor = ((wnidataKlr.getWniObj().getRecord4().getAlamat()==null)?"-":wnidataKlr.getWniObj().getRecord4().getAlamat());
 rt_pelapor = ((wnidataKlr.getWniObj().getRecord4().getNoRt()==null)?"-":wnidataKlr.getWniObj().getRecord4().getNoRt().toString());
 rw_pelapor = ((wnidataKlr.getWniObj().getRecord4().getNoRw()==null)?"-":wnidataKlr.getWniObj().getRecord4().getNoRw().toString());
 dusun_pelapor = ((wnidataKlr.getWniObj().getRecord4().getDusun()==null)?"-":wnidataKlr.getWniObj().getRecord4().getDusun());
 kodepos_pelapor = ((wnidataKlr.getWniObj().getRecord4().getKodePos()==null)?"-":wnidataKlr.getWniObj().getRecord4().getKodePos().toString());
 telp_pelapor = ((wnidataKlr.getWniObj().getRecord4().getTelp()==null)?"-":wnidataKlr.getWniObj().getRecord4().getTelp());
jenis_pkrjn_plpor = (wnidataKlr.getWniObj().getRecord4().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord4().getJenisPkrjn()));
   } else if (wn_pelapor==2 && wnidataKlr.getWnaObj().getRecord4()!=null) {
   nama_pelapor = wnidataKlr.getWnaObj().getRecord4().getNamaPertma();
jenis_pkrjn_plpor = (wnidataKlr.getWnaObj().getRecord4().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWnaObj().getRecord4().getJenisPkrjn()));
   tgl_lahir_pelapor = wnidataKlr.getWnaObj().getRecord4().getTglLhr();
 alamat_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getAlamat()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getAlamat());
 rt_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getNoRt()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getNoRt().toString());
 rw_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getNoRw()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getNoRw().toString());
 dusun_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getDusun()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getDusun());
 kodepos_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getKodePos()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getKodePos().toString());
 telp_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getTelp()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getTelp());
jenis_pkrjn_plpor = (wnidataKlr.getWnaObj().getRecord4().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWnaObj().getRecord4().getJenisPkrjn()));
   }
//System.out.println(1211);
jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_plpor"))==0?jenis_pkrjn_plpor:Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")));
//System.out.println("edit="+edit);
%>

<div class="tab-page"   id="tabPage4">
                    <h2 class="tab">Data Pelapor</h2>
                <script type="javascript">
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
                <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>

            <td width="26%">
              <p style="line-height: 100%"><%=nama_pelapor%></p>
                              </td>
                            </tr>
                            <tr>

            <td width="21%" height="40">
              <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>

            <td width="1%" height="40">:</td>

            <td width="26%" height="40">
              <p style="line-height: 100%"><%=tgl_lahir_pelapor%></p>
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

            <td colspan="5"><%=alamat_pelapor%><br>
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

<script language="javascript">
setupAllTabs();
</script>
</div>
              </td>
                      </tr>
                    </table>
                  </div>
                </td>
                <td>&nbsp;</td>
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
 <td width="120">
    <div align="center"><b>
   <input class=boxstandard type="button" value="KONFIRMASI" name="kon" onClick="return confirmasi(true)">
      </b></div>
    </td>
      <td width="110">
      <div align="center"><b></b>
   </div>
   <div align="center"><b>
    <input class=boxstandard type="button" value="SIMPAN" name="sim" onClick="return kematian(true)">
        </b></div>
    </td>
      <td width="98">
        <div align="center"><b>
   <input class=boxstandard type="button" value=KELUAR name="kel" onclick="document.location='Menu_Capil_Lahir_Mati_Kecamatan.jsp'">
   </b></div>
    </td>
      <td width="7">
        <div align="center"><b> </b></div>
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

<%
if(flag != null)
{
if(flag.equals("1"))
{%>
<script language="javascript">
</script>
<%}
else if(flag.equals("2"))
{%>
<script language="JavaScript">
  form1.nik.focus()
</script>
<%}}%>


 </form>
 <script language="JavaScript">
  form1.ktrunan_jnsah.selectedIndex = <%=ktrunan_jnsah%>
  form1.wkt_pkl_mt.selectedIndex = <%=wkt_pkl_mt%>
  form1.sbab_mati.selectedIndex = <%=sbab_mati%>
  form1.yg_mnerang.selectedIndex = <%=yg_mnerang%>


  setupPekerjaan(form1.jenis_pkrjn_ibu, <%=wn_ibu%>);
  form1.jenis_pkrjn_ibu.selectedIndex = <%=jenis_pkrjn_ibu%>

  setupPekerjaan(form1.jenis_pkrjn_ayh, <%=wn_ayah%>);
  form1.jenis_pkrjn_ayh.selectedIndex = <%=jenis_pkrjn_ayh%>

  setupPekerjaan(form1.jenis_pkrjn_plpor, <%=wn_pelapor%>);
  form1.jenis_pkrjn_plpor.selectedIndex = <%=jenis_pkrjn_plpor%>
  <%
  //System.out.println(1384);
//System.out.println("edit="+edit);

  //System.out.println(1387);
%>
  setSaveEnabled(<%=("".equals(edit))%>)
</script>
</BODY></HTML>
<%
   }

   catch(Exception e)
   {
e.printStackTrace();
    //System.out.println("Exception in List = " + e);
    //System.out.println("Record in List jsp = " + wnidataKlr.getWniObj().getRecord1().getNamaLgkp());
  }
%>