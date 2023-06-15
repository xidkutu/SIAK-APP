<%@page import="com.db.connection.ServiceController,register.akta.kelahiran.*,java.util.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>
<%!
    UserInfo1 record = null;
RegisterAktaLahir view = null;
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
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=register_akta_kelahiran.jsp";
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
<title>siakOnline</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printRegister(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Akta Kelahiran ini akan dicetak ?"))
          {
             obj.style.visibility='hidden';
             document.form1.close.style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
            window.print();
            window.opener.location="cetak_akta_kelahiran_WNI.jsp?update=okregister&radiobutton=Ulang&param_nik="+document.all["param_nik"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
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
       String nama_pej = request.getParameter("nama_pej");
       String nip_pej = request.getParameter("nip_pej");
       String radiobutton = request.getParameter("radiobutton");
       String nik = request.getParameter("nik");
       String param_nik = "";
       StringTokenizer st = new StringTokenizer(nik, "|");
       String token = "";
       Vector vNik = new Vector();

      while (st.hasMoreTokens())
      {
         token = st.nextToken();
         param_nik = param_nik +"|" +token;
         vNik.addElement(token);
      }

String cb = request.getParameter("cb");
StringTokenizer st1 = new StringTokenizer(cb, "^");
String tmpt_lhr="";
Vector vttmp=new Vector();
 while (st1.hasMoreTokens())
      {
         token = st1.nextToken();
         StringTokenizer st2 = new StringTokenizer(token, "|");
         int ct = 0;

         while(st2.hasMoreTokens())
         {
             token = st2.nextToken();
            /* if(ct==0)
             {
                  no_akta_lahir = token2;
             }
             else if(ct==1)
             {
                  nik = token2;
             }
             else if(ct==2)
             {
                  nama = token2;
             }*/
              if(ct==3)
             {
                  tmpt_lhr = token;
             }
             /*else if(ct==4)
             {
                  nama_ibu = token2;
             }
             else if(ct==5)
             {
                  nama_ayah = token2;
             }
             else if(ct==6)
             {
                  daylhr = token2;
             }
             else if(ct==7)
             {
                  monthlhr = token2;
             }
             else if(ct==8)
             {
                 yearlhr = token2;
             }
             else if(ct==9)
             {
                  nama_negara = token2;
             }
             else if(ct==10)
             {
                  anak_ke_lahir = token2;
                  System.out.println("*anak_ke_lahir= "+anak_ke_lahir);
             }
             else if(ct==11)
             {
                  jenis_klmin = token2;
                  System.out.println("*jenis_klmin= "+jenis_klmin);
             }
*/
             ct++;
      }
vttmp.addElement(tmpt_lhr);
      }

      String nama_prop = request.getParameter("nama_prop");
      String nama_kab = request.getParameter("nama_kab");
      String jabatan = request.getParameter("jabatan");
%>
<body bgcolor="#FFFFFF" text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="">
<input type="hidden" name="param_nik" value="<%=param_nik%>">
<%
int totalPage = vNik.size();
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
          RegisterAktaLahirHome home = (RegisterAktaLahirHome)statelessController.lookup("RegisterAktaLahirBean", RegisterAktaLahirHome.class);
          view = home.create();
          Vector vData=null;
          vData=view.retrieveData(vNik, nama_prop, nama_kab);

for(int i =0;i<vData.size();i++)
{
    tgl_ctk = tgl_ctk + "|"+ ((RegisterKelahiranObject)vData.elementAt(i)).getTgl_cetak_akta();
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative; top:1px; left:1px;" onClick="zoom(this.id)">
<table width="300" border="0" cellspacing="1" cellpadding="0" align="center">
  <tr>
    <td >
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
                              <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" class="fonts_AKTA_pkwn">
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
                                          <div align="center"><font face="Times New Roman, Times, serif" size="4"><b class="fonts_akta"><font size="5">AKTA
                                            KELAHIRAN</font></b></font></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><font face="Times New Roman, Times, serif" size="2"><span class="fonts_akta"><b>
WARGA NEGARA <%=((RegisterKelahiranObject)vData.elementAt(i)).getKwrngrn_bayi().toUpperCase()%></b></span></font></div>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td width="484">
                                    <table width="296" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td class="fonts_KT_KK" width="56">&nbsp;</td>
                                        <td class="fonts_KT_KK" width="10">&nbsp;</td>
                                        <td class="fonts_KT_KK" width="200">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK" width="56">Nomor</td>
                                        <td class="fonts_KT_KK" width="10"> :
                                        </td>
                                        <td class="fonts_KT_KK" width="200"><%=((RegisterKelahiranObject)vData.elementAt(i)).getNo_akta_lahir_bayi()%></td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK" width="60">NIK</td>
                                        <td class="fonts_KT_KK" width="10">:</td>
                                        <td class="fonts_KT_KK" width="200"><%=((RegisterKelahiranObject)vData.elementAt(i)).getNik_bayi()%></td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td valign="top" width="230">
                                    <table width="200" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td class="fonts_KT_KK">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK"><%=((RegisterKelahiranObject)vData.elementAt(i)).getDsrhk_cttlhr()%></td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="4" cellpadding="0" class="fonts_AKTA_pkwn">
                                <tr>
                                  <td class="fonts_KT_KK">
                                    <p align="justify">Pada hari ini <%=((RegisterKelahiranObject)vData.elementAt(i)).getHari_ini_day()%> tanggal <%=((RegisterKelahiranObject)vData.elementAt(i)).getHari_ini_dd()%>
&nbsp;<%=((RegisterKelahiranObject)vData.elementAt(i)).getHari_ini_mm()%>
tahun <%=((RegisterKelahiranObject)vData.elementAt(i)).getHari_ini_yy()%> hadir dihadapan
                                      saya <%=nama_pej%>
                                      Kepala <%=jabatan%>
                                      di <%=nama_kab%>
                                      seorang pelapor bernama <%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_pelpor()%> umur
                                      <%=((RegisterKelahiranObject)vData.elementAt(i)).getUmur_pelpor()%> tahun, pekerjaan <%=((RegisterKelahiranObject)vData.elementAt(i)).getPekerjaan_pelpor()%>
                                      alamat tempat tinggal <%=((RegisterKelahiranObject)vData.elementAt(i)).getAlamat_pelpor()%> RT. <%=((RegisterKelahiranObject)vData.elementAt(i)).getRt_pelpor()%>
                                      RW. <%=((RegisterKelahiranObject)vData.elementAt(i)).getRw_pelpor()%> Kelurahan/Desa <%=((RegisterKelahiranObject)vData.elementAt(i)).getKel_pelpor()%>
                                      Kecamatan <%=((RegisterKelahiranObject)vData.elementAt(i)).getKec_pelpor()%>
									  &nbsp;<%=getKabupaten(((RegisterKelahiranObject)vData.elementAt(i)).getKab_pelpor())%> Provinsi <%=((RegisterKelahiranObject)vData.elementAt(i)).getProp_pelpor()%>
                                       dengan membawa persyaratan :</p>
                                  </td>
                                </tr>
                                <tr>
                    <%
                            Vector vPersyaratan = view.getPersyaratanLahir(((RegisterKelahiranObject)vData.elementAt(i)).getPersyaratan_bayi());
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
 <p align="justify">melaporkan bahwa di <%=vttmp.elementAt(i)%>
                                      pada hari <%=((RegisterKelahiranObject)vData.elementAt(i)).getTgl_lhr_day_bayi()%> tanggal
                                      <%=((RegisterKelahiranObject)vData.elementAt(i)).getTgl_lhr_string_dd_bayi()%>&nbsp;<%=((RegisterKelahiranObject)vData.elementAt(i)).getTgl_lhr_string_mm_bayi()%> tahun
                                      <%=((RegisterKelahiranObject)vData.elementAt(i)).getTgl_lhr_string_yy_bayi()%> pukul <%=((RegisterKelahiranObject)vData.elementAt(i)).getPukul_lhr_bayi()%> telah
                                      lahir seorang anak bernama <%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_lgkp_bayi()%>
                                      anak ke <%=((RegisterKelahiranObject)vData.elementAt(i)).getAnak_ke_lahir_bayi()%> <%=((RegisterKelahiranObject)vData.elementAt(i)).getJenis_kelamin_bayi()%>
                                      &nbsp;<%=((((RegisterKelahiranObject)vData.elementAt(i)).getNama_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getNama_ayah())%> umur <%=((((RegisterKelahiranObject)vData.elementAt(i)).getUmur_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getUmur_ayah())%>
tahun, perkerjaan <%=((((RegisterKelahiranObject)vData.elementAt(i)).getPekerjaan_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getPekerjaan_ayah())%>
                                      alamat tempat tinggal <%=((((RegisterKelahiranObject)vData.elementAt(i)).getAlamat_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getAlamat_ayah())%>
                                      RT. <%=((((RegisterKelahiranObject)vData.elementAt(i)).getRt_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getRt_ayah())%> RW. <%=((((RegisterKelahiranObject)vData.elementAt(i)).getRw_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getRw_ayah())%>
                                      Kelurahan/Desa <%=((((RegisterKelahiranObject)vData.elementAt(i)).getKel_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getKel_ayah())%>
                                      Kecamatan <%=((((RegisterKelahiranObject)vData.elementAt(i)).getKec_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getKec_ayah())%>
									  &nbsp;<%=((getKabupaten(((RegisterKelahiranObject)vData.elementAt(i)).getKab_ayah())==null)?"-":getKabupaten(((RegisterKelahiranObject)vData.elementAt(i)).getKab_ayah()))%>
                                      Provinsi <%=((((RegisterKelahiranObject)vData.elementAt(i)).getProp_ayah()==null)?"-":((RegisterKelahiranObject)vData.elementAt(i)).getProp_ayah())%>
                                      dan <%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_ibu()%>
                                      umur <%=((RegisterKelahiranObject)vData.elementAt(i)).getUmur_ibu()%> tahun, perkerjaan
                                      <%=((RegisterKelahiranObject)vData.elementAt(i)).getPekerjaan_ibu()%> alamat tempat
                                      tinggal <%=((RegisterKelahiranObject)vData.elementAt(i)).getAlamat_ibu()%>
                                      RT. <%=((RegisterKelahiranObject)vData.elementAt(i)).getRt_ibu()%> RW. <%=((RegisterKelahiranObject)vData.elementAt(i)).getRw_ibu()%>
                                      Kelurahan/Desa <%=((RegisterKelahiranObject)vData.elementAt(i)).getKel_ibu()%>
                                      Kecamatan <%=((RegisterKelahiranObject)vData.elementAt(i)).getKec_ibu()%>
									  &nbsp;<%=getKabupaten(((RegisterKelahiranObject)vData.elementAt(i)).getKab_ibu())%>
                                      Provinsi <%=((RegisterKelahiranObject)vData.elementAt(i)).getProp_ibu()%>.
                                    </p>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                  <td colspan="5" class="fonts_KT_KK">Percatatan
                                    kelahiran ini disaksikan oleh :</td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="fonts_KT_KK">
                                    <table width="100%" border="0" cellspacing="4" cellpadding="0">
                                      <tr>
                                        <td width="2" valign="top" class="fonts_KT_KK">1.
                                        </td>
                                        <td class="fonts_KT_KK"><p align="justify"><%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_saksi1()%>
                                          umur <%=((RegisterKelahiranObject)vData.elementAt(i)).getUmur_saksi1()%> tahun,
                                          pekerjaan <%=((RegisterKelahiranObject)vData.elementAt(i)).getPekerjaan_saksi1()%>
                                          alamat tempat tinggal <%=((RegisterKelahiranObject)vData.elementAt(i)).getAlamat_saksi1()%>
                                          RT. <%=((RegisterKelahiranObject)vData.elementAt(i)).getRt_saksi1()%> RW.<%=((RegisterKelahiranObject)vData.elementAt(i)).getRw_saksi1()%>
                                          Kelurahan/Desa <%=((RegisterKelahiranObject)vData.elementAt(i)).getKel_saksi1()%>
                                          Kecamatan <%=((RegisterKelahiranObject)vData.elementAt(i)).getKec_saksi1()%>
										  &nbsp;<%=getKabupaten(((RegisterKelahiranObject)vData.elementAt(i)).getKab_saksi1())%>
                                          Provinsi <%=((RegisterKelahiranObject)vData.elementAt(i)).getProp_saksi1()%>.</p></td>
                                      </tr>
                                      <tr>
                                        <td width="2" valign="top" class="fonts_KT_KK">2.</td>
                                        <td class="fonts_KT_KK"><p align="justify"><%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_saksi2()%>
                                          umur <%=((RegisterKelahiranObject)vData.elementAt(i)).getUmur_saksi2()%> tahun
                                          pekerjaan <%=((RegisterKelahiranObject)vData.elementAt(i)).getPekerjaan_saksi2()%> alamat tempat
                                          tinggal <%=((RegisterKelahiranObject)vData.elementAt(i)).getAlamat_saksi2()%>
                                          RT. <%=((RegisterKelahiranObject)vData.elementAt(i)).getRt_saksi2()%> RW.  <%=((RegisterKelahiranObject)vData.elementAt(i)).getRw_saksi2()%>
                                          Kelurahan/Desa <%=((RegisterKelahiranObject)vData.elementAt(i)).getKel_saksi2()%>
                                          Kecamatan <%=((RegisterKelahiranObject)vData.elementAt(i)).getKec_saksi2()%>
										  &nbsp;<%=getKabupaten(((RegisterKelahiranObject)vData.elementAt(i)).getKab_saksi2())%>
										  Provinsi
                                          <%=((RegisterKelahiranObject)vData.elementAt(i)).getProp_saksi2()%>.</p></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" valign="top" class="fonts_KT_KK">Setelah
                                          Akta Kelahiran ini dibacakan dan dijelaskan,
                                          ditandatangani oleh pelapor, saksi dan
                                          saya. </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" align="center">
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
                                    <div align="center"><u><%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_saksi1()%></u></div>
                                  </td>
                                  <td width="32%" height="14" class="fonts_KT_KK">
                                    <div align="center"><u><%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_pelpor()%></u></div>
                                  </td>
                                  <td width="37%" height="14" class="fonts_KT_KK">
                                    <div align="center"><u><%=((RegisterKelahiranObject)vData.elementAt(i)).getNama_saksi2()%></u></div>
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
}
    tgl_ctk = tgl_ctk.substring(1);
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

