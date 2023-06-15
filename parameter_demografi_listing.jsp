<%@page import="com.db.connection.ServiceController,java.util.Vector,parameter.dasar.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<% UserInfo1 record = null;
%>

<%
try
   {
   record=(UserInfo1)session.getAttribute("remoteRef");

   String naprop = request.getParameter("naprop");
   String nakab = request.getParameter("nakab");
   String nakec = request.getParameter("nakec");
   String nprop = request.getParameter("nprop");
   String nkab = request.getParameter("nkab");
   String nkec = request.getParameter("nkec");
   String tahun = request.getParameter("tahun");

if(record != null)
{%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
//document.oncontextmenu=new Function("return false");
function printLaporan(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Demografi ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="parameter_demografi_opening.jsp";
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
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printLaporan(this)">
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
      <table width="100" border="0" cellspacing="5" cellpadding="5" align="center">
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
                              <div align="center"><span class="subtitle">Parameter
                                Dasar Demografi</span></div>
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
                                  <td>
                                    <div align="right">Tahun</div>
                                  </td>
                                  <td>:</td>
                                  <td><%=tahun%></td>
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
                  <table width="675" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td width="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="5"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td class="C-BG" valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="3">
                          <tr>
                            <td class="C-Fonts">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Parameter</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Nilai</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Keterangan</div>
                            </td>
                          </tr>
<%
DemografiObject obj = null;
Demografi view = null;
try
{
         ServiceController statelessController = ServiceController.getInstance();
         DemografiHome home = (DemografiHome)statelessController.lookup("Demografi", DemografiHome.class);

         view = home.create();
         obj = view.getDemografiData(nprop, nkab, tahun);
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
   view.remove();
}
String median = ""+obj.getMd();
median = median.replace('.',',');
%>
                          <tr>
                            <td align="center" class="C-Field">1.</td>
                            <td class="C-Field">Umur Median (<i>Median Age, Md</i>)</td>
                            <td align="center" class="C-Field"><%=median%></td>
                            <td class="C-Field">Umur median penduduk <%=median%>&nbsp;
                              tahun</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field">2.</td>
                            <td class="C-Field">Rasio Jenis Kelamin (<i>Sex Ratio,
                              SR</i>)&nbsp;&nbsp; </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getSex_ratio().trim() ) )%></td>
                            <td class="C-Field">Setiap 100 perempuan terdapat
                              <%=""+Math.round( Double.parseDouble( obj.getSex_ratio().trim() ) )%> laki-laki</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">3.</td>
                            <td class="C-Field">Angka Beban Ketergangtungan (<i>Depedency
                              Ratio, DR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getDepend_ratio().trim() ) )%></td>
                            <td class="C-Field">Setiap 100 penduduk usia produktif
                              menanggung <%=""+Math.round( Double.parseDouble( obj.getDepend_ratio().trim() ) )%> penduduk usia tidak produktif</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">4.</td>
                            <td class="C-Field">Angka Kelahiran Kasar<br>
                              (<i>Crude Birth Rate, CBR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble(obj.getCbr().trim()) )%></td>
                            <td class="C-Field">Diantara 1000 penduduk terdapat
                              kelahiran sebanyak <%=""+Math.round( Double.parseDouble(obj.getCbr().trim()) )%> orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">5.</td>
                            <td class="C-Field">Angka Kelahiran Umum<br>
                              (<i>General Fertility Rate, GFR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getGfr() ) )%></td>
                            <td class="C-Field">Diantara 1000 wanita usia 15 -
                              49 tahun, terdapat kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getGfr() ) )%> orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">6.</td>
                            <td class="C-Field">Angka Kelahiran Menurut Umur <br>
                              (<i>Age Specific Fertility Rate, ASFR</i>) :</td>
                            <td align="center" class="C-Field">&nbsp;</td>
                            <td class="C-Field">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field"></td>
                            <td class="C-Field">
                              <div align="right">X1 = 15 - 19 tahun </div>
                            </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getAsfr_x1() ) )%></td>
                            <td class="C-Field">Dari 1000 wanita kelompok umur
                              15 - 19 tahun terjadi kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getAsfr_x1() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field"></td>
                            <td class="C-Field">
                              <div align="right">X2 = 20 - 24 tahun </div>
                            </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getAsfr_x2() ) )%></td>
                            <td class="C-Field">Dari 1000 wanita kelompok umur
                              20 - 24 tahun terjadi kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getAsfr_x2() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field"></td>
                            <td class="C-Field">
                              <div align="right">X3 = 25 - 29 tahun </div>
                            </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getAsfr_x3() ) )%></td>
                            <td class="C-Field">Dari 1000 wanita kelompok umur
                              25 - 29 tahun terjadi kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getAsfr_x3() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field"></td>
                            <td class="C-Field">
                              <div align="right">X4 = 30 - 34 tahun </div>
                            </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getAsfr_x4() ) )%></td>
                            <td class="C-Field">Dari 1000 wanita kelompok umur
                              30 - 34 tahun terjadi kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getAsfr_x4() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field"></td>
                            <td class="C-Field">
                              <div align="right">X5 = 35 - 39 tahun </div>
                            </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getAsfr_x5() ) )%></td>
                            <td class="C-Field">Dari 1000 wanita kelompok umur
                              35 - 39 tahun terjadi kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getAsfr_x5() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field"></td>
                            <td class="C-Field">
                              <div align="right">X6 = 40 - 44 tahun </div>
                            </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getAsfr_x6() ) )%></td>
                            <td class="C-Field">Dari 1000 wanita kelompok umur
                              40 - 44 tahun terjadi kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getAsfr_x6() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field"></td>
                            <td class="C-Field">
                              <div align="right">X7 = 45 - 49 tahun </div>
                            </td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getAsfr_x7() ) )%></td>
                            <td class="C-Field">Dari 1000 wanita kelompok umur
                              45 - 49 tahun terjadi kelahiran sebanyak <%=""+Math.round( Double.parseDouble( obj.getAsfr_x7() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">7.</td>
                            <td class="C-Field">Angka Kelahiran Total<br>
                              (<i>Total Fertility Rate, TFR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getTfr() ) )%></td>
                            <td class="C-Field">Setiap wanita secara hipotesis
                              akan melahirkan sebanyak <%=""+Math.round( Double.parseDouble( obj.getTfr() ) )%> orang hingga berakhir
                              masa reproduksi</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">8.</td>
                            <td class="C-Field">Ratio Anak Wanita<br>
                              (<i>Child Women Ratio, CWR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getCwr() ) )%></td>
                            <td class="C-Field">Setiap 1000 wanita usia produktif
                              (15 - 49 tahun) terdapat balita sebanyak <%=""+Math.round( Double.parseDouble( obj.getCwr() ) )%>
                              orang&nbsp; </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">9.</td>
                            <td class="C-Field">Angka Kematian Kasar<br>
                              (<i>Crude Death Rate, CDR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getCdr() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk terjadi kematian
                              sebanyak <%=""+Math.round( Double.parseDouble( obj.getCdr() ) )%> orang </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">10.</td>
                            <td class="C-Field">Angka Kematian Waktu Melahirkan
                              (<i>Maternal Mortality Rate, MMR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getMmr() ) )%></td>
                            <td class="C-Field">Setiap 100.000 penduduk melahirkan
                              terjadi kematian sebanyak <%=""+Math.round( Double.parseDouble( obj.getMmr() ) )%> orang </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">11.</td>
                            <td class="C-Field">Angka Kematian Bayi<br>
                              (<i>Infant Mortality Rate, IMR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getImr_mati() ) )%></td>
                            <td class="C-Field">Setiap 1000 kelahiran penduduk
                              terdapat kematian sebanyak <%=""+Math.round( Double.parseDouble( obj.getImr_mati() ) )%> bayi berumur kurang
                              dari 1 tahun</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">12.</td>
                            <td class="C-Field">Angka Perkawinan Kasar<br>
                              (<i>Crude Marriage Rate, CMR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getCmr() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk terjadi <%=""+Math.round( Double.parseDouble( obj.getCmr() ) )%>
                              peristiwa perkawinan</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field">13.</td>
                            <td class="C-Field">Angka Perkawinan Umum (<i>MU</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getApu_kawin() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk usia lebih
                              dari 15 tahun ke atas terjadi <%=""+Math.round( Double.parseDouble( obj.getApu_kawin() ) )%> peristiwa perkawinan</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field">14.</td>
                            <td class="C-Field">Angka Perceraian (<i>Divorce Rate,
                              DR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getApu_cerai() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk terjadi <%=""+Math.round( Double.parseDouble( obj.getApu_cerai() ) )%>
                              peristiwa perceraian</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field">15.</td>
                            <td class="C-Field">Angka Perceraian Kasar&nbsp; (<i>DU</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getApk_percerain() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk terjadi <%=""+Math.round( Double.parseDouble( obj.getApk_percerain() ) )%>
                              peristiwa peceraian (tengah tahun)</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">16.</td>
                            <td class="C-Field">Angka Migrasi Masuk<br>
                              (<i>In-migration Rate, ImR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getImr() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk di daerah
                              tujuan terdapat penduduk yang masuk sebanyak <%=""+Math.round( Double.parseDouble( obj.getImr() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">17.</td>
                            <td class="C-Field">Angka Migrasi Keluar<br>
                              (<i>Out-migration Rate, OmR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getOmr() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk di daerah
                              asal terdapat penduduk yang keluar sebanyak <%=""+Math.round( Double.parseDouble( obj.getOmr() ) )%>
                              orang</td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" valign="top">18.</td>
                            <td class="C-Field">Angka Migrasi Netto<br>
                              (<i>Net-migration Rate, NmR</i>)</td>
                            <td align="center" class="C-Field"><%=""+Math.round( Double.parseDouble( obj.getNmr() ) )%></td>
                            <td class="C-Field">Setiap 1000 penduduk dalam suatu
                              wilayah terdapat mobilitas penduduk sebanyak <%=""+Math.round( Double.parseDouble( obj.getNmr() ) )%>
                              orang</td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td width="5"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
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
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
  }
   catch(Exception e){
response.sendRedirect("index.jsp");
}

%>
