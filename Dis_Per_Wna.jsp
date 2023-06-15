<%@ page import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%
String no_kk="",namakep="",niplrh="",namacmat="",nipcmat="",namabup="",namapetentri="",nippetentri="",tglentri="";
String nprop="",nkab="",nkec="",nkel="";
ServiceController factory=null,factory1=null;
Num_Wna_DataHome home=null;
Num_Wna_Data remote=null;
Vector v=null;
int i=0,j=0,w=0,x=0,y=0,z=0;
int ii=0,jj=0,kk=0;

 String nama_kec="",no_kec="",nama_kel="",no_kel="";
 Individu_SudapunyaWna record=null,record1=null;

 UserInfo1 record2=null;

String status="NL";  //NL-Normal Entry,AL-Asal,TJ-Tujuan

try
   {
    record2=(UserInfo1)session.getAttribute("remoteRef");
if(record2 != null)
    {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK Online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/pindah.js">
</SCRIPT>
<SCRIPT language="JavaScript" src="Templates/wil.js">
</script>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<%
 no_kk=request.getParameter("no_kk");

if (request.getParameter("status")!=null)
     {
       status=request.getParameter("status").trim().toUpperCase();
     }

    namapetentri=record2.getNamaPetugas();
    nippetentri=record2.getNipPetugas();
    tglentri=record2.getToday();
    nprop=record2.getNoProp();
    nkab=record2.getNoKab();
    String source="";

 if (request.getParameter("source")!=null)   source=request.getParameter("source").trim();

  System.out.println("SOURCE=" + source);

  nkec=request.getParameter("no_kec");
  nkel=request.getParameter("no_kel");
  nama_kel=request.getParameter("namakel");

if (request.getParameter("start")!=null)
{
  session.setAttribute("no_kel",request.getParameter("no_kel").toString());
  session.setAttribute("nama_kel",request.getParameter("namakel").toString());
}

    factory=ServiceController.getInstance();
    home = (Num_Wna_DataHome) factory.lookup("Num_Wna_Data",Num_Wna_DataHome.class);
    remote = home.create();
    v = remote.numpangKeluarga_new(no_kk,nprop,nkab,nkec,nkel,source);

    j=v.size();

 if(v.isEmpty())
  {
   response.sendRedirect("Perpindahan_Wna.jsp?error=1&no_kk=" + no_kk +"&source=" + source);
   }
  else
  {
   record1=(Individu_SudapunyaWna)v.elementAt(0);
%>
<form name="pindah" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">
        <input type="hidden" name="source" value="<%=source%>">
        <input type="hidden" name="status" value="AL">
		<jsp:include page="top.html"/>
      </td>
  </tr>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
 <td height="45">
<div align="center">
<span class="subtitle">
Keterangan Perpindahan <%=source%> <%if (source.equals("WNA")){%>&nbsp;KITAP<%}%>
</span>
<br>
</div>
</td>
</tr>
</table>
</td>
  </tr>
     <tr>
<td>

<% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record2.getNoProp() + "&nama_prop=" + record2.getNamaProp() +
      "&no_kab=" + record2.getNoKab() + "&nama_kab=" + record2.getNamaKab() + "&no_kec=" + (request.getParameter("no_kec")==null?"":request.getParameter("no_kec")) + "&nama_kec=" + (request.getParameter("nama_kec")==null?"":request.getParameter("nama_kec")) +
      "&no_kel=" + nkel+ "&nama_kel="+ session.getAttribute("nama_kel").toString().toUpperCase();
%>

<%
/*String jsp = "";
   if (source.equals("WNI")) {
     jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record2.getNoProp() + "&nama_prop=" + record2.getNamaProp() +
      "&no_kab=" + record2.getNoKab() + "&nama_kab=" + record2.getNamaKab() + "&no_kec=" + record2.getNoKec() + "&nama_kec=" + record2.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&nama_kel="+ (request.getParameter("namakel")==null?"":request.getParameter("namakel"));
   } else if (source.equals("WNA")) {
     jsp = "data_wilayah.jsp?level=2&no_prop=" + record2.getNoProp() + "&nama_prop=" + record2.getNamaProp() +
      "&no_kab=" + record2.getNoKab() + "&nama_kab=" + record2.getNamaKab();
   }
*/
%>
 <jsp:include page="<%=jsp%>"/>
</td>
              </tr>
              <tr>
                <td valign="top">&nbsp;</td>
              </tr>
            </table>
<table width="80%"  cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" >
              <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                    <tr>
                      <td valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" valign="middle">
                              <div align="center"><span class="subtitle">Data
                                Daerah AsaI</span></div>
                            </td>
                          </tr>

                          <tr>
                            <td>
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">
                        <table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="8" height="10">
                              <div align="center">
                                <table border="0" cellspacing="3" cellpadding="2" width="100%">
                                  <tr>
                                    <td colspan="8" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                  </tr>

                                  <tr>
                                    <td valign="top" width="24%">Nomor Kartu Keluarga<span class="asterish">*</span></td>
                                    <td valign="top" width="1%">:</td>
                                    <td colspan="6" valign="top">
<input class=boxdefault size=18 value="<%=record1.getNokk()%>" name=nokk maxlength="16" onFocus="this.blur()">
 <b>
 </b><img src="images/dot.gif" width="10" height="1"></td>
                                  </tr>
                                <tr>
                                    <td valign="top" width="24%">Nama Kepala Keluarga</td>
                                    <td valign="top" width="1%">:</td>
<td colspan="5" valign="top"><font color="#003366"><b><font color="#003366">
<b><%=record1.getNamapra().toString().toUpperCase()%></b></font></b></font></td>
<input type=hidden value=<%=record1.getNamapra().toString().toUpperCase()%> name=nkap>
                                  </tr>
                                  <tr>
<td valign="top" width="24%">Alamat Asal<span class="asterish"></span></td>
<td valign="top" width="1%">:</td>
<td colspan="5" valign="top">
<%=record1.getAlamat().toString().toUpperCase()%>;
  RT <%=record1.getNort()%>;
  RW <%=record1.getNorw()%>;
  </td>
</tr>
                                  <tr>
                                    <td valign="top" width="24%">
<div align="right">Dusun/Kampung/Dukuh</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" colspan="5">
<%=record1.getDusun().toString().toUpperCase()%></td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">
                                      <div align="right">Provinsi</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="16%">
<%=record1.getNamaPro().toString().toUpperCase()%> </td>
                                    <td valign="top" width="6%">&nbsp;</td>
                                    <td valign="top" width="13%">
                                      <div align="right">Kabupaten/Kota</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="38%">
<%=record1.getNamaKab().toString().toUpperCase() %></td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">
                                      <div align="right">Kecamatan</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="16%">
<%=record1.getNamaKec().toString().toUpperCase()%></td>
                                    <td valign="top" width="6%">&nbsp;</td>
                                    <td valign="top" width="13%">
                                      <div align="right">Desa/Kelurahan</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="38%">
<%=record1.getNamaKel().toString().toUpperCase()%></td>
                                  </tr>
                                </table>
                                <img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="25">
                              <div align="center"><span class="subtitle">Data
                                Kepindahan</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Alasan Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="6" valign="top">
                              <select name="als_pndh" class="boxdefault">
                                <option selected value="0">-- Pilih Alasan Pindah --</option>
                                <option value="1">1 - Pekerjaan</option>
                                <option value="2">2 - Pendidikan</option>
                                <option value="3">3 - Keamanan</option>
                                <option value="4">4 - Kesehatan</option>
                                <option value="5">5 - Perumahan</option>
                                <option value="6">6 - Keluarga</option>
                                <option value="7">7 - Lainnya</option>
                              </select>
                              <img src="images/dot.gif" width="10" height="1"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Alamat Tujuan Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="5" valign="top">
<input class=boxdefault size=35 name=alamat_tjpndh onblur="return alam()" maxlength="120">
                              RT
<input class=boxdefault size=3 name=no_rt_tjpndh  onblur="return rt()" maxlength="3">
                              RW
<input class=boxdefault size=3 name=no_rw_tjpndh onblur="return rw()" maxlength="3">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">
                              <div align="right">Dusun/Kampung/Dukuh</div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" colspan="5">
<input class=boxdefault size=20 name=dusun_tjpndh onblur="return dus()" maxlength="60">
                            </td>
                          </tr>
<tr>
                            <td valign="top" width="21%">Klasifikasi Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" colspan="5"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">

<select name="klasf_pndh" class="boxdefault" onchange="nama_prop_ibu.options[0].selected=true">
<option selected value="0">
-- Pilih Klasifikasi Pindah --</option>
<option value="1">1 - Dalam Satu Desa/Kelurahan</option>
<option value="2">2 - Antar Desa/Kelurahan</option>
<option value="3">3 - Antar Kecamatan</option>
<option value="4">4 - Antar Kabupaten/Kota</option>
<option value="5">5 - Antar Provinsi</option>
</select>
</font>
</td>
</tr>
<tr>
<td valign="top" width="21%">
<div align="right">Provinsi<span class="asterish">*</span></div>
</td>
<td valign="top" width="1%">:</td>
<td valign="top" width="20%">
<input type="hidden" name="no_prop_ibu" value="">

<select  name="nama_prop_ibu" onChange="no_prop_ibu.value=this.value;np.value=this.options[this.selectedIndex].text;pilih_kab_select_only(this, pindah.nama_kab_ibu, pindah.nama_kec_ibu, pindah.nama_kel_ibu);set_prop(no_prop_ibu.value);" class="boxdefault">
<option selected>-- Pilih Provinsi --</option>
</select>
</td>
<td valign="top" width="1%">&nbsp;</td>
<td valign="top" width="12%">
<div align="right">Kabupaten/Kota<span class="asterish">*</span></div>
</td>
<td valign="top" width="1%">:</td>
<td valign="top" width="25%">
<input type="hidden" name="no_kab_ibu" value="">
<select name="nama_kab_ibu" onChange="no_kab_ibu.value=this.value;nb.value=this.options[this.selectedIndex].text; pilih_kec_select_only(pindah.nama_prop_ibu, this, pindah.nama_kec_ibu, pindah.nama_kel_ibu);set_kab(no_kab_ibu.value);"  class="boxdefault">
<option selected>-- Pilih Kabupaten/Kota --</option>
</select>
</td>
</tr>
<tr>
<td valign="top" width="21%">
<div align="right">Kecamatan<span class="asterish">*</span></div>
</td>
<td valign="top" width="1%">:</td>
<td valign="top" width="20%">
<input type="hidden" name="no_kec_ibu" value="">
<select   name="nama_kec_ibu" onChange="no_kec_ibu.value=this.value;nc.value=this.options[this.selectedIndex].text;pilih_kel_select_only(pindah.nama_prop_ibu, pindah.nama_kab_ibu, this, pindah.nama_kel_ibu);set_kec(no_kec_ibu.value);"   class="boxdefault">
<option selected>-- Pilih Kecamatan --</option>
</select>
</td>
<td valign="top" width="1%">&nbsp;</td>
<td valign="top" width="12%">
<div align="right">Desa/Kelurahan<span class="asterish">*</span></div>
</td>
<td valign="top" width="1%">:</td>
<td valign="top" width="25%">
<input type="hidden" name="no_kel_ibu" value="">
<select  name="nama_kel_ibu"  class="boxdefault" onChange="no_kel_ibu.value=this.value;nl.value=this.options[this.selectedIndex].text;set_kel(this.value)">
<option selected>-- Pilih Desa/Kelurahan --</option>
</select>
</td>
</tr>
<tr>
<td valign="top" width="21%">
                              <div align="right">Kode Pos</div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" width="17%">
<input class=boxdefault size=5 name=kodepos_tjpndh maxlength="5">
                            </td>
                            <td valign="top" width="3%">&nbsp;</td>
                            <td valign="top" width="13%">
                              <div align="right">Telepon</div>
                            </td>
                            <td valign="top" width="2%">:</td>
                            <td valign="top" width="43%">
<input class=boxdefault size=20 name=telp_tjpndh onblur="return tel()" maxlength="20">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Jenis Kepindahan<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="5" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<select name="jenis_kpndhn" class="boxdefault" onChange="return jens()">
                                <option selected value="0">-- Pilih Jenis Kepindahan --</option>
                                <option value="1">1 - Kepala Keluarga</option>
                                <option value="2">2 - Kepala Keluarga dan Seluruh
                                Anggota Keluarga</option>
                                <option value="3">3 - Kepala Keluarga dan Sebagian
                                Anggota Keluarga</option>
                                <option value="4">4 - Anggota Keluarga</option>
                              </select>
                              </font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Status Nomor KK Bagi
                              Yang Tidak Pindah</td>
                            <td valign="top" width="1%">:</td>
                            <td width="35%" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">

 <select name="stat_no_kk_tdkpdh" size="1" class="boxdefault" onchange="tdkpdh(this.options[this.selectedIndex].text)">
      <option> Pilih Status Nomor KK Bagi Yang Tidak Pindah </option>
  </select></font></td>

<td width="21%" valign="top">

<input type=hidden name=no_kk value="<%=no_kk%>">

<input type=hidden name="modtype">

<input type="button" name="btn1" disabled value="Numpang KK" class="boxstandard" onclick="return startMod('NP')">
</td>
<td width="25%" valign="top">
<input type="button"  name="btn2" disabled value="KK Baru" class="boxstandard" onclick="return startMod('KB')">
 </td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Status Nomor KK Bagi
                              Yang Pindah</td>
                            <td valign="top" width="1%">:</td>
   <td colspan="5" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">
<select name="stat_no_kk_pdh" class="boxdefault">
   <option> Pilih Status Nomor KK Bagi Yang Pindah </option>
</select>
                              </font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Rencana Tanggal Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="5" valign="top">

                              <table width="100" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td>
<input class=boxdefault size=2 name=renc_tgl_pindah maxlength="2" onKeyUP="return tglhr1()">
                                  </td>
                                  <td>/ </td>
                                  <td>
<input class=boxdefault size=2 name=renc_bln_pindah maxlength="2" onKeyUP="return tglhr2()" >
                                  </td>
                                  <td>/</td>
                                  <td>
<input class=boxdefault size=4 name=renc_thn_pindah maxlength="4" onKeyUP="return tglhr3()">
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>

                          <tr>
                            <td valign="top" width="25%">Keluarga Yang Pindah</td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" colspan="5">&nbsp;</td>
                          </tr>

                          <tr>
                            <td valign="top" colspan="7">

                              <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#93BEE2">
                                <tr>
                                  <td width="5" height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                  <td width="1" height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td valign="middle" align="center">
                                    <table width="100%" border="0" cellspacing="1" cellpadding="3" class="C-BG">
                                      <tr>
                                        <td class="C-Fonts" width="4%">
                                          <div align="center"> No.</div>
                                        </td>
                                        <td class="C-Fonts" width="20%">
                                          <div align="center">NIK</div>
                                        </td>
                                        <td class="C-Fonts" width="31%">
                                          <div align="center">Nama Lengkap</div>
                                        </td>

                                        <td class="C-Fonts">
                                          <div align="center">SHDK dengan KK Asal</div>
                                        </td>
                                    <td class="C-Fonts"> <div align="center">Pilih</div></td>
                                      </tr>
<%
String prefix="";
if (source.equals("WNA")) prefix="A";
for (i=0;i<v.size();i++)
      {
        record=(Individu_SudapunyaWna)v.elementAt(i);
%>
                                      <tr>
                                        <td class="C-Field" width="4%">
                                          <div align="center">
                                       <%=i+1%>
                        </div>
                                        </td>
                                        <td class="C-Field" width="20%">
<div align="center"><%=prefix.trim()+record.getNik().trim()%>
                                       </div>
                                        </td>
                                        <td class="C-Field" width="31%">
<div align="center"><%=record.getNamapra().toString().toUpperCase()%>
                                          </div>
                                        </td>
                                        <td class="C-Field" width="19%">
<div align="center"> <%=record.getStathbkel().toString().toUpperCase()%></div>
                                        </td>
<td class="C-Field">
<div align="center" width="1%">
<input type="checkbox" value="<%=record.getNik()%>" name="agtnik<%=i%>" onclick="setAnggota(totagt.value,no_kk.value)">
</div>
<input type="hidden" name="namalgkp<%=i%>" value="<%=record.getNamapra().trim()%>">
<input type="hidden" name="hbkel<%=i%>" value="<%=record.getStathbkel().trim()%>">
<input type="hidden" name="jenis<%=i%>" value="<%=record.getJenisKlmin()%>">
<input type="hidden" name="kwrn<%=i%>" value="<%=record.getKwrngrn()%>">
</td>
 </tr>
<%
if ((record.getStathbkel().toString().toUpperCase().trim().equals("KEPALA KELUARGA"))
|| (record.getStathbkel().toString().toUpperCase().trim().equals("KEPALA KELUARGA/HEAD OF FAMILY"))
|| (record.getStathbkel().toString().toUpperCase().trim().equals("Kepala Keluarga"))
|| (record.getStathbkel().toString().toUpperCase().trim().equals("Kepala Keluarga/Head of Family")))
{
%>
<input type=hidden name=nik value="<%=record.getNik().trim() %>">
<%
}}
%>

<input type=hidden name=checkflag value="N">
<input type=hidden name=totagt value="<%=i%>">
<input type=hidden name=pinlist>
                               </table>
                                  </td>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                  <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">
                        <table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="9" height="10">
                              <div align="center"><img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Administrasi</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
       <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10"></td>
       </tr>

<%
if (source.equals("WNI"))
{
%>               <tr valign="top">
                            <td>Nama Kepala Desa/ Kelurahan<span class="asterish">*</span>
                            </td>
                            <td>:</td>
                            <td colspan="2">
                              <input  class=boxdefault size=22 name=nama_kep_des maxlength="60">
                            </td>
                            <td><img src="images/dot.gif" width="10" height="1"></td>
                            <td>NIP Lurah</td>
                            <td>:</td>
                            <td colspan="2">
                              <input  class=boxdefault size=9 name=nip_lrh maxlength="9">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td>Nama Camat<span class="asterish">*</span> </td>
                            <td>:</td>
                            <td colspan="2">
                              <input
                                class=boxdefault size=22 name=nama_cmat maxlength="60">
                            </td>
                            <td>&nbsp;</td>
                            <td>NIP Camat<span class="asterish">*</span> </td>
                            <td>:</td>
                            <td colspan="2">
                              <input class=boxdefault size=9 name=nip_cmat maxlength="9">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td>Nama Petugas Entri</td>
                            <td>:</td>
                            <td colspan="2"><b><%=record2.getNamaPetugas()%> </b></td>
                            <td>&nbsp;</td>
                            <td>NIP Petugas Entri</td>
                            <td>:</td>
                            <td colspan="2"> <b><%=record2.getNipPetugas()%></b></td>
                          </tr>
                          <tr valign="top">
                            <td height="20"><img src="images/dot.gif" width="1" height="1">Tanggal
                              Entri</td>
                            <td>:</td>
                            <td colspan="2"> <b><%=record2.getToday()%></b></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                          </tr>
<%
}
else if (source.equals("WNA"))
{
%>
  <tr>
    <td valign="top" width="30%" nowrap>Nama Bupati/Walikota/Pejabat<br>yang Ditunjuk
      <span class="asterish">*</span> </td>
    <td valign="top" width="1%">:</td>
    <td colspan="2" valign="top">
      <input type=hidden name="nama_bup" value="<%=record2.getKabNamaPej()%>">
      <%=record2.getKabNamaPej()%> </td>
    <td valign="top" nowrap>Nama Petugas Entri</td>
    <td valign="top" width="1%">:</td>
    <td colspan="2" valign="top"><%=getTrimData(record2.getNamaPetugas()).toString().toUpperCase()%></td>
  </tr>
  <tr>
    <td valign="top" width="15%"> NIP Petugas Entri </td>
    <td valign="top" width="2%">:</td>
    <td colspan="2" valign="top" width="28%"><%=record2.getNipPetugas()%> </td>
    <td valign="top" width="30%"> <img src="images/dot.gif" width="1" height="1">Tanggal
      Entri</td>
    <td valign="top" width="1%">:</td>
    <td colspan="2" valign="top"><%=record2.getToday()%> </td>
  </tr>
<%
}
%>

        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">&nbsp;</td>
                    </tr>
                  </table>
                </td>
                <td>&nbsp;</td>
              </tr>

<input type=hidden name="kabtot" value="<%=ii%>">
<input type=hidden name="kectot" value="<%=jj%>">
<input type=hidden name="keltot" value="<%=kk%>">
<input type=hidden name=namakk value="<%=record1.getNamapra().trim()%>">
<input type=hidden name=namapetentri value="<%=namapetentri%>">
<input type=hidden name=nippetentri value=<%=nippetentri%>>
<input type=hidden name=tglentri value="<%=tglentri%>">
<input type=hidden name=nb value="">
<input type=hidden name=np value="">
<input type=hidden name=nl value="">
<input type=hidden name=nc value="">
    <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
            <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b>
<input class=boxstandard type=button value=SIMPAN name="sim" onClick="return pin()">
                    </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
                </td>
                <td>
                  <div align="center"><b>
       <input class=boxstandard type=button name="klbtn" onClick="document.location='<%=record2.getModRefFile()%>'" value=KELUAR name="submit2322">
                    </b></div>
                </td>
              </tr>
              <tr>
                <td colspan="3">
                  <div align="center"><font color="#003399"><i>Keterangan : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data
                    harus Diisi</font></i></div>
                </td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        </tr>
      </table>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>

<SCRIPT language=javascript>
  pilih_prop_select_only(pindah.nama_prop_ibu);
</script>
</form>

</BODY>
</HTML>
<%
 }
source="";
    }
else
{
  response.sendRedirect("index.jsp");
}
   }
catch(Exception e)
{
e.printStackTrace();
System.out.print("Error in jsp=" + e.toString());
}
finally
{
remote.remove();
}
%>