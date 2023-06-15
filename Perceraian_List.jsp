<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%  UserInfo1 record = null;
    Vector v = null;
    ServiceController factory;

    WNIBiodataHome home = null;
    WNIBiodata remote2;

    SaksiObject saksiData=null;
    String nik_suami,nik_istri,nik_plpor;
    String edit = "";
    int step = 0;

%>

<% Vector errMsg;
   String infoMsg;
   errMsg = new Vector();
   infoMsg = null;
   try
   {
         record = (UserInfo1)session.getAttribute("remoteRef");
if(record != null)
{
     factory=ServiceController.getInstance();
     nik_suami=(request.getParameter("nik_suami")==null?"":request.getParameter("nik_suami"));
     nik_istri=(request.getParameter("nik_istri")==null?"":request.getParameter("nik_istri"));
     nik_plpor=(request.getParameter("nik_plpor")==null?"":request.getParameter("nik_plpor"));
if (!"".equals(nik_suami) && !"".equals(nik_istri) && !"".equals(nik_plpor)) {
   try
   {
     v = new Vector();
      home = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);

      if(home != null)
      {
          remote2 = home.create();
          try {
             saksiData =(SaksiObject)remote2.getCeraiData(nik_suami,nik_istri,nik_plpor);
             step = 1;
          } catch (CapilException ex) {
             errMsg.add(ex.getMessage());
          }
      }

   }      catch(Exception e){e.printStackTrace();}
}

   Saksi1Object suamiWniData = null;
   Saksi1Object3 suamiWnaData = null;
   Saksi2Object istriWniData = null;
   Saksi2Object4 istriWnaData = null;
   PelaporData pelaporWniData = null;
   PelaporDataWna pelaporWnaData = null;



if (saksiData!=null) {
   if (saksiData.getSaksi1Record() != null) {
      suamiWniData = saksiData.getSaksi1Record();
   } else if(saksiData.getSaksi1Record3() == null) {
      suamiWnaData = saksiData.getSaksi1Record3();
   }

   if (saksiData.getSaksi2Record() != null) {
      istriWniData = saksiData.getSaksi2Record();
   } else if(saksiData.getSaksi2Record4() == null) {
      istriWnaData = saksiData.getSaksi2Record4();
   }

   if (saksiData.getPelaporWni() != null) {
      pelaporWniData = saksiData.getPelaporWni();
   } else if(saksiData.getPelaporWna() == null) {
      pelaporWnaData = saksiData.getPelaporWna();
   }
}
if (step>0) {
if (saksiData==null)
   errMsg.add("Data Perkawinan Tidak Ada!");
else {
   if (suamiWniData == null && suamiWnaData == null) {
      errMsg.add("NIK Suami yang anda isi salah !");
   } else if (istriWniData == null && istriWnaData == null) {
      errMsg.add("NIK Istri yang anda isi salah !");
   } else if (pelaporWniData==null && pelaporWnaData==null) {
      errMsg.add("Data Pelapor yang anda isi salah !");
   }
}

if (errMsg.isEmpty() &&
       ((suamiWniData!=null || suamiWnaData!=null) &&
       (istriWniData!=null || istriWnaData!=null) &&
       (pelaporWniData!=null || pelaporWnaData!=null))) {
        step = 2;
   }
}
//System.out.println("AWAL....................");
//System.out.println("nik_suami="+nik_suami);
//System.out.println("nik_istri="+nik_istri);
//System.out.println("nik_plpor="+nik_plpor);

//System.out.println("saksiData="+saksiData);
//System.out.println("suamiWniData="+suamiWniData);
//System.out.println("suamiWnaData="+suamiWnaData);
//System.out.println("istriWniData="+istriWniData);
//System.out.println("istriWnaData="+istriWnaData);
//System.out.println("pelaporWniData="+pelaporWniData);
//System.out.println("pelaporWnaData="+pelaporWnaData);

//System.out.println("errMsg="+errMsg);
//System.out.println("step="+step);
//System.out.println("AWAL....................");
%>
<script type="text/javascript" src="Templates/tabpane.js"></script>
<SCRIPT language=JavaScript src="scripts/util.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/Cerai.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/Perceraian.js">
</SCRIPT>

<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
</HEAD>
<link type="text/css" rel="StyleSheet" href="Templates/tab.webfx.css" />
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="form1" method="post" action="PerceraianInput.jsp">
<script language="text/javaScript">
var tp1;
</script>
<input type="hidden" name="buttondisabled" value="0">
<input type=hidden name="today" value="<%=record.getToday()%>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="topcapil.html"/></td>
    </tr> <tr>

    <td>
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20">
                  <div align="center"><span class="submenu">Pencatatan Perceraian</span><br>
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

                <% //System.out.println(175);
                   if (infoMsg!=null) { %>
                      <tr><td><%=printInfo(infoMsg)%></td></tr>
                <%
                   } else {
                     for(int i=0; i<errMsg.size(); i++) {
                        String message = (String) errMsg.elementAt(i);
                %>
                <tr><td><%=printError(message, "left")%></td></tr>
                <%   }
                   }
if(errMsg.isEmpty()) errMsg = null;
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
                          <div align="center">

 <div class="tab-pane" id="tab-pane-1" style="postion:absolute">
<script type="text/javascript">
tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);
</script>
                    <%
//System.out.println(270);
int wn_suami= ("".equals(nik_suami)?0:(nik_suami.substring(0,1).equals("A")?2:1));
//if(kawinData!=null && kawinData.getRecordBayi() == null)
if (suamiWniData==null && suamiWnaData==null) {
edit="disabled";
//System.out.println("edit="+edit);
}
String no_KK_suami = "-";
String nama_suami = "-";
int pddk_akh_suami = 0;
String alamat_suami = "-";
String rt_suami = "-";
String rw_suami = "-";
String dusun_suami = "-";
String kodepos_suami = "-";
String telp_suami = "-";
String agama_suami = "-";
int jenis_pkrjn_suami = 0;
int ktrunan_suami = 0;
int stat_kwn_sblm_nkh_suami = 0;
String crai_ke_suami = ((request.getParameter("crai_ke_suami")==null)?"":request.getParameter("crai_ke_suami"));
String kwn_ke_suami = ((request.getParameter("kwn_ke_suami")==null)?"":request.getParameter("kwn_ke_suami"));
String istri_ke = ((request.getParameter("istri_ke")==null)?"":request.getParameter("istri_ke"));
String bangsa_suami = "-";
//System.out.println(299);
//if (kawinData!=null && kawinData.getRecordBayi()!=null) {
if (step>0 && suamiWniData!=null) {
   //System.out.println(311);
   no_KK_suami = (suamiWniData.getNoKk()==null?"-":suamiWniData.getNoKk().toString());
   nama_suami = (suamiWniData.getNamaLgkp()==null?"-":suamiWniData.getNamaLgkp().toUpperCase());
   pddk_akh_suami = (suamiWniData.getPddkh()==null?0:suamiWniData.getPddkh().intValue());
   alamat_suami = (suamiWniData.getAlamat()==null?"-":suamiWniData.getAlamat());
   rt_suami = (suamiWniData.getNoRt()==null?"-":suamiWniData.getNoRt().toString());
   rw_suami = (suamiWniData.getNoRw()==null?"-":suamiWniData.getNoRw().toString());
   dusun_suami = (suamiWniData.getDusun()==null?"-":suamiWniData.getDusun());
   kodepos_suami = (suamiWniData.getKodePos()==null?"-":suamiWniData.getKodePos().toString());
   telp_suami = (suamiWniData.getTelp()==null?"-":suamiWniData.getTelp());
   agama_suami = (suamiWniData.getAgama()==null?"-":suamiWniData.getAgama());
   jenis_pkrjn_suami = (suamiWniData.getJenisPkrjn()==null?0:suamiWniData.getJenisPkrjn().intValue());
   stat_kwn_sblm_nkh_suami = (suamiWniData.getStatKwn()==null?0:suamiWniData.getStatKwn().intValue());
   //bangsa_suami = "-";
} else if (step>0 && suamiWnaData!=null) {
   //System.out.println(407);
   no_KK_suami = (suamiWnaData.getNoKk()==null?"-":suamiWnaData.getNoKk().toString());
   nama_suami = (suamiWnaData.getNamaLgkp()==null?"-":suamiWnaData.getNamaLgkp().toUpperCase());
   pddk_akh_suami = (suamiWnaData.getPddkh()==null?0:suamiWnaData.getPddkh().intValue());
   alamat_suami = (suamiWnaData.getAlamat()==null?"-":suamiWnaData.getAlamat());
   rt_suami = (suamiWnaData.getNoRt()==null?"-":suamiWnaData.getNoRt().toString());
   rw_suami = (suamiWnaData.getNoRw()==null?"-":suamiWnaData.getNoRw().toString());
   dusun_suami = (suamiWnaData.getDusun()==null?"-":suamiWnaData.getDusun());
   kodepos_suami = (suamiWnaData.getKodePos()==null?"-":suamiWnaData.getKodePos().toString());
   telp_suami = (suamiWnaData.getTelp()==null?"-":suamiWnaData.getTelp());
   agama_suami = (suamiWnaData.getAgama()==null?"-":suamiWnaData.getAgama());
   jenis_pkrjn_suami = (suamiWnaData.getJenisPkrjn()==null?0:suamiWnaData.getJenisPkrjn().intValue());
   stat_kwn_sblm_nkh_suami = (suamiWnaData.getStatKwn()==null?0:suamiWnaData.getStatKwn().intValue());
   bangsa_suami = (suamiWnaData.getKwrngr()==null?"-":suamiWnaData.getKwrngr().toUpperCase());
}
//System.out.println(313);
pddk_akh_suami = (request.getParameter("pddk_akh_suami")==null || Integer.parseInt(request.getParameter("pddk_akh_suami"))==0?pddk_akh_suami:Integer.parseInt(request.getParameter("pddk_akh_suami")));
jenis_pkrjn_suami = (request.getParameter("jenis_pkrjn_suami")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_suami"))==0?jenis_pkrjn_suami:Integer.parseInt(request.getParameter("jenis_pkrjn_suami")));
ktrunan_suami = (request.getParameter("ktrunan_suami")==null || Integer.parseInt(request.getParameter("ktrunan_suami"))==0?ktrunan_suami:Integer.parseInt(request.getParameter("ktrunan_suami")));
stat_kwn_sblm_nkh_suami = (request.getParameter("stat_kwn_sblm_nkh_suami")==null || Integer.parseInt(request.getParameter("stat_kwn_sblm_nkh_suami"))==0?stat_kwn_sblm_nkh_suami:Integer.parseInt(request.getParameter("stat_kwn_sblm_nkh_suami")));
%>
                    <div class="tab-page" style="postion:absolute"  id="tabPage1">
    <h2 class="tab">Data Suami</h2>
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
                                  <p style="line-height: 100%">NIK Suami<font color="#000099" class="asterish">*</font>
                                  </p>
                                </td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nik_suami" value="<%=nik_suami%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_suami)" onBlur="validateWNSuami(form1.nik_suami);setupPekerjaan(form1.jenis_pkrjn_suami, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1));setupPendidikanAkhir(form1.pddk_akh_suami, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
                                  </p>
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"><%=no_KK_suami%></p>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Nama Lengkap</td>
                                <td width="1%">:</td>
                                <td width="23%"><%=nama_suami%>
                                  <input type="hidden" name="nama_suami" value="<%=nama_suami%>">
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <select
                  name="pddk_akh_suami" boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Pendidikan
                                    Terakhir --</option>
                                    <option value="1">1 - Tidak/Belum Sekolah</option>
                                    <option value="2">2 - Tidak Tamat SD/Sederajat</option>
                                    <option value="3">3 - Tamat SD/Sederajat</option>
                                    <option value="4">4 - SLTP/Sederajat</option>
                                    <option value="5">5 - SLTA/Sederajat</option>
                                    <option value="6">6 - Diploma I/II</option>
                                    <option value="7">7 - Akademi/Diploma III/S.
                                    Muda</option>
                                    <option value="8">8 - Diploma IV/Strata I</option>
                                    <option value="9">9 - Strata II</option>
                                    <option value="10">10 - Strata III</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%" valign="top">Alamat</td>
                                <td width="1%" valign="top">:</td>
                                <td colspan="5"> <%=alamat_suami%><br>
                                  RT <%=rt_suami%> RW <%=rw_suami%> Dusun <%=dusun_suami%>
                                  Kodepos <%=kodepos_suami%> Telp <%=telp_suami%>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="23%"> <%=agama_suami%> </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <select
                  name="jenis_pkrjn_suami" boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Pelajar/Mahasiswa</option>
                                    <option value="2">2 - Mengurus Rumah Tangga</option>
                                    <option value="3">3 - Pensiunan</option>
                                    <option value="4">4 - Belum/Tidak Bekerja</option>
                                    <option value="5">5 - Petani/Pekebun</option>
                                    <option value="6">6 - Peternak</option>
                                    <option value="7">7 - Nelayan/Perikanan</option>
                                    <option value="8">8 - Industri</option>
                                    <option value="9">9 - Konstruksi</option>
                                    <option value="10">10 - Perdagangan</option>


                                    <option value="11">11 - Transportasi</option>
                                    <option value="12">12 - Pegawai Negeri Sipil</option>
                                    <option value="13">13 - Tentara Nasional Indonesia</option>
                                    <option value="14">14 - Kepolisian R.I.</option>
                                    <option value="15">15 - Jasa Lainnya</option>
                                    <option value="16">16 - Lainnya</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Keturunan</td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <select
                  name="ktrunan_suami"  class="boxdefault">
                                    <option value="0" selected>-- Pilih Keturunan
                                    --</option>
                                    <option value="1">1 - Eropa</option>
                                    <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                    <option value="3">3 - Pribumi Nasrani</option>
                                    <option value="4">4 - Pribumi Non Nasrani</option>
                                  </select>
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Status Perkawinan Sebelum Nikah</td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <select
                  name="stat_kwn_sblm_nkh_suami" class="boxdefault" >
                                    <option value="0" selected>-- Pilih Status
                                    Perkawinan --</option>
                                    <option value="1">1 - Belum Kawin</option>
                                    <option value="2">2 - Kawin</option>
                                    <option value="3">3 - Cerai Hidup</option>
                                    <option value="4">4 - Cerai Mati</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Perceraian Yang Ke<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <input type="text" name="crai_ke_suami" value="<%=crai_ke_suami%>" size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.crai_ke_suami)">
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <input type="text" name="kwn_ke_suami" value="<%=kwn_ke_suami%>" size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_suami)">
                                </td>
                              </tr>
							  <tr>
                                <td width="22%">Istri Yang Ke (bagi poligami)</td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <input type="text" name="istri_ke" value="<%=istri_ke%>" size="2" maxlength="2" class="boxdefault"  onKeyUp="return num(form1.istri_ke)">
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Kewarganegaraan</td>
                                <td width="1%">:</td>
                                <td width="26%"> <%=(wn_suami==0?"-":(wn_suami==1?"WNI":"WNA"))%>
                                <input type="hidden" name="wn_suami" value="<%=wn_suami%>">
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Kebangsaan (Bagi WNA)</td>
                                <td width="1%">:</td>
                                <td width="23%"><%=bangsa_suami%></td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">&nbsp;</td>
                                <td width="1%">&nbsp;</td>
                                <td width="26%">&nbsp;</td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                  </div>

                    <%
//System.out.println(270);
int wn_istri= ("".equals(nik_istri)?0:(nik_istri.substring(0,1).equals("A")?2:1));
//if(kawinData!=null && kawinData.getRecordBayi() == null)
if (istriWniData==null && istriWnaData==null) {
edit="disabled";
//System.out.println("edit="+edit);
}
String no_KK_istri = "-";
String nama_istri = "-";
int pddk_akh_istri = 0;
String alamat_istri = "-";
String rt_istri = "-";
String rw_istri = "-";
String dusun_istri = "-";
String kodepos_istri = "-";
String telp_istri = "-";
String agama_istri = "-";
int jenis_pkrjn_istri = 0;
int ktrunan_istri = 0;
int stat_kwn_sblm_nkh_istri = 0;
String kwn_ke_istri = ((request.getParameter("kwn_ke_istri")==null)?"":request.getParameter("kwn_ke_istri"));
String jml_ank = ((request.getParameter("jml_ank")==null)?"":request.getParameter("jml_ank"));
int yg_btgung_pmel_ank = ((request.getParameter("jml_ank")==null || "".equals(request.getParameter("jml_ank")))?0:Integer.parseInt(request.getParameter("jml_ank")));
String bangsa_istri = "-";
//System.out.println(299);
//if (kawinData!=null && kawinData.getRecordBayi()!=null) {
if (step>0 && istriWniData!=null) {
   //System.out.println(311);
   no_KK_istri = (istriWniData.getNoKk()==null?"-":istriWniData.getNoKk().toString());
   nama_istri = (istriWniData.getNamaLgkp()==null?"-":istriWniData.getNamaLgkp().toUpperCase());
   pddk_akh_istri = (istriWniData.getPddkh()==null?0:istriWniData.getPddkh().intValue());
   alamat_istri = (istriWniData.getAlamat()==null?"-":istriWniData.getAlamat());
   rt_istri = (istriWniData.getNoRt()==null?"-":istriWniData.getNoRt().toString());
   rw_istri = (istriWniData.getNoRw()==null?"-":istriWniData.getNoRw().toString());
   dusun_istri = (istriWniData.getDusun()==null?"-":istriWniData.getDusun());
   kodepos_istri = (istriWniData.getKodePos()==null?"-":istriWniData.getKodePos().toString());
   telp_istri = (istriWniData.getTelp()==null?"-":istriWniData.getTelp());
   agama_istri = (istriWniData.getAgama()==null?"-":istriWniData.getAgama());
   jenis_pkrjn_istri = (istriWniData.getJenisPkrjn()==null?0:istriWniData.getJenisPkrjn().intValue());
   stat_kwn_sblm_nkh_istri = (istriWniData.getStatKwn()==null?0:istriWniData.getStatKwn().intValue());
   //bangsa_istri = "-";
} else if (step>0 && istriWnaData!=null) {
   //System.out.println(407);
   no_KK_istri = (istriWnaData.getNoKk()==null?"-":istriWnaData.getNoKk().toString());
   nama_istri = (istriWnaData.getNamaLgkp()==null?"-":istriWnaData.getNamaLgkp().toUpperCase());
   pddk_akh_istri = (istriWnaData.getPddkh()==null?0:istriWnaData.getPddkh().intValue());
   alamat_istri = (istriWnaData.getAlamat()==null?"-":istriWnaData.getAlamat());
   rt_istri = (istriWnaData.getNoRt()==null?"-":istriWnaData.getNoRt().toString());
   rw_istri = (istriWnaData.getNoRw()==null?"-":istriWnaData.getNoRw().toString());
   dusun_istri = (istriWnaData.getDusun()==null?"-":istriWnaData.getDusun());
   kodepos_istri = (istriWnaData.getKodePos()==null?"-":istriWnaData.getKodePos().toString());
   telp_istri = (istriWnaData.getTelp()==null?"-":istriWnaData.getTelp());
   agama_istri = (istriWnaData.getAgama()==null?"-":istriWnaData.getAgama());
   jenis_pkrjn_istri = (istriWnaData.getJenisPkrjn()==null?0:istriWnaData.getJenisPkrjn().intValue());
   stat_kwn_sblm_nkh_istri = (istriWnaData.getStatKwn()==null?0:istriWnaData.getStatKwn().intValue());
   bangsa_istri = (istriWnaData.getKwrngr()==null?"-":istriWnaData.getKwrngr().toUpperCase());
}
//System.out.println(313);

pddk_akh_istri = (request.getParameter("pddk_akh_istri")==null || Integer.parseInt(request.getParameter("pddk_akh_istri"))==0?pddk_akh_istri:Integer.parseInt(request.getParameter("pddk_akh_istri")));
jenis_pkrjn_istri = (request.getParameter("jenis_pkrjn_istri")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_istri"))==0?jenis_pkrjn_istri:Integer.parseInt(request.getParameter("jenis_pkrjn_istri")));
ktrunan_istri = (request.getParameter("ktrunan_istri")==null || Integer.parseInt(request.getParameter("ktrunan_istri"))==0?ktrunan_istri:Integer.parseInt(request.getParameter("ktrunan_istri")));
stat_kwn_sblm_nkh_istri = (request.getParameter("stat_kwn_sblm_nkh_istri")==null || Integer.parseInt(request.getParameter("stat_kwn_sblm_nkh_istri"))==0?stat_kwn_sblm_nkh_istri:Integer.parseInt(request.getParameter("stat_kwn_sblm_nkh_istri")));
%>
                    <div class="tab-page" style="postion:absolute" id="tabPage2">
    <h2 class="tab">Data Istri</h2>
                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage2"));
                </script>
                      <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                        <tr>
                          <td>
                            <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                              <tr>
                                <td colspan="7">&nbsp;</td>
                              </tr>
                              <tr>
                                <td width="22%">
                                  <p style="line-height: 100%">NIK Istri<font color="#000099" class="asterish">*</font>
                                  </p>
                                </td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nik_istri" value="<%=nik_istri%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_istri)" onBlur="validateWNIstri(form1.nik_istri);setupPekerjaan(form1.jenis_pkrjn_istri, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1));setupPendidikanAkhir(form1.pddk_akh_istri, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
                                  </p>
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"><%=no_KK_istri%></p>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Nama Lengkap</td>
                                <td width="1%">:</td>
                                <td width="23%"><%=nama_istri%>
                                  <input type="hidden" name="nama_istri" value="<%=nama_istri%>">
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <select
                  name="pddk_akh_istri" class="boxdefault">
                                    <option value="0" selected>-- Pilih Pendidikan
                                    Terakhir --</option>
                                    <option value="1">1 - Tidak/Belum Sekolah</option>
                                    <option value="2">2 - Tidak Tamat SD/Sederajat</option>
                                    <option value="3">3 - Tamat SD/Sederajat</option>
                                    <option value="4">4 - SLTP/Sederajat</option>
                                    <option value="5">5 - SLTA/Sederajat</option>
                                    <option value="6">6 - Diploma I/II</option>
                                    <option value="7">7 - Akademi/Diploma III/S.
                                    Muda</option>
                                    <option value="8">8 - Diploma IV/Strata I</option>
                                    <option value="9">9 - Strata II</option>
                                    <option value="10">10 - Strata III</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%" valign="top">Alamat</td>
                                <td width="1%" valign="top">:</td>
                                <td colspan="5"><%=alamat_istri%><br>
                                  RT <%=rt_istri%> RW <%=rw_istri%> Dusun <%=dusun_istri%>
                                  Kodepos <%=kodepos_istri%> Telp <%=telp_istri%>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="23%"> <%=agama_istri%> </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <select
                  name="jenis_pkrjn_istri" class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Pelajar/Mahasiswa</option>
                                    <option value="2">2 - Mengurus Rumah Tangga</option>
                                    <option value="3">3 - Pensiunan</option>
                                    <option value="4">4 - Belum/Tidak Bekerja</option>
                                    <option value="5">5 - Petani/Pekebun</option>
                                    <option value="6">6 - Peternak</option>
                                    <option value="7">7 - Nelayan/Perikanan</option>
                                    <option value="8">8 - Industri</option>
                                    <option value="9">9 - Konstruksi</option>
                                    <option value="10">10 - Perdagangan</option>
                                    <option value="11">11 - Transportasi</option>
                                    <option value="12">12 - Pegawai Negeri Sipil</option>
                                    <option value="13">13 - Tentara Nasional Indonesia</option>
                                    <option value="14">14 - Kepolisian R.I.</option>
                                    <option value="15">15 - Jasa Lainnya</option>
                                    <option value="16">16 - Lainnya</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Keturunan</td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <select size="1" name="ktrunan_istri" class="boxdefault">
                                    <option value="0" selected>-- Pilih Keturunan
                                    --</option>
                                    <option value="1">1 - Eropa</option>
                                    <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                    <option value="3">3 - Pribumi Nasrani</option>
                                    <option value="4">4 - Pribumi Non Nasrani</option>
                                    <option value="5">5 - Lainnya</option>
                                  </select>
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Status Perkawinan Sebelum Nikah</td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <select
                  name="stat_kwn_sblm_nkh_istri" class="boxdefault" >
                                    <option value="0" selected>-- Pilih Status
                                    Perkawinan --</option>
                                    <option value="1">1 - Belum Kawin</option>
                                    <option value="2">2 - Kawin</option>
                                    <option value="3">3 - Cerai Hidup</option>
                                    <option value="4">4 - Cerai Mati</option>
                                  </select>
                                </td>
                              </tr>
							  <tr>
                                <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <input type="text" name="kwn_ke_istri" value="<%=kwn_ke_istri%>" size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_istri)">
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Jumlah Anak<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <input type="text" name="jml_ank" value="<%=jml_ank%>" size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.jml_ank)" onBlur="tanggungAnak(this.value)">
                                </td>
                              </tr>
                              <tr>
                                <td width="22%">Yang Bertanggung Jawab Dalam Pemeliharaan
                                  Anak<font color="#000099" class="asterish">*</font></td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <select size="1" name="yg_btgung_pmel_ank" class="boxdefault" <%if (jml_ank==null || "".equals(jml_ank) || Integer.parseInt(jml_ank)<0) {%> disabled<%}%> >
                                    <option value="0" selected>-- Pilih Yang Memelihara
                                    Anak --</option>
                                    <option value="1">1 - Suami</option>
                                    <option value="2">2 - Istri</option>
                                    <option value="3">3 - Kesepakatan Suami/Istri</option>
                                  </select>
                                </td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">Kewarganegaraan</td>
                                <td width="1%">:</td>
                                <td width="26%"><%=(wn_istri==0?"-":(wn_istri==1?"WNI":"WNA"))%></td>
                                <input type="hidden" name="wn_istri" value="<%=wn_istri%>">
                              </tr>
                              <tr>
                                <td width="22%">Kebangsaan (Bagi WNA)</td>
                                <td width="1%">:</td>
                                <td width="23%"><%=bangsa_istri%></td>
                                <td width="3%">&nbsp;</td>
                                <td width="24%">&nbsp;</td>
                                <td width="1%">&nbsp;</td>
                                <td width="26%">&nbsp;</td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                      <%

//System.out.println(1762);
int wn_pelapor = ("".equals(nik_plpor)?0:(nik_plpor.substring(0,1).equals("A")?2:1));
//System.out.println(1763);
if(pelaporWniData==null && pelaporWnaData==null)
{
edit="disabled";
//System.out.println("pelpaor edit="+edit);
}
//System.out.println(1396);
String nama_pelapor = "-";
String tgl_lahir_pelapor = "-";
String alamat_pelapor = "-";
String rt_pelapor = "-";
String rw_pelapor = "-";
String dusun_pelapor = "-";
String kodepos_pelapor = "-";
String telp_pelapor = "-";
int jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")==null?0:Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")));
//System.out.println(1409);
if (step>0 && pelaporWniData!=null) {
  //System.out.println(1412);
   nama_pelapor = (pelaporWniData.getNamaLgkp()==null?"-":pelaporWniData.getNamaLgkp().toUpperCase());
   tgl_lahir_pelapor = (pelaporWniData.getTglLhr()==null?"-":pelaporWniData.getTglLhr());
 alamat_pelapor = ((pelaporWniData.getAlamat()==null)?"-":pelaporWniData.getAlamat());
 rt_pelapor = ((pelaporWniData.getNoRt()==null)?"-":pelaporWniData.getNoRt().toString());
 rw_pelapor = ((pelaporWniData.getNoRw()==null)?"-":pelaporWniData.getNoRw().toString());
 dusun_pelapor = ((pelaporWniData.getDusun()==null)?"-":pelaporWniData.getDusun());
 kodepos_pelapor = ((pelaporWniData.getKodePos()==null)?"-":pelaporWniData.getKodePos().toString());
 telp_pelapor = ((pelaporWniData.getTelp()==null)?"-":pelaporWniData.getTelp());
jenis_pkrjn_plpor = ((pelaporWniData.getJenisPkrjn()==null)?0:Integer.parseInt(pelaporWniData.getJenisPkrjn()));
//System.out.println("pelaporWniData.getJenisPkrjn()="+pelaporWniData.getJenisPkrjn());
} else if (step>0 && pelaporWnaData!=null) {
  //System.out.println(1412);
   nama_pelapor = (pelaporWnaData.getNamaPertma()==null?"-":pelaporWnaData.getNamaPertma().toUpperCase());
   tgl_lahir_pelapor = (pelaporWnaData.getTglLhr()==null?"-":pelaporWnaData.getTglLhr());
 alamat_pelapor = ((pelaporWnaData.getAlamat()==null)?"-":pelaporWnaData.getAlamat());
 rt_pelapor = ((pelaporWnaData.getNoRt()==null)?"-":pelaporWnaData.getNoRt().toString());
 rw_pelapor = ((pelaporWnaData.getNoRw()==null)?"-":pelaporWnaData.getNoRw().toString());
 dusun_pelapor = ((pelaporWnaData.getDusun()==null)?"-":pelaporWnaData.getDusun());
 kodepos_pelapor = ((pelaporWnaData.getKodePos()==null)?"-":pelaporWnaData.getKodePos().toString());
 telp_pelapor = ((pelaporWnaData.getTelp()==null)?"-":pelaporWnaData.getTelp());
jenis_pkrjn_plpor = ((pelaporWnaData.getJenisPkrjn()==null)?0:Integer.parseInt(pelaporWnaData.getJenisPkrjn()));
//System.out.println("pelaporWnaData.getJenisPkrjn()="+pelaporWnaData.getJenisPkrjn());
}
jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")!=null && Integer.parseInt(request.getParameter("jenis_pkrjn_plpor"))!=0 ?Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")):jenis_pkrjn_plpor);
//System.out.println(1211);
%>
                    </div>

  <div class="tab-page" style="postion:absolute"  id="tabPage3">
                    <h2 class="tab">Data Pelapor</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage3"));
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
                                    <input type="text" name="nik_plpor" size="17" class="boxdefault" maxlength="17" value="<%=nik_plpor%>"   onKeyUp="return num1(form1.nik_plpor)" onBlur="setupPekerjaan(form1.jenis_pkrjn_plpor, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
                                    </p>
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
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"><%=tgl_lahir_pelapor%></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                               <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <select
                     name="jenis_pkrjn_plpor" boxdefault2 class="boxdefault">
                                      <option value="0" selected>-- Pilih Jenis
                                      Pekerjaan --</option>
                                    </select>
                                    <input type="hidden" name="wn_pelapor" value="<%=wn_pelapor%>">
                                  </p>
                                  </td>
                            </tr>

                            <tr>
                              <td width="21%">Alamat</td>
                              <td width="1%">:</td>
                                <td colspan="5"> <%=alamat_pelapor%><br>
                                  RT <%=rt_pelapor%> RW <%=rw_pelapor%> Dusun
                                  <%=dusun_pelapor%> Kodepos <%=kodepos_pelapor%>
                                  Telp <%=telp_pelapor%> </td>
</tr>
                            <tr>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<%
if (errMsg==null && step>1) {
%>
<div class="tab-page"  style="postion:absolute"  id="tabPage4">
        <h2 class="tab">Data Perceraian</h2>

          <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>
          <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td width="182">Yang Mengajukan Perceraian<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <select size="1" name="yg_aju_crai" class="boxdefault" >
                                  <option value="0" selected>-- Pilih Yang Mengajukan
                                  Cerai --</option>
                                  <option value="1">1. Suami</option>
                                  <option value="2">2. Istri</option>
                                </select>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Nomor Akta Perkawinan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
<td width="200">
   <%
if (saksiData.getNo_akta_kwn()!=null)
{
 %>
<input type="text" class="boxdefault" name="no_akta_kwn"  value="<%=((saksiData.getNo_akta_kwn()==null)?"":saksiData.getNo_akta_kwn())%>">
<%}
else
{
%>
<input type="text" class="boxdefault" name="no_akta_kwn"  >
  <%
  }
 %>
  </td>
 </tr>
 <tr>
                              <td width="182">Tanggal Akta Perkawinan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                   <td>
<%
String tglAktaKawin = saksiData.getTgl_akta_kwn();
%>
<%=((tglAktaKawin==null)?"":tglAktaKawin)%>
<table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
<input  class=boxdefault size=2 name=tgl_akta_kwn_dd maxlength="2"  onKeyUp="return tab7(form1.tgl_akta_kwn_dd,form1.tgl_akta_kwn_mm)" >
                                    </td>
                                    <td>/ </td>
                                    <td>
<input  class=boxdefault size=2 name=tgl_akta_kwn_mm  maxlength="2"   onKeyUp="return tab8(form1.tgl_akta_kwn_mm,form1.tgl_akta_kwn_yy)">
                                    </td>
                                    <td>/</td>
                                    <td>
<input class=boxdefault size=4 name=tgl_akta_kwn_yy maxlength="4"  onKeyUp="return tab9(form1.tgl_akta_kwn_dd,form1.tgl_akta_kwn_mm,form1.tgl_akta_kwn_yy,form1.tmpt_ctt_kwn)">
                                    </td>
                                  </tr>
</table>
<input type="hidden" name="tgl_akta_kwn">
 </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Tempat Pencatatan Perkawinan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                  <input type="text" name="tmpt_ctt_kwn" size="20" maxlength="60" class="boxdefault" value="<%=(request.getParameter("tmpt_ctt_kwn")==null?"":request.getParameter("tmpt_ctt_kwn"))%>" >
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Nomor Surat Keterangan Panitera
                                Pengadilan Negeri<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                  <input type="text" name="no_srt_ket_pn" size="20" maxlength="40" class="boxdefault" value="<%=(request.getParameter("no_srt_ket_pn")==null?"":request.getParameter("no_srt_ket_pn"))%>" >
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Tanggal, Bulan, Tahun, Surat Keterangan
                                Panitera Pengadilan Negeri<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                        <input  class=boxdefault size=2 name=tgl_srt_ket_pn_dd maxlength="2"  onKeyUp="return tab7(form1.tgl_srt_ket_pn_dd,form1.tgl_srt_ket_pn_mm)" value="<%=(request.getParameter("tgl_srt_ket_pn_dd")==null?"":request.getParameter("tgl_srt_ket_pn_dd"))%>">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                        <input  class=boxdefault size=2 name=tgl_srt_ket_pn_mm  maxlength="2"   onKeyUp="return tab8(form1.tgl_srt_ket_pn_mm,form1.tgl_srt_ket_pn_yy)" value="<%=(request.getParameter("tgl_srt_ket_pn_mm")==null?"":request.getParameter("tgl_srt_ket_pn_mm"))%>">
                                    </td>
                                    <td>/</td>
                                    <td>
                                        <input class=boxdefault size=4 name=tgl_srt_ket_pn_yy maxlength="4"  onKeyUp="return tab9(form1.tgl_srt_ket_pn_dd,form1.tgl_srt_ket_pn_mm,form1.tgl_srt_ket_pn_yy,form1.no_kep_pngadil)" value="<%=(request.getParameter("tgl_srt_ket_pn_yy")==null?"":request.getParameter("tgl_srt_ket_pn_yy"))%>">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Nomor Keputusan Pengadilan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                  <input type="text" name="no_kep_pngadil" size="20" class="boxdefault" maxlength="40" value="<%=(request.getParameter("no_kep_pngadil")==null?"":request.getParameter("no_kep_pngadil"))%>" >
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Tanggal Surat Keputusan Pengadilan<font color="#000099" class="asterish">*</font>
                              </td>
                              <td width="9">:</td>
                              <td width="200">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                        <input
                                class=boxdefault size=2 name=tgl_srt_kep_pngadil_dd maxlength="2"   onKeyUp="return tab7(form1.tgl_srt_kep_pngadil_dd,form1.tgl_srt_kep_pngadil_mm)" value="<%=(request.getParameter("tgl_srt_kep_pngadil_dd")==null?"":request.getParameter("tgl_srt_kep_pngadil_dd"))%>">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                        <input
                                class=boxdefault size=2 name=tgl_srt_kep_pngadil_mm maxlength="2"   onKeyUp="return tab8(form1.tgl_srt_kep_pngadil_mm,form1.tgl_srt_kep_pngadil_yy)" value="<%=(request.getParameter("tgl_srt_kep_pngadil_mm")==null?"":request.getParameter("tgl_srt_kep_pngadil_mm"))%>">
                                    </td>
                                    <td>/</td>
                                    <td>
                                        <input
                                class=boxdefault size=4 name=tgl_srt_kep_pngadil_yy maxlength="4"   onKeyUp="return tab9(form1.tgl_srt_kep_pngadil_dd,form1.tgl_srt_kep_pngadil_mm,form1.tgl_srt_kep_pngadil_yy,form1.lbg_pngadil_kel_kep)" value="<%=(request.getParameter("tgl_srt_kep_pngadil_yy")==null?"":request.getParameter("tgl_srt_kep_pngadil_yy"))%>">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Lembaga Pengadilan yang Mengeluarkan
                                Keputusan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <select size="1" name="lbg_pngadil_kel_kep" class="boxdefault" >
                                  <option value="0" selected>-- Pilih Lembaga
                                  Pengadilan --</option>
                                  <option value="1">1. Pengadilan Negeri</option>
                                  <option value="2">2. Pengadilan Tinggi</option>
                                  <option value="3">3. Mahkamah Agung</option>
                                </select>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Tempat Lembaga Pengadilan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                  <input type="text" name="tmpt_lbg_pngadil" size="20" maxlength="60" class="boxdefault" value="<%=(request.getParameter("tmpt_lbg_pngadil")==null?"":request.getParameter("tmpt_lbg_pngadil"))%>" >
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Sebab Perceraian<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <select size="1" name="sbab_crai" class="boxdefault" >
                                  <option value="0" selected>-- Pilih Sebab Perceraian
                                  --</option>
                                  <option value="1">1. Berbuat Zina</option>
                                  <option value="2">2. Pemabuk/Pemadat</option>
                                  <option value="3">3. Penjudi</option>
                                  <option value="4">4. Meninggalkan Pasangan &gt;
                                  2 thn</option>
                                  <option value="5">5. Hukuman Penjara &gt; 5
                                  thn atau &gt; Berat</option>
                                  <option value="6">6. Melakukan Kejahatan</option>
                                  <option value="7">7. Mendapat Cacat Badan/Penyakit</option>
                                  <option value="8">8. Perselisihan/pertengkaran
                                  Terus Menerus</option>
                                </select>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Hari, Tanggal, Bulan dan Tahun Melapor<font color="#000099" class="asterish">*</font>
                              </td>
                              <td width="9">:</td>
                              <td width="200">

                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                        <input
                                class=boxdefault size=2 name=dd_mlpor maxlength="2"    onKeyUp="return tab7(form1.dd_mlpor,form1.mm_mlpor)" value="<%=(request.getParameter("dd_mlpor")==null?"":request.getParameter("dd_mlpor"))%>">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                        <input
                                class=boxdefault size=2 name=mm_mlpor maxlength="2"   onKeyUp="return tab8(form1.mm_mlpor,form1.yy_mlpor)" value="<%=(request.getParameter("mm_mlpor")==null?"":request.getParameter("mm_mlpor"))%>">
                                    </td>
                                    <td>/</td>
                                    <td>
                                        <input
                                class=boxdefault size=4 name=yy_mlpor maxlength="4"   onKeyUp="return tab9(form1.dd_mlpor,form1.mm_mlpor,form1.yy_mlpor,form1.tgl_daft_crai_drln_dd)" value="<%=(request.getParameter("yy_mlpor")==null?"":request.getParameter("yy_mlpor"))%>">
                                    </td>

                                  </tr>
                                </table>

                              </td>
                            </tr>
                            <tr>
                              <td width="182">Tanggal Pendaftaran Perceraian dari
                                Luar Negeri</td>
                              <td width="9">:</td>
                              <td width="246">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                        <input    class=boxdefault size=2 name=tgl_daft_crai_drln_dd maxlength="2"  onKeyUp="return tab7(form1.tgl_daft_crai_drln_dd,form1.tgl_daft_crai_drln_mm)" value="<%=(request.getParameter("tgl_daft_crai_drln_dd")==null?"":request.getParameter("tgl_daft_crai_drln_dd"))%>">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                        <input      class=boxdefault size=2 name=tgl_daft_crai_drln_mm maxlength="2" onKeyUp="return tab8(form1.tgl_daft_crai_drln_mm,form1.tgl_daft_crai_drln_yy)" value="<%=(request.getParameter("tgl_daft_crai_drln_mm")==null?"":request.getParameter("tgl_daft_crai_drln_mm"))%>">
                                    </td>
                                    <td>/</td>
                                    <td>
                                        <input        class=boxdefault size=4 name=tgl_daft_crai_drln_yy maxlength="4" onKeyUp="return tab9(form1.tgl_daft_crai_drln_dd,form1.tgl_daft_crai_drln_mm,form1.tgl_daft_crai_drln_yy,null)" onblur="tp1.setSelectedIndex(4);dsrhk_cttcrai.focus()" value="<%=(request.getParameter("tgl_daft_crai_drln_yy")==null?"":request.getParameter("tgl_daft_crai_drln_yy"))%>">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">&nbsp;</td>
                              <td width="9">&nbsp;</td>
                              <td width="200">&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>


  <div class="tab-page"   id="tabPage5">
    <h2 class="tab">Data Administrasi</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td width="182">
                                <p style="line-height: 100%">Dasar Hukum Pencatatan
                                  Perceraian<font color="#000099" class="asterish">*</font></p>
                              </td>
                                <td width="4">:</td>
                                <td width="240">
                                  <p style="line-height: 100%">
                                  <select size="1" name="dsrhk_cttcrai" class="boxdefault" >
                                    <option value="0" selected>-- Pilih Dasar
                                    Hukum --</option>
                                    <option value="1">1 - UU No. 1 Tahun 1974</option>
                                    <option value="2">2 - Stbld 1849 No. 25</option>
                                    <option value="3">3 - Stbld 1917 No.130 jo
                                    1919 No.81</option>
                                    <option value="4">4 - Stbld 1933 No.75 jo
                                    1936 No.607</option>
                                    <option value="5">5 - Stbld 1920 No.751 jo
                                    1927 No.564</option>
                                    <option value="6">6 - Non Stbld</option>
									<option value="6">7 - UU No.23 Tahun 2006</option>
									<option value="7">8 - ----------</option>
                                  </select>
                                </p>
                              </td>
                                <td width="2">&nbsp;</td>
                                <td width="211">
                                  <p style="line-height: 100%">Nomor Akta Perceraian</p>
                              </td>
                                <td width="4">:</td>
                                <td width="205"> </td>
                            </tr>
                            <tr>
                              <td width="182">Tanggal Akta Perceraian<font color="#000099" class="asterish">*</font></td>
                                <td width="4">:</td>
                                <td width="240"> <%=record.getToday()%> </td>
                                <td width="2">&nbsp;</td>
                                <td width="211">Jabatan pada Dinas/Kantor</td>
                                <td width="4">:</td>
                                <td width="205"> <%=record.getKabJabatan()%></td>
                            </tr>
                            <tr>
                              <td width="182">Nama Pejabat</td>
                                <td width="4">:</td>
                                <td width="240"> <%=record.getKabNamaPej()%> </td>
                                <td width="2">&nbsp;</td>
                                <td width="211">NIP Pejabat</td>
                                <td width="4">:</td>
                                <td width="205"> <%=record.getKabNipPej()%> </td>
                            </tr>
                            <tr>
                              <td width="182">
                                <p style="line-height: 100%">Nama Petugas Pencatat/
                                  Registrar<font color="#000099" class="asterish">*</font></p>
                              </td>
                                <td width="4">:</td>
                                <td width="240">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nama_pet_reg" size="27" class="boxdefault" maxlength="60"  onKeyUp="return char(form1.nama_pet_reg)" value="<%=(request.getParameter("nama_pet_reg")==null?"":request.getParameter("nama_pet_reg"))%>">
                                </p>
                              </td>
                                <td align="center" width="2">&nbsp;</td>
                                <td width="211">
                                  <p style="line-height: 100%">NIP Petugas Pencatat/Registrar<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                                <td width="4">:</td>
                                <td width="205">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nip_pet_reg" size="9" class="boxdefault" maxlength="9" onKeyUp="return num(form1.nip_pet_reg)" value="<%=(request.getParameter("nip_pet_reg")==null?"":request.getParameter("nip_pet_reg"))%>" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                                <td align="center" width="182" nowrap>
                                  <p align="left" style="line-height: 100%"> Nama
                                    Petugas Entri Data
                                </td>
                                <td width="4">:</td>
                                <td align="center" width="240">
                                  <p align="left" style="line-height: 100%"><%=record.getNamaPetugas()%>
                                </td>
                                <td align="center" width="2">&nbsp;</td>
                                <td width="211">
                                  <p style="line-height: 100%">NIP Petugas Entri
                                    Data </p>
                              </td>
                                <td width="4">:</td>
                                <td width="205">
                                  <p style="line-height: 100%"><%=record.getNipPetugas()%>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                                <td align="center" width="182">
                                  <p align="left" style="line-height: 100%">Tanggal
                                    Entri Data
                                </td>
                                <td width="4">:</td>
                                <td align="center" width="240">
                                  <p align="left" style="line-height: 100%">
             <%=record.getToday()%>
                                </td>
                                <td width="2">&nbsp;</td>
                                <td width="211">
                                  <p style="line-height: 100%">&nbsp;</p>
                              </td>

                                <td width="4">
                                  <p style="line-height: 100%">&nbsp; </p>
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <% } %>
 </div>

<script type="text/javascript">
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
      <td width="130">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KONFIRMASI"  name="kon"  onClick="return suamiistri()">
          </b></div>
      </td>
      <td width="104">
        <div align="center"><b>
          <input class=boxstandard type="button" value="SIMPAN" name="sim"  onClick="return cerai()" <%if (saksiData==null) {%>disabled<%}%>>
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
</form>
<script language="JavaScript">
  form1.pddk_akh_suami.selectedIndex = <%=pddk_akh_suami%>
  form1.ktrunan_suami.selectedIndex = <%=ktrunan_suami%>
  form1.stat_kwn_sblm_nkh_suami.selectedIndex = <%=stat_kwn_sblm_nkh_suami%>
<%
  if (wn_suami>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_suami, "<%=wn_suami%>");
     form1.jenis_pkrjn_suami.selectedIndex = <%=jenis_pkrjn_suami%>
<%
  }
%>


  form1.pddk_akh_istri.selectedIndex = <%=pddk_akh_istri%>
  form1.ktrunan_istri.selectedIndex = <%=ktrunan_istri%>
  form1.stat_kwn_sblm_nkh_istri.selectedIndex = <%=stat_kwn_sblm_nkh_istri%>
  form1.yg_btgung_pmel_ank.selectedIndex = <%=yg_btgung_pmel_ank%>
<%
  if (wn_istri>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_istri, <%=wn_istri%>);
     form1.jenis_pkrjn_istri.selectedIndex = <%=jenis_pkrjn_istri%>
<%
  }
%>



  setupPekerjaan(form1.jenis_pkrjn_plpor, <%=wn_pelapor%>);
  form1.jenis_pkrjn_plpor.selectedIndex = <%=jenis_pkrjn_plpor%>

<% if (step>1) {
%>
  form1.yg_aju_crai.selectedIndex = <%=(request.getParameter("yg_aju_crai")==null?0:Integer.parseInt(request.getParameter("yg_aju_crai")))%>
  form1.lbg_pngadil_kel_kep.selectedIndex = <%=(request.getParameter("lbg_pngadil_kel_kep")==null?0:Integer.parseInt(request.getParameter("lbg_pngadil_kel_kep")))%>
  form1.sbab_crai.selectedIndex = <%=(request.getParameter("sbab_crai")==null?0:Integer.parseInt(request.getParameter("sbab_crai")))%>
  form1.dsrhk_cttcrai.selectedIndex = <%=(request.getParameter("dsrhk_cttcrai")==null?0:Integer.parseInt(request.getParameter("dsrhk_cttcrai")))%>
<%
}
%>

  setSaveEnabled(<%=(step>1 && "".equals(edit))%>)

</script>
</BODY></HTML>
<%
}
else
{
response.sendRedirect("index.jsp");
}
 }
 catch(Exception e)
{}
%>