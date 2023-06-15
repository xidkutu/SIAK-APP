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
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<table align="center">
<tr align="center"><td align="center" >
                                  <div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printLampid(this)">
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

//System.out.println("naprop: "+naprop);
//System.out.println("nakab: "+nakab);
//System.out.println("nakec: "+nakec);
   String nprop = request.getParameter("nprop");
   String nkab = request.getParameter("nkab");
   String nkec = request.getParameter("nkec");

System.out.println("nprop: "+nprop);
System.out.println("nkab: "+nkab);
System.out.println("nkec: "+nkec);

   String sysdate = record.getToday(); //request.getParameter("sysdate");
System.out.println("sysdate: "+sysdate);
%>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="100%">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="152">
            <table width="100%" border="0" cellspacing="3" cellpadding="0" align="center">
              <tr>
                <td height="1">
                  <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                </td>
              </tr>
              <tr>
                <td height="25">
                  <div align="center" class="subtitle">DAFTAR KUNCI OTORITAS PENGGUNA/USER</div>
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
                      <td width="167">Provinsi</td>
                      <td width="14"> :</td>
                      <td><%=naprop%></td>
                    </tr>
                    <tr>
                      <td width="167">Kabupaten/Kota </td>
                      <td width="14"> :</td>
                      <td><%=nakab%></td>
                    </tr>
                    <tr>
                      <td width="167">Kecamatan </td>
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
              <tr valign="bottom">
                <td height="45" valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="100%">
                    <tr>
                      <td height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
                          <tr>
                            <td class="C-Fonts" width="36">
                              <div align="center">No.&nbsp;</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Kunci Otoritas</div>
                            </td>
                            <td class="C-Fonts" width="89">
                              <div align="center">Nama Pengguna</div>
                            </td>
                            <td class="C-Fonts" width="76">
                              <div align="center"><span lang="EN-GB">Nama Lengkap</span></div>
                            </td>
                            <td class="C-Fonts" width="84">
                              <div align="center">Level</div>
                            </td>
                            <td class="C-Fonts" width="72">
                              <div align="center">Divisi</div>
                            </td>
                            <td class="C-Fonts" width="144">
                              <div align="center">Nama Kantor</div>
                            </td>
                            <td class="C-Fonts" width="196">Alamat Kantor<br>
                              - Telepon</td>
                          </tr>
<%
KunciOtoritas view = null;
Vector vData = new Vector();
try
{
         ServiceController statelessController = ServiceController.getInstance();
         KunciOtoritasHome home = (KunciOtoritasHome)statelessController.lookup("KunciOtoritasBean", KunciOtoritasHome.class);

         view = home.create();
         vData = view.getDataKunciOtoritas(nprop, nkab, nkec);
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
KunciOtoritasObject obj = (KunciOtoritasObject)vData.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="36">
                              <div align="right"><%=numbering%>.</div>
                            </td>
                            <td class="C-Field" width="84">
                              <div align="left"><%=obj.getKunci_otoritas()%></div>
                            </td>
                            <td class="C-Field" width="89"><%=obj.getNama_pengguna()%>&nbsp;</td>
                            <td class="C-Field" width="76"><%=obj.getNama_lgkp()%>&nbsp;</td>
                            <td class="C-Field" width="84"><%=obj.getLevel_id()%>&nbsp;</td>
                            <td class="C-Field" width="72"><%=obj.getDivision()%>&nbsp;</td>
                            <td class="C-Field" width="144"><%=obj.getNama_kantor()%>&nbsp;</td>
                            <td class="C-Field" width="196"><%=obj.getAlamat_telp()%>&nbsp;</td>
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
