<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,pendaftaran.*,com.db.connection.*"%>
<%!
   String no_kk;
   Vector b;
   int i,j,k,l,z;
  // Context SessionContext;
   WNIBiodataHome home;
   WNIBiodata remote;
  ServiceController factory=null;
%>

<%
   try
   {
if (session.getAttribute("remoteRef")!=null)
{


  no_kk=request.getParameter("no_kk");

      factory=ServiceController.getInstance();
      home=(WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);
      remote = home.create();
      b=new Vector();
      b = remote.list(no_kk);
      j=b.size();
      k=j/4;
l=0;
i=0;
z=1;
%>

<html>
<head>
<TITLE>adminduk SIAK online</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>

<body bgcolor="#93BEE2" text="#93BEE" onload="window.history.forward(1)">

<%
      if(b.isEmpty())
      {%>
<table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr> </tr>
    <tr>
      <td>
        <table border="0" cellspacing="3" cellpadding="2" align="center">
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
           <td colspan="3" height="25">

              <div align="center"><span class="subtitle">Daftar Keluarga WNI</span></div>
                            </td>
          </tr>
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
<% out.println("<h3><center><font color=red>Data belum ada !.");%>
            </td>
       <%}
else
{
%>
<form name="form1" method="post" action="">
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr> </tr>
    <tr>
      <td>
        <table border="0" cellspacing="3" cellpadding="2" align="center">
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
           <td colspan="3" height="25">

              <div align="center"><span class="subtitle">Daftar Keluarga WNI</span></div>
                            </td>
          </tr>
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td colspan="3" height="10">
              <table border="0" cellspacing="3" cellpadding="0" align="center" width="100%">
                <tr>
                  <td width="193" valign="top">
                    <div align="right"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif">Nomor
                      KK</font></b></font></div>
                  </td>
                  <td width="14" valign="top">
                    <div align="center"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif">:</font></b></font></div>
                  </td>
                  <td colspan="2" valign="top" width="242">
                    <div align="left"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif"><%=no_kk%></font></b></font></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> </tr>
    <tr>
      <td height="35" valign="bottom">
        <div align="center">
          <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
            <tr>
              <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
              <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
              <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td class="C-BG">
                <table border="0" cellspacing="1" cellpadding="3" align="center">
                  <tr>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">
                        No.</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">NIK</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Nama
                        Lengkap</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Jenis Kelamin</font></div>
                    </td>
                    <td class="C-Fonts"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Tempat Lahir </font></td>
                    <td align="center" class="C-Fonts">Tanggal Lahir</td>
                    <td align="center" class="C-Fonts">SHDK</td>
                    <td align="center" class="C-Fonts">NIK Ibu</td>
                    <td align="center" class="C-Fonts">Nama Ibu</td>
                    <td align="center" class="C-Fonts">Nomor Pasport</td>
                  </tr>
                  <tr>


<%
while(i<j)
{
%>
                    <td class="C-Field">
                      <div align="center">
                        <p><%=z%></p>
                      </div>
                    </td>
                    <td class="C-Field">
                      <div align="center">
                        <p><%=b.elementAt(i)%></p>
                      </div>
                    </td>
                    <td class="C-Field">
                      <div align="center"><%=b.elementAt(i+1).toString().toUpperCase()%> </div>
                    </td>
                    <td align="center" class="C-Field"><%=b.elementAt(i+2)%> </td>
                    <td align="center" class="C-Field"><%=b.elementAt(i+3).toString().toUpperCase()%></td>
<td align="center" class="C-Field"><%=b.elementAt(i+4)%></td>
<td align="center" class="C-Field"><%=b.elementAt(i+5)%></td>
<td align="center" class="C-Field"><%=b.elementAt(i+6).toString()%></td>
<td align="center" class="C-Field"><%=b.elementAt(i+7).toString().toUpperCase()%></td>
<td align="center" class="C-Field"><%=b.elementAt(i+8).toString().toUpperCase()%></td>
                  </tr>
<%
z=z+1;
i=i+9;
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


<%
    }

%>
          <b> </b></div>
      </td>
    </tr>
    <tr>
      <td height="35" valign="bottom">
        <div align="center"><b>
          <input class=boxstandard type=button value= KELUAR name="Button2222" onClick="window.close()">
          </b></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
</body>
</html>
<%
}
else
{
response.sendRedirect("index.jsp");
}
}
catch (Exception e)
{
e.printStackTrace();
}

%>
