<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,datawilayah.*,com.db.connection.ServiceController"%>

<%!
    String nama_prop,nama_kab,flag=null;
    String no_prop,no_kab,no_prop1,no_kec;
    int i,j;
    int ii,jj,kk,ll,zz;
    String nprop,nkab,nkec;
    String login=null,pwd=null,no_kel,nama_kel,select,id1=null;
    Vector v = null;
    ServiceController factory;
    String prop;
    KelHome home;
    Kel remote;

%>

<%
   factory=ServiceController.getInstance();

   nprop=request.getParameter("nprop");
   nkab=request.getParameter("nkab");
   nkec=request.getParameter("nkec");
   no_prop=request.getParameter("no_prop");
   no_kab=request.getParameter("no_kab");
   no_kec=request.getParameter("no_kec");
   flag=request.getParameter("flag");
System.out.println("nprop=" +nprop);
System.out.println("nkab="+nkab);
System.out.println("nkec="+nkec);
System.out.println("no_prop="+no_prop);
System.out.println("no_kab="+no_kab);
System.out.println("no_kec="+no_kec);
System.out.println("flag="+flag);
   try
   {
      v = new Vector();
if (session.getAttribute("remoteRef")!=null)
{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>

<TITLE>adminduk SIAK online</TITLE>

<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</script>
<META content="Microsoft FrontPage 4.0" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="form1" method="post" action="Data_Kel_Input.jsp">
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
                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span class="subtitle">Setup Wilayah
                          Desa/Kelurahan</span></div>
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
                    <tr>
                      <td>
                        <table width="450" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td>Kode-Nama Provinsi</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name=no_prop onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">

<input type="hidden" name="nprop" value="<%=nprop%>">
<input type="hidden" name="nkab" value="<%=nkab%>">
<input type="hidden" name="nkec" value="<%=nkec%>">
<input type="hidden" name="flag" value="<%=flag%>">
<select name="nama_prop"
onClick="document.all['no_prop'].value=this.value;nprop.value=this.selectedIndex; pilih_kab_with_textbox(form1.no_prop.value, form1.no_kab, form1.nama_kab, form1.no_kec, form1.nama_kec, null, null);able();" class="boxdefault">

<option>-- Pilih Provinsi --</option>
</select>
                  </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name=no_kab onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">
<select class="boxdefault"
name="nama_kab" onChange="no_kab.value=this.value;nkab.value=this.selectedIndex;pilih_kec_with_textbox(form1.no_prop.value, form1.no_kab.value, form1.no_kec, form1.nama_kec, null, null);able()">
<option>-- Pilih Kabupaten/Kota --</option>
</select>
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kecamatan</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                 class=boxdefault size=4 name="no_kec" onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">
                                <select name="nama_kec"
onChange="no_kec.value=this.value;nkec.value=this.selectedIndex;able()"  boxdefault2 class="boxdefault">
<option>-- Pilih Kecamatan --</option>
       </select>

                            </td>
                          </tr>
                          <tr>
                            <td width="185">Kode-Nama Desa/Kelurahan</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name="no_kel" maxlength="4" onKeyUp="form1.sim.disabled=false;return test()">
                            </td>
                            <td width="80">
                              <input
                                class=boxdefault size=22 name="nama_kel" maxlength="60" onKeyUp="return test1()">
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr valign="bottom">
                      <td height="45" valign="top">
                        <div align="center"></div>
                        <div align="center"><b> </b>
                          <table width="100" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                              <td><b>
                                <input class=boxstandard type="submit" value="SIMPAN" name="sim" disabled onClick="return validate(form1.no_kel,form1.nama_kel)">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value="TAMPILKAN" name="tam">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value="KELUAR" name="kel">
                                </b></td>
                            </tr>
                          </table>

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
<center>
<%

if(request.getParameter("no_prop") != null && request.getParameter("no_kab") != null && request.getParameter("no_kec") != null)
{
  try
  {
      home=(KelHome)factory.lookup("KelBean",KelHome.class);
      remote = home.create();

      v = remote.list(request.getParameter("no_prop").trim(),request.getParameter("no_kab").trim(),request.getParameter("no_kec").trim());

   }
  catch(Exception ee)
  {
   out.println("Exception in vector : " + ee);
  }

  if(v.isEmpty())
  {
    out.println("<h3><font color=red>Data belum ada !.");
  }
else
{
     jj=v.size();
      kk=jj/4;
      ll=0;
      zz=1;
%>
              <tr>
                <td valign="top">
                  <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="25">
                        <div align="center"><span class="subtitle">Daftar Desa/Kelurahan</span></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="15">&nbsp; </td>
              </tr>
              <tr>
                <td>
                  <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td class="C-BG">
                        <table width="500" border="0" cellspacing="1" cellpadding="3">
                          <tr>
                            <td class="C-Fonts">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Kode Desa/Kelurahan
</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Nama Desa/Kelurahan
</div>
                            </td>
                          </tr>
<%
for(ii = 0; ii < jj;ii=ii+2)
{

%>
                          <tr>
                            <td class="C-Field">
                              <div align="center"> <%=zz%>.</div>
                            </td>
                            <td class="C-Field">
                              <div align="center">
                                <%=v.elementAt(ii)%>
                              </div>
                            </td>
                            <td class="C-Field">
                              <div align="center">
                               <%=v.elementAt(ii+1).toString().toUpperCase()%>
                              </div>
                            </td>
</tr>
<%

zz=zz+1;

}
}%>
                        </table>

</td></tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td height="5" width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
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
<%
     }
%>

<SCRIPT language="javascript">
  if (document.all['flag'].value=="1") {
  alert("Data Sudah disimpan !");
}
      pilih_prop_with_textbox(form1.no_prop,form1.nama_prop,form1.no_kab,form1.nama_kab,form1.no_kec,form1.nama_kec,null,null);
      document.all["nama_prop"].selectedIndex=<%=nprop%>
      document.all["no_prop"].value="<%=no_prop%>"
      pilih_kab_with_textbox(form1.no_prop.value, form1.no_kab, form1.nama_kab, form1.no_kec, form1.nama_kec, null, null);
      document.all["nama_kab"].selectedIndex=<%=nkab%>
      document.all["no_kab"].value="<%=no_kab%>"
      pilih_kec_with_textbox(form1.no_prop.value, form1.no_kab.value, form1.no_kec, form1.nama_kec, null, null);
      document.all["nama_kec"].selectedIndex=<%=nkec%>
      document.all["no_kec"].value="<%=no_kec%>"
</script>
<tr>
    <td>&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>
</center>



<SCRIPT language=JavaScript>
document.all["no_kel"].focus();
</SCRIPT>
</form>
<SCRIPT language=JavaScript src="scripts/validation1.js">
</SCRIPT>
</BODY>
</HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e)
   {
e.printStackTrace();
   }

%>

