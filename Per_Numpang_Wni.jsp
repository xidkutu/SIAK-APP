<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>

<%!
    UserInfo1 record1=null;
      String flag;
    ServiceController factory;
    Get_AllWilayahaHome home;
    Get_AllWilayaha remote1;
    Vector v_kec,v_kel;
    int kk;
 String nprop="",nkab="",nkec="",nkel="";
 String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
 String  nama_cmat="",nip_cmat="",nip_lrh="",nama_kep_des="",nama_pet="",nip_pet="";

%>

<%
   try
   {
     record1=(UserInfo1)session.getAttribute("remoteRef");

   if(record1 != null)
   {
   System.out.println("Wni");
   nprop=record1.getNoProp();
   nkab=record1.getNoKab();
   nkec=record1.getNoKec();

   System.out.println("Wni head biodata");

     factory=ServiceController.getInstance();
     home=(Get_AllWilayahaHome)factory.lookup("Get_AllWilayaha",Get_AllWilayahaHome.class);
     remote1 = home.create();
     WIlayahInfo obj=(WIlayahInfo)remote1.getWilayahWna(nprop,nkab,nkec);
     v_kel=obj.getWnakel();

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/Numpang.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/lurah.js">
</SCRIPT>
<style type="text/css">
<!--
.hide { font-family: Verdana; font-size: 12px; font-weight: normal;background-color: #CBE0FA; border: 0px #CBE0FA none}
-->
</style>

<%
String no_kk="",flag="";

if(request.getParameter("Numpangkk")!=null)
{
no_kk=request.getParameter("Numpangkk");
flag=no_kk;

nama_prop=request.getParameter("nama_prop_tmp");
nama_kab= request.getParameter("nama_kab_tmp");
nama_kec=request.getParameter("nama_kec_tmp");
nama_kel=request.getParameter("nama_kel_tmp");
nprop=request.getParameter("no_prop_tmp");
nkab=request.getParameter("no_kab_tmp");
nkec=request.getParameter("no_kec_tmp");
nkel=request.getParameter("no_kel_tmp");
nama_cmat=request.getParameter("nama_cmat_tmp");
nip_cmat=request.getParameter("nip_cmat_tmp");
nip_lrh=request.getParameter("nip_lrh_tmp");
nama_kep_des=request.getParameter("nama_kep_des_tmp");
}
%>


<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name=numpang method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">
        <p>
          <input type="hidden" name="flag" value="<%=no_kk%>">
          <!--For reading data from pindah asal-->
          <input type=hidden   name=no_prop_tmp   value="<%=nprop%>">
          <input type=hidden   name=nama_prop_tmp    value="<%=nama_prop%>">
          <input  type=hidden  name=no_kab_tmp   value="<%=nkab%>">
          <input type=hidden   name=nama_kab_tmp    value="<%=nama_kab%>">
          <input type=hidden   name=no_kec_tmp   value="<%=nkec%>">
          <input type=hidden   name=nama_kec_tmp  value="<%=nama_kec%>">
          <input type=hidden   name=no_kel_tmp   value="<%=nkel%>">
          <input type=hidden    name=nama_kel_tmp    value="<%=nama_kel%>">
          <input type=hidden     name=nama_cmat_tmp  value="<%=nama_cmat%>">
          <input  type=hidden     name=nip_cmat_tmp  value="<%=nip_cmat%>">
          <input  type=hidden     name=nip_lrh_tmp  value="<%=nip_lrh%>" >
          <input type=hidden     name=nama_kep_des_tmp value="<%=nama_kep_des%>">
		  <jsp:include page="top.html"/>
      </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="45">
                              <div align="center"><span class="submenu">Permohonan
                                Menumpang KK WNI</span><br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table width="850" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                                   <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td width="150">Kode-Nama Provinsi</td>
                            <td>:</td>
                            <td width="5">
 <input value=<%=record1.getNoProp()%> class=boxdefault size=4 name=no_prop onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="33">
<input value="<%=record1.getNamaProp()%>" class=boxdefault size=22 name=nama_prop onFocus="this.blur()" maxlength="60">
                            </td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td>:</td>
                            <td width="8">
<input value=<%=record1.getNoKab()%> class=boxdefault size=4 name=no_kab onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="22">
 <input value="<%=record1.getNamaKab()%>" class=boxdefault size=22 name=nama_kab onFocus="this.blur()" maxlength="60">
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kecamatan</td>
                            <td>:</td>
                            <td width="5">
<input value=<%=record1.getNoKec()%> class=boxdefault size=4 name=no_kec onFocus="this.blur()" maxlength="2">
                            </td>
                            <td>
<input value="<%=record1.getNamaKec()%>" class=boxdefault size=22 name=nama_kec onFocus="this.blur()" maxlength="60">
                            </td>
                            <td>&nbsp;</td>
                            <td>Kode-Nama Desa/Kelurahan</td>
                            <td>:</td>
        <td width="8">
<input  class=boxdefault size=4 name=no_kel onFocus="this.blur()" maxlength="4">

<input  type="hidden" name=nama_kelur>
</td>
<td width="22">
<select  name=nama_kel boxdefault2 class="boxdefault" onchange="no_kel.value=this.options[this.selectedIndex].value;nama_kelur.value=this.options[this.selectedIndex].text;nama_kep_des.value=setNamaLurah(this.selectedIndex);">
 <option>-- Pilih Desa/Kelurahan --</option>
  <%
for(int n=0;n<v_kel.size();n++)
{
%>
 <option value="<%=((GetKel)v_kel.elementAt(n)).getNokel().trim()%>"><%=((GetKel)v_kel.elementAt(n)).getNamakel()%></option>
<%
}
%>

<%
for(int m=0;m<v_kel.size();m++)
{
%>
<input type="hidden" name="namapej<%=m%>"  value="<%=((GetKel)v_kel.elementAt(m)).getNamaLur().trim()%>">
<%
}
%>                            </td>
                          </tr>
                          <tr>
                            <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                            <td>&nbsp;</td>
                            <td width="5">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td width="8">&nbsp;</td>
                            <td width="22">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">&nbsp; </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" valign="middle">
                                    <div align="center"><span class="subtitle">Data
                                      Permohonan Menumpang KK</span></div>
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
                              <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                                <tr>
                                  <td colspan="11"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="images/dot.gif" width="1" height="10"></b></font></td>
                                </tr>

                                <tr valign="top">
                                  <td width="225"> Nomor Kartu Keluarga Lama<span class="asterish">*</span></td>
                                  <td>:</td>
          <td colspan="9">
 <input class=boxdefault  size=16  name=no_kk_lama maxlength="16"   value="<%=no_kk%>"   onKeyUP="return semu()">
                                    <b>
                                <%--  <input class=boxstandard type=button value=PERIKSA name="submit2">--%>
                                    </b></td>
                                </tr>
                                <tr valign="top">
                                  <td> NIK Kepala Keluarga Lama</td>
                                  <td>:</td>
                                  <td colspan="9"><b>&lt;get from system&gt;</b></td>
                                </tr>
                                <tr valign="top">
                                  <td> Nama Kepala Keluarga Lama</td>
                                  <td>:</td>
                                  <td colspan="9"><b>&lt;get from system&gt;</b>
                                  </td>
                                </tr>
                                <tr valign="top">
                                  <td>Nomor Kartu Kepala Keluarga Yang Ditempati<span class="asterish">*</span>
                                  </td>
                                  <td>:</td>
                                  <td colspan="9">
 <input class=boxdefault size=16 name=no_kk_tmpt maxlength="16" onKeyUP="return yung()">
                                    <b>
 <input class=boxstandard type=button value=PERIKSA name="btnperiksa" onclick="return nump()">
                                    </b></td>
                                </tr>

                                <tr valign="top">
                                  <td>NIK Kepala Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"><b>&lt;get from system&gt;</b></td>
                                </tr>
                                <tr valign="top">
                                  <td>Nama Kepala Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"><b>&lt;get from system&gt;</b></td>
                                </tr>
                                <tr valign="top">
                                  <td> Alamat Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"> <b>&lt;get from system&gt;
                                    <font color="#003366">&lt;Alamat&gt; RT &lt;RT&gt;
                                    RW &lt;RW&gt; Dusun &lt;Dusun&gt;</font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td>Desa/Kelurahan </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366"><b>&lt;Desa/Kelurahan&gt;</b></font></b></font></td>
                                  <td>Kecamatan</td>
                                  <td>:</td>
                                  <td colspan="4"> <b><font color="#003366"><b>&lt;Kecamatan&gt;</b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kab/Kota</td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366">&lt;Kab/Kota&gt;</font></b></font></td>
                                  <td>Provinsi<font color="#003366"></font></td>
                                  <td>:</td>
                                  <td colspan="4"> <b><font color="#003366"><b><font color="#003366">&lt;Provinsi&gt;</font></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kode Pos </td>
                                  <td>:</td>
                                  <td><b><font color="#003366">&lt;Kode Pos&gt;
                                    </font></b></td>
                                  <td>Telepon</td>
                                  <td>:</td>
                                  <td colspan="4"><b><font color="#003366">&lt;Telepon&gt;</font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td>Alasan Menumpang KK</td>
                                  <td>:</td>
                                  <td colspan="9">
                                    <select
                                    name=als_numpang boxdefault2 class="boxdefault">
                                      <option>-- Pilih Alasan Menumpang KK --</option>
                                      <option value="1">1 - Karena KK dibawa pindah
                                      oleh KepKel</option>
                                      <option value="2">2 - Karena Pindah tempat
                                      tinggal namun tdk membawa KK</option>
                                    </select>
                                  </td>
                                </tr>
                                <tr valign="top">
                                  <td>Jumlah Anggota Keluarga/Pengikut</td>
                                  <td>:</td>
                                  <td colspan="9">
                                    <input
                                class=boxdefault size=4 name=jml maxlength="2">
                                    Orang </td>
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
                                    <div align="center"><span class="subtitle">Daftar
                                      Keluarga Pemohon</span></div>
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
                                    <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                                      <tr>
                                        <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                                        <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                        <td width="1" height="1"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                                      </tr>
                                      <tr>

                                        <td>&nbsp;</td>
                                        <td valign="middle" align="center">
                                          <table width="100%" border="0" cellspacing="1" cellpadding="3" class="C-BG">
                                            <tr>
                                              <td class="C-Fonts" rowspan="2" width="4%">
                                                <div align="center"> No.</div>
                                              </td>
                                              <td class="C-Fonts" rowspan="2" width="20%">
                                                <div align="center">NIK</div>
                                              </td>
                                              <td class="C-Fonts" rowspan="2" width="31%">
                                                <div align="center">Nama Lengkap</div>
                                              </td>
                                              <td class="C-Fonts" colspan="2">
                                                <div align="center">Status Hubungan
                                                  dalam Keluarga</div>
                                              </td>
                                              <td class="C-Fonts" rowspan="2" width="10%">
                                                <div align="center">Cek</div>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td class="C-Fonts" width="16%">
                                                <div align="center">Semula</div>
                                              </td>
                                              <td class="C-Fonts" width="19%">Berubah
                                                Menjadi</td>
                                            </tr>
                                            <tr>
                                              <td class="C-Field" width="4%">
                                                <div align="center"> 1</div>
                                              </td>
                                              <td class="C-Field" width="20%">
                                                <div align="center">&lt;get from
                                                  kk&gt; </div>
                                              </td>
                                              <td class="C-Field" width="31%">
                                                <div align="center">&lt;get from
                                                  nik&gt; </div>
                                              </td>
                                              <td class="C-Field" width="16%">&lt;get
                                                from nik&gt;</td>
                                              <td class="C-Field" width="19%">
                                                <select
                                   name=select2 boxdefault2 class="boxdefault" size="1">
                                                  <option selected>-- Pilih SHDK
                                                  --</option>
                                                  <option>1. Kepala Keluarga</option>
                                                  <option>2. Suami</option>
                                                  <option>3. Istri</option>
                                                  <option>4. Anak</option>
                                                  <option>5. Menantu</option>
                                                  <option>6. Cucu</option>
                                                  <option>7. OrangTua</option>
                                                  <option>8. Mertua</option>
                                                  <option>9. Famili Lain</option>
                                                  <option>10. Pembantu</option>
                                                  <option>11. Lainnya</option>
                                                </select>
                                              </td>
                                              <td class="C-Field" width="10%">
                                                <div align="center">
                                                  <input type=checkbox name=ext3222262>
                                                </div>
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="1" width="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                                        <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                        <td width="1" height="1"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                                      </tr>
                                    </table>
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
                                    <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                                      <tr>
                                        <td>Nama Kepala Desa/ Kelurahan<span class="asterish">*</span></td>
                                        <td>:</td>
                                        <td>
    <input type="text" class="hide" maxlength="40" name="nama_kep_des" onfocus="this.blur()">
                                        </td>
                                        <td>Nama Petugas Entri</td>
                                        <td>:</td>
                                        <td><b><%=record1.getNamaPetugas()%></b></td>
                                      </tr>
                                      <tr>
                                        <td>NIP Petugas Entri</td>
                                        <td>:</td>
                                        <td><b><%=record1.getNipPetugas()%></b></td>
                                        <td>Tanggal Entri</td>
                                        <td>:</td>
                                        <td><b><%=record1.getToday()%></b> </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
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
                  <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
                    <tr>
                      <td>
                        <div align="center"><b>
                        <input class=boxstandard type=button value=SIMPAN name="submit23" disabled>
                          </b></div>
                      </td>
                      <td>
                      </td>
                      <td>
                        <div align="center"><b>
                         <input class=boxstandard type=button value=KELUAR name="submit2322" onclick="document.location='WNI_Menu.jsp'">
                          </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                        <div align="center"><font color="#003399"><i>Keterangan
                          : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data
                          harus Diisi</font></i></div>
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
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<p class="linkyellow">&nbsp;</p>
</BODY>
</HTML>
<%}
else
{
  response.sendRedirect("index.jsp");
}
   }catch(Exception err)
{
  response.sendRedirect("index.jsp");
  System.out.println(err.toString());
}
finally{
remote1.remove();
}
%>
