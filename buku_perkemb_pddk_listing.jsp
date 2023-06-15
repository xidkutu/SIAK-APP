<%@page import="com.db.connection.ServiceController,java.util.Vector,buku.pkbg.pddk.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%!
    UserInfo1 record = null;
    String  nprop="", nkab="", nkec="", nkel="";
    String naprop="",nakab="",nakec="",nakel="";
%>

<%
try{

     record=(UserInfo1)session.getAttribute("remoteRef");

if (record!=null)
   {
  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printBuku()
{
   window.print();
   //alert("BUKU PRINTING");
   window.close();
}
</script>
</HEAD>
<%
nprop=""; nkab=""; nkec="";nkel="";
naprop="";nakab="";nakec="";nakel="";
   nprop = (request.getParameter("nprop")==null?"0":request.getParameter("nprop"));
   naprop = (request.getParameter("naprop")==null?"-":request.getParameter("naprop"));
   nkab = (request.getParameter("nkab")==null?"0":request.getParameter("nkab"));
   nakab = (request.getParameter("nakab")==null?"-":request.getParameter("nakab"));
   nkec = (request.getParameter("nkec")==null?"0":request.getParameter("nkec"));
   nakec = (request.getParameter("nakec")==null?"-":request.getParameter("nakec"));
   nkel = (request.getParameter("nkel")==null?"0":request.getParameter("nkel"));
   nakel = (request.getParameter("nakel")==null?"-":request.getParameter("nakel"));
    String sysdate = record.getToday();//request.getParameter("sysdate");
%>

<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000"  onKeyDown="alert('Please use the print button')" onload="window.history.forward(1)">
<div style="position:relative; top:1px; left:-30px; page-break-after:always">
<table align="center">
<tr align="center"><td align="center" >
                                  <div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printBuku()">
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
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
      <table width="900" border="0" cellspacing="5" cellpadding="5" align="center">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Buku
                                Perkembangan Penduduk</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4">
                              <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
                                <tr>
                                  <td width="40%">PROVINSI</td>
                                  <td width="2%">:</td>
                                  <td><%=naprop%></td>
                                </tr>
                                <tr>
                                  <td>KABUPTEN/KOTA</td>
                                  <td>:</td>
                                  <td><%=nakab%></td>
                                </tr>
                                <tr>
                                  <td>KECAMATAN</td>
                                  <td>:</td>
                                  <td><%=nakec%></td>
                                </tr>
                                <tr>
                                  <td>DESA/KELURAHAN</td>
                                  <td>:</td>
                                  <td><%=nakel%></td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="right"> Tanggal</div>
                                  </td>
                                  <td>:</td>
                                  <td><%=sysdate%></td>
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
                <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="100">
                    <tr>
                        <td width="10" height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                        <td height="1" width="895"><img src="images/dot.gif" width="1" height="1"></td>
                        <td width="5" height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                        <td width="10">&nbsp;</td>
                        <td valign="middle" align="center" width="895">
                          <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="900">
                            <tr>
                              <td class="C-Fonts" rowspan="2" width="5%">
                                <div align="center">NO.&nbsp;</div>
                              </td>
                              <td class="C-Fonts" rowspan="2" width="24%">
                                <div align="center"><span lang="EN-GB">Perincian
                                  Jumlah</span></div>
                              </td>
                              <td class="C-Fonts" colspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Warga
                                  Negara R.I.</span></div>
                              </td>
                              <td class="C-Fonts" colspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Orang
                                  Asing</span></div>
                              </td>
                              <td class="C-Fonts" colspan="3">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Jumlah
                                  (WNI dan WNA)</span></div>
                              </td>
                            </tr>
                            <tr>
                              <td class="C-Fonts" width="10%">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Laki-laki</span></div>
                              </td>
                              <td class="C-Fonts" width="11%">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Perempuan</span></div>
                              </td>
                              <td class="C-Fonts" width="9%">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Laki-laki</span></div>
                              </td>
                              <td class="C-Fonts" width="11%">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Perempuan</span></div>
                              </td>
                              <td class="C-Fonts" width="9%">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Laki-laki</span></div>
                              </td>
                              <td class="C-Fonts" width="10%">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Perempuan</span></div>
                              </td>
                              <td class="C-Fonts" width="11%">
<div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Laki-laki
dan Perempuan</span></div>
</td>
</tr>
<%
BukuPerkembanganPddk view = null;
BukuPerkembanganPddkObject obj = null;
Vector results=null;
String [] arr={"Penduduk Sekarang","Kelahiran Penduduk","Kematian Penduduk","Perpindahan Penduduk","Kedatangan Penduduk"};
ServiceController statelessController = ServiceController.getInstance();
BukuPerkembanganPddkHome home = (BukuPerkembanganPddkHome)statelessController.lookup("BukuPerkembanganPddkBean", BukuPerkembanganPddkHome.class);
view = home.create();
results= view.getDataBukuPerkembanganPenduduk(nprop,nkab,nkec,nkel);

nprop="";
nkab="";
nkec="";
nkel="";
int sno=0;

 for(int index=0;index<=results.size();index++)
  {
  obj=(BukuPerkembanganPddkObject)results.elementAt(index);
  sno++;
 %>
                            <tr>
                              <td class="C-Field" width="5%">
                                <div align="right"><%=sno%>.</div>
                              </td>
                              <td class="C-Field" width="24%">
                                <div align="left"><%=arr[index]%></div>
                              </td>
                              <td class="C-Field" width="10%">
                                <div align="left"><%=obj.getLakiwni()%></div>
                                </td>
                              <td class="C-Field" width="11%">
                                <div align="left"><%=obj.getPeremwni()%></div>
                                </td>
                              <td class="C-Field" width="9%">
                                <div align="left"><%=obj.getLakiwna()%></div>
                                </td>
                              <td class="C-Field" width="11%">
                                <div align="left"><%=obj.getPeremwna()%></div>
                                </td>
                              <td class="C-Field" width="9%">
                                <div align="left"><%=obj.getJumlaki()%></div>
                                </td>
                              <td class="C-Field" width="10%">
                                <div align="left"><%=obj.getJumPerem()%></div>
                                </td>
                              <td class="C-Field" width="11%">
                                <div align="left"><%=obj.getJumLkPrm()%></div>
                                </td>
                            </tr>
   <%
           }
    %>
                          </table>
                      </td>
                        <td width="5">&nbsp;</td>
                    </tr>

                    <tr>
                        <td height="1" width="10"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                        <td height="1" width="895"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                        <td width="5" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
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
</table>
</div>
</BODY></HTML>
<%
 }
else
{
response.sendRedirect(record.getModRefFile());
}
}catch(Exception err)
{
 System.out.println(err);
   response.sendRedirect(record.getModRefFile());
}
%>
