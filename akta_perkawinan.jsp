<%@page import="com.db.connection.ServiceController,register.akta.perkawinan.*,java.util.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>
<%!
String getStatus(String status)
{
String result="";
if ((status!=null) && (status.trim().equals("Belum Kawin"))) result="belum pernah";
else if ((status!=null) && !(status.trim().equals("Belum Kawin"))) result="pernah";
return result;
}
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
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=akta_perkawinan.jsp";
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
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printRegister(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Akta Perkawinan ini akan dicetak ?"))
          {
             obj.style.visibility='hidden';
             document.form1.close.style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
            window.print();
            //alert("PRINT Register AKTA KELAHIRAN");
            window.opener.location="cetak_akta_perkawinan.jsp?update=okregister&radiobutton=Ulang&param_akta="+document.all["param_no_akta_kawin"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>
<%
       String nama_pej = (request.getParameter("nama_pej")==null?"":request.getParameter("nama_pej"));
       String nip_pej = (request.getParameter("nip_pej")==null?"":request.getParameter("nip_pej"));
       System.out.println("nama_pej= "+nama_pej);
       System.out.println("nip_pej= "+nip_pej);
       String nama_prop = (request.getParameter("nama_prop")==null?"":request.getParameter("nama_prop"));
       String nama_kab = (request.getParameter("nama_kab")==null?"":request.getParameter("nama_kab"));
       String radiobutton = (request.getParameter("radiobutton")==null?"":request.getParameter("radiobutton"));
       String no_akta_kawin = (request.getParameter("no_akta_kawin")==null?"":request.getParameter("no_akta_kawin"));
       System.out.println("no_akta_kawin di register akta perkawinan: "+no_akta_kawin);
      Vector vNoAktaKawin = new Vector();

      StringTokenizer st1 = new StringTokenizer(no_akta_kawin, "^");
      String token = "", token2="", param_akta="";
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
               System.out.println("token2 no_akta_kwn= "+token2+" & ct= "+ct);
         vNoAktaKawin.addElement(token2);
         param_akta = param_akta +"|" +token2;
            }
            ct++;
         }
      }
      String jabatan = (request.getParameter("jabatan")==null?"":request.getParameter("jabatan"));
%>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="">
<input type="hidden" name="param_no_akta_kawin" value="<%=param_akta%>">
<%
int totalPage = vNoAktaKawin.size();
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
RegisterAktaKawin view = null;
String tgl_ctk = "";
          ServiceController statelessController = ServiceController.getInstance();
          RegisterAktaKawinHome home = (RegisterAktaKawinHome)statelessController.lookup("RegisterAktaKawinBean", RegisterAktaKawinHome.class);
          view = home.create();
          Vector vData=null;
          if (vData==null) vData = new Vector();
          vData=view.retrieveData(vNoAktaKawin);
for(int i =0;i<vData.size();i++)
{
    tgl_ctk = tgl_ctk + "|"+ ((RegisterPerkawinanObject)vData.elementAt(i)).getTgl_cetak_akta();
    RegisterPerkawinanObject obj = (RegisterPerkawinanObject)vData.elementAt(i);
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative; top:0px; left:0px;" onClick="zoom(this.id)">
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
                                              <div align="center"><font face="Times New Roman, Times, serif" size="4"><b class="fonts_akta">AKTA
                                                PERKAWINAN</b></font></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
<div align="center"><font face="Times New Roman, Times, serif" size="2"><span class="fonts_akta"><b>WARGA
NEGARA &nbsp;<%=obj.getKwrngrn_suami()%>
</b>
</span>
</font>
</div>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td width="484">
                                    <table width="296" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td class="fonts_KT_KK" width="56">Nomor</td>
                                        <td class="fonts_KT_KK" width="10"> :
                                        </td>
                                        <td class="fonts_KT_KK" width="200">
                                          <%=vNoAktaKawin.elementAt(i).toString()%></td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK" width="60">NIK
                                          Suami</td>
                                        <td class="fonts_KT_KK" width="10">:</td>
                                        <td class="fonts_KT_KK" width="200">
                                          <%=obj.getNik_suami()%></td>
                                      </tr>
                                      <tr>
                                        <td class="fonts_KT_KK" width="56">NIK
                                          Istri</td>
                                        <td class="fonts_KT_KK" width="10"> :</td>
                                        <td class="fonts_KT_KK" width="200">
                                          <%=obj.getNik_istri()%></td>
                                      </tr>
                                    </table>
                                  </td>
	<td valign="top" width="230">
		<table width="200" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="fonts_KT_KK"><%=obj.getDsrhk_cttlhr()%></td>
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
<%
UserInfo1 record = null;
try {
     record = (UserInfo1)session.getAttribute("remoteRef");
} catch (Exception ex) {
  ex.printStackTrace();
}
%>
                              <table width="100%" border="0" cellspacing="4" cellpadding="0" class="fonts_AKTA_pkwn">
                                <tr>
                                      <td class="fonts_KT_KK">
									  <p align="justify">
									  Pada hari ini <%=obj.getM_ini_day()%>
                                        tanggal <%=obj.getM_current_date()%>&nbsp;<%=obj.getM_current_month()%>
                                        tahun&nbsp;<%=obj.getM_current_year()%>&nbsp;pukul&nbsp;<%=obj.getM_current_time()%>
                                        hadir dihadapan saya <%=nama_pej%>&nbsp;Kepala&nbsp;<%=record.getKabJabatan()%>
                                        di&nbsp;<%=nama_kab%>,&nbsp;<%=obj.getNama_lgkp_suami()%>&nbsp;tempat tanggal lahir&nbsp; <%=obj.getTmpt_lahir_suami() +" "+obj.getTgl_lhr_string_dd_suami()%>
                                        <%=" "+obj.getTgl_lhr_string_mm_suami()+ " "+obj.getTgl_lhr_string_yy_suami()%>
                                        &nbsp; umur <%=obj.getUmur_suami()%>
                                        tahun, agama <%=obj.getAgama_suami()%>
                                        pekerjaan <%=obj.getPekarjan_suami()%>
                                        alamat tempat tinggal <%=obj.getAlamat_suami()%>
                                        RT. <%=obj.getRt_suami()%> RW. <%=obj.getRw_suami()%>
                                        Kelurahan/Desa <%=obj.getKelnama_suami()%>
                                        Kecamatan <%=obj.getKecnama_suami()%>
										&nbsp;<%=getKabupaten(obj.getKabnama_suami())%>
                                        Provinsi <%=obj.getPropnama_suami()%>
                                        sebelumnya <%=getStatus(obj.getSebel_suami())%>
                                        kawin dengan--- anak ke ---laki-laki&nbsp;<%=obj.getNama_ayah_suami()%> umur&nbsp;<%=obj.getUmur_ayah_suami()%>&nbsp;tahun,
                                        agama &nbsp;<%=obj.getM_agama_ayah_suami()%>&nbsp;pekerjaan&nbsp;<%=obj.getPekerjaan_ayah_suami()%>&nbsp;
                                        alamat tempat tinggal <%=obj.getAlamat_ayah()%>
                                        RT.<%=obj.getRt_ayah_suami()%> RW.<%=obj.getRw_ayah_suami()%>
                                        Kelurahan/Desa <%=obj.getKel_ayah_suami()%>
                                        Kecamatan <%=obj.getKec_ayah_suami()%>
										&nbsp;<%=getKabupaten(obj.getKab_ayah_suami())%>
                                        Provinsi <%=obj.getProp_ayah_suami()%>&nbsp;
                                        dan <%=obj.getNama_ibu_suami()%> umur
                                        <%=obj.getUmur_ibu_suami()%> tahun, agama
                                        <%=obj.getM_agama_ibu_suami()%> pekerjaan
                                        <%=obj.getPekerjaan_ibu_suami()%> alamat
                                        tempat tinggal <%=obj.getAlamat_ibu_suami()%>
                                        RT. <%=obj.getRt_ibu_suami()%> RW. <%=obj.getRw_ibu_suami()%>
                                        Kelurahan/Desa <%=obj.getKel_ayah_suami()%>
                                        Kecamatan <%=obj.getKec_ayah_suami()%>
										&nbsp;<%=getKabupaten(obj.getKab_ayah_suami())%>
                                        Provinsi <%=obj.getProp_ayah_suami()%>
										</p>
										</td>
                                </tr>
                                <tr>
                                  <td class="fonts_KT_KK">
                                    <div align="center" class="fonts_KT_KK">dan</div>
                                  </td>
                                </tr>
                                <tr>
                                      <td class="fonts_KT_KK"><p align="justify"><%=obj.getNama_lgkp_istri()%>&nbsp;tempat tanggal lahir&nbsp;
                                        <%=" "+obj.getTmpt_lahir_istri()+" "+obj.getTgl_lhr_string_dd_istri()+" "+obj.getTgl_lhr_string_mm_istri()+" "+obj.getTgl_lhr_string_yy_istri()%>&nbsp;
                                        umur <%=obj.getM_umur_istri()%> tahun,
                                        agama <%=obj.getAgama_istri()%> pekerjaan
                                        <%=obj.getM_pekarjan_istri()%> alamat
                                        tempat tinggal <%=obj.getAlamat_istri()%>
                                        RT.<%=obj.getRt_istri()%> RW.<%=obj.getRw_istri()%>
                                        Kelurahan/Desa <%=obj.getKelnama_istri()%>
                                        Kecamatan <%=obj.getKecnama_istri()%>
										&nbsp;<%=getKabupaten(obj.getKabnama_istri())%>
                                        Provinsi <%=obj.getPropnama_istri()%>
                                        sebelumnya <%=getStatus(obj.getSebel_istri())%>
                                        kawin dengan --- anak ke---perempuan <%=obj.getNama_ayah_istri()%>
                                        umur <%=obj.getUmur_ayah_istri()%> tahun,
                                        agama <%=obj.getM_agama_ayah_istri()%>&nbsp;pekerjaan
                                        <%=obj.getPekerjaan_ayah_istri()%> alamat
                                        tempat tinggal <%=obj.getAlamat_ayah_istri()%>
                                        RT. <%=obj.getRt_ayah_istri()%> RW. <%=obj.getRw_ayah_istri()%>
                                        Kelurahan/Desa <%=obj.getKel_ayah_istri()%>
                                        Kecamatan <%=obj.getKec_ayah_istri()%>
										&nbsp;<%=getKabupaten(obj.getKab_ayah_istri())%>
                                        Provinsi <%=obj.getProp_ayah_istri()%>
                                        dan <%=obj.getNama_ibu_istri()%> umur
                                        <%=obj.getUmur_ibu_istri()%> tahun, agama
                                        <%=obj.getM_agama_ibu_istri()%> pekerjaan
                                        <%=obj.getPekerjaan_ibu_istri()%> alamat
                                        tempat tinggal <%=obj.getAlamat_ibu_istri()%>&nbsp;RT.
                                        <%=obj.getRt_ibu_istri()%> RW. <%=obj.getRw_ibu_istri()%>
                                        Kelurahan/Desa <%=obj.getKel_ibu_istri()%>
                                        Kecamatan <%=obj.getKec_ibu_istri()%>
										&nbsp;<%=getKabupaten(obj.getKab_ibu_istri())%>
                                        Provinsi <%=obj.getProp_ibu_istri()%> </p>
                                      </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                      <td colspan="5" class="fonts_KT_KK">
                                        <p align="justify">Perkawinan mereka telah
                                          dilangsungkan dihadapan pemuka agama
                                          <%=obj.getTiduk_agama()%> yang bernama
                                          <%=obj.getNama_pmka()%> pada tanggal&nbsp;<%=obj.getKwnDate()%>&nbsp;<%=obj.getKwnMonth()%>
                                          tahun <%=obj.getKwnYear()%>&nbsp;di
                                          <%=obj.getNamaTmptPnesah()%> &nbsp;<%=obj.getKetNamaTmptPnesah()%>.
                                          Dalam pencatatan perkawinan ini telah
                                          diakui dan disahkan --- anak, yaitu
                                          :</p>
                                      </td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="fonts_KT_KK">
                                    <table width="100%" border="0" cellspacing="3" cellpadding="0" align="center">
                                      <tr>
                                        <td colspan="5" class="fonts_KT_KK">
                                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="15" class="fonts_KT_KK">
<img src="images/dot.gif" width="1" height="1"></td>
                 <td width="3" class="fonts_KT_KK">1.</td>
                                 <td class="fonts_KT_KK"> ---------------------------Akta
                                   Kelahiran Nomor ---------------------------</td>
                                     </tr>
                                       <tr>
                                             <td class="fonts_KT_KK">&nbsp;</td>
                                             <td class="fonts_KT_KK">2.</td>
                                             <td class="fonts_KT_KK">---------------------------Akta
                                                    Kelahiran Nomor ---------------------------</td>
                                          </tr>
                                            <tr>
                                              <td class="fonts_KT_KK">&nbsp;</td>
                                              <td class="fonts_KT_KK">3.</td>
                                                  <td class="fonts_KT_KK">---------------------------Akta
                                                    Kelahiran Nomor ---------------------------</td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td colspan="5" class="fonts_KT_KK"><p align="justify">Mereka
                                          meminta kepada saya supaya mencatatkan
                                          perkawinannya dengan melampirkan persyaratan
                                          sebagai berikut :</p></td>
                                      </tr>
                                      <tr>
<%
 Vector vPersyaratan = view.getPersyaratanKawin(obj.getPersyaratan_kawin());
%>
<td colspan="5" class="fonts_KT_KK">
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
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="fonts_KT_KK">Percatatan
                                    perkawinan ini disaksikan oleh :</td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="fonts_KT_KK">
                                    <table width="100%" border="0" cellspacing="4" cellpadding="0">
                                      <tr>
                                        <td width="2" valign="top" class="fonts_KT_KK">1.
                                        </td>
                                        <td class="fonts_KT_KK"><p align="justify"><%=obj.getNama_saksi1()%>&nbsp;
umur <%=obj.getUmur_saksi1()%> tahun, agama <%=obj.getAgama_saksi1()%>
                                          pekerjaan <%=obj.getPekerjaan_saksi1()%>
                                          alamat tempat tinggal <%=obj.getAlamat_saksi1()%>
                                          RT. <%=obj.getRt_saksi1()%>; RW. <%=obj.getRw_saksi1()%>
                                          Kelurahan/Desa <%=obj.getKel_saksi1()%>
                                          Kecamatan <%=obj.getKec_saksi1()%>
										  &nbsp;<%=getKabupaten(obj.getKab_saksi1())%>
                                          Provinsi <%=obj.getProp_saksi1()%>.</p></td>
                                      </tr>
                                      <tr>
                                        <td width="2" valign="top" class="fonts_KT_KK">2.</td>
                                        <td class="fonts_KT_KK"><p align="justify"><%=obj.getNama_saksi2()%>
                                         umur <%=obj.getUmur_saksi2()%> tahun, agama
                                         <%=obj.getAgama_saksi2()%> pekerjaan <%=obj.getPekerjaan_saksi2()%>
 alamat tempat tinggal <%=obj.getAlamat_saksi2()%>
                                          RT. <%=obj.getRt_saksi2()%> RW. <%=obj.getRw_saksi2()%>
                                          Kelurahan/Desa <%=obj.getKel_saksi2()%>
                                          Kecamatan <%=obj.getKec_saksi2()%>
										  &nbsp;<%=getKabupaten(obj.getKab_saksi2())%> Provinsi
                                          <%=obj.getProp_saksi2()%>.</p></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" valign="top" class="fonts_KT_KK"><p align="justify">Setelah
                                          Akta Perkawinan ini dibacakan dan dijelaskan,
                                          ditandatangani oleh para penghadap dan
                                          saya. </p></td>
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
                                    <div align="center">Tanda tangan <br>
                                      Suami</div>
                                  </td>
                                  <td valign="bottom" width="32%" class="fonts_KT_KK">
                                    <div align="center">Tanda tangan <br>
                                      Istri,</div>
                                  </td>
                                  <td width="37%" class="fonts_KT_KK">&nbsp;</td>
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
                                        <div align="center"><u><%=obj.getNama_lgkp_suami()%></u></div>
                                  </td>
                                  <td width="32%" height="14" class="fonts_KT_KK">
                                    <div align="center"><u><%=obj.getNama_lgkp_istri()%></u></div>
                                  </td>
                                  <td width="37%" height="14" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="2" width="31%" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="32%" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="37%" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" class="fonts_KT_KK">
                                    <div align="center">Tanda tangan<br>
                                      Orang tua/Wali Laki-laki</div>
                                  </td>
                                  <td width="32%" class="fonts_KT_KK">
                                    <div align="center">Tanda tangan<br>
                                      Orang tua/Wali Perempuan</div>
                                  </td>
                                  <td width="37%" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" class="fonts_KT_KK" height="4">&nbsp;</td>
                                  <td width="32%" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="37%" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" class="fonts_KT_KK" height="4">&nbsp;</td>
                                  <td width="32%" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="37%" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" class="fonts_KT_KK">
                                    <div align="center"><u><%=obj.getNama_ayah_suami()%></u></div>
                                  </td>
                                  <td width="32%" class="fonts_KT_KK">
                                    <div align="center"><u><%=obj.getNama_ayah_istri()%></u></div>
                                  </td>
                                  <td rowspan="3" class="fonts_KT_KK" valign="middle">
                                        <div align="center">Kepala&nbsp;<%=record.getKabJabatan()%></div>
                                    <div align="center"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td width="31%" class="fonts_KT_KK" height="2">&nbsp;</td>
                                  <td width="32%" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" class="fonts_KT_KK">
                                    <div align="center">Tanda tangan<br>
                                      Saksi Pertama,</div>
                                  </td>
                                  <td width="32%" class="fonts_KT_KK">
                                    <div align="center">Tanda tangan<br>
                                      Saksi Kedua</div>
                                  </td>
                                </tr>
                                <tr>
                                  <td width="31%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="32%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="37%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="32%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="37%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" height="6" class="fonts_KT_KK">
                                    <div align="center"><u><%=obj.getNama_saksi1()%></u></div>
                                  </td>
                                  <td width="32%" height="6" class="fonts_KT_KK">
                                    <div align="center"><u><%=obj.getNama_saksi2()%></u></div>
                                  </td>
                                  <td width="37%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td width="31%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="32%" height="6" class="fonts_KT_KK">&nbsp;</td>
                                  <td width="37%" height="6" class="fonts_KT_KK">
                                    <div align="center"><u><%=record.getKabNamaPej()%></u><br>
                                      NIP. <%=record.getKabNipPej()%></div>
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
<%
  tgl_ctk = tgl_ctk.substring(1);
}
%>
<input type="hidden" name="tgl_ctk" value="<%=tgl_ctk%>">
</form>
</body>
</html>
<%}
%>
