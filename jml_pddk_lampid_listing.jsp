<%@page import="com.db.connection.ServiceController,java.util.Vector,jmlpddk.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%!
    UserInfo1 record = null;
Lampid view = null;

%>
<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printLampid(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Jumlah Penduduk LAMPID ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              //document.all['divZoom'].style.zoom="50%";
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=10&pick_year=true";
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
<%
   String naprop = request.getParameter("naprop");
   String nakab = request.getParameter("nakab");
   String nakec = request.getParameter("nakec");
//System.out.println("naprop: "+naprop);
//System.out.println("nakab: "+nakab);
//System.out.println("nakec: "+nakec);
   String nprop = request.getParameter("nprop");
   String nkab = request.getParameter("nkab");
   String nkec = request.getParameter("nkec");
//System.out.println("nprop: "+nprop);
//System.out.println("nkab: "+nkab);
//System.out.println("nkec: "+nkec);
   String tahun = request.getParameter("tahun");
System.out.println("tahun: "+tahun);
%>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Jumlah
                                Penduduk Menurut Lahir, Mati, Pindah dan Datang</span></div>
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
                                  <td>KECAMATAN</td>
                                  <td>:</td>
                                  <td><%=nakec%></td>
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
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="89">
                    <tr>
                      <td width="0%" height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td height="1" width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="0%" height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td width="0%">&nbsp;</td>
                      <td valign="middle" align="center" width="100%">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG">
                          <tr>
                            <td class="C-Fonts" rowspan="3" width="18">
                              <div align="center"> No</div>
                            </td>
                            <td class="C-Fonts" rowspan="3" width="63">
                              <div align="center">Bulan</div>
                            </td>
                            <td class="C-Fonts" colspan="3" rowspan="2">
                              <div align="center">Penduduk Awal</div>
                            </td>
                            <td class="C-Fonts" colspan="3" rowspan="2">
                              <div align="center">Lahir</div>
                            </td>
                            <td class="C-Fonts" colspan="3" rowspan="2">
                              <div align="center">Mati</div>
                            </td>
                            <td class="C-Fonts" colspan="4">
                              <div align="center">Pindah</div>
                            </td>
                            <td class="C-Fonts" colspan="4">
                              <div align="center">Datang</div>
                            </td>
                            <td class="C-Fonts" colspan="3" rowspan="2">
                              <div align="center">Penduduk Akhir</div>
                            </td>
                            <td class="C-Fonts" rowspan="3" width="81">
                              <div align="center">Jumlah Kartu Keluarga (KK)</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Dalam Desa/Kel</div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Luar Desa/Kel</div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Dalam Desa/Kel</div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Luar Desa/Kel</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" width="16">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="25">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="36">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                            <td class="C-Fonts" width="15">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="22">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="33">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                            <td class="C-Fonts" width="15">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="22">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="33">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                            <td class="C-Fonts" width="34">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="47">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="38">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="28">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="36">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="48">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="45">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="16">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="24">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="39">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                          </tr>
                          <%
Vector vData = new Vector();

         ServiceController statelessController = ServiceController.getInstance();
         LampidHome home = (LampidHome)statelessController.lookup("lampid", LampidHome.class);

         view = home.create();
         vData = view.getDataLampid(nprop, nkab, nkec, tahun);
String months[]={"Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","Nopember","Desember"};
   //int pddkawaltotal=0, pddkakhir=0, totallahir=0, totalmati=0;
  //int pddkawallaki[]=new int[12];
  //int pddkawalperem[]=new int[12];

// totallahir = Integer.parseInt(((LampidObject)vData.elementAt(0)).getLahirlaki()) + Integer.parseInt(((LampidObject)vData.elementAt(0)).getLahirperem());
// totalmati = Integer.parseInt(((LampidObject)vData.elementAt(0)).getMatilaki()) + Integer.parseInt(((LampidObject)vData.elementAt(0)).getMatiperem());
int cntr=1;
//pddkawallaki[0] = Integer.parseInt(((LampidObject)vData.elementAt(0)).getPendudklk()) - Integer.parseInt(((LampidObject)vData.elementAt(0)).getLahirlaki()) + Integer.parseInt(((LampidObject)vData.elementAt(0)).getMatilaki()) - ( Integer.parseInt(((LampidObject)vData.elementAt(0)).getPindahlakiluar())+Integer.parseInt(((LampidObject)vData.elementAt(0)).getPindlakidalam())+Integer.parseInt(((LampidObject)vData.elementAt(0)).getDtnglakidalam())+Integer.parseInt(((LampidObject)vData.elementAt(0)).getDtnglakiluar()) );
//pddkawalperem[0] = Integer.parseInt(((LampidObject)vData.elementAt(0)).getPendudukprp()) - Integer.parseInt(((LampidObject)vData.elementAt(0)).getLahirperem()) + Integer.parseInt(((LampidObject)vData.elementAt(0)).getMatiperem()) - ( Integer.parseInt(((LampidObject)vData.elementAt(0)).getPindahperemluar())+Integer.parseInt(((LampidObject)vData.elementAt(0)).getPindperemdalam())+Integer.parseInt(((LampidObject)vData.elementAt(0)).getDtngperemdalam())+Integer.parseInt(((LampidObject)vData.elementAt(0)).getDtngperemluar()));
//pddkawaltotal = pddkawallaki[0] + pddkawalperem[0];
System.out.println("vData.size() !!" + vData.size());
long totlaki_awal=0;
long totperum_awal=0;
long tot_awal=0;
long totlahirlaki=0;
long totlahirperum=0;
long totlahir=0;
long totmatilaki=0;
long totmatiperum=0;
long totmati=0;
long totpind_lakir_dlm=0;
long totpind_perum_dlm=0;
long totpind_lakir_dlr=0;
long totpind_perum_dlr=0;
long totdtng_lakir_dlm=0;
long totdtng_perum_dlm=0;
long totdtng_lakir_dlr=0;
long totdtng_perum_dlr=0;
long totlaki_akhr=0;
long totperum_akhr=0;
long totakhr=0;
long totkk=0;


 for(int i=0;i<vData.size();i++)
                {
LampidObject new_rec=(LampidObject)vData.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="18"><%=cntr++%></td>
                            <td class="C-Field" width="63">
                              <div align="left"><%=months[i]%></div>
                            </td>
                            <td class="C-Field" width="16">
                              <div align="right"><%=new_rec.getLakiAwal()%></div>
                            </td>
                            <td class="C-Field" width="25">
                              <div align="right"><%=new_rec.getPerumAwal()%></div>
                            </td>
                            <td class="C-Field" width="36">
                              <div align="right"><%=(Integer.parseInt(new_rec.getLakiAwal())+Integer.parseInt(new_rec.getPerumAwal()))%></div>
                            </td>
                            <td class="C-Field" width="15">
                              <div align="right"><%=new_rec.getLahirlaki()%></div>
                            </td>
                            <td class="C-Field" width="22">
                              <div align="right"><%=new_rec.getLahirperem()%></div>
                            </td>
                            <td class="C-Field" width="33">
                              <div align="right"><%=(Integer.parseInt(new_rec.getLahirlaki()) + Integer.parseInt(new_rec.getLahirperem()))%></div>
                            </td>
                            <td class="C-Field" width="15">
                              <div align="right"><%=new_rec.getMatilaki()%></div>
                            </td>
                            <td class="C-Field" width="22">
                              <div align="right"><%=new_rec.getMatiperem() %></div>
                            </td>
                            <td class="C-Field" width="33">
                              <div align="right"><%=(Integer.parseInt(new_rec.getMatilaki()) + Integer.parseInt(new_rec.getMatiperem())) %></div>
                            </td>
                            <td class="C-Field" width="34">
                              <div align="right"><%=new_rec.getPindlakidalam()%></div>
                            </td>
                            <td class="C-Field" width="47">
                              <div align="right"><%=new_rec.getPindperemdalam()%></div>
                            </td>
                            <td class="C-Field" width="38">
                              <div align="right"><%=new_rec.getPindahlakiluar()%></div>
                            </td>
                            <td class="C-Field" width="35">
                              <div align="right"><%=new_rec.getPindahperemluar()%></div>
                            </td>
                            <td class="C-Field" width="28">
                              <div align="right"><%=new_rec.getDtnglakidalam()%></div>
                            </td>
                            <td class="C-Field" width="36">
                              <div align="right"><%=new_rec.getDtngperemdalam()%></div>
                            </td>
                            <td class="C-Field" width="48">
                              <div align="right"><%=new_rec.getDtnglakiluar()%></div>
                            </td>
                            <td class="C-Field" width="45">
                              <div align="right"><%=new_rec.getDtngperemluar()%></div>
                            </td>
                            <td class="C-Field" width="16">
                              <div align="right"><%=new_rec.getLakiAkhr()%></div>
                            </td>
                            <td class="C-Field" width="24">
                              <div align="right"><%=new_rec.getPerumAkhr()%></div>
                            </td>
                            <td class="C-Field" width="39">
                              <div align="right"><%=(Integer.parseInt(new_rec.getLakiAkhr()) + Integer.parseInt(new_rec.getPerumAkhr()))%></div>
                            </td>
                            <td class="C-Field" width="81">
                              <div align="right"><%=new_rec.getJumlakk()%></div>
                            </td>
                          </tr>
<%
totlaki_awal=totlaki_awal+Long.parseLong(new_rec.getLakiAwal());
totperum_awal=totperum_awal+Long.parseLong(new_rec.getPerumAwal());
tot_awal=tot_awal+(Long.parseLong(new_rec.getLakiAwal())+Long.parseLong(new_rec.getPerumAwal()));
totlahirlaki=totlahirlaki+Long.parseLong(new_rec.getLahirlaki());
totlahirperum=totlahirperum+Long.parseLong(new_rec.getLahirperem());
totlahir= totlahir+(Long.parseLong(new_rec.getLahirlaki())+Long.parseLong(new_rec.getLahirperem()));
totmatilaki=totmatilaki+Long.parseLong(new_rec.getMatilaki());
totmatiperum=totmatiperum+ Long.parseLong(new_rec.getMatiperem());
totmati=totmati+(Long.parseLong(new_rec.getMatilaki())+Long.parseLong(new_rec.getMatiperem()));
totpind_lakir_dlm=totpind_lakir_dlm+Long.parseLong(new_rec.getPindlakidalam());
totpind_perum_dlm=totpind_perum_dlm+Long.parseLong(new_rec.getPindperemdalam());
totpind_lakir_dlr=totpind_lakir_dlr+Long.parseLong(new_rec.getPindahlakiluar());
totpind_perum_dlr=totpind_perum_dlr+Long.parseLong(new_rec.getPindahperemluar());
totdtng_lakir_dlm=totdtng_lakir_dlm+Long.parseLong(new_rec.getDtnglakidalam());
totdtng_perum_dlm=totdtng_perum_dlm+Long.parseLong(new_rec.getDtngperemdalam());
totdtng_lakir_dlr=totdtng_lakir_dlr+ Long.parseLong(new_rec.getDtnglakiluar());
totdtng_perum_dlr=totdtng_perum_dlr+Long.parseLong(new_rec.getDtngperemluar());
 totlaki_akhr= totlaki_akhr+Long.parseLong(new_rec.getLakiAkhr());
totperum_akhr=totperum_akhr+ Long.parseLong(new_rec.getPerumAkhr());
totakhr=totakhr+(Long.parseLong(new_rec.getLakiAkhr()) + Long.parseLong(new_rec.getPerumAkhr()));
totkk=totkk+Long.parseLong(new_rec.getJumlakk());
}
%>
<tr>
                            <td class="C-Field" colspan="2">
                              <div align="center">JUMLAH</div>
                            </td>
                            <td class="C-Field" width="16">
                              <div align="right"><%=totlaki_awal%></div>
                            </td>
                            <td class="C-Field" width="25">
                              <div align="right"><%=totperum_awal%></div>
                            </td>
                            <td class="C-Field" width="36">
                              <div align="right"><%=tot_awal%></div>
                            </td>
                            <td class="C-Field" width="15">
                              <div align="right"><%=totlahirlaki%></div>
                            </td>
                            <td class="C-Field" width="22">
                              <div align="right"><%=totlahirperum%></div>
                            </td>
                            <td class="C-Field" width="33">
                              <div align="right"><%=totlahir%></div>
                            </td>
                            <td class="C-Field" width="15">
                              <div align="right"><%=totmatilaki%></div>
                            </td>
                            <td class="C-Field" width="22">
                              <div align="right"><%=totmatiperum%></div>
                            </td>
                            <td class="C-Field" width="33">
                              <div align="right"><%=totmati%></div>
                            </td>
                            <td class="C-Field" width="34">
                              <div align="right"><%=totpind_lakir_dlm%></div>
                            </td>
                            <td class="C-Field" width="47">
                              <div align="right"><%=totpind_perum_dlm%></div>
                            </td>
                            <td class="C-Field" width="38">
                              <div align="right"><%=totpind_lakir_dlr%></div>
                            </td>
                            <td class="C-Field" width="35">
                              <div align="right"><%=totpind_perum_dlr%></div>
                            </td>
                            <td class="C-Field" width="28">
                              <div align="right"><%=totdtng_lakir_dlm%></div>
                            </td>
                            <td class="C-Field" width="36">
                              <div align="right"><%=totdtng_perum_dlm%></div>
                            </td>
                            <td class="C-Field" width="48">
                              <div align="right"><%=totdtng_lakir_dlr%></div>
                            </td>
                            <td class="C-Field" width="45">
                              <div align="right"><%=totdtng_perum_dlr%></div>
                            </td>
                            <td class="C-Field" width="16">
                              <div align="right"><%=totlaki_akhr%></div>
                            </td>
                            <td class="C-Field" width="24">
                              <div align="right"><%=totperum_akhr%></div>
                            </td>
                            <td class="C-Field" width="39">
                              <div align="right"><%=totakhr%></div>
                            </td>
                            <td class="C-Field" width="81">
                              <div align="right"><%=totkk%></div>
                            </td>
                          </tr>
                       </table>
                      </td>
                      <td width="0%">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1" width="0%"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td height="1" width="100%"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td width="0%" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                  <table width="200" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="100">
                        <div align="left">Keterangan</div>
                      </td>
                      <td width="15">
                        <div align="left">:</div>
                      </td>
                      <td width="184">Lk = Laki-Laki</td>
                    </tr>
                    <tr>
                      <td width="100">&nbsp; </td>
                      <td width="15">&nbsp;</td>
                      <td width="184">Prp = Perempuan</td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
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
   catch(Exception e)
   {
e.printStackTrace();
   }
finally
{
   view.remove();
}

%>
