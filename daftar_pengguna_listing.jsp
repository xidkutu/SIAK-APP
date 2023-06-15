<%@page import="com.db.connection.ServiceController,java.util.Vector,daftar.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%!
    UserInfo1 record = null;
%>
<%
   try
   {
     record = (UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript>
document.oncontextmenu=new Function("return false");
function printPengguna(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Daftar Pengguna ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              //document.all['divZoom'].style.zoom="50%";
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=7&security_option=yes";
              window.close();
          }
    }
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<table align="center">
<tr align="center"><td align="center" >
                                  <div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printPengguna(this)">
                                    </b></div>
                                </td>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
                                    </b></div>
                                </td>
</tr>
</table>
<p>&nbsp;</p>
<%
   String naprop = request.getParameter("naprop");
   if(naprop==null || naprop.trim().startsWith("--"))
   {
      naprop = "";
   }

   String nakab = request.getParameter("nakab");
   if(nakab==null || nakab.trim().startsWith("--"))
   {
      nakab = "";
   }

   String nakec = request.getParameter("nakec");
   if(nakec==null || nakec.trim().startsWith("--"))
   {
      nakec = "";
   }
System.out.println("naprop: "+naprop);
System.out.println("nakab: "+nakab);
System.out.println("nakec: "+nakec);
   String nprop = request.getParameter("nprop");
   String nkab = request.getParameter("nkab");
   String nkec = request.getParameter("nkec");
//System.out.println("nprop: "+nprop);
//System.out.println("nkab: "+nkab);
//System.out.println("nkec: "+nkec);
   String sysdate = record.getToday(); //request.getParameter("sysdate");
System.out.println("sysdate: "+sysdate);
%>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="820">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="296">
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
                        <div align="center" class="subtitle">DAFTAR PENGGUNA/USER</div>
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
                        <table width="444" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td width="167">Kode-Nama Provinsi</td>
                            <td width="14"> :</td>
                            <td><%=naprop%></td>
                          </tr>
                          <tr>
                            <td width="167">Kode-Nama Kabupaten/Kota </td>
                            <td width="14"> :</td>
                            <td><%=nakab%></td>
                          </tr>
                          <tr>
                            <td width="167">Kode-Nama Kecamatan </td>
                            <td width="14"> :</td>
                            <td><%=nakec%></td>
                          </tr>
                          <tr>
                            <td width="167">
                              <div align="right">Edisi Tanggal</div>
                            </td>
                            <td width="14">:</td>
                            <td><%=sysdate%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="85%">
                    <tr>
                      <td height="6"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td height="6"><img src="images/dot.gif" width="1" height="1"></td>
                      <td height="6"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
                          <tr>
                            <td class="C-Fonts" width="100">
                              <div align="center">No.&nbsp;</div>
                            </td>
                            <td class="C-Fonts" width="228">
                              <div align="center">Nama Pengguna</div>
                            </td>
                            <td class="C-Fonts" width="232">
                              <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Kata
                                Kunci</span><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt"></span></div>
                            </td>
                            <td class="C-Fonts" width="186">
                              <div align="center">Level</div>
                            </td>
                            <td class="C-Fonts" width="182">
                              <div align="center">Divisi</div>
                            </td>
                          </tr>
<%
Pengguna view = null;
Vector vData = new Vector();
try
{
         ServiceController statelessController = ServiceController.getInstance();
         PenggunaHome home = (PenggunaHome)statelessController.lookup("PenggunaBean", PenggunaHome.class);

         view = home.create();
         vData = view.getDataPengguna(nprop, nkab, nkec);
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
   view.remove();
}
int numbering = 1;
for(int i=0;i<vData.size();i++)
{
PenggunaObject obj = (PenggunaObject)vData.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="100">
                              <div align="center"><%=numbering%>.</div>
                            </td>
                            <td class="C-Field" width="228"><%=obj.getNama_pengguna()%>&nbsp;</td>
                            <td class="C-Field" width="232">
                              <div align="center"><%=obj.getKata_kunci()%></div>
                            </td>
                            <td class="C-Field" width="186"><%=obj.getLevel_id()%>&nbsp;</td>
                            <td class="C-Field" width="182"><%=obj.getDivision()%>&nbsp;</td>
                          </tr>
<%numbering++;
}%>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

          </td>
        </tr>
        <tr>
          <td valign="top">&nbsp; </td>
        </tr>
      </table>

    </td>
  </tr>
</table>

</BODY></HTML>
<%
}
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
