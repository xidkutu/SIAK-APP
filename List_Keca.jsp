<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,setupwilayah.*,com.db.connection.ServiceController,pendaftaran.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<script language=javascript src="Templates/validation.js">
</script>
<SCRIPT language=javascript src="Templates/nokec.js">
</Script>
<SCRIPT language=javascript src="Templates/namakec.js">
</Script>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
 <%!
 ServiceController factory1;
 String select,nama_prop,sql2,nama_kab;
 String nprop,nkab,no_prop,no_kab;
 int i;
   String flag;
   Vector b;
   int ii,j,k,l,z;
   TemkecHome home1;
   Temkec remoteWilayalist1;
   String u,w;
%>

<%
  nprop=request.getParameter("nprop");
  nkab=request.getParameter("nkab");
  no_prop=request.getParameter("no_prop");
  no_kab=request.getParameter("no_kab");
  flag=request.getParameter("flag");

  System.out.println("nprop="+nprop);
  System.out.println("nkab="+nkab);
  System.out.println("no_prop="+no_prop);
  System.out.println("no_kab="+no_kab);
  System.out.println("flag="+flag);
%>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
<FORM action="SetupKec.jsp" method=post name="setupkec">
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
                          Kecamatan</span></div>
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
                                class=boxdefault size=4 name=no_prop onFocus="this.blur()" maxlength="2" value='<%=no_prop%>'>
                            </td>
                            <td width="80">
                              <select
onChange="no_prop.value=this.value;nprop.value=this.selectedIndex;pilih_kab_with_textbox(setupkec.no_prop.value, setupkec.no_kab, setupkec.nama_kab, null, null, null, null);"
                  name=nama_prop boxdefault2 class="boxdefault">
                                <option>-- Pilih Provinsi --</option>
                          </select>
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td width="10"> :</td>
                            <td width="4">
<input class=boxdefault size=4 name=no_kab onFocus="this.blur()"  maxlength="2" value='<%=no_kab%>'>
                            </td>
                            <td width="80">
<select
onchange="no_kab.value=this.value;nkab.value=this.selectedIndex;setupkec.T.disabled=false"
                  name=nama_kab boxdefault2 class="boxdefault" >
                                <option>-- Pilih Kabupaten/Kota --</option>

                              </select>

<input type="hidden" name="nprop" value="<%=nprop%>">
<input type="hidden" name="nkab" value="<%=nkab%>">
<input type="hidden" name="flag" value="<%=flag%>">
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kecamatan</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name=no_kec maxlength="2" onKeyUp="noke()">
                            </td>
                            <td width="80">
                              <input
                                class=boxdefault size=22 name=nama_kec  maxlength="60" onKeyUp="namake()">
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
                                <input class=boxstandard type="submit" value=SIMPAN name="SIM" onClick="return validate(no_kec,nama_kec)">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value=TAMPILKAN KK name="T" onclick="op()" disabled>
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="button" value=KELUAR name="kel" onclick="document.location='menu_wilayah.jsp'">
                                </b></td>
                            </tr>
                          </table>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
<%-- Get the parameter from client --%>
<%
 try
   {
      factory1=ServiceController.getInstance();
      home1=(TemkecHome)factory1.lookup("Temkec",TemkecHome.class);
      remoteWilayalist1 = home1.create();
      b=new Vector();
      b = remoteWilayalist1.show(no_prop,no_kab);
      j=b.size();
      k=j/4;
l=0;
z=1;
ii=0;
%>
<%
      if(b.isEmpty())
      {
%>
<td>
<div align="center"><h3><font color="red">Data Belum Ada !</font></h3></div></td>
<%
        //out.println("No Data Available");
}
else
{
%>
                   <tr>
                      <td colspan="4" height="25">
                        <div align="center"><span class="subtitle">Daftar Kecamatan</span></div>
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
                              <div align="center">Kode Kecamatan</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Nama Kecamatan</div>
                            </td>
                          </tr>
                          <tr>
<%
while(ii<j) {
%>
                            <td class="C-Field">
                              <div align="center"> <%=z%>.</div>
                            </td>
                            <td class="C-Field">
                              <div align="center">
                                <%=b.elementAt(ii)%>
                              </div>
                            </td>
                            <td class="C-Field">
                              <div align="center">
                                 <%=b.elementAt(ii+1).toString().toUpperCase()%>
                              </div>
                            </td>
                          </tr>
 <%
z=z+1;
ii=ii+2;
}
%>
                        </table>
                      </td>
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
<%
  }
}   catch (Exception ne)  {System.out.print("Error in jsp2=" + ne.toString());}
%>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>

<script   language="javascript">
  if (document.all['flag'].value=="1") {
    alert("Data Sudah disimpan");
 }
</SCRIPT>
</form>
</BODY>


<script language="javascript">
pilih_prop_with_textbox(setupkec.no_prop,setupkec.nama_prop,setupkec.no_kab,setupkec.nama_kab,null,null,null,null);
document.all["nama_prop"].selectedIndex=<%=nprop%>
document.all["no_prop"].value="<%=no_prop%>"
pilih_kab_with_textbox(setupkec.no_prop.value, setupkec.no_kab, setupkec.nama_kab, null, null, null, null);
document.all["nama_kab"].selectedIndex=document.all["nkab"].value;
document.all["no_kab"].value="<%=no_kab%>"
</script>

<SCRIPT language=JavaScript>
setupkec.no_kec.focus();
function op()
{
if(setupkec.no_prop.value=="")
{
setupkec.no_prop.value=0;
}
setupkec.nama_prop.value="  ";

if(setupkec.no_kab.value=="")
{
setupkec.no_kab.value=0;
}
setupkec.nama_kab.value="  ";
setupkec.no_kec.value=0;
setupkec.nama_kec.value="  ";
}

</script>
</HTML>