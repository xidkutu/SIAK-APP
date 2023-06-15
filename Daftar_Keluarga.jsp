<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%!
String no_kk,nik,nop,nokab,nokec,nokel,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI;
int i,j;
//Context entityContext;
ServiceController factory;
DaftarHome home;
Daftar remote;
Vector v,vt_hbn;
Individu_sudapunya record,record1;
String flag="";
String namakel="";
String namalur="";
    UserInfo1 record2=null;

 String nprop="",nkab="",nkec="",nkel="";
 String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
 String  nama_cmat="",nip_cmat="",nip_lrh="",nama_kep_des="",nama_pet="",nip_pet="";
%>

<%
   record2=(UserInfo1)session.getAttribute("remoteRef");

 try
    {
   if(record2 != null)
   {
         if(request.getParameter("Kepindahankk")!=null)
               {
System.out.println("Inside Kepindahankk");
                no_kk=request.getParameter("Kepindahankk");
System.out.println("Setting flag Kepindahankk");
                flag=no_kk;
System.out.println("flag " + flag);
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
              nop=nprop;
              nokab=nkab;
              nokec=nkec;
              nokel=nkel;
              namakel=nama_kel;
              namalur=nama_kep_des;
    System.out.println("Inside Sudah Punya from Pindah ASAL");
                }
       else
           {
        System.out.println("Inside Sudah Punya from Menu Sudah Punya Nik");
               no_kk=request.getParameter("no_kk_semula");
               nik=request.getParameter("nik_kep_kel");
               nop=request.getParameter("no_prop");
               nokab=request.getParameter("no_kab");
               nokec=request.getParameter("no_kec");
               nokel=request.getParameter("no_kel");
               namakel=request.getParameter("namakel");
               namalur=request.getParameter("namalur");
            }

    factory=ServiceController.getInstance();

    home = (DaftarHome) factory.lookup("Daftar",DaftarHome.class);
    remote = home.create();
    v = remote.daftarKeluarga(no_kk,nik);
    vt_hbn=getListHubuganWni();
    j=v.size();
System.out.println("Checked Here 1");
System.out.println("Flag Condition->" + flag);
  if(v.isEmpty())
   {
%>
<HTML>
   <TITLE>adminduk SIAK online</TITLE>
   <META http-equiv=Content-Type content="text/html; charset=windows-1252">
   <LINK href="Templates/s.css" rel=stylesheet>
   <body bgColor="#93BEE2" onload="window.history.forward(1)"><br><br><br>
      <td>
         <div align="center">
            <h3><font color="red">Data Belum Ada !</font></h3>
         </div>
      </td>
      <center>
         <input class=boxstandard type=button value=KELUAR name="submit2322"  onclick="document.location='KKSudaPunyaNik.jsp'">
      </center>
   </body>
</HTML>
<%
 }
else
  {
  NAMA_PET_ENTRI=record2.getNamaPetugas() ;
  NIP_PET_ENTRI=record2.getNipPetugas();
  TGL_ENTRI=record2.getToday();
  record1=(Individu_sudapunya)v.elementAt(0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
   <HEAD>
      <TITLE>adminduk SIAK online</TITLE>
      <META http-equiv=Content-Type content="text/html; charset=windows-1252">
      <LINK href="Templates/s.css" rel=stylesheet>
      <SCRIPT language=JavaScript src="Templates/Nikper.js">
      </SCRIPT>

      <META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
   </HEAD>
   <BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<style type="text/css">
<!--
.hide { font-family: Verdana; font-size: 11px; font-weight: normal;background-color: #CBE0FA; border: 0px #CBE0FA none}
-->
</style>
      <form name=daf method="post" action="parsenikpemhn.jsp">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
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
               <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
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
<div align="center"><span class="submenu">Permohonan KK Baru WNI</span><br>
                                <span class="linkyellow">Yang Sudah Punya NIK</span>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
<div align="center"><span class="subtitle">Data Wilayah</span></div>
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
                            <td>Kode-Nama Provinsi</td>
                            <td>:</td>
                            <td width="5">
<b>                              <%=nop%></b>
<input  type="hidden"  name=no_prop  value=<%=nop%>>
<input type="hidden" name=nama_prop value="<%=record2.getNamaProp()%>">
                            </td>
      <td nowrap>
<b>       <%=record2.getNamaProp()%></b>
                           </td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td>:</td>
                            <td width="8">
<b>                           <%=nokab%></b>
<input type="hidden"  name=no_kab  value=<%=nokab%>>
<input type="hidden" name=nama_kab value="<%=record2.getNamaKab()%>">
                            </td>
                            <td  nowrap>

<b>   <%=record2.getNamaKab()%></b>
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kecamatan</td>
                            <td>:</td>
                            <td >
<b>  <%=nokec%></b>
<input type="hidden" name=no_kec value=<%=nokec%>>
<input type="hidden"  name=nama_kec value="<%=record2.getNamaKec()%>">
                            </td>
     <td nowrap>

<b>    <%=record2.getNamaKec()%></b>
                     </td>
       <td>&nbsp;</td>
                            <td>Kode-Nama Desa/Kelurahan</td>
                            <td>:</td>
                            <td width="8">
<b>  <%=nokel%></b>
<input type="hidden"  name=no_kel value=<%=nokel%>>
<input type="hidden" name=namakel value=<%=namakel%>>
                            </td>
          <td nowrap>

<b><%=namakel%></b>

          </td>
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
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
<div align="center"><span class="subtitle">Data Permohonan KK Baru WNI</span></div>
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
                                  <td colspan="13"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="images/dot.gif" width="1" height="10"></b></font></td>
                                </tr>
<input type=hidden name="flg" value=<%=flag%>>
                                  <tr valign="top">
                                    <td width="200"> Nomor Kartu Keluarga Semula<span class="asterish">*</span>
                                    </td>
                                    <td>:</td>
                                    <td colspan="11">
                                  <%=no_kk%>
    <input type="hidden" name=no_kk_semula value=<%=no_kk%>>
                                      <b> </b></td>
                                  </tr>
                                  <tr valign="top">
                                    <td> NIK Pemohon KK(sebagai Kepala Keluarga
                                      Baru)<span class="asterish">*</span></td>
                                    <td>:</td>
         <td colspan="11">
<input class=hide size=18 name=nik_kep_kel maxlength="16" onclick="this.blur()">
                                      <b>

                                      </b></td>
                                  </tr>
                                  <tr valign="top">
                                    <td> Nomor Kartu Keluarga Baru</td>
                                    <td>:</td>
                                    <td colspan="11"><b>&lt;create by system&gt;</b></td>
                                  </tr>
<%System.out.println("Checked Here 2");%>
                                  <tr valign="top">
                                  <td> Nama Lengkap</td>
                                  <td>:</td>
<td colspan="11"><b><%=record1.getNamalgkp().toString().toUpperCase()%></b></td>
   </tr>
<input type=hidden value="<%=record1.getNamalgkp()%>" name=NAMA_LGKP>
                                <tr valign="top">
                                  <td> Alamat KK Pemohon</td>
                                  <td> :</td>
                                  <td colspan="11"> <b><font color="#003366"><%=record1.getAlamat().toString().toUpperCase()%> RT :<%=record1.getNort()%> RW :<%=record1.getNorw()%>
                                  Dusun :<%=record1.getDusun().toString().toUpperCase()%> </font></b></td>
                                </tr>
<input type=hidden value="<%=record1.getAlamat()%>" name=alamat>
<input type=hidden value="<%=record1.getNort()%>" name=no_rt>
<input type=hidden value="<%=record1.getNorw()%>" name=no_rw>
<input type=hidden value="<%=record1.getDusun()%>" name=dusun>

 <%System.out.println("Checked Here 3");%>
                               <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td>Desa/Kelurahan </td>
                                  <td>:</td>
         <td> <font color="#003366"><b><font color="#003366"><b><%=nokel%> &nbsp;
   <%if ((record1.getNamaKel()) !=null)
   {
%>
   <%=record1.getNamaKel()%>
   <%}
    %>
</b></font></b></font></td>
                                  <td>Kecamatan</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font color="#003366"><b><%=nokec%>&nbsp;
<%if (record1.getNamaKec()!=null)
{
%>
<%=record1.getNamaKec()%>
<%
}%>
</b>
                                    </font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kab/Kota </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366"><%=nokab%>&nbsp; <%=record1.getNamaKab()%>
</font></b></font></td>
                                  <td>Provinsi</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font color="#003366"><b><font color="#003366"><%=nop%>&nbsp;<%=record1.getNamaProp()%><b></b></font></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kode Pos </td>
                                  <td>:</td>
                                  <td><b><font color="#003366"><%=record1.getKodepos()%>
                                    </font></b></td>
                                  <td>Telepon</td>
                                  <td>:</td>
                                  <td colspan="6"><b><font color="#003366"><%=record1.getTelp()%></font></b></td>
                                </tr>
<%System.out.println("Checked Here 4");%>
<input type=hidden value="<%=record1.getKodepos()%>" name=kodepos>
<input type=hidden value="<%=record1.getTelp()%>" name=telp>

                                <tr valign="top">
                                  <td>Alasan Permohonan </td>
                                  <td>:</td>
                                  <td colspan="11">
<select name="als_prmohon" class="boxdefault">
                                      <option value="0">-- Pilih Alasan Permohonan --</option>
                                      <option value="1">1 - Karena Membentuk Rumah
                                      Tangga Baru</option>
                                      <option value="2">2 - Karena Pindah Tempat
                                      Tinggal</option>
                                      <option value="3">3 - Karena Kartu Keluarga
                                      Hilang/Rusak</option>
                                      <option value="4">4 -Lainnya</option>
                                    </select>
                                  </td>
                                </tr>
                                <tr valign="top">
                                  <td>Jumlah Anggota Keluarga/Pengikut</td>
                                  <td>:</td>
                                  <td colspan="11">
<input type=hidden value=<%=j%> name=sa>
                                    <input class=boxdefault size=2 name=jml maxlength="2"> Orang </td>
                                </tr>
                              </table>
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
                                    <div align="center"><span class="subtitle">Daftar Keluarga Pemohon</span></div>
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
                                              <td class="C-Fonts" width="19%">
                                                <div align="center">Berubah Menjadi</div>
                                              </td>
                                            </tr>
<%
 for(i=0;i<v.size();i++)
      {
        record=(Individu_sudapunya)v.elementAt(i);
%>

                                            <tr>
                                              <td class="C-Field" width="4%">
                                                <div align="center"> <%=i+1%></div>
                                              </td>
                                              <td class="C-Field" width="20%">
                                                <div align="center"><%=record.getNik()%> </div>
                                              </td>
<input type=hidden name=nik<%=i%> value="<%=record.getNik()%>">
                                              <td class="C-Field" width="31%">
                                                <div align="center"><%=record.getNamalgkp().toString().toUpperCase()%> </div>
                                              </td>
                                              <td class="C-Field" width="16%"><%=record.getStathbkel().toString().toUpperCase()%></td>
<td  class="C-Field" width="19%">
<select name=stat_hbkel<%=i%> class="boxdefault" size="1" onChange="setKK(this.form)">
<option selected value="0">-- Sama dengan Semula--</option>
 <%
     for(int cntr=0;cntr<=vt_hbn.size()-1;cntr++)
       {
          String element=(String)vt_hbn.elementAt(cntr);
           if (!(element.trim().equals(record.getStathbkel().trim())))
   out.println("<option value=" + (cntr+1)+ ">" + (cntr+1)+ "." + element + "</option>");
       }
%>
</select>
<input type="hidden" name="flag_stat" value="0">
                                              </td>
<td class="C-Field" width="10%">
<center>
<input type=checkbox name=chk value=<%=record.getNik()%> onclick="javascript:setNik(this.form)">
</center>
 </td>
     </tr>


<input type=hidden name=ch<%=i%> value=<%=record.getNik()%>>


<%
      }
%>


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
                              <table border="0" cellspacing="3" cellpadding="2" align="center" width="100%">
                                <tr>
                                  <td colspan="9" height="10">
                                    <div align="center"><img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="9" height="1">
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="9" height="25">
                                    <div align="center"><span class="subtitle">Data
                                      Administrasi</span></div>
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
                                <tr valign="top">
                                  <td width="200">Nama Kepala Desa/ Kelurahan<span class="asterish">*</span>
                                  </td>
                                  <td>:</td>
                                  <td colspan="2">
                                    <p>

<font size=2 face="verdana">
<b>
 <input type="text" class="hide" size=16 maxlength="16" name="namalur" onfocus="this.blur()" value="<%=namalur%>">
</b>
</font>
</p>
                                    </td>
                                  <td><img src="images/dot.gif" width="10" height="1"></td>
                                  <td>Nama Petugas Entri</td>
                                  <td>:</td>
                                  <td colspan="2"> <b><%=NAMA_PET_ENTRI%></b></td>
                                </tr>
                                <tr valign="top">
                                  <td>NIP Petugas Entri</td>
                                  <td>:</td>
                                  <td colspan="2"><b><%=NIP_PET_ENTRI%></b></td>
                                  <td>&nbsp;</td>
                                  <td>Tanggal Entri</td>
                                  <td>:</td>
                                  <td colspan="2"><b><%=TGL_ENTRI%></b> </td>
                                </tr>
<input type=hidden value="<%=NAMA_PET_ENTRI%>" name=NAMA_PET_ENTRI>
<input type=hidden value="<%=NIP_PET_ENTRI%>" name=NIP_PET_ENTRI>
<input type=hidden value="<%=TGL_ENTRI%>" name=TGL_ENTRI>
<input type=hidden name=TC>

                                <tr valign="top">
                                  <td height="20"><img src="images/dot.gif" width="1" height="1"></td>
                                  <td>&nbsp;</td>
                                  <td colspan="2">&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td colspan="2">&nbsp;</td>
                                </tr>
                              </table>
                              <p>&nbsp;</p>
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
   <input class=boxstandard type=submit value=SIMPAN name="button" onclick="return ver()">
                  </b></div>
                      </td>
                      <td>
                        <div align="center">  <b> </b></div>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="submit2322"  onclick="document.location='WNI_Menu.jsp'">
                          </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                        <div align="center"><font color="#003399"><i>Keterangan
                          : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data
                          harus Diisi</font> </i></div>
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
</BODY></HTML>
<%
  }
  remote.remove();
 }
else
{
  response.sendRedirect("index.jsp");
}
  }catch(Exception e) {
remote.remove();
System.out.print("Error in jsp=" + e.toString());
}

%>