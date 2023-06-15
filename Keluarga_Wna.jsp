<%@ page language="java" import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
ServiceController factory=null;
%>

<%
String no_kk="",nik="",nprop="",nkab="",nkec="",nkel="",nama_din="",nama_kep_din="",nip_kep_din="",NAMA_PET_ENTRI="",NIP_PET_ENTRI="",TGL_ENTRI="";
int i=0,j=0;
//Context entityContext;
UserInfo1 record2=null;
KeluargaWnaHome home=null;
KeluargaWna remote=null;
Individu_SudapunyaWna record=null,record1=null;
Vector v=null,vt_hbn=null;

String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
String status="NL";  //NL-Normal Entry,AL-Asal,TJ-Tujuan
String source="";
%>

<%
//System.out.println("Entered into Keluarga WNA STEP 1!!!!!!!");

try
  {
     record2=(UserInfo1)session.getAttribute("remoteRef");
 if(record2 != null)
   {
    if (request.getParameter("source")!=null) source=request.getParameter("source").trim();

      if (source.equals("WNA"))
        {
 nama_din=record2.getKabJabatan();
nama_kep_din=record2.getKabNamaPej().toString().toUpperCase();
nip_kep_din=record2.getKabNipPej();
        }

NAMA_PET_ENTRI=record2.getNamaPetugas().toString().toUpperCase();
NIP_PET_ENTRI=record2.getNipPetugas();
TGL_ENTRI=record2.getToday().toString().toUpperCase();

nama_prop=request.getParameter("nama_prop");
nama_kab=request.getParameter("nama_kab");
nama_kec=request.getParameter("nama_kec");
nama_kel=request.getParameter("namakel");

nprop=request.getParameter("no_prop");    //have to check for pindah whether wilayah passes
nkab=request.getParameter("no_kab");
nkec=request.getParameter("no_kec");
nkel=request.getParameter("no_kel");

 if (request.getParameter("status")!=null)
     {
       status=request.getParameter("status").trim().toUpperCase();
     }

   no_kk=request.getParameter("no_kk_semula");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/NikVeri.js">
</SCRIPT>
<script language="javascript">
function closure(file)
{
if ((document.all['status'].value=="TJ"))
    {
      self.close();
     }
else
   {
           document.location=file;
   }
}

function checkJenisKelamin(frm,hbkel,i)
{
var res=false;
   if (document.all['chk'].length>=2)
    {
       res=(checkSex(document.all['chk'][i].value,hbkel))
	   }
   else
    {
       res= (checkSex(document.all['chk'].value,hbkel))
	 }
 if (res)
	 {
                  setKK(frm);
                  refreshAll()
                  return true;
         }
           alert("Jenis Kelamin salah !");
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<%
    System.out.println("No KK Before Keluarga WNA");
    factory=ServiceController.getInstance();
    home = (KeluargaWnaHome) factory.lookup("KeluargaWna",KeluargaWnaHome.class);
    remote = home.create();
    System.out.println("No KK After Keluarga WNA");

if (status.equals("TJ"))
     {
     System.out.println("Before remote");
     v = remote.daftarKK(no_kk.trim(),source);
     System.out.println("After remote");
     }
     else
     {
     v = remote.daftarKeluarga(no_kk.trim(),source,nprop,nkab,nkec,nkel);
     }


if (source.equals("WNI"))
{
vt_hbn=getListHubuganWni();
}
else if (source.equals("WNA"))
{
   vt_hbn=getListHubugan();
}

  System.out.println("No KK After getListHubugan() WNA");
  j=v.size();

 if(v.isEmpty())
 {
    response.sendRedirect("Pen_KKWna_SudapunyaNik.jsp?kk_err=" + no_kk + "&error=1&source=" + source +"&status=" + status);
 }
else
{
System.out.println("Not v.isEmpty()");
record1=(Individu_SudapunyaWna)v.elementAt(0);
%>
<form name=daf method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td background="images/v_bg_header.gif">
<input type="hidden" name="source" value="<%=source%>">
<input type="hidden" name="status" value="<%=status%>">
<jsp:include page="top.html"/>
</td>
</tr>
<tr>
<td>
<table width="100%" border="0" cellspacing="5" cellpadding="5">
<tr>
                        <td valign="top">
                           <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
                              <tr>
                                 <td>
                                    <table width="100%" border="0" cellspacing="3" cellpadding="3">
                                       <tr>
                                          <td>
                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                   <td height="45">
                                                      <div align="center"><span class="submenu">Permohonan KK Baru <%=source%></span><br><span class="linkyellow">Yang Sudah Punya NIK</span><br></div>
                                                   </td>
                                                </tr>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                             <td>
<% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record2.getNoProp() + "&nama_prop=" + record2.getNamaProp() +
      "&no_kab=" + record2.getNoKab() + "&nama_kab=" + record2.getNamaKab() + "&no_kec=" + (request.getParameter("no_kec")==null?"":request.getParameter("no_kec")) + "&nama_kec=" + (request.getParameter("nama_kec")==null?"":request.getParameter("nama_kec")) +
      "&no_kel=" + nkel+ "&nama_kel="+ nama_kel.toString().toUpperCase();
%>
                          <jsp:include page="<%=jsp%>"/>
                                             </td>
                                       </tr>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <table width="820" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                                                               <div align="center"><span class="subtitle">Data Permohonan KK Baru <%=source%></span></div>
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
                                                   <td valign="top">
                                                      <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                                                         <tr>
                                                            <td colspan="13"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="../../images/dot.gif" width="1" height="10"></b></font></td>
                                                         </tr>
                                                         <tr valign="top">
                                                            <td width="185"> Nomor Kartu Keluarga Semula<span class="asterish">*</span></td>
                                                            <td>:</td>
                                                            <td colspan="11">
                                                               <input class=boxdefault size=20 name=no_kk_semula maxlength="16" onFocus="this.blur()" value=<%=no_kk%>>
                                                               <%-- <input class=boxstandard type=submit value=PERIKSA name="submit2" onclick="return wna()">--%>
                                                            </td>
                                                         </tr>
                                                         <!--to be inserted-->
                                                         <tr valign="top">
                                                            <td> NIK Pemohon KK (sebagai Kepala Keluarga Baru)<span class="asterish">*</span></td>
                                                            <td>:</td>
                                                            <td colspan="11">
                                                               <input class=boxdefault size=20 name=nik_kep_kel onFocus="this.blur()" maxlength="16">
                                                            </td>
                                                         </tr>
                                                         <tr valign="top">
                                                            <td> Nama Lengkap</td>
                                                            <td>:</td>
                                                            <td colspan="11"><b><%=record1.getNamaKep().toString().toUpperCase()%></b></td>
                                                         </tr>
                                                         <tr valign="top">
                                                            <td> Alamat KK Pemohon</td>
                                                            <td>:</td>
                                                            <td colspan="11">&nbsp;
<%=record1.getAlamat().toString().toUpperCase()%>;
RT <%=(record1.getNort()==null)?"-":record1.getNort()%>;
RW <%=(record1.getNorw()==null)?"-":record1.getNorw()%>;
Dusun <%=record1.getDusun()%>
                                                            </td>
                                                         </tr>
                                                         <tr valign="top">
                                                            <td colspan="2">&nbsp;</td>
                                                            <td>Desa/Kelurahan </td>
                                                            <td>:</td>
                                                            <td> <font color="#003366"><b><font color="#003366"><b><%=record1.getNamaKel().toString().toUpperCase()%></b></font></b></font></td>
                                                            <td>Kecamatan</td>
                                                            <td>:</td>
                                                            <td colspan="6">
                                                               <b><font color="#003366"><%=record1.getNamaKec().toString().toUpperCase()%></font></b>
                                                            </td>
                                                         </tr>
                                                         <tr valign="top">
                                                            <td colspan="2">&nbsp;</td>
                                                            <td> Kab/Kota </td>
                                                            <td>:</td>
                                                            <td> <font color="#003366"><b><%=record1.getNamaKab().toString().toUpperCase()%></b></font></td>
                                                            <td>Provinsi</td>
                                                            <td>:</td>
                                                            <td colspan="6"> <b><font color="#003366"><%=record1.getNamaPro().toString().toUpperCase()%></font></b></td>
                                                         </tr>
                                                         <tr valign="top">
                                                            <td colspan="2">&nbsp;</td>
                                                            <td> Kode Pos </td>
                                                            <td>:</td>
                                                            <td><b><font color="#003366"><%=record1.getKodepos()%></font></b></td>
                                                            <td>Telepon</td>
                                                            <td>:</td>
                                                            <td colspan="6"><b><font color="#003366"><%=record1.getTelp()%></font></b></td>
                                                         </tr>

                                                         <input type=hidden value="<%=record1.getAlamat()%>" name=alamat>
                                                         <input type=hidden value=<%=record1.getNort()%> name=no_rt>
                                                         <input type=hidden value=<%=record1.getNorw()%> name=no_rw>
                                                         <input type=hidden value="<%=record1.getDusun()%>" name=dusun>
                                                         <input type=hidden value=<%=record1.getKodepos()%> name=kodepos>
                                                         <input type=hidden value="<%=record1.getTelp()%>" name=telp>
                                                         <input type=hidden value=<%=nprop%> name=nopr>
                                                         <input type=hidden value=<%=nkab%> name=noka>
                                                         <input type=hidden value=<%=nkec%> name=noke>
                                                         <input type=hidden value=<%=nkel%> name=nokl>

                                                         <tr valign="top">
                                                            <td>Alasan Permohonan</td>
                                                            <td>:</td>
                                                            <td colspan="11">
                                                               <select name="als_prmohon" class="boxdefault">
                                                                  <option value="0">-- Pilih Alasan Permohonan --</option>
                                                                  <option value="1">1 - Karena Membentuk Rumah Tangga Baru</option>
                                                                  <option value="2">2 - Karena Pindah Tempat Tinggal</option>
                                                                  <option value="3">3 - Karena Kartu Keluarga Hilang/Rusak</option>
                                                                  <option value="4">4 - Lainnya</option>
                                                               </select>
                                                            </td>
                                                         </tr>
                                                         <input type=hidden value=<%=j%> name=sa>
                                                         <tr valign="top">
                                                            <td>Jumlah Anggota Keluarga/Pengikut</td>
                                                            <td>:</td>
                                                            <td colspan="11"><input class=boxdefault size=2 name=jml maxlength="2" onKeyUp="return val()"> Orang </td>
                                                         </tr>
                                                      </table>
                                                      <table width="100%" border="0" cellspacing="3" cellpadding="2" align="center">
                                                         <tr>
                                                            <td height="10">
                                                               <div align="center"><img src="images/dot.gif" width="1" height="10" hspace="5"></div>
                                                            </td>
                                                         </tr>
                                                         <tr>
                                                            <td height="1">
                                                               <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                                            </td>
                                                         </tr>
                                                         <tr>
                                                            <td height="25">
                                                               <div align="center"><span class="subtitle">Daftar Keluarga Pemohon</span></div>
                                                            </td>
                                                         </tr>
                                                         <tr>
                                                            <td height="1">
                                                               <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                                            </td>
                                                         </tr>
                                                         <tr>
                                                            <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                                         </tr>
                                                         <tr valign="top">
                                                            <td>
                                                               <table width="775" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#93BEE2">
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
                                                                              <td class="C-Fonts" rowspan="2" width="4%">
                                                                                 <div align="center"> No.</div>
                                                                              </td>
                                                                              <td class="C-Fonts" rowspan="2" width="20%">
                                                                                 <div align="center">NIK</div>
                                                                              </td>
                                                                              <td class="C-Fonts" rowspan="2" width="31%">
                                                                                 <div align="center">Nama Lengkap</div>
                                                                              </td>
                                                                              <td class="C-Fonts" colspan="2">
                                                                                 <div align="center">Status Hubungan dalam Keluarga</div>
                                                                              </td>
                                                                              <td class="C-Fonts" rowspan="2" width="10%">
                                                                                 <div align="center">Cek</div>
                                                                              </td>
                                                                           </tr>
                                                                           <tr>
                                                                              <td class="C-Fonts" width="16%">
                                                                                 <div align="center">Semula</div>
                                                                              </td>
                                                                              <td class="C-Fonts" width="19%">
                                                                                 <div align="center">Berubah Menjadi</div>
                                                                              </td>
                                                                           </tr>

<%
 for(i=0;i<v.size();i++)
      {
        record=(Individu_SudapunyaWna)v.elementAt(i);
%>
                                                                           <tr>
                                                                              <td class="C-Field" width="4%">
                                                                                 <div align="center"> <%=i+1%></div>
                                                                              </td>
                                                                              <td class="C-Field" width="20%">
                                                                                 <div align="center"><%=record.getNik()%></div>
                                                                              </td>
                                                                              <td class="C-Field" width="31%">
<div align="left"><%=record.getNamapra().toString().toUpperCase()%> </div>
</td>
<input type="hidden" name=namap<%=i%> value="<%=record.getNamapra().toString().toUpperCase()%>">
<td class="C-Field" width="16%">
<%=record.getStathbkel().toString().toUpperCase()%>
</td>
<td class="C-Field" width="19%">
<select name=stat_hbkel<%=i%> class="boxdefault" size="1" onChange="checkJenisKelamin(this.form,this,<%=i%>);">
<option selected value="<%if (source.equals("WNI")){%><%=getStatHubunIdxWni(record.getStathbkel())%><%}%><%if(source.equals("WNA")){%><%=getStatHubunIdxWna(record.getStathbkel())%><%}%>">-- Sama dengan Semula--</option>
 <%
     for(int cntr=0;cntr<=vt_hbn.size()-1;cntr++)
       {
          String element=(String)vt_hbn.elementAt(cntr);
           if (!(element.trim().equals(record.getStathbkel().trim())))
   out.println("<option value=" + (cntr+1)+ ">" + (cntr+1)+ "." + element + "</option>");
       }
%>
</select>
</td>
<input type="hidden" name="flag_stat" value="0">
<td class="C-Field" width="10%">
                                                                                 <center>
                                                                                    <input type=checkbox name=chk value=<%=record.getNik()%> onclick="javascript:setNik(this.form);validateKKBaru(this.form)">
                                                                                 </center>
                                                                              </td>
                                                                           </tr>
                                                                           <input type=hidden name=ch<%=i%> value=<%=record.getNik()%>>
                                                                           <input type=hidden name=umur<%=i%> value=<%=record.getUmur()%>>
                                                                           <input type=hidden name=kwn<%=i%> value=<%=record.getStatKwn()%>>
 <%
      }
 %>

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
                                                               <div align="center"><span class="subtitle">Data Administrasi</span></div>
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
                                                         <tr valign="top">
                                                            <td>

<%if (source.equals("WNI"))
{
%>
                                                               <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                                                                  <tr>
                                                                     <td>Nama Kepala Desa/ Kelurahan<span class="asterish">*</span></td>
<td>:</td>
<td>
<input type="text" class="boxdefault" maxlength="40" name="nama_kep_des">
</td>
                                                                     <td>Nama Petugas Entri</td>
                                                                     <td>:</td>
                                                                     <td><b><%=record2.getNamaPetugas()%></b></td>
                                                                  </tr>
                                                                  <tr>
                                                                     <td>NIP Petugas Entri</td>
                                                                     <td>:</td>
                                                                     <td><b><%=record2.getNipPetugas()%></b></td>
                                                                     <td>Tanggal Entri</td>
                                                                     <td>:</td>
                                                                     <td><b><%=record2.getToday()%></b> </td>
                                                                  </tr>
                                                               </table>
<%
}
else
{
%>
                                                               <table border="0" cellspacing="3" cellpadding="3" width="100%">
                                                                  <tr>
                                                                     <td>Jabatan pada Kantor/Dinas<span class="asterish">*</span></td>
                                                                     <td>:</td>
                                                                     <td>
                                                                        <b><input class=boxdefault size=22  value="<%=nama_din.toString().toUpperCase()%>" name=nama_din maxlength="60" onFocus="this.blur()"></b>
                                                                     </td>
                                                                     <td>&nbsp;</td>
                                                                     <td>Nama Pejabat<span class="asterish">*</span></td>
                                                                     <td>:</td>
                                                                     <td>
                                                                        <b><input class=boxdefault size=22 value="<%=nama_kep_din.toString().toUpperCase()%>" name=nama_kep_din maxlength="60" onFocus="this.blur()"></b>
                                                                     </td>
                                                                  </tr>
                                                                  <tr>
                                                                     <td>NIP Pejabat<span class="asterish">*</span></td>
                                                                     <td>:</td>
                                                                     <td><b><input class=boxdefault size=10 value="<%=nip_kep_din%>" name=nip_kep_din maxlength="9" onFocus="this.blur()"></b></td>
                                                                     <td>&nbsp;</td>
                                                                     <td>Nama Petugas Entri Data</td>
                                                                     <td>:</td>
                                                                     <td><b><font color="#000066"><%=NAMA_PET_ENTRI.toString().toUpperCase()%></font></b> </td>
                                                                  </tr>
                                                                  <tr>
                                                                     <td>NIP Petugas Entri Data</td>
                                                                     <td>:</td>
                                                                     <td><b> <font color="#000066"><%=NIP_PET_ENTRI%></font></b></td>
                                                                     <td>&nbsp;</td>
                                                                     <td>Tanggal Entri Data</td>
                                                                     <td>:</td>
                                                                     <td><b><%=TGL_ENTRI%></b></td>
                                                                  </tr>
                                                               </table>

<%
}
%>
                                                            </td>
                                                         </tr>
                                                      </table>
                                                   </td>
                                                </tr>
                                             </table>
                                          </td>
                                          <td>&nbsp;</td>
                                       </tr>
                                       <input type=hidden value=<%=nama_din%> name=ndin>
                                       <input type=hidden value=<%=nama_kep_din%> name=nkdin>
                                       <input type=hidden value=<%=nip_kep_din%> name=nkedin>
                                       <input type=hidden value=<%=NAMA_PET_ENTRI%> name=NAMA_PET_ENTRI>
                                       <input type=hidden value=<%=NIP_PET_ENTRI%> name=NIP_PET_ENTRI>
                                       <input type=hidden value=<%=TGL_ENTRI%> name=TGL_ENTRI>
                                       <input type=hidden name=TC>
                                       <input type="hidden" name=nikna>
                                       <tr>
                                          <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                                          <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                          <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                                       </tr>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td height="44">
                                    <table width="350" border="0" cellspacing="5" cellpadding="5" align="center" height="55">
                                       <tr>
                                          <td>
                                             <div align="center"><b><input class=boxstandard type=button value=SIMPAN name="btn" onclick="return startSub(this.form)">
</b></div>
                                          </td>
                                          <td></td>
                                          <td>
                                             <div align="center"><b>
                   <%

                   if (status.equals("AL"))
                                   {
                          if (session.getAttribute("no_kel")!=null)
                                 no_kel=(String)session.getAttribute("no_kel");
                          if (session.getAttribute("nama_kel")!=null)
                                nama_kel=(String)session.getAttribute("nama_kel");

%>
                       <input name="klbtn" onClick="return closure('Dis_Per_Wna.jsp?no_kk=<%=no_kk%>&status=<%=status%>&source=<%=source%>&no_kec=<%=no_kec%>&nama_kec=<%=nama_kec%>&no_kel=<%=no_kel%>&nama_kel=<%=nama_kel%>&namakel=<%=nama_kel%>')" class=boxstandard type=button value=KELUAR name="button22">
                                  <%
                                   }
                        else
                             {
                                  %>
              <input name="klbtn" onClick="return closure('<%=record2.getModRefFile()%>')" class=boxstandard type=button value=KELUAR name="button22">
                              <%}
                                %>
</b></div>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan="3">
                                             <div align="center"><font color="#003399"><i>Keterangan : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data harus Diisi</font></i></div>
                                          </td>
                                       </tr>
                                    </table>
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
            <tr>
               <td>&nbsp;</td>
            </tr>
         </table>
         <p class="linkyellow">&nbsp;</p>
      </form>
   </BODY>
</HTML>
<%
}
   }
else
{
  response.sendRedirect("index.jsp");
}
 }
catch(Exception e)
{
e.printStackTrace();
System.out.print("Error in Keluarga_Wna.jsp=" + e.toString());
}
finally
{
remote.remove();
}
%>
