<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,datawilayah.*,com.db.connection.ServiceController"%>
<%@ include file="Global.jsp"%>
<%
    int i,j;
    Vector v_prop;
    String select,id1=null;
   nprop=request.getParameter("np");
   no_prop=request.getParameter("no_prop");
   v_prop= getPropinsiList();
%>
<%
try{
if (session.getAttribute("remoteRef")!=null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="Microsoft FrontPage 4.0" name=GENERATOR>

</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="frm" method="post" action="DataInput_Parameter.jsp">
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
                          Kabupaten/Kota</span></div>
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

<input type="hidden" name="np" value="<%=nprop%>">

                              <select name="nama_prop"
 onChange="able();frm.no_prop.value=frm.nama_prop.options[this.selectedIndex].value;np.value=frm.nama_prop.selectedIndex" class="boxdefault">

<option>-- Pilih Provinsi --</option>

<%
for(int k=0;k<v_prop.size();k++)
{
%>
<option value="<%=((jmlpddk.agama.ListProp)v_prop.elementAt(k)).getNo_prop()%>">
 <%=((jmlpddk.agama.ListProp)v_prop.elementAt(k)).getNama_prop()%></option>
<%
}
%>


                              </select>

                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input class=boxdefault size=4 name="no_kab" maxlength="2" onKeyup="frm.sim.disabled=false;return test()">
                            </td>
                            <td width="80">
                              <input class=boxdefault size=22 name="nama_kab" onKeyUP="return test1()">
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
                                <input class=boxstandard type="submit" value="SIMPAN" name="sim" disabled onclick="return blank()">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value="TAMPILKAN" name="tam" disabled>
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value="KELUAR" name="kel" onclick="document.location='menu_wilayah.jsp'">
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
<p class="linkyellow">&nbsp;</p>


<%
if(request.getParameter("no_prop") != null)
{
  if(request.getParameter("i").equals("1"))
  {%>
    <script language="JavaScript">

      document.all["no_prop"].value="<%=no_prop%>"
      document.all["nama_prop"].selectedIndex=<%=nprop%>

    </script>


  <%
  }
  else if(request.getParameter("i").equals("2"))
  {%>
    <script language="JavaScript">
      alert("Data sudah ada!.")

      document.all["nama_prop"].selectedIndex=<%=nprop%>
      document.all["no_prop"].value="<%=no_prop%>"
      frm.tam.disabled=false

 </script>
 <%
  }
}
%>
<SCRIPT language=JavaScript src="scripts/kabu_vali1.js">
</script>

<SCRIPT language=JavaScript>
document.all["no_kab"].focus()
</SCRIPT>
</form>
</BODY>
</HTML>
<%
}
else
{
response.sendRedirect("index.jsp");
}

}catch(Exception err)
{
err.printStackTrace();
}
%>