<%@ page language="java" import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
ServiceController factory;
UserInfo1 record=null;
%>

<%
String status="NL";
String source="";
String no_kk="",nik="",nprop="",nkab="",nkec="",nkel="",nama_din="",nama_kep_din="",nip_kep_din="",NAMA_PET_ENTRI="",NIP_PET_ENTRI="",TGL_ENTRI="";
String no_kk_lama="",no_kk_tmpt="";
int i=0,j=0;
Num_Wna_DataHome home=null;
Num_Wna_Data remote=null;
Vector v=null,vt_hbn=null,ve=null;
Individu_SudapunyaWna record1=null,rec_last=null;
String nama_prop="",nama_kab="",nama_kec="",nama_kel="";

    record=(UserInfo1)session.getAttribute("remoteRef");

try
  {

 if(record != null)
   {
%>

<%
if (request.getParameter("source")!=null) source=request.getParameter("source").trim();

   if (source.equals("WNA"))
         {
nama_din=record.getKabJabatan();
nama_kep_din=record.getKabNamaPej().toString().toUpperCase();
nip_kep_din=record.getKabNipPej();
         }

NAMA_PET_ENTRI=record.getNamaPetugas().toString().toUpperCase();
NIP_PET_ENTRI=record.getNipPetugas();
TGL_ENTRI=record.getToday().toString().toUpperCase();

no_kk_lama=request.getParameter("no_kk_lama");
no_kk_tmpt=request.getParameter("no_kk_tmpt");

nprop=record.getNoProp();
nkab=record.getNoKab();

nama_prop=record.getNamaProp();
nama_kab=record.getNamaKab();
nkec=request.getParameter("no_kec");
nama_kec=request.getParameter("nama_kec");

nkel=request.getParameter("no_kel");
nama_kel=request.getParameter("namakel");

/*     if (source.equals("WNI"))
      {
                //nkec=record.getNoKec();
       //         nama_kec=record.getNamaKec();
      }
*/

if(request.getParameter("status")!=null && !request.getParameter("status").trim().equals(""))
{
status=request.getParameter("status");
}
    factory=ServiceController.getInstance();
    home = (Num_Wna_DataHome) factory.lookup("Num_Wna_Data",Num_Wna_DataHome.class);
    remote = home.create();
if (source.equals("WNA"))
    {
if (status.equals("TJ"))
    {
        v=remote.numpangTujuan(no_kk_lama.trim(),no_kk_tmpt.trim(),source);
    }
else
   {
    v = remote.numpangKeluarga(no_kk_lama.trim(),no_kk_tmpt.trim(),nprop,nkab,nkec,nkel,source);
   }
  }
else if (source.equals("WNI"))
  {
    if (status.equals("TJ"))
       {
          v=remote.numpangTujuan(no_kk_lama.trim(),no_kk_tmpt.trim(),source);
       }
  else
   {
    v = remote.numpangKeluarga(no_kk_lama.trim(),no_kk_tmpt.trim(),nprop,nkab,nkec,nkel,source);
  }
}

if (source.equals("WNA"))
    {
    vt_hbn=getListHubugan();
    }
else if (source.equals("WNI"))
{
   vt_hbn=getListHubuganWni();
}

    j=v.size();

if(v.isEmpty())
      {
        response.sendRedirect("NumpangKK_Wna.jsp?error=6&source="+source+"&status="+status);
      }
else
    {
   record1=(Individu_SudapunyaWna)v.elementAt(0);
  rec_last=((Individu_SudapunyaWna)v.elementAt(v.size()-1));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/kepalawna.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/NikVeri.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/trim.js">
</SCRIPT>
<SCRIPT language=JavaScript>
function checkJenisKelamin(frm,hbkel,i)
{
var res=false;
var obj=new Object();
obj.name="che"+i;
 res= (checkSex(document.all[obj.name].value,hbkel))
  if (res==false)  alert("Jenis Kelamin salah !");
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name=numpang method="post">
<input type="hidden" name="source" value="<%=source%>">
<input type="hidden" name="status" value="<%=status%>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
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
                              <div align="center"><span class="submenu">Permohonan
                                Menumpang KK <%=source%></span><br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
<td>
<%/* String jsp = "";
   if (source.equals("WNI")) {
      jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
         "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
         "&no_kel=" + nkel+ "&nama_kel="+ nama_kel.toString().toUpperCase();
   } else if (source.equals("WNA")) {
      jsp = "data_wilayah.jsp?level=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
         "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();
   }
*/
%>
<% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + (request.getParameter("no_kec")==null?"":request.getParameter("no_kec")) + "&nama_kec=" + (request.getParameter("nama_kec")==null?"":request.getParameter("nama_kec")) +
      "&no_kel=" + nkel+ "&nama_kel="+ nama_kel.toString().toUpperCase();
%>
                          <jsp:include page="<%=jsp%>"/>
                                             </td>
                    </tr>
                    <tr>
                      <td valign="top">&nbsp; </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                                      Permohonan Menumpang KK</span></div>
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
                                  <td colspan="11"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="../../images/dot.gif" width="1" height="10"></b></font></td>
                                </tr>
                                <tr valign="top">
       <td width="225"> Nomor Kartu Keluarga Lama<span class="asterish">*</span></td>
                                  <td>:</td>
                                  <td colspan="9">
<input class=boxdefault size=18 name=no_kk_lama maxlength="16" value=<%=no_kk_lama%> onFocus="this.blur()">
                                    <b>
                               <%--      <input class=boxstandard type=button value=PERIKSA name="submit2">--%>
                                    </b></td>
                                </tr>
                                <tr valign="top">
                                  <td> NIK Kepala Keluarga Lama</td>
                                  <td>:</td>
                        <td colspan="9"><b>
<%=record1.getNik()%>

</b></td>
                               </tr>
                          <tr valign="top">
                                  <td> Nama Kepala Keluarga Lama</td>
                                  <td>:</td>
 <td colspan="9">
<b>
  <%=record1.getNamaKep().toString().toUpperCase()%>
<input type="hidden" name="nama_kepala_kk_lama" value="<%=record1.getNamaKep().toString().toUpperCase()%>">
</b>
                                  </td>
                                </tr>
                                <tr valign="top">
                                  <td>Nomor Kartu Kepala Keluarga Yang Ditempati<span class="asterish">*</span></td>
                                  <td>:</td>
                                  <td colspan="9">
<input class=boxdefault size=18 name=no_kk_tmpt maxlength="16" value=<%=no_kk_tmpt%> onFocus="this.blur()">
                                    <b>
<%--<input class=boxstandard type=submit value=PERIKSA name="submit22" onclick="return nump()">--%>
                                    </b></td>
                                </tr>

                                <tr valign="top">
                                  <td>NIK Kepala Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"><b><%=rec_last.getNikKepLama()%></b></td>
                                </tr>
                                <tr valign="top">
                                  <td>Nama Kepala Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"><b>

<%=rec_last.getNamaKepLama().toString().toUpperCase()%>
</b></td>
 <input type="hidden" name=nama_kep_lma value="<%=rec_last.getNamaKepLama().toString().toUpperCase()%>">
     </tr>
 <tr valign="top">
   <td> Alamat Keluarga yang Ditempati</td>
                                  <td>:</td>

<td colspan="11"> <b><font color="#003366">
<%=rec_last.getAlamat().toString().toUpperCase()%>;
RT <%=(rec_last.getNort()==null)?"-":rec_last.getNort()%>;
RW <%=(rec_last.getNorw()==null)?"-":rec_last.getNorw()%>;
Dusun <%=rec_last.getDusun()%>;</font></b></td>
</tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td>Desa/Kelurahan </td>
                                  <td>:</td>
<td> <font color="#003366"><b><font color="#003366"><b>
<%=rec_last.getNamaKel().toString().toUpperCase()%></b></font></b></font></td>
                                  <td>Kecamatan</td>
                                  <td>:</td>
<td colspan="6"> <b><font color="#003366">
<b><%=rec_last.getNamaKec().toString().toUpperCase()%></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kab/Kota </td>
                                  <td>:</td>
<td> <font color="#003366"><b><font color="#003366">
<%=rec_last.getNamaKab().toString().toUpperCase()%></font></b></font></td>
                                  <td>Provinsi</td>
                                  <td>:</td>
<td colspan="6"> <b><font color="#003366">
<b><font color="#003366"><%=rec_last.getNamaPro().toString().toUpperCase()%><b></b></font></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kode Pos </td>
                                  <td>:</td>
<td><b><font color="#003366"><%=rec_last.getKodepos()%>
                                    </font></b></td>
                                  <td>Telepon</td>
                                  <td>:</td>
<td colspan="6"><b><font color="#003366"><%=rec_last.getTelp()%></font></b></td>
                                </tr>
                               <tr valign="top">
                                  <td>Alasan Menumpang KK</td>
                                  <td>:</td>
                                  <td colspan="9">

 <select name=als_numpang boxdefault2 class="boxdefault">
       <option value="0">-- Pilih Alasan Menumpang KK --</option>
       <option value="1">1 - Karena KK dibawa pindaholeh KepKel</option>
       <option value="2">2 - Karena Pindah tempat tinggal namun tdk membawa KK</option>
  </select>
</td>
</tr>

<input type=hidden value="<%=record1.getNamapra()%>" name=NAMA_PRA>
<input type=hidden value="<%=rec_last.getAlamat()%>" name=alamat>
<input type=hidden value="<%=rec_last.getNort()%>" name=no_rt>
<input type=hidden value="<%=rec_last.getNorw()%>" name=no_rw>
<input type=hidden value="<%=rec_last.getDusun()%>" name=dusun>
<input type=hidden value=<%=rec_last.getKodepos()%> name=kodepos>
<input type=hidden value=<%=rec_last.getTelp()%> name=telp>

<input type=hidden value="<%=rec_last.getNamaKel()%>" name="ditemkel">
<input type=hidden value="<%=rec_last.getNamaKec()%>" name="ditemkec">
<input type=hidden value="<%=rec_last.getNamaKab()%>" name="ditemkab">
<input type=hidden value="<%=rec_last.getNamaPro()%>" name="ditemprop">

<input type=hidden value="<%=record1.getNoPro()%>" name="no_prop_ditem">
<input type=hidden value="<%=record1.getNoKab()%>" name="no_kab_ditem">
<input type=hidden value="<%=record1.getNoKec()%>" name="no_kec_ditem">
<input type=hidden value="<%=record1.getNoKel()%>" name="no_kel_ditem">

<input type=hidden value=<%=nprop%> name=nopr>
<input type=hidden value=<%=nkab%> name=noka>

       <tr valign="top">
                                  <td>Jumlah Anggota Keluarga/Pengikut</td>
                                  <td>:</td>
                                  <td colspan="9">

<input class=boxdefault size=4 name=jml maxlength="2" onKeyUp="return al()">
                                    Orang </td>
                                </tr>
                              </table>
<input type=hidden value=<%=j%> name=sa>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="2">
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
                                    <div align="center"><span class="subtitle">Daftar
                                      Keluarga Pemohon</span></div>
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
                                                <div align="center">Status Hubungan
                                                  dalam Keluarga</div>
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
        record1=(Individu_SudapunyaWna)v.elementAt(i);

%>
                                            <tr>
                                              <td class="C-Field" width="4%">
                                                <div align="center"> <%=i+1%></div>
                                              </td>
                                              <td class="C-Field" width="20%">
                                                <div align="center"><%=record1.getNik()%> </div>
                                              </td>
                                              <td class="C-Field" width="31%">
                                                <div align="center"><%=record1.getNamapra().toString().toUpperCase()%> </div>
                                              </td>
 <td class="C-Field" width="16%">
<%=record1.getStathbkel().toString().toUpperCase()%>
</td>
<input type=hidden value="<%=record1.getStathbkel().trim()%>" name=stkep<%=i%>>

<td class="C-Field" width="19%">
<select  name=stat_hbkel<%=i%> boxdefault2 class="boxdefault" size="1" onchange="checkJenisKelamin(this.form,this,<%=i%>)">
<option value="<%if (source.equals("WNI")){%><%=getStatHubunIdxWni(record1.getStathbkel())%><%}%><%if(source.equals("WNA")){%><%=getStatHubunIdxWna(record1.getStathbkel())%><%}%>" selected>-- Sama dengan Semula--</option>
<%
     for(int cntr=0;cntr<=vt_hbn.size()-1;cntr++)
       {
          String element=(String)vt_hbn.elementAt(cntr);
          if (source.equals("WNA"))
                     {
          if (!(element.trim().equals(record1.getStathbkel().trim())) && !(element.trim().equals("Kepala Keluarga/Head of Family")))
              out.println("<option value=" + (cntr+1)+ ">" + (cntr+1)+ "." + element + "</option>");
                     }
         else if(source.equals("WNI"))
         {
               if (!(element.trim().equals(record1.getStathbkel().trim())) && !(element.trim().equals("Kepala Keluarga")))
              out.println("<option value=" + (cntr+1)+ ">" + (cntr+1)+ "." + element + "</option>");
         }
       }
%>
</select>
                                              </td>
  <td class="C-Field" width="10%">
  <div align="center">
<%
if (status.equals("TJ"))
  {
%>
<input type=checkbox name=che<%=i%> value="<%=record1.getNik()%>" checked onclick="this.checked=true">
<%
  }
else
 {
%>
<input type=checkbox name=che<%=i%> value="<%=record1.getNik()%>">
<%
 }
%>

<input type=hidden name=nama<%=i%> value="<%=record1.getNamapra().toUpperCase()%>">
                       </div>
                       </td>
                       </tr>
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
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="2">
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
                                    <div align="center"><span class="subtitle">Data
                                      Administrasi</span></div>
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
                                        <td><b><%=record.getNamaPetugas()%></b></td>
                                      </tr>
                                      <tr>
                                        <td>NIP Petugas Entri</td>
                                        <td>:</td>
                                        <td><b><%=record.getNipPetugas()%></b></td>
                                        <td>Tanggal Entri</td>
                                        <td>:</td>
                                        <td><b><%=record.getToday()%></b> </td>
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
                                        <td><b>
<input class=boxdefault size=22  value="<%=nama_din.toString().toUpperCase()%>" name=nama_din maxlength="60" onFocus="this.blur()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                          <td>Nama Pejabat<span class="asterish">*</span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=22 value="<%=nama_kep_din.toString().toUpperCase()%>" name=nama_kep_din maxlength="60" onFocus="this.blur()">
                                          </b></td>
                                      </tr>
                                      <tr>
                                          <td>NIP Pejabat<span class="asterish">*</span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=10 value="<%=nip_kep_din%>" name=nip_kep_din maxlength="9" onFocus="this.blur()">
                                          </b></td>
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
                                        <td><b> </b> <b><%=TGL_ENTRI%></b></td>
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
                          <tr>
                            <td valign="top" height="25">&nbsp;</td>
                          </tr>
                        </table>
                      </td>

<input type=hidden value=<%=nama_din%> name=ndin>
<input type=hidden value=<%=nama_kep_din%> name=nkdin>
<input type=hidden value=<%=nip_kep_din%> name=nkedin>

<input type=hidden value=<%=NAMA_PET_ENTRI%> name=NAMA_PET_ENTRI>
<input type=hidden value=<%=NIP_PET_ENTRI%> name=NIP_PET_ENTRI>
<input type=hidden value=<%=TGL_ENTRI%> name=TGL_ENTRI>
<input type=hidden name=TC>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="350" border="0" cellspacing="5" cellpadding="5" align="center" height="55">
                    <tr>
                      <td>
           <div align="center"><b>
   <input class=boxstandard type="button" value=SIMPAN name="btn" onclick="return ditem()">
                    </b>
                   </div>
                      </td>
                      <td>
 <div align="center">
<b>
<%
                         if (status.equals("AL"))
                                   {
                          if (session.getAttribute("no_kel")!=null)
                                 no_kel=(String)session.getAttribute("no_kel");
                          if (session.getAttribute("nama_kel")!=null)
                                nama_kel=(String)session.getAttribute("nama_kel");
                                 %>
                      <input name="klbtn" onClick="return closure('Dis_Per_Wna.jsp?no_kk=<%=no_kk_lama%>&status=<%=status%>&source=<%=source%>&no_kec=<%=no_kec%>&nama_kec=<%=nama_kec%>&no_kel=<%=no_kel%>&nama_kel=<%=nama_kel%>&namakel=<%=nama_kel%>')" class=boxstandard type=button value=KELUAR name="button22">
                                  <%
                                   }
                        else
                             {
                                  %>
              <input name="klbtn" onClick="return closure('<%=record.getModRefFile()%>')" class=boxstandard type=button value=KELUAR name="button22">
                              <%}
                                %>
                          </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                        <div align="center"><font color="#003399"><i>Keterangan
                          : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data
                          harus Diisi</font></i></div>
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
</script>

<%
}
  }
else
{
  response.sendRedirect("index.jsp");
}
 }catch(Exception e) {
System.out.print("Error in NumpangWna_Valid.jsp1=" + e.toString());
}
%>