<%@page import="com.db.connection.ServiceController,register.akta.perceraian.*,java.util.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>

<html>
<head>
<title>siak Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printRegister(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Akta Perceraian ini akan dicetak ?"))
          {
             obj.style.visibility='hidden';
             document.form1.close.style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
            window.print();
            //alert("PRINT Register AKTA KELAHIRAN");
            window.opener.location="cetak_akta_perceraian.jsp?update=okregister&radiobutton=Ulang&param_akta="+document.all["param_no_akta_cerai"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
            window.close();
        }
    }
}

function zoom(id)
{
    if(document.all[id].style.zoom=="50%")
    {
       document.all[id].style.zoom="100%";
    }
    else
    {
       document.all[id].style.zoom="50%";
    }
}

</script>

<%
       String nama_pej = (request.getParameter("nama_pej")==null?"":request.getParameter("nama_pej"));
       String nip_pej = (request.getParameter("nip_pej")==null?"":request.getParameter("nip_pej"));
       System.out.println("nama_pej= "+nama_pej);
       System.out.println("nip_pej= "+nip_pej);
       String nama_prop = (request.getParameter("nama_prop")==null?"":request.getParameter("nama_prop"));
       String nama_kab = (request.getParameter("nama_kab")==null?"":request.getParameter("nama_kab"));
       String radiobutton = (request.getParameter("radiobutton")==null?"":request.getParameter("radiobutton"));
        String no_akta_cerai = (request.getParameter("no_akta_cerai")==null?"":request.getParameter("no_akta_cerai"));
       StringTokenizer st1 = new StringTokenizer(no_akta_cerai, "^");
       String token = "", token2="", param_akta="";
       Vector vNoAktaCerai = new Vector();
      int ct=0;
      while (st1.hasMoreTokens())
      {
         token = st1.nextToken();
         StringTokenizer st2 = new StringTokenizer(token, "|");

         while(st2.hasMoreTokens())
         {
            token2 = st2.nextToken();

            if(ct==0)
            {
                vNoAktaCerai.addElement(token2);
            }
            ct++;
                    if (ct==5) ct=0;
         }
         param_akta = param_akta +"|" +token2;
      }
      String jabatan = (request.getParameter("jabatan")==null?"":request.getParameter("jabatan"));
%>
<body bgcolor="#FFFFFF" text="#000000" style="media:screen">
<form name="form1" method="post" action="">
<input type="hidden" name="param_no_akta_cerai" value="<%=param_akta%>">
<%
int totalPage = vNoAktaCerai.size();
%>
<table width="100%" border="0" cellspacing="5" cellpadding="5" style="media:screen">
<tr>
   <td>
      <div align="center">
           <input class=boxstandard type="button" name="Print" value="Print" onclick="printRegister(this);">
           <input class=boxstandard type="button" name="close" value="Close" onclick="window.close();;">
           <input type="hidden" name="totalpage" value=<%=totalPage%>>
      </div>
   </td>
</tr>
</table>

<%

RegisterAktaCerai view = null;
String tgl_ctk = "";

try
{
          ServiceController statelessController = ServiceController.getInstance();
          RegisterAktaCeraiHome home = (RegisterAktaCeraiHome)statelessController.lookup("RegisterAktaCeraiBean", RegisterAktaCeraiHome.class);
          view = home.create();
          Vector vData=null;
          if (vData==null) vData = new Vector();
          vData = view.retrieveData(vNoAktaCerai);



  for(int i =0;i<vData.size();i++)
  {
    RegisterPerceraianObject obj = (RegisterPerceraianObject)vData.elementAt(i);
    tgl_ctk = tgl_ctk + "|"+ obj.getTgl_ctk_ktakta();
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative; top:0px; left:0px;media:printer" onClick="zoom(this.id)">
<table width="300" border="0" cellspacing="1" cellpadding="0" align="center">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="1" cellpadding="10">
        <tr>
          <td bgcolor="#FFFFFF">
            <table width="100" border="0" cellspacing="1" cellpadding="10" align="center">
              <tr>
                <td bgcolor="#FFFFFF">
                  <table width="200" border="0" cellspacing="1" cellpadding="10">
                    <tr>
                      <td bgcolor="#FFFFFF">
                        <table width="70" border="0" cellspacing="5" cellpadding="0">
                          <tr>
                            <td>
                              <table width="100" border="0" cellspacing="5" cellpadding="0" align="center" class="fonts_AKTA_pkwn">
                                <tr>
                                  <td height="50" colspan="2">
                                    <div align="center"><img border="0" src="images/Garuda.gif" width="79" height="83"></div>
                                  </td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2" height="55">
                                    <table width="250" border="0" cellspacing="0" cellpadding="0" align="center" class="fonts_AKTA_pkwn">
                                      <tr>
                                        <td>
                                          <div align="center"><font face="Times New Roman, Times, serif" size="4"><b class="fonts_akta">
<font size="4"><u>AKTA PERCERAIAN</u></font></b></font></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
 <div align="center"><font face="Times New Roman, Times, serif" size="2"><span class="fonts_akta"><b>
WARGA NEGARA &nbsp<%=obj.getWargn_suami().toUpperCase()%></b></span></font></div>
                                        </td>
                                      </tr>
                                    </table>
                                  <p>&nbsp;</p></td>
                                </tr>
                                <tr>
                                  <td width="484">
                                    <table width="296" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td class="fonts_KT_KK" width="56">Nomor</td>
                                        <td class="fonts_KT_KK" width="10"> :
                                        </td>
                                        <td class="fonts_KT_KK" width="200">
                                 <%=obj.getNo_akta_crai()%></td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK" width="60">NIK
                                          Suami</td>
                                        <td class="fonts_KT_KK" width="10">:</td>
                                        <td class="fonts_KT_KK" width="200">
                                   <%=obj.getNik_suami()%>
                                    </td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK" width="56">NIK
                                          Istri</td>
                                        <td class="fonts_KT_KK" width="10"> :</td>
                                        <td class="fonts_KT_KK" width="200"><%=obj.getNik_istri()%></td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td valign="top" width="230">
                                    <table width="200" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                            <td class="fonts_KT_KK">&nbsp;<%=obj.getDasar_hkm_crai()%>
                                            </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="2">&nbsp;</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="5" cellpadding="0" class="fonts_AKTA_pkwn">
                                <tr>
                                      <td>
                                        <p class="fonts_KT_KK" align="justify">Pada
                                          hari ini <%=obj.getIni_day()%> tanggal
                                          <%=obj.getIni_date()%> &nbsp;<%=obj.getCurrent_month()%>
                                          tahun <%=obj.getCurrent_year()%> hadir
                                          dihadapan saya <%=nama_pej%> Kepala
                                          <%=jabatan%> seorang pelapor bernama
                                          <%=obj.getNamaPelapor()%> umur <%=obj.getUmurPelapor()%>
                                          tahun, pekerjaan <%=obj.getPkrjn_pelpor()%>
                                          alamat tempat tinggal <%=obj.getAlamat_pelpor()%>
                                          RT. <%=obj.getRt_pelpor()%> RW. <%=obj.getRw_pelpor()%>
                                          Kelurahan/Desa <%=obj.getKel_pelpor()%>
                                          Kecamatan <%=obj.getKec_pelpor()%> &nbsp;<%=getKabupaten(obj.getKab_pelpor())%>
                                          Provinsi <%=obj.getProp_pelpor()%> melaporkan
                                          dengan membawa putusan <%=obj.getLbg_pngadil_kel_kep()%>
                                          <%=obj.getTmpt_lbg_pngadil()%>&nbsp;
                                          nomor&nbsp;<%=obj.getNo_kep_pngadil()%> tanggal <%=obj.getTgl_srt_kep_dt()%>&nbsp;
                                          <%=obj.getTgl_srt_kep_mm()%> Tahun <%=obj.getTgl_srt_kep_yy()%>
                                          yang menyatakan bahwa putusnya perkawinan
                                          karena perceraian antara :</p>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="fonts_KT_KK">
                                    <div align="center" class="fonts_akta">
                                      <p><%=obj.getNama_lgkp_suami()%></p>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td align="center" valign="bottom" class="fonts_KT_KK">
                                    <div align="center" class="fonts_KT_KK">dengan
                                    </div>
                                    <div align="center" class="fonts_AKTA_pkwn"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="fonts_KT_KK">
                                    <div align="center" class="fonts_akta"><%=obj.getNama_lgkp_istri()%></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="fonts_AKTA_pkwn">
                                        <p class="fonts_KT_KK" align="justify">yang
                                          perkawinannya dicatatkan di <%=obj.getTmpt_ctt_kwn()%>,
                                          akta perkawinan Nomor&nbsp;<%=obj.getNoAktakwn()%>
                                          tanggal <%=obj.getKawin_dt()%>&nbsp;<%=obj.getKawin_month()%>
                                          tahun <%=obj.getKawin_year()%> dan surat
                                          keterangan Panitera Pengadilan Negeri
                                          <%=obj.getTmpt_lbg_pngadil()%> Nomor
                                          <%=obj.getNo_srt_ket_pn()%> tanggal
                                          <%=obj.getTgl_srt_kep_dt()%>&nbsp;<%=obj.getTgl_srt_kep_mm()%>
                                          tahun <%=obj.getTgl_srt_kep_yy()%> yang
                                          menyatakan bahwa Putusan tersebut telah
                                          mempunyai kekuatan hukum yang tetap.
                                        </p>
                                        <p class="fonts_KT_KK" align="justify">&nbsp;
                                        </p>
                                      </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" align="center">
                              <table width="400" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                      <td>
                                        <table width="242" border="0" cellspacing="3" cellpadding="0" align="right">
                                          <tr>
                                            <td class="fonts_KT_KK">
                                              <div align="center">Tanda Tangan,<br>
                                                Pelapor </div>
                                            </td>
                                          </tr>
                                          <tr>
                                            <td class="fonts_KT_KK">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td class="fonts_KT_KK">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td class="fonts_KT_KK">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td class="fonts_KT_KK">
                                              <div align="center"><u><%=obj.getNamaPelapor()%></u>
                                              </div>
                                            </td>
                                          </tr>
                                        </table>
                                      </td>
                                  <td>
                                        <table width="242" border="0" cellspacing="3" cellpadding="0" align="right">
                                          <tr>
                                        <td class="fonts_KT_KK">
                                              <div align="center">Kepala&amp&nbsp;<%=jabatan%></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK">
                                          <div align="center"><u><%=nama_pej%></u><br>
                                            NIP. <%=nip_pej%>;</div>
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
<%if (i<(vData.size()-1))
{
%>
<p style="page-break-before:always">&nbsp; </p>
<%
}
%>

<%
         tgl_ctk = tgl_ctk.substring(1);
    }
}
catch(Exception e)
{
    e.printStackTrace();
}
finally
{
    if(view!=null)
    {
        view.remove();
    }
}
%>
<input type="hidden" name="tgl_ctk" value="<%=tgl_ctk%>">
</form>
</body>
</html>
