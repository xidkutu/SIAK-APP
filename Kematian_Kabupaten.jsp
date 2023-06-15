<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="Global.jsp"%>
<%!
    String select,id1=null,flag=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factory1;
    Login remote;
%>

<% Vector errMsg;
   String infoMsg;
   errMsg = new Vector();
   infoMsg = null;
   try
   {

     factory=ServiceController.getInstance();
     flag=request.getParameter("n");

     v = new Vector();

   record = (UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{%>
<HTML>
   <HEAD>
      <script type="text/javascript" src="Templates/tabpane.js"></script>
      <SCRIPT language=JavaScript src="scripts/KematianNik.js"></SCRIPT>

<SCRIPT language=JavaScript>
   function simpan() {
     document.all["kon"].disabled = true;
     //document.all["sim"].disabled = true;
     document.all["kel"].disabled = true;
   //  form1.submit();
   }
</SCRIPT>
      <META http-equiv=Content-Type content="text/html; charset=windows-1252">
      <LINK href="Templates/s.css" rel=stylesheet>
   </HEAD>
   <link type="text/css" rel="StyleSheet" href="Templates/tab.webfx.css" />
   <BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
      <form name="form1" action="Pencatatan_Kematian_Edit.jsp" method="post">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td background="images/v_bg_header.gif"><jsp:include page="top.html"/> </td>
            </tr>
            <tr>
               <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                     <tr>
                        <td>
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                 <td height="20">
                                    <div align="center"><span class="submenu">Pencatatan Kematian</span><br><br></div>
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <jsp:include page="data_wilayah.jsp"> <jsp:param name="level" value="2"/>
                              <jsp:param name="no_prop" value="<%=record.getNoProp()%>"/>
                              <jsp:param name="nama_prop" value="<%=record.getNamaProp()%>"/>
                              <jsp:param name="no_kab" value="<%=record.getNoKab()%>"/>
                              <jsp:param name="nama_kab" value="<%=record.getNamaKab()%>"/>
                           </jsp:include>
			</td>
                     </tr>
                     <tr>
		   <%     errMsg = (Vector) request.getAttribute("errors");
                          if (errMsg==null) errMsg = new Vector();
                           if(flag!=null) {
                              if (flag.equals("1")) {
                                infoMsg = "Data sudah disimpan !";
                              } else if (flag.equals("2")){
                                errMsg.add("Data NIK belum ada !");
                              }
                           }
                           if(request.getParameter("n") != null) {
                             if (request.getParameter("n").equals("0")) {
                                errMsg.add("Data NIK jenazah Belum Ada !");
                             } else if (request.getParameter("n").equals("1")) {
                                infoMsg = "Data sudah disimpan !";
                             }
                           }
                       %>
                       <% if (infoMsg!=null) { %>
                          <tr><td><%=printInfo(infoMsg)%></td></tr>
                       <%
                          }
                          else {
                              for(int i=0; i<errMsg.size(); i++) {
                                String message = (String) errMsg.elementAt(i);
                       %>
                                <tr><td><%=printError(message, "left")%></td></tr>
                       <%   }
                            request.removeAttribute("errors");
                         }
                       %>
                     </tr>
                  </table>
               </td>
            </tr>
         </table width="100%" border="0" cellspacing="5" cellpadding="5">
         <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
         <tr>
            <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
            <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
            <td valign="top">
               <div align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                     <tr>
                        <td align="center">
                           <div align="center">
                              <div class="tab-pane" id="tab-pane-1">
                                 <script type="text/javascript">
                                    tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);
                                 </script>
                                 <div class="tab-page" style="postion:absolute"  id="tabPage1">
                                    <h2 class="tab">Data Jenazah</h2>
				    <script type="text/javascript">
                                       tp1.addTabPage(document.getElementById("tabPage1"));
                                    </script>
                                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                                       <tr>
                                          <td>
                                             <table align="center" width="100%" cellpadding="2" cellspacing="5" border="0">
                                                <tr>
                                                   <td colspan="7"> </td>
                                                </tr>
                                                <tr>
                                                   <td width="22%">
                                <p style="line-height: 100%">NIK Jenazah<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_jnsah" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_jnsah)" value="<%=(request.getParameter("nik_jnsah")==null?"":request.getParameter("nik_jnsah"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat</td>
                              <td width="1%"> :</td>
                              <td colspan="5">&nbsp;  </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Jenis Kelamin</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tempat Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="23%">&nbsp; </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Keturunan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ktrunan_jnsah" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="23%">&nbsp;
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Anak ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="anak_ke_mt" size="2" class="boxdefault" maxlength="2" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tanggal Kematian<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_mati maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=bln_mati maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=thn_mati maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pukul<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="pukul_mt" size="5" class="boxdefault" maxlength="5" disabled>
                                <select size="1" name="wkt_pkl_mt" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Waktu --</option>
                                  <option value="1">WIB</option>
                                  <option value="2">WITA</option>
                                  <option value="3">WIT</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Sebab Kematian<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <select size="1" name="sbab_mati" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Sebab
                                    Kematian --</option>
                                    <option value="1">1 - Sakit Biasa/Tua</option>
                                    <option value="2">2 - Wabah Penyakit</option>
                                    <option value="3">3 - Kecelakaan</option>
                                    <option value="4">4 - Kriminalitas</option>
                                    <option value="5">5 - Bunuh Diri</option>
                                    <option value="6">6 - Melahirkan</option>
                                    <option value="7">7 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tempat Kematian<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="tmpt_mati" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Yang Menerangkan
                                  Kematian<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <select size="1" name="yg_mnerang" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Yang Menerangkan
                                    --</option>
                                    <option value="1">1 - Dokter</option>
                                    <option value="2">2 - Tenaga Kesehatan Lain</option>
                                    <option value="3">3 - Kepolisian</option>
                                    <option value="4">4 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tempat Penetapan
                                  Pengadilan Negeri </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="pnetap_pn" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nomor Penetapan Pengadilan Negeri
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="no_pnetap" size="22" class="boxdefault" maxlength="40" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Penetapan Pengadilan Negeri</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_pnetap maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=bln_pnetap maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=thn_pnetap maxlength="4" disabled>
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

                    <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
                    <h2 class="tab">Data Ibu</h2>
                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage2"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton" value="radiobutton" >
                                Ada<br>
                                <input type="radio" name="radiobutton" value="radiobutton" >
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton" value="radiobutton" >
                                WNI<br>
                                <input type="radio" name="radiobutton" value="radiobutton" >
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu" size="17" class="boxdefault" maxlength="17" disabled value="<%=(request.getParameter("nik_ibu")==null?"":request.getParameter("nik_ibu"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=bln_lhr_ibu maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=thn_lhr_ibu maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_pkrjn_ibu" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ibu" size="30" class="boxdefault" maxlength="120" disabled>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="no_rt_ibu" size="3" class="boxdefault" maxlength="3" disabled>
                                  RW
                                  <input type="text" name="no_rw_ibu" size="3" class="boxdefault" maxlength="3" disabled>
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ibu" size="22" class="boxdefault" maxlength="40" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kodepos_ibu" size="5" class="boxdefault" maxlength="5" disabled>
                                </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ibu" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                  <div align="right">Nama Provinsi<font color="#000099" class="asterish">*</font>
                                    </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="nama_prop_ibu" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kecamatan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="nama_kec_ibu" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="nama_kab_ibu" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                  <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                    </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="nama_kel_ibu" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"  id="tabPage3">
                    <h2 class="tab">Data Ayah</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage3"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton" value="radiobutton">
                                Ada<br>
                                <input type="radio" name="radiobutton" value="radiobutton">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ayah<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton" value="radiobutton">
                                WNI<br>
                                <input type="radio" name="radiobutton" value="radiobutton">
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh" size="17" class="boxdefault" maxlength="17" disabled value="<%=(request.getParameter("nik_ayh")==null?"":request.getParameter("nik_ayh"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=bln_lhr_ayh maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=thn_lhr_ayh maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_pkrjn_ayh" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ayh" size="30" class="boxdefault" maxlength="120" disabled>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="no_rt_ayh" size="3" class="boxdefault" maxlength="3" disabled>
                                  RW
                                  <input type="text" name="no_rw_ayh" size="3" class="boxdefault" maxlength="3" disabled>
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ayh" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kodepos_ayh" size="5" class="boxdefault" maxlength="5" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ayh" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="nama_prop_ayh" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="nama_kab_ayh" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan<font color="#000099" class="asterish">*
                                  </font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="nama_kec_ayh" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*
                                  </font></div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="nama_kel_ayh" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"   id="tabPage4">
                    <h2 class="tab">Data Pelapor</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Pelapor<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_plpor" size="17" class="boxdefault" maxlength="17" disabled value="<%=(request.getParameter("nik_plpor")==null?"":request.getParameter("nik_plpor"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_pkrjn_plpor" class="boxdefault" disabled>
                                    <option selected>-- Pilih Jenis Pekerjaan
                                    --</option>
                                  </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Melapor</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_mlapor maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=bln_mlapor maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=thn_mlapor maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"  id="tabPage5" >
                    <h2 class="tab">Data Saksi I</h2>

               <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi I<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi1" size="17" class="boxdefault" maxlength="17" value="<%=(request.getParameter("nik_sksi1")==null?"":request.getParameter("nik_sksi1"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_pkrjn1_sksi1" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5">&nbsp;  </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"  id="tabPage6">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="javascript">
                	tp1.addTabPage(document.getElementById("tabPage6"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" size="17" class="boxdefault" maxlength="17" value="<%=(request.getParameter("nik_sksi2")==null?"":request.getParameter("nik_sksi2"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_pkrjn1_sksi2" class="boxdefault" disabled>
                                    <option selected>-- Pilih Jenis Pekerjaan
                                    --</option>
                                  </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  </div>

<script type="text/javascript">
setupAllTabs();
</script>
              </div>
              </td>
                      </tr>
                    </table>
                  </div>
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>

<br>
<table width="400" border="0" cellspacing="5" cellpadding="5" align="center">
  <tr>
    <td width="137">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KONFIRMASI"  name="kon" onClick="return matiNik()">
          </b></div>
    </td>
    <td width="108">
      <div align="center"><b> </b></div>
      <div align="center"><b>
        <input class=boxstandard type=button value=SIMPAN name="sim" onclick="return simpan()" disabled>
        </b></div>
    </td>
    <td width="86">
      <div align="center"><b>
        <input class=boxstandard type=button value=KELUAR name="kel" onclick="document.location='Menu_Capil_KabKota.jsp'">
        </b></div>
    </td>
    <td width="4">
      <div align="center"><b> </b></div>
    </td>
  </tr>
  <tr>
    <td colspan="4">
      <div align="center"><font color="#003399">Keterangan : </font><font color="#000099" class="asterish">*</font><font color="#003399">Data
        harus diisi sesuai kondisi sebenarnya</font></div>
    </td>
  </tr>
</table>
<%
if(flag != null)
{
if(flag.equals("1"))
{%>
<script language="javascript">
</script>
<%}
else if(flag.equals("0"))
{%>
<script language="JavaScript">
  form1.nik_jnsah.focus()
</script>
<%}}%>
</form>
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

%>