<%@ page import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
ServiceController factory=null;
%>

<%
String no_kk_semula="",nik_kep_kel="",NAMA_PRA="",nama="",ni="",na="";
String alamat="",no_rt="",no_rw="",dusun="",kodepos="",telp="";
String als_prmohon="",jml="",nama_din="",nama_kep_din="",nip_kep_din="",NAMA_PET_ENTRI="",NIP_PET_ENTRI="",TGL_ENTRI="",tc="";
int sa=0;
Vector vt_agt=null;
PermohonKK_Wna record=null,out_rec=null;
WnaKKHome home=null;
WnaKK remote=null;
PermohanAnggota agt_detail=null;
String status="NL";  //NL-Normal Entry,AL-Asal,TJ-Tujuan
int agtcntr=0;
String source="";
UserInfo1 record3=null;
String script_str="";
String form_opn="",form_close="";;
%>
<%
try
{
      record3=(UserInfo1)session.getAttribute("remoteRef");
 if(record3 != null)
{

/*	no_prop=request.getParameter("nopr");
	no_kab=request.getParameter("noka");
	no_kec=request.getParameter("noke");
	no_kel=request.getParameter("nokl");
*/

/*   New Version Begin*/
      no_prop=record3.getNoProp();
      no_kab=record3.getNoKab();
      no_kec=request.getParameter("no_kec");
      no_kel=request.getParameter("nokl");
/*   New Version End*/


/*	nama_prop=request.getParameter("nama_prop");
	nama_kab=request.getParameter("nama_kab");
	nama_kec=request.getParameter("nama_kec");
	nama_kel=request.getParameter("nama_kel");
*/

/*   New Version Begin*/

        nama_prop=record3.getNamaProp();
        nama_kab=record3.getNamaKab();
        nama_kec=request.getParameter("nama_kec");
        nama_kel=request.getParameter("nama_kel");

/*   New Version End*/

	no_kk_semula=request.getParameter("no_kk_semula");
	nik_kep_kel=request.getParameter("nik_kep_kel");
	nama=request.getParameter("nikna");


if (request.getParameter("source")!=null) source=request.getParameter("source").trim();

    if (request.getParameter("status")!=null)
     {
       status=request.getParameter("status").trim().toUpperCase();
     }

	StringTokenizer st1 = new StringTokenizer(nama,"@");

	while (st1.hasMoreTokens())
		{
	   ni=st1.nextToken();
	   na=st1.nextToken();

		   if(ni.equals(nik_kep_kel.trim()))
			   {
		    NAMA_PRA=na;
			   }
		}

	alamat=request.getParameter("alamat");
	no_rt=request.getParameter("no_rt");
	no_rw=request.getParameter("no_rw");
	dusun=request.getParameter("dusun");
	kodepos=request.getParameter("kodepos");
	telp=request.getParameter("telp");
	als_prmohon=request.getParameter("als_prmohon");
	sa=Integer.parseInt(request.getParameter("sa"));
	nama_din=request.getParameter("ndin");
	nama_kep_din=request.getParameter("nkdin");
	nip_kep_din=request.getParameter("nkedin");
	NAMA_PET_ENTRI=request.getParameter("NAMA_PET_ENTRI");
	NIP_PET_ENTRI=request.getParameter("NIP_PET_ENTRI");
	TGL_ENTRI=request.getParameter("TGL_ENTRI");
	tc=request.getParameter("TC");

			StringTokenizer st = new StringTokenizer(tc,"@");
				vt_agt=new Vector();

				 while (st.hasMoreTokens())
					 {
				   agt_detail=new PermohanAnggota(st.nextToken(),st.nextToken());
					agtcntr++;
				   vt_agt.add(agt_detail);
					 }

	record=new PermohonKK_Wna(nik_kep_kel,NAMA_PRA,no_kk_semula,alamat,no_rt,no_rw,dusun,kodepos,telp,als_prmohon,nama_din,nama_kep_din,nip_kep_din,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI,no_prop,no_kab,no_kec,no_kel);
	record.setAngotta(vt_agt);
        factory=ServiceController.getInstance();

    home = (WnaKKHome) factory.lookup("WnaKK",WnaKKHome.class);
    remote = home.create();

String new_kk="";

    if ((status!=null) && (status.trim().equals("TJ")))
    {
    new_kk=remote.genNewKK(no_prop,no_kab,no_kec);
    }
   else
    {
System.out.println("New KK Enterded from Menu here !!!!!");
    new_kk = remote.setNewKKSudahPunya(record,source);
    }

if ((new_kk !=null)  && !(new_kk.trim().equals("")))
{

if ((status!=null) && (status.trim().equals("AL")))
  {
    script_str="frmdis.submit()";
    form_opn="<form method='post' action='Dis_Per_Wna.jsp' name='frmdis'>";
    form_close="</form>";
  }

if  ((status!=null) && (status.trim().equals("NL")))
{
  script_str="closure('"+ record3.getModRefFile() + "')";

  form_opn="";
  form_close="";
}

if  ((status!=null) && (status.trim().equals("TJ")))
{
  script_str="valueTujuanSetter()";
  form_opn="";
  form_close="";
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/kkbaru.js">
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
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<%=form_opn%>
<%
if  ((status!=null) && (status.trim().equals("NL")))
{
%>

    <input type="hidden" name="status" value="<%=status%>">
    <input type="hidden" name="source" value="<%=source%>">
<%
}
else if ((status!=null) &&  ((status.trim().equals("AL")) || (status.trim().equals("TJ"))))
{
%>
<input type="hidden" name="status" value="<%=status%>">
<input type="hidden" name="source" value="<%=source%>">

<input type="hidden" name="no_kk"  value="<%=no_kk_semula%>">
<input type="hidden" name="no_prop"  value="<%=no_prop%>">
<input type="hidden" name="no_kab"  value="<%=no_kab%>">
<input type="hidden" name="no_kec"  value="<%=no_kec%>">
<input type="hidden" name="no_kel"  value="<%=no_kel%>">

<input type="hidden" name="nama_propinsi"  value="<%=nama_prop%>">
<input type="hidden" name="nama_kabupaten"  value="<%=nama_kab%>">
<input type="hidden" name="nama_kec"  value="<%=nama_kec%>">
<input type="hidden" name="nama_kel"  value="<%=nama_kel%>">
<%
}
%>
<div align="center">
<table  width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
        <td ><jsp:include page="top.html"/> </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="5" cellpadding="5">
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
                                KK Baru <%=source%></span><br>
                                <span class="linkyellow">Yang Sudah Punya NIK</span>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                    <td  valign="top"><table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" valign="middle">
                                    <div align="center"><span class="subtitle">Data
                                      Permohonan KK Baru <%=source%></span></div>
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
                            <td valign="top" height="236">
                              <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                                <tr>
                                  <td colspan="13"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="images/dot.gif" width="1" height="10"></b></font></td>
                                </tr>
                                  <tr valign="top">
                                    <td width="200"> Nomor Kartu Keluarga Semula<span class="asterish">*</span>
                                    </td>
                                    <td>:</td>
                                    <td colspan="11">
                         <b><%=no_kk_semula%> </b></td>
                                  </tr>
                      <tr valign="top">
                                  <td> NIK Pemohon KK(sebagai Kepala Keluarga
                                    Baru)<span class="asterish">*</span></td>
                                  <td>:</td>
                                  <td colspan="11">
                                       <b><%=nik_kep_kel%></b>
                                  </td>
                                </tr>
                                <tr valign="top">
                                  <td> Nomor Kartu Keluarga Baru</td>
                                  <td>:</td>
                                  <td colspan="11"><font color="red"><b><%=new_kk%></b></font></td>
                                </tr>
                                <tr valign="top">
                                  <td> Nama Lengkap</td>
                                  <td>:</td>
                                  <td colspan="11"><b><%=NAMA_PRA%></b></td>
                                </tr>
                                <tr valign="top">
                                  <td> Alamat KK Pemohon</td>
                                  <td>:</td>
                                  <td colspan="11"> <b><font color="#003366">
                                    <%=alamat.toString().toUpperCase()%>; RT <%=no_rt%>;
                                    RW <%=no_rw%>; Dusun <%=dusun.toString().toUpperCase()%></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td>Desa/Kelurahan </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366"><b><%=nama_kel%></b></font></b></font></td>
                                  <td>Kecamatan</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font color="#003366"><b><%=nama_kec%></b>
                                    </font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kab/Kota </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366"><%=nama_kab%></font></b></font></td>
                                  <td>Provinsi</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font color="#003366"><b><font color="#003366">
                               <%=nama_prop%><b></b></font></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kode Pos </td>
                                  <td>:</td>
                                  <td><b><font color="#003366"><%=kodepos%></font></b></td>
                                  <td>Telepon</td>
                                  <td>:</td>
                                  <td colspan="6"><b><font color="#003366"><%=telp%></font></b></td>
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
                      <td height="2"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td height="2"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td height="2"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>

                  </table>
                 </td>
              </tr>

                    <tr>
                      <td>
                      <br>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR onclick="<%=script_str%>">
                          </b></div>
                      </td>
                    </tr>
<tr>
<td colspan="3">
<div align="center"><b>
                    <h4> <font color=red>        <%=printInfo("Data Sudah disimpan !")%></font></h4></b></div>
 </td>
</tr>
<td>
</td>
</tr>
 </table>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</div>
<%=form_close%>
<%if ((status!=null) && (status.trim().equals("TJ")))
{
%>
<script language="javascript">
function valueTujuanSetter()
{
opener.document.all['no_kk_tujuan'].value="<%=new_kk%>"
opener.document.all['nama_kk_asal'].value="<%=NAMA_PRA%>"

opener.document.all['nama_prop_tuj'].value="<%=nama_prop%>"
opener.document.all['nama_prop_tuj'].disabled=true
opener.document.all['nama_kab_tuj'].value="<%=nama_kab%>"
opener.document.all['nama_kab_tuj'].disabled=true
opener.document.all['nama_kec_tuj'].value="<%=nama_kec%>"
opener.document.all['nama_kec_tuj'].disabled=true
opener.document.all['nama_kel_tuj'].value="<%=nama_kel%>"
opener.document.all['nama_kel_tuj'].disabled=true

opener.document.all['namaprop_tjpndh'].value="<%=nama_prop%>"
opener.document.all['namakab_tjpndh'].value="<%=nama_kab%>"
opener.document.all['namakec_tjpndh'].value="<%=nama_kec%>"
opener.document.all['namakel_tjpndh'].value="<%=nama_kel%>"

opener.document.all['no_prop_tuj'].value="<%=no_prop%>"
opener.document.all['no_kab_tuj'].value="<%=no_kab%>"
opener.document.all['no_kec_tuj'].value="<%=no_kec%>"
opener.document.all['no_kel_tuj'].value="<%=no_kel%>"

<%
//System.out.println("Anggota Acounter !!!!!"+ agtcntr);

if ((status!=null) && (status.trim().equals("TJ")))
   {
for(int cntr=0;cntr<agtcntr;cntr++)
   {
 if ((((PermohanAnggota)vt_agt.elementAt(cntr)).getStatHubun() !=null) && !((PermohanAnggota)vt_agt.elementAt(cntr)).getStatHubun().trim().equals("0")&& !((PermohanAnggota)vt_agt.elementAt(cntr)).getStatHubun().trim().equals(""))
   {
           String hubun=getStatHubunganWna(((PermohanAnggota)vt_agt.elementAt(cntr)).getStatHubun());
           out.println("opener.document.all['shdk" + cntr + "'].value='" + hubun + "'");
   }
   }
}
%>
self.close();
}
</script>
<%
}
%>
<%
 }
else
{
%>
<html>
<body>
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
<div align="center">
<h4><font color="red"><%=printInfo("Contact Administrator !")%></font></h4>
<br>
<input type="hidden" name="status" value="<%=status%>">
<input type="hidden" name="source" value="<%=source%>">
  <input class=boxstandard type=button value=KELUAR  onclick="return closure('<%=record3.getModRefFile()%>')" >
</div>
</body>
</html>
<%
}
%>
<p class="linkyellow">&nbsp;</p>
</BODY>
</HTML>
<%
}
else
{
  response.sendRedirect("index.jsp");
}
  }
catch(Exception err)
{
   err.printStackTrace();
}
%>


