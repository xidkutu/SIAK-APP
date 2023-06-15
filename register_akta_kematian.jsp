<%@page import="com.db.connection.ServiceController,register.akta.kematian.*,java.util.*,pendaftaran.*"%>
<%@  include file="Global.jsp"%>
<%!
   UserInfo1 record = null;
   RegisterKematian view = null;
%>

<%
try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");
 if(record != null)
 {
%>
<%--
<%@include file="CommonOtorisasi.jsp"%>
<% String statusCetak = request.getParameter("radiobutton");
   System.out.println("statusCetak="+statusCetak);
   if ( (!authorized) && (statusCetak.equalsIgnoreCase("ULANG"))) {
         //otorisasi dialog?
         %>
         <script language="JavaScript">
            if (confirm("Anda belum diotorisasi untuk melakukan cetak ulang, Lakukan Otorisasi?")) {
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=register_akta_kematian.jsp";
              } else {
                self.close();
              }

         </script>
   <%
   } else {

   %>
--%>
<% {
  %>
<html>
<head>
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printRegister(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Akta Kematian ini akan dicetak ?"))
          {
             obj.style.visibility='hidden';
             document.form1.close.style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
            window.print();
            //window.opener.location="cetak_akta_kematian.jsp?update=ok&radiobutton=Ulang&param_nik="+document.all["param_nik"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
            window.opener.location="cetak_akta_kematian.jsp?update=ok&radiobutton=Ulang&param_akta="+document.all["param_akta"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
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
<title>Tampilan Akta Kematian</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>

<%
       String nama_pej = request.getParameter("nama_pej");
       String nip_pej = request.getParameter("nip_pej");
       String radiobutton = request.getParameter("radiobutton");
       String no_akta = request.getParameter("no_akta");
       String param_akta = "";
       StringTokenizer st = new StringTokenizer(no_akta, "|");
       String token = "";
       Vector vAkta = new Vector();

      while (st.hasMoreTokens())
      {
         token = st.nextToken();
         param_akta = param_akta +"|" +token;
         vAkta.addElement(token);
      }

      String nama_prop = request.getParameter("nama_prop");
      String nama_kab = request.getParameter("nama_kab");
      String jabatan = request.getParameter("jabatan");
%>
<body bgcolor="#FFFFFF" text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="">
<input type="hidden" name="param_nik" value="<%=param_akta%>">
<%
int totalPage = vAkta.size();
%>
<table width="100%" border="0" cellspacing="5" cellpadding="5">
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
String tgl_ctk = "";
          ServiceController statelessController = ServiceController.getInstance();
          RegisterKematianHome home = (RegisterKematianHome)statelessController.lookup("RegisterKematianBean", RegisterKematianHome.class);
          view = home.create();
          Vector vData=null;
          vData=view.retrieveData(vAkta, nama_prop, nama_kab);

for(int i =0;i<vData.size();i++)
{
    tgl_ctk = tgl_ctk + "|"+ ((AktaKematianObject)vData.elementAt(i)).getTgl_cetak_akta();
    AktaKematianObject obj = (AktaKematianObject)vData.elementAt(i);
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative; top:1px; left:1px;" onClick="zoom(this.id)">
    <table border="0" cellspacing="1" cellpadding="0" align="center" width="300">
      <tr>
    <td>
      <table width="100%" border="0" cellspacing="1" cellpadding="10">
        <tr>
          <td bgcolor="#FFFFFF">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="font_TAB">
              <tr>
                <td valign="top" height="15">
                  <table width="350" border="0" cellspacing="0" cellpadding="0" align="right">
                    <tr>
                      <td>
                        <div align="right"><font size="2"></font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="4" cellpadding="0" align="center" class="fonts_KT_KK">
                    <tr>
                      <td height="50" colspan="2">
                        <div align="center"><img border="0" src="images/Garuda.gif" width="58" height="63"></div>
                      </td>
                    </tr>
                    <tr valign="top">
                      <td colspan="2" height="55">
                        <table width="250" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr>
                            <td>
                              <div align="center"><font face="Times New Roman, Times, serif" size="4"><b>AKTA
                                KEMATIAN</b></font></div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div align="center"><font face="Times New Roman, Times, serif" size="2"><b>WARGA
                                NEGARA<%=" "+obj.getKwrngrn_jenazah()%></b></font></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td width="484">
                        <table width="300" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td class="fonts_KT_KK">Nomor</td>
                            <td class="fonts_KT_KK"> : </td>
                            <td class="fonts_KT_KK"><%=obj.getNo_akta_mati_jenazah()%></td>
                          </tr>
                          <tr>
                            <td class="fonts_KT_KK">NIK </td>
                            <td class="fonts_KT_KK">:</td>
                            <td class="fonts_KT_KK"><%=obj.getNik_jenazah()%></td>
                          </tr>
                        </table>
                      </td>
                      <td valign="top" width="230">
                        <table width="200" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                                <td width="200" class="fonts_KT_KK" nowrap>&nbsp;<%=obj.getDasar_hkm_mati()%></td>
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
                  <table width="100%" border="0" cellspacing="4" cellpadding="0" class="fonts_KT_KK">
                    <tr>
                      <td class="fonts_KT_KK">
                            <p align="justify">Pada hari ini <%=obj.getHari_ini_day()%>
                              tanggal <%=obj.getHari_ini_dd()+" "+obj.getHari_ini_mm()%>
                              tahun <%=obj.getHari_ini_yy()%> hadir dihadapan
                              saya <%=nama_pej%> Kepala <%=jabatan%> seorang pelapor
                              bernama <%=obj.getNama_pelpor()%> umur <%=obj.getUmur_pelpor()+" "%>
                              tahun, pekerjaan <%=obj.getPekerjaan_pelpor()%>
                              alamat tempat tinggal <%=obj.getAlamat_pelpor()%>
                              RT. <%=obj.getRt_pelpor()%> RW. <%=obj.getRw_pelpor()%>
                              Kelurahan/Desa <%=obj.getKel_pelpor()%> Kecamatan
                              <%=obj.getKec_pelpor()%>&nbsp;<%=getKabupaten(obj.getKab_pelpor())%>
                              Provinsi <%=obj.getProp_pelpor()%> dengan membawa
                              persyaratan :</p>
                      </td>
                    </tr>
                    <tr>
                    <%
                       Vector vPersyaratan = view.getPersyaratanAktaMati( obj.getPersyaratan_mti() );
                    %>
                      <td class="fonts_KT_KK">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <%
                         int num=1;
                         int cntr=0;
                         int cntr1=0;

           while(cntr<vPersyaratan.size())
                                {
                              %>
                          <tr>
                              <%
                               cntr1=0;
                             while(cntr1<2)
                                 {
                              %>

                                <td width="14" valign="top" class="fonts_KT_KK">
                               <%=num%>.
                               </td>
                               <td width="308" class="fonts_KT_KK">
                                  <%=vPersyaratan.elementAt(cntr).toString().trim()%>
                               </td>

                               <%
                                  cntr1=cntr1+1;
                                  cntr=cntr+1;
                                  num=num+1;
                                 if (cntr>(vPersyaratan.size()-1)) break;
                                  }
                              %>
                          </tr>
                          <%
                          }
                          %>

                        </table>
                            <p align="justify">melaporkan bahwa di <%=obj.getTmpt_mati_jenazah()%>
                              pada hari <%=obj.getTgl_mti_day_jenazah()%> tanggal
                              <%=obj.getTgl_mti_string_dd_jenazah()%> <%=" "+obj.getTgl_mti_string_mm_jenazah()%>
                              tahun <%=obj.getTgl_mti_string_yy_jenazah()%> pukul
                              <%=obj.getPukul_mti_jenazah()%> telah meningggal
                              dunia seorang bernama <%=obj.getNama_lgkp_jenazah()%>
                              lahir di <%=obj.getTmpt_lahir_jenazah()%> pada tanggal
                              <%=obj.getTgl_lhr_string_dd_jenazah()+ " "+obj.getTgl_lhr_string_mm_jenazah()%>
                              tahun <%=obj.getTgl_lhr_string_yy_jenazah()%> pekerjaan
                              <%=obj.getPekerjaan_jenazah()%> alamat tempat tinggal
                              terakhir <%=obj.getAlamat_jenazah()%> RT <%=obj.getRt_jenazah()%>
                              RW <%=obj.getRw_jenazah()%> Kelurahan/Desa <%=obj.getKel_jenazah()%>
                              Kecamatan <%=obj.getKec_jenazah()%>&nbsp;<%=getKabupaten(obj.getKab_jenazah())%>
                              Provinsi<%=obj.getProp_jenazah()%> anak ke <%=obj.getAnak_ke_jenazah()+ " "+obj.getJenis_klmin_jenazah()+ " "%>dari
                              <%=obj.getNama_ayah()%> umur <%=obj.getUmur_ayah()+" "%>
                              tahun, perkerjaan <%=obj.getPekerjaan_ayah()%> alamat
                              tempat tinggal <%=obj.getAlamat_ayah()%> RT. <%=obj.getRt_ayah()%>
                              RW. <%=obj.getRw_ayah()%> Kelurahan/Desa <%=obj.getKel_ayah()%>
                              Kecamatan <%=obj.getKec_ayah()%> &nbsp;<%=getKabupaten(obj.getKab_ayah())%>
                              Provinsi <%=obj.getProp_ayah()%> dan <%=obj.getNama_ibu()%>
                              umur <%=obj.getUmur_ibu()+" "%> tahun, perkerjaan
                              <%=obj.getPekerjaan_ibu()%> alamat tempat tinggal
                              <%=obj.getAlamat_ibu()%> RT. <%=obj.getRt_ibu()%>
                              RW. <%=obj.getRw_ibu()%> Kelurahan/Desa <%=obj.getKel_ibu()%>
                              Kecamatan <%=obj.getKec_ibu()%> &nbsp;<%=getKabupaten(obj.getKab_ibu())%>
                              Provinsi <%=obj.getProp_ibu()%>. Pencatatan Kematian
                              ini disaksikan oleh :</p>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table width="100%" border="0" cellspacing="4" cellpadding="0">
                    <tr>
                      <td width="2" valign="top" class="fonts_KT_KK">1. </td>
                      <td class="fonts_KT_KK"><p align="justify"><%=obj.getNama_saksi1()%>
                        umur <%=obj.getUmur_saksi1()+" "%> tahun, pekerjaan <%=obj.getPekerjaan_saksi1()%>
                        alamat tempat tinggal <%=obj.getAlamat_saksi1()%>
                        RT. <%=obj.getRt_saksi1()%> RW. <%=obj.getRw_saksi1()%> Kelurahan/Desa
                        <%=obj.getKel_saksi1()%> Kecamatan <%=obj.getKec_saksi1()%>
						&nbsp;<%=getKabupaten(obj.getKab_saksi1())%>
                        Provinsi&nbsp;<%=obj.getProp_saksi1()%>.</p></td>
                    </tr>
                    <tr>
                      <td width="2" valign="top" class="fonts_KT_KK">2.</td>
                      <td class="fonts_KT_KK"><p align="justify"><%=obj.getNama_saksi2()%>
                        umur <%=obj.getUmur_saksi2()+" "%> tahun, pekerjaan <%=obj.getPekerjaan_saksi2()%>
                        alamat tempat tinggal <%=obj.getAlamat_saksi2()%>
                        RT. <%=obj.getRt_saksi2()%> RW. <%=obj.getRw_saksi2()%> Kelurahan/Desa
                        <%=obj.getKel_saksi2()%> Kecamatan <%=obj.getKec_saksi2()%>
						&nbsp;<%=getKabupaten(obj.getKab_saksi2())%>
                        Provinsi&nbsp;<%=obj.getProp_saksi2()%>.</p></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top" class="fonts_KT_KK"><p align="justify">Setelah Akta Kematian
                  ini dibacakan dan dijelaskan, ditandatangani oleh pelapor, saksi
                  dan saya.</p></td>
              </tr>
              <tr>
                    <td valign="top" class="fonts_KT_KK">
                      <table width="95%" border="0" cellspacing="4" cellpadding="0" align="center">
                        <tr>
                          <td valign="bottom" width="31%" class="fonts_KT_KK">
                            <div align="center">Tanda tangan<br>
                              Saksi pertama,</div>
                          </td>
                          <td valign="bottom" width="32%" class="fonts_KT_KK">
                            <div align="center">Tanda tangan<br>
                              Pelapor,</div>
                          </td>
                          <td width="37%" class="fonts_KT_KK">
                            <div align="center">Tanda tangan<br>
                              Saksi kedua</div>
                          </td>
                        </tr>
                        <tr>
                          <td width="31%" height="14" class="fonts_KT_KK">&nbsp;</td>
                          <td width="32%" height="14" class="fonts_KT_KK">&nbsp;</td>
                          <td width="37%" height="14" class="fonts_KT_KK">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="31%" height="14" class="fonts_KT_KK">&nbsp;</td>
                          <td width="32%" height="14" class="fonts_KT_KK">&nbsp;</td>
                          <td width="37%" height="14" class="fonts_KT_KK">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="31%" height="14" class="fonts_KT_KK">
                            <div align="center"><u><%=obj.getNama_pelpor()%></u></div>
                          </td>
                          <td width="32%" height="14" class="fonts_KT_KK">
                            <div align="center"><u><%=obj.getNama_saksi1()%></u></div>
                          </td>
                          <td width="37%" height="14" class="fonts_KT_KK">
                            <div align="center"><u><%=obj.getNama_saksi2()%></u></div>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" height="60" class="fonts_KT_KK" rowspan="6">&nbsp;</td>
                          <td width="37%" height="14" class="fonts_KT_KK">&nbsp;</td>
                        </tr>
                        <tr>
                          <td class="fonts_KT_KK" valign="middle">
                            <div align="center">Kepala&nbsp;<%=jabatan%></div>
                            <div align="center"></div>
                          </td>
                        </tr>
                        <tr>
                          <td width="37%" height="6" class="fonts_KT_KK">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="37%" height="6" class="fonts_KT_KK">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="37%" height="6" class="fonts_KT_KK">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="37%" height="6" class="fonts_KT_KK">
                            <div align="center"><u><%=nama_pej%></u><br>
                              NIP. <%=nip_pej%></div>
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
%>
<input type="hidden" name="tgl_ctk" value="<%=tgl_ctk%>">
</form>
</body>
</html>
<%
}
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
finally
{
    if(view!=null)
    {
        view.remove();
    }
}

%>
