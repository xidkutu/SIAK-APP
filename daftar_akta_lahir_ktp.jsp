<%@page import="com.db.connection.ServiceController,kepemilikan.aktalahirdanktp.*,java.util.Vector"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printBuku(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Kepemilikan Akta Kelahiran dan KTP Penduduk Indonesia ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="akta_lahir_ktp_pembuka.jsp";
              window.close();
          }
    }
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<p>&nbsp;</p>
<%
    String sysdate = request.getParameter("sysdate");
%>
<form method="post" name="listform" action="">
<table align="center">
  <tr align="center"><td align="center" >
                                  <div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printBuku(this)">
                                    </b></div>
                                </td>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
                                    </b></div>
                                </td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="100">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5" align="center">
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
                              <div align="center"><span class="subtitle">Kepemilikan
                                Akta Kelahiran dan KTP<br>
                                Penduduk Indonesia</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4">
                              <table width="442" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                  <td width="216">
                                    <div align="right"> Tanggal</div>
                                  </td>
                                  <td width="2%">:</td>
                                  <td colspan="2" width="200"><%=sysdate%></td>
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
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="600">
                    <tr>
                      <td><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td class="C-BG" valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="3" align="center">
                          <tr>
                            <td class="C-Fonts" rowspan="2" width="21">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="117">
                              <div align="center">Provinsi</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="74">
                              <div align="center">Jumlah Penduduk (jiwa)</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="76">
                              <div align="center">Kepemilikan Akta Kelahiran</div>
                            </td>
                            <td class="C-Fonts" colspan="3">
                              <div align="center">Kartu Tanda Penduduk (jiwa)</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" width="53">
                              <div align="center">Wajib Memiliki</div>
                            </td>
                            <td class="C-Fonts" width="49">
                              <div align="center">Telah Memiliki</div>
                            </td>
                            <td class="C-Fonts" width="49">
                              <div align="center">Belum Memiliki</div>
                            </td>
                          </tr>
<%
AktaLahirDanKTP aktaLahirDanKTPObj = null;
Vector vData = new Vector();
try
{
         ServiceController statelessController = ServiceController.getInstance();
         AktaLahirDanKTPHome home = (AktaLahirDanKTPHome)statelessController.lookup("AktaLahirDanKTPBean", AktaLahirDanKTPHome.class);

         aktaLahirDanKTPObj = home.create();
         vData = aktaLahirDanKTPObj.getDataKepemilikanAktaLahirDanKTP();
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
if(aktaLahirDanKTPObj!=null) aktaLahirDanKTPObj.remove();
}
int numbering = 1;
int total_jumlah_penduduk=0, total_ada_akta_lahir=0,
total_wajib_memiliki_ktp=0, total_telah_memiliki_ktp=0, total_belum_memiliki_ktp=0;

for(int i=0;i<vData.size();i++)
{
    AktaLahirDanKtpObject obj = (AktaLahirDanKtpObject)vData.elementAt(i);

    total_jumlah_penduduk = total_jumlah_penduduk + Integer.parseInt( obj.getJumlah_penduduk().trim() );
    total_ada_akta_lahir = total_ada_akta_lahir +Integer.parseInt( obj.getAda_akta_lahir().trim() );
    total_wajib_memiliki_ktp = total_wajib_memiliki_ktp +Integer.parseInt( obj.getWajib_memiliki_ktp().trim() );
    total_belum_memiliki_ktp = total_belum_memiliki_ktp +Integer.parseInt( obj.getBelum_memiliki_ktp().trim() );
    total_telah_memiliki_ktp = total_telah_memiliki_ktp +Integer.parseInt( obj.getTelah_memiliki_ktp().trim() );

%>
                          <tr>
                            <td align="center" class="C-Field" width="21"><%=numbering+". "%></td>
                            <td class="C-Field" width="117">
                              <div align="left"><%=obj.getNama_prop()%></div>
                            </td>
                            <td class="C-Field" width="74">
                              <div align="right"><%=obj.getJumlah_penduduk()%></div>
                            </td>
                            <td class="C-Field" width="76">
                              <div align="right"><%=obj.getAda_akta_lahir()%></div>
                            </td>
                            <td class="C-Field" width="53">
                              <div align="right"><%=obj.getWajib_memiliki_ktp()%></div>
                            </td>
                            <td class="C-Field" width="49">
                              <div align="right"><%=obj.getTelah_memiliki_ktp()%></div>
                            </td>
                            <td class="C-Field" width="49">
                              <div align="right"><%=obj.getBelum_memiliki_ktp()%></div>
                            </td>
                          </tr>
<%numbering++;
}
%>
                          <tr>
                            <td align="center" class="C-Field" colspan="2">Jumlah
                              Nasional </td>
                            <td class="C-Field" width="74">
                              <div align="right"><%=total_jumlah_penduduk%></div>
                            </td>
                            <td class="C-Field" width="76">
                              <div align="right"><%=total_ada_akta_lahir%></div>
                            </td>
                            <td class="C-Field" width="53">
                              <div align="right"><%=total_wajib_memiliki_ktp%></div>
                            </td>
                            <td class="C-Field" width="49">
                              <div align="right"><%=total_telah_memiliki_ktp%></div>
                            </td>
                            <td class="C-Field" width="49">
                              <div align="right"><%=total_belum_memiliki_ktp%></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
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
</form>
</BODY></HTML>