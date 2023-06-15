<%@ page language="java" import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%!
    UserInfo1 record1=null;
String no_prop,no_kab,no_kec,no_kel;
String no_kk_semula,nik_kep_kel,NAMA_LGKP;
String alamat,no_rt,no_rw,dusun,kodepos,telp;
String als_prmohon,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI,s,chk,stat_hbkel,z,tc;
int sa,count;
Vector vt_agt;
PermohonKK record;
ServiceController factory;
facadePermohonHome home;
facadePermohon remote;
PermohanAnggota agt_detail;
String kk_baru;
String flag;
String sud_pun_flag="";
String namakel="";

String nprop="",nkab="",nkec="",nkel="";
 String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
 String  nama_cmat="",nip_cmat="",nip_lrh="",nama_kep_des="",nama_pet="",nip_pet="";
%>
<%
   try
   {

record1=(UserInfo1)session.getAttribute("remoteRef");

if(record1 != null)
{
    if ((request.getParameter("flg")!=null) && (!(request.getParameter("flg").trim().equals(""))))
     {
    flag=request.getParameter("flg");
    nama_prop=request.getParameter("nama_prop_tmp");
nama_kab= request.getParameter("nama_kab_tmp");
nama_kec=request.getParameter("nama_kec_tmp");
nama_kel=request.getParameter("nama_kel_tmp");
nprop=request.getParameter("no_prop_tmp");
nkab=request.getParameter("no_kab_tmp");
nkec=request.getParameter("no_kec_tmp");
nkel=request.getParameter("no_kel_tmp");
nama_cmat=request.getParameter("nama_cmat_tmp");
nip_cmat=request.getParameter("nip_cmat_tmp");
nip_lrh=request.getParameter("nip_lrh_tmp");
nama_kep_des=request.getParameter("nama_kep_des_tmp");
  no_prop=nprop;
  no_kab=nkab;
   no_kec=nkec;
  no_kel=nkel;
  namakel=nama_kel;
System.out.println("Inside FLAG CONDITION");
     }
    else
     {
System.out.println("OutSide FLAG CONDITION");
   no_prop=request.getParameter("no_prop");
   no_kab=request.getParameter("no_kab");
   no_kec=request.getParameter("no_kec");
   no_kel=request.getParameter("no_kel");
   namakel=request.getParameter("namakel");
     }

no_kk_semula=request.getParameter("no_kk_semula");
nik_kep_kel=request.getParameter("nik_kep_kel");
System.out.println("nik_kep_kel" + nik_kep_kel);
NAMA_LGKP=request.getParameter("NAMA_LGKP");
alamat=request.getParameter("alamat");
no_rt=request.getParameter("no_rt");
no_rw=request.getParameter("no_rw");
dusun=request.getParameter("dusun");
kodepos=request.getParameter("kodepos");
telp=request.getParameter("telp");
als_prmohon=request.getParameter("als_prmohon");
sa=Integer.parseInt(request.getParameter("sa"));
NAMA_PET_ENTRI=request.getParameter("NAMA_PET_ENTRI");
NIP_PET_ENTRI=request.getParameter("NIP_PET_ENTRI");
TGL_ENTRI=request.getParameter("TGL_ENTRI");

//sud_pun_flag=request.getParameter("switch");

tc=request.getParameter("TC");
StringTokenizer st = new StringTokenizer(tc,",");
vt_agt=new Vector();

System.out.println(no_kk_semula);

 while (st.hasMoreTokens())
{
   agt_detail=new PermohanAnggota(st.nextToken(),st.nextToken());
   vt_agt.add(agt_detail);
  System.out.println("From JSP-> NIK=" + agt_detail.getNik());
  System.out.println("From JSP-> HUBUN" +agt_detail.getStatHubun());
 }
record=new PermohonKK(nik_kep_kel,NAMA_LGKP,no_kk_semula,alamat,no_rt.trim(),no_rw.trim(),dusun,kodepos,telp,als_prmohon,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI,no_prop,no_kab,no_kec,no_kel);
record.setAngotta(vt_agt);

   factory=ServiceController.getInstance();

    home = (facadePermohonHome)
   factory.lookup("facadePermohon",facadePermohonHome.class);
    remote = home.create();
    kk_baru = remote.setKKPermohon(record);

   System.out.println("kk_baru" + kk_baru);

    if (kk_baru!=null)
	{
    //System.out.println("New KK Generated=" + kk_baru);
    //System.out.println("Flag =" + flag);
    // System.out.println("Flag =" + flag);
  if ((flag!=null) && (!(flag.trim().equals(""))))
  {
%>
<jsp:forward page="Dis_Per_Wni.jsp">
<jsp:param name="fg" value="<%=flag%>"/>
<jsp:param name="nama_prop_tmp" value="<%=nama_prop%>"/>
<jsp:param name="nama_kab_tmp" value="<%=nama_kab%>"/>
<jsp:param name="nama_kec_tmp" value="<%=nama_kec%>"/>
<jsp:param name="nama_kel_tmp" value="<%=nama_kel%>"/>
<jsp:param name="no_prop_tmp" value="<%=nprop%>"/>
<jsp:param name="no_kab_tmp" value="<%=nkab%>"/>
<jsp:param name="no_kec_tmp" value="<%=nkec%>"/>
<jsp:param name="no_kel_tmp" value="<%=nkel%>"/>
<jsp:param name="nama_cmat_tmp" value="<%=nama_cmat%>"/>
<jsp:param name="nip_cmat_tmp" value="<%=nip_cmat%>"/>
<jsp:param name="nip_lrh_tmp" value="<%=nip_lrh%>"/>
<jsp:param name="nama_kep_des_tmp" value="<%=nama_kep_des%>"/>
</jsp:forward>
<%
   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">

<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/kkbaru.js">
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2
text="#000000" onload="window.history.forward(1)">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0"
align="center" height="720">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="45">
                              <div align="center"><span class="submenu">Permohonan
                                KK Baru WNI</span><br>
                                <span class="linkyellow">Yang Sudah Punya NIK</span>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table width="750" border="0" cellspacing="3" cellpadding="2"
align="center">
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif"
width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif"
width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="10"><img src="images/dot.gif"
width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Provinsi</td>
                            <td>:</td>
                            <td>
  <%=record1.getNoProp()%>
                            </td>
                            <td nowrap>
<%=record1.getNamaProp()%>
                            </td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td>:</td>
                            <td>
<%=record1.getNoKab()%>
                            </td>
                            <td nowrap>
   <%=record1.getNamaKab()%>
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kecamatan</td>
                           <td>:</td>
                            <td>
<%=record1.getNoKec()%>
                            </td>
                            <td nowrap>
<%=record1.getNamaKec()%>
                            </td>
                            <td>&nbsp;</td>
                            <td>Kode-Nama Desa/Kelurahan</td>
                            <td>:</td>
                            <td width="8">
   <%=no_kel%>                           </td>
                    <td nowrap>
<%=namakel%>
                            </td>
                          </tr>
                          <tr>
                            <td height="10"><img src="images/dot.gif" width="1"
height="10"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                   </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="447">
                  <table width="95%" border="0" cellspacing="0" cellpadding="0"
align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1"
height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0"
align="center" height="100">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0"
cellpadding="0">
                                <tr>
                                  <td height="25" valign="middle">
                                    <div align="center"><span class="subtitle">Data
                                      Permohonan KK Baru WNI</span></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="center"><img src="images/batas_dot.gif"
width="461" height="1"></div>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" height="236">
                              <table width="100%" border="0" cellspacing="3"
cellpadding="3" align="center">
                                <tr>
                                  <td colspan="13"><font face="Verdana, Arial,
Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="images/dot.gif" width="1"
height="10"></b></font></td>
                                </tr>
                                <form name=nokksemula action="Daftar_Keluarga.jsp"
method=post>
                                  <tr valign="top">
                                    <td width="200"> Nomor Kartu Keluarga Semula<span
class="asterish">*</span>
                                    </td>
                                    <td>:</td>
                                    <td colspan="11">
<%=no_kk_semula%>             <b> </b></td>
                                  </tr>
                                </form>
                                <tr valign="top">
                                  <td> NIK Pemohon KK(sebagai Kepala Keluarga
                                    Baru)<span class="asterish">*</span></td>
                                  <td>:</td>
                                  <td colspan="11">
   <%=nik_kep_kel%>
 </td>
                                </tr>
                                <tr valign="top">
                                  <td> Nomor Kartu Keluarga Baru</td>
                                  <td>:</td>
                                  <td colspan="11"><font
color="red"><b><%=kk_baru%></b></font></td>
                                </tr>
                                <tr valign="top">
                                  <td> Nama Lengkap</td>
                                  <td>:</td>
                                  <td colspan="11"><b><%=NAMA_LGKP%></b></td>
                                </tr>
                                <tr valign="top">
                                  <td> Alamat KK Pemohon</td>
                                  <td>:</td>
                                  <td colspan="11"> <b><font color="#003366">
                                  <%=alamat.toString().toUpperCase()%>;
RT <%=no_rt%>;
RW <%=no_rw%>; Dusun <%=dusun%></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td>Desa/Kelurahan </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font
color="#003366"><b><%=no_kel%></b></font></b></font></td>
                                  <td>Kecamatan</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font
color="#003366"><b><%=no_kec%></b>
                                    </font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kab/Kota </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font
color="#003366"><%=no_kab%></font></b></font></td>
                                  <td>Provinsi</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font color="#003366"><b><font
color="#003366"><%=no_prop%><b></b></font></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kode Pos </td>
                                  <td>:</td>
                                  <td><b><font color="#003366"><%=kodepos%>;
                                    </font></b></td>
                                  <td>Telepon</td>
                                  <td>:</td>
                                  <td colspan="6"><b><font
color="#003366"><%=telp%></font></b></td>
                                </tr>
                              </table>
                              <p>&nbsp;</p>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="2"><img src="images/v_sdt_kr_btm.gif" width="5"
height="5"></td>
                      <td height="2"><img src="images/dot.gif" width="1" height="1"
hspace="1"></td>
                      <td height="2"><img src="images/v_sdt_kn_btm.gif" width="5"
height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="450" border="0" cellspacing="5" cellpadding="5"
align="center">
                    <tr>
                      <td>
                        <div align="center"><b>
     <input class=boxstandard type=button value=KELUAR name="submit2322" onclick="document.location='WNI_Menu.jsp'">
                          </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                        <div align="center"><h4><font color=red>Data Sudah disimpan !</font></h4>
                  </div>
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
<%
}
else
{
%>
<div align="center">
  <h4><font color="red">Contact Administrator !</font></h4>
</div>
<%
}
%>

<p class="linkyellow">&nbsp;</p>
</BODY></HTML>
<%}
else
{
  response.sendRedirect("index.jsp");
}
}
catch(Exception err)
{
err.printStackTrace();
         System.out.println(err.toString());
response.sendRedirect("index.jsp");
}
finally
{
          remote.remove();
}
%>
