<%@ page language="java" import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%!
    ServiceController factory=null;
    String nokk;
    Vector b=null;
    int i,j,k,l;
    NOKKHome home;
    NOKK remote;
%>

<%
try
   {
if (session.getAttribute("remoteRef")!=null)
{
%>
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name=nickverify action"">
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
                              <div align="center"><span class="subtitle">Daftar
                                Keluarga WNA</span></div>
                            </td>
          </tr>
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
<%
     nokk=request.getParameter("no_kk");
     factory=ServiceController.getInstance();
System.out.println("Stats here in twna.jsp step1");
     home = (NOKKHome) factory.lookup("NOKK",NOKKHome.class);
     remote = home.create();
System.out.println("Stats here in twna.jsp step2");
      b=new Vector();
      b = remote.verifyNik(nokk);
System.out.println("Stats here in twna.jsp step3");
      j=b.size();
      k=j/4;
l=0;
%>
<%
      if(b.isEmpty())
      {
%>
<div align="center"><b>
<h4><font color=red>Data Belum Ada !</font></h4>
</b></div>
<%
}
else
{
%>
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
                    <div align="left"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif"> <%=nokk%></font></b></font></div>
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
              <td height="1"><img src="I.Login/images/dot.gif" width="1" height="1"></td>
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
                        Pertama</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">No.Paspor</font></div>
                    </td>
                    <td class="C-Fonts"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">SHDK</font></td>
                  </tr>
<%
l=1;
for (i=0; i<j; i++)
{
%>
        <tr>
                    <td class="C-Field">
                      <div align="center">
                        <p><%=l%></p>
                      </div>
                    </td>
                    <td class="C-Field">
                      <div align="center">
                        <p><%=b.elementAt(i).toString().toUpperCase()%></p>
                      </div>
                    </td>
                    <td class="C-Field">
                      <div align="center"> </div><%=b.elementAt(i+1).toString().toUpperCase()%>
                    </td>
                    <td class="C-Field"><%=b.elementAt(i+2).toString().toUpperCase()%> </td>
                    <td class="C-Field"><%=b.elementAt(i+3).toString().toUpperCase()%></td>
                  </tr>


       </tr>
<%
l=l+1;
i=i+3;
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
          <b> </b></div>
      </td>
    </tr>
    <tr>
      <td height="35" valign="bottom">
        <div align="center"><b>
          <input class=boxstandard type=button value=   KELUAR    name="Button2222" onclick="window.close()">
          </b></div>
      </td>
    </tr>
  </table>

<%
}
%>
</form>
</BODY>
</HTML>
<%}
else
{
  response.sendRedirect("index.jsp");
}
   }
   catch (Exception ne)
    {
ne.printStackTrace();
System.out.println("Error Twna.jsp =" + ne.toString());
    }

%>