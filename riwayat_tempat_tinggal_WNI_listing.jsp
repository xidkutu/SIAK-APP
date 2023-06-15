<%@page import="com.db.connection.ServiceController,java.util.Vector,riwayat.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%!
    UserInfo1 record = null;
    String nik;
    RiwayatObject riwayatObj = null;
%>
<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");
 if(record != null)
  {

      nik = request.getParameter("nik");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><!-- #BeginTemplate "/Templates/SIAK_IIIA.dwt" --><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>

<script language="javascript">

function printPage()
{

   if (window.print)
    {
      document.all['cet'].style.visibility='hidden';
      document.all['kel'].style.visibility='hidden';
        window.print();
        document.location="<%=record.getModRefFile()%>"
    }
}
</script>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" text="#000000" onload="window.history.forward(1)">
<table align="center">
<tr align="center"><td align="center" >
                                  <div align="center"><b>
<input class=boxstandard type=button  name="cet" value="CETAK" onclick="printPage()">
                                    </b></div>
                                </td>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button name="kel" value=KELUAR onClick="document.location='<%=record.getModRefFile()%>'" name="KEL">
                                    </b></div>
                                </td>
</tr>
</table>
<p>&nbsp;</p>
<table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
<div align="center" class="subtitle">RIWAYAT TEMPAT TINGGAL PENDUDUK <%=request.getParameter("sc")%></div>
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
<%
RiwayatTempatTinggal view=null;
String nama=null;
Vector vData = null;
String title[]={"Pertama","Kedua","Ketiga","Keempat"};

         ServiceController statelessController = ServiceController.getInstance();
         RiwayatTempatTinggalHome home = (RiwayatTempatTinggalHome)statelessController.lookup("RiwayatTempatTinggalBean", RiwayatTempatTinggalHome.class);
         view = home.create();
         vData = view.getDataRiwayatTempatTinggal(nik, 0,record.getNoProp(),record.getNoKab(),record.getNoKec());

if  (vData.size()!=0)
     {
       System.out.println("not Empty");
%>
                    <tr>
                      <td>
                        <table width="444" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td width="167">NIK</td>
                            <td width="14"> :</td>
                            <td><%=nik%>&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="167">Nama Lengkap </td>
                            <td width="14"> :</td>
                            <td><%=((RiwayatObject)vData.elementAt(0)).getNama_lengkp()%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                  </table>
<table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" dwcopytype="CopyTableColumn">
                    <tr>
                      <td height="1" width="1420"><img src="images/dot.gif" width="1" height="1"></td>
                      </tr>
                    <tr>
                      <td valign="middle" align="center" width="1420">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG">
                          <tr>
                            <td class="C-Fonts" width="89">
                              <div align="center"><span lang="EN-GB">Tempat Tinggal</span></div>
                            </td>
                            <td class="C-Fonts" width="82">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Nomor
                                KK</span></div>
                            </td>
                            <td class="C-Fonts" width="105">
                              <div align="center"><span lang="EN-GB">Alamat</span></div>
                            </td>
                            <td class="C-Fonts" width="97">
                              <div align="center"><span lang="EN-GB">Tgl. Rencana
                                Pindah </span></div>
                            </td>
                            <td class="C-Fonts" width="89">
                              <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Tgl.
                                Datang </span></div>
                            </td>
                            <td class="C-Fonts" width="93">
                              <div align="center">Nama Camat </div>
                            </td>
                            <td class="C-Fonts" width="141">
                              <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Nama
                                Kades/Lurah </span></div>
                            </td>
                            <td class="C-Fonts" width="220">
                              <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Nama
                                <br>Petugas Entri</span></div>
                            </td>
                          </tr>
                   <%
                       for(int i=0;i<vData.size()-1;i++)
                        {
                         riwayatObj=(RiwayatObject)vData.elementAt(i);
                    %>
                          <tr>
                            <td class="C-Field"><font color="#307CB6"><b><%=title[i]%></b></font></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNo_kk()%></div></td>
                            <td class="C-Field"  width="367" nowrap><div align="left"><%=riwayatObj.getAlmt()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getRenc_tgl()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getTgl_dtng()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNama_camat()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNama_lur()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNama_pet()%></div></td>
                          </tr>
                       <%
                        }
                        riwayatObj=(RiwayatObject)vData.elementAt(vData.size()-1);
                       %>
                          <tr>
                            <td class="C-Field"><font color="#307CB6"><b><%="Sekarang"%></b></font></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNo_kk()%></div></td>
                            <td class="C-Field"  width="367" nowrap><div align="left"><%=riwayatObj.getAlmt()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getRenc_tgl()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getTgl_dtng()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNama_camat()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNama_lur()%></div></td>
                            <td class="C-Field" nowrap><div align="left"><%=riwayatObj.getNama_pet()%></div></td>
                          </tr>
                        </table>
                      </td>
                      </tr>
                    <tr>
                      <td height="1" width="1420"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      </tr>
                  </table>
<%
     }
     else
     {
       response.sendRedirect("riwayat_tempat_tinggal_WNI.jsp?error=1");
     }
%>
</BODY><!-- #EndTemplate -->
</HTML>

<%
}
else
{
response.sendRedirect(record.getModRefFile());
}
  }
   catch(Exception e)
   {
     e.printStackTrace();
     response.sendRedirect(record.getModRefFile());
   }

finally
{
riwayatObj = null;
}

%>
