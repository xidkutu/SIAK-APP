<%@ page import="javax.naming.*,javax.rmi.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan,com.pkrjn.Pkrjn,manage.KendaliProses,manage.KendaliProsesObject"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%
     String nik;
     ServiceController wniedit=null;
     WNIBiodataHome home = null;
     WNIBiodata remote = null;
     BioSiak wnidata = null;
     BioSiak wnipddkn = null;
     UserInfo1 record = null;
     KendaliProses KendaliOke  = null;
     String changeflag="";
     String tglpenuh="";
     String tglhari="";
     String tglbulan="";
     String tgltahun="";
     String apatampil="";
     Vector vKdl = new Vector();
%>

<%
   nik = request.getParameter("nik");
if  (request.getParameter("alter")!=null)
   changeflag=request.getParameter("alter");

try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

 if(record != null)
   {

//E-Error Raised
//Y-Already Ubah
//N-Still Not Ubah
//F-Not Found
   KendaliOke = new KendaliProses();
   int deKdl=0;
   System.out.println("Cek Kendali <jsp>");
   deKdl = KendaliOke.CekKendali(record.getNoProp().trim(),record.getNoKab().trim());
   String dNo_Srt_Mdn="";
   String dTgl_srt_mdn=null;
   String dNo_srt_asl="";
   String dTgl_srt_asl=null;
   String dKtp_start="";
   String dKtp_end="";
	String dKtp_idx="";
	String dKk_start="";
	String dKk_end="";
	String dKk_idx="";
	String dLahir_start="";
	String dLahir_end="";
	String dLahir_idx="";
	String dKawin_start="";
	String dKawin_end="";
	String dKawin_idx="";
	String dCerai_start="";
	String dCerai_end="";
	String dCerai_idx="";
	String dMati_start="";
	String dMati_end="";
	String dMati_idx="";
	String dPng_start="";
	String dPng_end="";
	String dPng_idx="";
	String dNm_pet_oto="";
	String dNip_pet_oto="";
	String dJab_pet_oto="";

   if (deKdl == 0) {
   System.out.println("Cek Kendali Tidak Ada");
   } else {
   System.out.println("Cek Kendali Ada");
     //-Proses Lanjutan
     vKdl = KendaliOke.GetDataKendali(record.getNoProp().trim(),record.getNoKab().trim());
     if (vKdl.size()>=0)
    {  for(int i=0;i<vKdl.size();i++)
          {
             //System.out.println(837);
             KendaliProsesObject obj = (KendaliProsesObject)vKdl.elementAt(i);
             dNo_Srt_Mdn = obj.getNo_srt_mdn();
             dTgl_srt_mdn = obj.getTgl_srt_mdn();
             dNo_srt_asl = obj.getNo_srt_asl();
             if (dNo_srt_asl == null) {
		dNo_srt_asl="";
             }
             dTgl_srt_asl = obj.getTgl_srt_asl();
             dKtp_start=     obj.getKtp_start();
		dKtp_end=       obj.getKtp_end();
		dKtp_idx=       obj.getKtp_idx();
		dKk_start=      obj.getKk_start();
		dKk_end=        obj.getKk_end();
		dKk_idx=        obj.getKk_idx();
		dLahir_start=   obj.getLahir_start();
		dLahir_end=     obj.getLahir_end();
		dLahir_idx=     obj.getLahir_idx();
		dKawin_start=   obj.getKawin_start();
		dKawin_end=     obj.getKawin_end();
		dKawin_idx=     obj.getKawin_idx();
		dCerai_start=   obj.getCerai_start();
		dCerai_end=     obj.getCerai_end();
		dCerai_idx=     obj.getCerai_idx();
		dMati_start=    obj.getMati_start();
		dMati_end=      obj.getMati_end();
		dMati_idx=      obj.getMati_idx();
		dPng_start=     obj.getPng_start();
		dPng_end=       obj.getPng_end();
		dPng_idx=       obj.getPng_idx();
		dNm_pet_oto=    obj.getNm_pet_oto();
		if (dNm_pet_oto == null) {
		 dNm_pet_oto="";
		}
		dNip_pet_oto=   obj.getNip_pet_oto();
		if (dNip_pet_oto == null) {
		 dNip_pet_oto="";
		}
		dJab_pet_oto=   obj.getJab_pet_oto();
		if (dJab_pet_oto == null) {
		 dJab_pet_oto="";
		}
	     System.out.println("dNo_Srt_Mdn : " + dNo_Srt_Mdn);
             System.out.println("dTgl_srt_mdn : " + dTgl_srt_mdn);
          }
    }
   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/Update_Wni.js">
</SCRIPT>
<script language="javascript">
/*
function isNewNikSubmit()
{
if (document.all['no_akta_lhr_yy'].value!=document.all['lhr_yy_tmp'].value)
{
document.all['nik_flag'].value="2";
}
}*/
</script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Update_Kendali.jsp">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td background="images/v_bg_header.gif">
        <jsp:include page="top.html"/>
      </td>
    </tr>
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="35">
              <div align="center"><span class="submenu">Setup Nomor Kendali</span><br>
                <br>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
        <input type=hidden name='prop' value="<%=record.getNoProp().trim()%>">
        <input type=hidden name='kab' value="<%=record.getNoKab().trim()%>">
        <input type=hidden name='kec' value="<%=record.getNoKec().trim()%>">
        <% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&nama_kel="+ (request.getParameter("namakel")==null?"":request.getParameter("namakel"));
%>
        <jsp:include page="<%=jsp%>"/>
      </td>
    </tr>
    <tr>
      <td valign="top">&nbsp;

      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="5" cellpadding="5">
    <tr>
      <td valign="top">
        <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                <tr>
                  <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                  <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                  <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td valign="top">
                    <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100">
                      <tr>
                        <td valign="top">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="25" valign="top">
                                <div align="center"><span class="subtitle">Nomor
                                  Kendali</span></div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <table width="100%" border="0" cellspacing="5" cellpadding="2">
                            <tr>
                              <td valign="top">No Surat Depdagri<br>
                              </td>
                              <td valign="top"> :</td>
                              <td colspan="2" valign="top"> <b>
                                <input
				class=boxdefault size=22 name=no_srt_dep value="<%=dNo_Srt_Mdn %>">
                                </b></td>
                              <td width="12"><img src="images/dot.gif" width="10" height="1"></td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">&nbsp; </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <p>Tanggal Surat</p>
                              </td>
                              <td valign="top"> :</td>
                              <td colspan="2" valign="top"> <b>
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
								  <% /*
								if (wnipdknst.trim().equals("N")) { */
									tglpenuh = "01/01/2006"; /*
								} else {
									if (wnipddkn.getB_ijazah_tgl() != null) {
									tglpenuh = wnipddkn.getB_ijazah_tgl();
									}
									else {
									tglpenuh = "01/01/2005";
                                                                        }
								} */
									System.out.println("Tanggal : "+tglpenuh);
									if (dTgl_srt_mdn==null) {
									 tglpenuh = "01/01/2005";
									 tglhari = tglpenuh.substring(0,2);
									 tglbulan = tglpenuh.substring(3,5);
									 tgltahun = tglpenuh.substring(6,10);
									} else {
                                                                          if (dTgl_srt_mdn.trim().equals("")) {
									   tglpenuh = "01/01/2005";
									   tglhari = tglpenuh.substring(0,2);
									   tglbulan = tglpenuh.substring(3,5);
									   tgltahun = tglpenuh.substring(6,10);
                                                                          } else {
									  tglpenuh = dTgl_srt_mdn.trim();
									  tglhari = tglpenuh.substring(8,10);
									  tglbulan = tglpenuh.substring(5,7);
									  tgltahun = tglpenuh.substring(0,4);
                                                                          }
									}

									%>
                                    <td>
                                      <input
				class=boxdefault size=2 name=tglsatu_dd maxlength="2"   value="<%=tglhari%>"  onKeyUp="return tabtglsat()">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
				class=boxdefault size=2 name=tglsatu_mm maxlength="2"   value="<%=tglbulan%>" onKeyUp="return tabtglsat1()">
                                    </td>
                                    <td>/</td>
                                    <td>

                                      <input
				class=boxdefault size=4 name=tglsatu_yyyy maxlength="4"  value="<%=tgltahun%>"  onKeyUp="return tabtglsat2()">
                                    </td>
                                  </tr>
                                </table>
                                </b></td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top"> <b> &nbsp; </b></td>
                            </tr>
                            <tr>
                              <td valign="top">No Surat Asal</td>
                              <td valign="top">&nbsp;</td>
                              <td colspan="2" valign="top"><b>
                                <input
				class=boxdefault size=22 name=no_srt_asl maxlength="40"  value="<%=dNo_srt_asl %>">
                                </b></td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">&nbsp;</td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <p>Tanggal Surat Asal</p>
                              </td>
                              <td valign="top"> :</td>
                              <td colspan="2" valign="top"><b>
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
								  <%
								/*if (wnipdknst.trim().equals("N")) { */
									tglpenuh = "01/01/2006"; /*
								} else {
									if (wnipddkn.getB_ijazah_tgl() != null) {
									tglpenuh = wnipddkn.getB_ijazah_tgl();
									}
									else {
									tglpenuh = "01/01/2005";
                                                                        }
								} */
									System.out.println("Tanggal : "+tglpenuh);
									if (dTgl_srt_asl==null ) {
									 tglpenuh = "01/01/2006";
                                                                         tglhari = tglpenuh.substring(0,2);
									 tglbulan = tglpenuh.substring(3,5);
									 tgltahun = tglpenuh.substring(6,10);
									} else {
									  if (dTgl_srt_asl.trim().equals("")) {
                                                                          tglpenuh = "01/01/2006";
                                                                          tglhari = tglpenuh.substring(0,2);
									  tglbulan = tglpenuh.substring(3,5);
									  tgltahun = tglpenuh.substring(6,10);
									  } else {
									  tglpenuh = dTgl_srt_asl.trim();
									  tglhari = tglpenuh.substring(8,10);
									  tglbulan = tglpenuh.substring(5,7);
									  tgltahun = tglpenuh.substring(0,4);
									  }
									}

									%>
                                    <td>
                                      <input
				class=boxdefault size=2 name=tgldua_dd maxlength="2"   value="<%=tglhari%>"  onKeyUp="return tabtgldua()">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
				class=boxdefault size=2 name=tgldua_mm maxlength="2"   value="<%=tglbulan%>" onKeyUp="return tabtgldua1()">
                                    </td>
                                    <td>/</td>
                                    <td>

                                      <input
				class=boxdefault size=4 name=tgldua_yyyy maxlength="4"  value="<%=tgltahun%>"  onKeyUp="return tabtgldua2()">
                                    </td>
                                  </tr>
                                </table>
                                </b>
							  </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">&nbsp; </td>
                            </tr>
                            <tr>
                              <td valign="top" colspan="4">&nbsp;

                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">&nbsp; </td>
                            </tr>
                            <tr>
                              <td valign="top" height="35"><div align="left">Nomor Kendali</div></td>
                              <td valign="top" height="35">&nbsp;</td>
                              <td colspan="2" valign="top" height="35">
                                <div align="center">Awal</div>
                              </td>
                              <td width="12" height="35">&nbsp;</td>
                              <td valign="top" height="35">
                                <div align="center">Akhir</div>
                              </td>
                              <td valign="top" height="35">&nbsp;</td>
                              <td width="210" valign="top" height="35">
                                <div align="left">&nbsp;&nbsp;Putaran</div>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top" height="35">
							   <% if (dKtp_start.trim().equals("0") || dKtp_start.equals(null) || dKtp_start.trim().equals("")) {
							   %>
                                <input type="checkbox" name="ckktp" value="KTP">
								<% } else { %>
								<input type="checkbox" name="ckktp" value="KTP" checked>
								<% } %>
                                KTP </td>
                              <td valign="top" height="35">:</td>
                              <td colspan="2" valign="top" height="35">
                                <div align="center">
                                  <input type="text" name="aktp" size="12" onKeyUp="return num(form1.aktp)" value="<%=dKtp_start %>">
                                </div>
                              </td>
                              <td width="12" height="35">s/d</td>
                              <td valign="top" height="35">
                                <div align="center">
                                  <input type="text" name="bktp" size="12" onKeyUp="return num(form1.bktp)" value="<%=dKtp_end %>">
                                </div>
                              </td>
                              <td valign="top" height="35">&nbsp;</td>
                              <td width="210" valign="top" height="35">
                                <input type="text" name="pktp" size="12" onKeyUp="return num(form1.pktp)" value="<%=dKtp_idx %>">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
							  <% if (dKk_start.trim().equals("0") || dKk_start.equals(null) || dKk_start.trim().equals("")) {
							   %>
                                <input type="checkbox" name="ckkk" value="KK">
								<% } else { %>
								<input type="checkbox" name="ckkk" value="KK" checked>
								<% } %>
                                KK</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <div align="center">
                                  <input type="text" name="akk" size="12" onKeyUp="return num(form1.akk)" value="<%=dKk_start %>">
                                </div>
                              </td>
                              <td width="12">s/d</td>
                              <td valign="top">
                                <div align="center">
                                  <input type="text" name="bkk" size="12" onKeyUp="return num(form1.bkk)" value="<%=dKk_end %>">
                                </div>
                              </td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">
                                <input type="text" name="pkk" size="12" onKeyUp="return num(form1.pkk)" value="<%=dKk_idx %>">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
							  <% if (dLahir_start.trim().equals("0") || dLahir_start.equals(null) || dLahir_start.trim().equals("")) {
							   %>
                                <input type="checkbox" name="ckkal" value="KAL">
								<% } else { %>
								<input type="checkbox" name="ckkal" value="KAL" checked>
								<% } %>
                                K.A. Lahir</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <div align="center">
                                  <input type="text" name="akal" size="12" onKeyUp="return num(form1.akal)" value="<%=dLahir_start %>">
                                </div>
                              </td>
                              <td width="12">s/d</td>
                              <td valign="top">
                                <div align="center">
                                  <input type="text" name="bkal" size="12" onKeyUp="return num(form1.bkal)" value="<%=dLahir_end %>">
                                </div>
                              </td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">
                                <input type="text" name="pkal" size="12" onKeyUp="return num(form1.pkal)" value="<%=dLahir_idx %>">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
							  <% if (dMati_start.trim().equals("0") || dMati_start.equals(null) || dMati_start.trim().equals("")) {
							   %>
                                <input type="checkbox" name="ckkam" value="KAM">
								<% } else { %>
								<input type="checkbox" name="ckkam" value="KAM" checked>
								<% } %>
                                K.A. Kematian</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <div align="center">
                                  <input type="text" name="akam" size="12" onKeyUp="return num(form1.akam)" value="<%=dMati_start %>">
                                </div>
                              </td>
                              <td width="12">s/d</td>
                              <td valign="top">
                                <div align="center">
                                  <input type="text" name="bkam" size="12" onKeyUp="return num(form1.bkam)" value="<%=dMati_end %>">
                                </div>
                              </td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">
                                <input type="text" name="pkam" size="12" onKeyUp="return num(form1.pkam)" value="<%=dMati_idx %>">

                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
							  <% if (dCerai_start.trim().equals("0") || dCerai_start.equals(null) || dCerai_start.trim().equals("")) {
							   %>
                                <input type="checkbox" name="ckkac" value="KAC">
								<% } else { %>
								<input type="checkbox" name="ckkac" value="KAC" chwcked>
								<% } %>
                                K.A. Cerai</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <div align="center">
                                  <input type="text" name="akac" size="12" onKeyUp="return num(form1.akac)" value="<%=dCerai_start %>">
                                </div>
                              </td>
                              <td width="12">s/d</td>
                              <td valign="top">
                                <div align="center">
                                  <input type="text" name="bkac" size="12" onKeyUp="return num(form1.bkac)" value="<%=dCerai_end %>">
                                </div>
                              </td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">
                                <input type="text" name="pkac" size="12" onKeyUp="return num(form1.pkac)" value="<%=dCerai_idx %>">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <% if (dKawin_start.trim().equals("0") || dKawin_start.equals(null) || dKawin_start.trim().equals("")) {
							   %>
							   <input type="checkbox" name="ckaw" value="KAW">
							   <% } else { %>
							   <input type="checkbox" name="ckaw" value="KAW" checked>
							   <% } %>
                                K.A. Kawin</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <div align="center">
                                  <input type="text" name="akaw" size="12" onKeyUp="return num(form1.akaw)" value="<%=dKawin_start %>">
                                </div>
                              </td>
                              <td width="12">s/d</td>
                              <td valign="top">
                                <div align="center">
                                  <input type="text" name="bkaw" size="12" onKeyUp="return num(form1.bkaw)" value="<%=dKawin_end %>">
                                </div>
                              </td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">
                                <input type="text" name="pkaw" size="12" onKeyUp="return num(form1.pkaw)" value="<%=dKawin_idx %>">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <% if (dPng_start.trim().equals("0") || dPng_start.equals(null) || dPng_start.trim().equals("")) {
							   %>
							   <input type="checkbox" name="ckkap" value="KAP">
							   <% } else { %>
							   <input type="checkbox" name="ckkap" value="KAP" checked>
							   <% } %>
                                K.A. P. Anak</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <div align="center">
                                  <input type="text" name="akap" size="12" onKeyUp="return num(form1.akap)" value="<%=dPng_start %>">
                                </div>
                              </td>
                              <td width="12">s/d</td>
                              <td valign="top">
                                <div align="center">
                                  <input type="text" name="bkap" size="12" onKeyUp="return num(form1.bkap)" value="<%=dPng_end %>">
                                </div>
                              </td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">
                                <input type="text" name="pkap" size="12" onKeyUp="return num(form1.pkap)" value="<%=dPng_idx %>">
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>

                      <tr>
                        <td valign="top">
                          <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tr>
                              <td height="10">
                                <div align="center"><img src="images/dot.gif" width="1" height="10" hspace="5"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="25">
                                <div align="center"><span class="subtitle">Data
                                  Administrasi</span></div>
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
                            <tr valign="top">
                              <td>
                                <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                  <tr>
                                    <td>Nama Petugas Otoritas <font color="#000099" class="asterish">*</font></td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=22 name=nama_pet_reg maxlength="60"   value="<%=dNm_pet_oto %>" onKeyUp="return char(form1.nama_pet_reg)">
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>Nama Petugas Entri Data</td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <b><font color="#000066">
                                      <%=record.getNamaPetugas()%> </font></b>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>NIP Petugas Otoritas</td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=9 name=nip_pet_reg maxlength="9"  value="<%=dNip_pet_oto %>" onKeyUp="return num(form1.nip_pet_reg)">
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>NIP Petugas Entri Data</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><b><font color="#000066">
                                      <%=record.getNipPetugas()%></font></b></td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Jabatan Petugas Otoritas</td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input type="text" name="jbt_pet_reg" value="<%=dJab_pet_oto %>">
                                    </td>
                                    <td>&nbsp;</td>
                                    <td></td>
                                    <td>:</td>
                                    <td colspan="2"> </td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">
                                      <input type="hidden"   maxlength="55" name="nama_pet_entri" value="<%=record.getNamaPetugas().trim()%>">
                                      &nbsp; </td>
                                    <td colspan="2">
                                      <input type="hidden"  maxlength="99" name="nip_pet_entri" value="<%=record.getNipPetugas().trim()%>">
                                      &nbsp; </td>
                                  </tr>
                                  <tr>
                                    <td>Tanggal Entri Data<font color="#000099" class="asterish">
                                      *</font></td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <table width="100" border="0" cellspacing="3" cellpadding="0">
                                        <tr>
                                          <td> <%=record.getToday()%> </td>
                                        </tr>
                                      </table>
                                      <b></b></td>
                                    <td>
                                      <input type="hidden" name="today" value="<%=record.getToday().trim()%>">
                                      &nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top"><img src="images/dot.gif" width="1" height="25"></td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                  <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                  <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                </tr>
              </table>
            </td>

          </tr>
          <tr>
            <td>
              <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                <tr>
                  <td>
                    <div align="center"><b>
                      <input class=boxstandard type="submit" value=SIMPAN name="sim" onClick="return validKendali()">
                      </b></div>
                  </td>
                  <td>
                    <div align="center"><b>
                      <input class=boxstandard type="button" value="KELUAR" name="bat" onclick="document.location='menu_supv_otor.jsp'">
                      </b></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="catatan" colspan="2"><font color="#000066">Keterangan
                    :</font><span class="asterish"> *</span><span class="catatan"><font color="#000066">Data
                    harus diisi</font></span></td>
    </tr>
     </table>
<input type="hidden" name="nik_flag" value="1">
 </td>
   </tr>
   </table>
    </tr>
  </table>
<script language="JavaScript">

</script>
</form>
</BODY>
</HTML>
<%
   }
else
{
   response.sendRedirect("index.jsp");
}

}catch (Exception ne)
    {
     ne.printStackTrace();
     System.out.println("In WNI Edit Exception"+ne);
     response.sendRedirect("index.jsp");
    }
%>
