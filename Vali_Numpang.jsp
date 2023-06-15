<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%!
String nop,nokab,nokec,nokel,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI;
String no_kk_lama,no_kk_tmpt,flag;
int i,j;
ServiceController factory;
Data_Numpang_WniHome home;
Data_Numpang_Wni remote;
Vector v,vt_hbn,ve;
Individu_Mumpang record,record1;

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

no_kk_lama=request.getParameter("no_kk_lama");
no_kk_tmpt=request.getParameter("no_kk_tmpt");
nop=request.getParameter("no_prop");
nokab=request.getParameter("no_kab");
nokec=request.getParameter("no_kec");
nokel=request.getParameter("no_kel").trim() ;
nama_kel=request.getParameter("nama_kelur") ;

if(!(request.getParameter("flag").trim().equals("")))
{
flag=no_kk_lama;
System.out.println("Inside FLAG NOT NULL AND NOT SPACE");

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
else
{
flag="";
}

NAMA_PET_ENTRI=record2.getNamaPetugas();
NIP_PET_ENTRI=record2.getNipPetugas();
TGL_ENTRI=record2.getToday();

factory=ServiceController.getInstance();

System.out.println("Before Lookup");
    home = (Data_Numpang_WniHome) factory.lookup("Data_Numpang_Wni",Data_Numpang_WniHome.class);
    remote = home.create();
System.out.println("After Lookup");
    v = remote.numpangKeluarga(no_kk_lama,no_kk_tmpt);
    vt_hbn=getListHubuganWni();
System.out.println("After Call getListHubuganWni()");
    j=v.size();

    if(v.isEmpty())
   {

%>
    <br><br><br><br>
<body bgColor=#93BEE2 onload="window.history.forward(1)">
<style type="text/css">
<!--
.flat {  background-color: #CCCCCC; border: 2px #CCCCCC solid}
-->
</style>
<table align="center"  >
<tr>
<td>
<div align="center">
<h4>
<font color="red"> <br><%=no_kk_lama%> &nbsp;Nomor Kartu Keluarga Lama Belum Ada !  </font>
</h4>
</div>
</td>
</tr>
<tr>
<td>
<div align="center">
<input onClick="document.location='Per_Numpang_Wni.jsp'" class=flat type=button value=KELUAR name="button22">
</div>
</td>
</tr>
</table>
</body>
<%
   }
 else
    {

  record1=(Individu_Mumpang)v.elementAt(0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/Ditempati.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name=numpang method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">

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
                                             <td>
<% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record2.getNoProp() + "&nama_prop=" + record2.getNamaProp() +
      "&no_kab=" + record2.getNoKab() + "&nama_kab=" + record2.getNamaKab() + "&no_kec=" + record2.getNoKec() + "&nama_kec=" + record2.getNamaKec() +
      "&no_kel=" + nkel+ "&nama_kel="+ nama_kel.toString().toUpperCase();
%>
                          <jsp:include page="<%=jsp%>"/>
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
                                    <input class=boxdefault size=20 name=no_kk_lama maxlength="16" onFocus="this.blur()" value=<%=no_kk_lama%>>
                                    <b>
                                   </b></td>
                                </tr>
                                <tr valign="top">
                                  <td> NIK Kepala Keluarga Lama</td>
                                  <td>:</td>
                                  <td colspan="9"><b><%=record1.getNik()%></b></td>
                                </tr>
                                <tr valign="top">
                                  <td> Nama Kepala Keluarga Lama</td>
                                  <td>:</td>
                                  <td colspan="9"><b><%=record1.getNamaKep().toString().toUpperCase()%></b>
                                  </td>

                                </tr>
                                <tr valign="top">
                                  <td>Nomor Kartu Kepala Keluarga Yang Ditempati<span class="asterish">*</span>
                                  </td>
                                  <td>:</td>
                                  <td colspan="9">
                                    <input class=boxdefault size=20 name=no_kk_tmpt maxlength="16" onFocus="this.blur()" value=<%=no_kk_tmpt%>>
                                    <b>
                                  <%--  <input class=boxstandard type=submit value=PERIKSA name="submit22" onclick="return nump()">--%>
                                    </b></td>
                                </tr>
                                <tr valign="top">
                                  <td>NIK Kepala Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"><b><%=record1.getNik()%></b></td>
                                </tr>
                                <tr valign="top">
                                  <td>Nama Kepala Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"><b><%=record1.getNamaKep().toString().toUpperCase()%></b></td>
                                </tr>
                                <tr valign="top">
                                  <td> Alamat Keluarga Yang Ditempati</td>
                                  <td>:</td>
                                  <td colspan="9"> <b>
                                    <font color="#003366"><%=record1.getAlamat().toString().toUpperCase()%>;
                                    RT <%=record1.getNort()%>;RW <%=record1.getNorw()%>;
                                    Dusun <%=record1.getDusun().toString().toUpperCase()%></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td>Desa/Kelurahan </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366"><b><%=nokel%></b></font></b></font></td>
                                  <td>Kecamatan</td>
                                  <td>:</td>
                                  <td colspan="4"> <b><font color="#003366"><b><%=nokec%></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kab/Kota</td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366"><%=nokab%></font></b></font></td>
                                  <td>Provinsi<font color="#003366"></font></td>
                                  <td>:</td>
                                  <td colspan="4"> <b><font color="#003366"><b><font color="#003366"><%=nop%></font></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kode Pos </td>
                                  <td>:</td>
                                  <td><b><font color="#003366"><%=record1.getKodepos()%>
                                    </font></b></td>
                                  <td>Telepon</td>
                                  <td>:</td>
                                  <td colspan="4"><b><font color="#003366"><%=record1.getTelp()%></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td>Alasan Menumpang KK</td>
                                  <td>:</td>
                                  <td colspan="9">
                                    <select name=als_numpang boxdefault2 class="boxdefault">
                                      <option value="0">-- Pilih Alasan Menumpang KK --</option>
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
                                           <input type=hidden value=<%=j%> name=sa>
                                  <td colspan="9">
                                    <input class=boxdefault size=4 name=jml maxlength="2" onKeyUp="al()">
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
<%
 for(i=0;i<v.size();i++)
      {
        record=(Individu_Mumpang)v.elementAt(i);
%>
                                            <tr>
                                              <td class="C-Field" width="4%">
                                                <div align="center"> <%=i+1%></div>
                                              </td>
                                              <td class="C-Field" width="20%">
                                                <div align="center"><%=record.getNik()%> </div>
                                              </td>
                                              <td class="C-Field" width="31%">
                                                <div align="center"><%=record.getNamalgkp().toString().toUpperCase()%> </div>
                                              </td>
 <td class="C-Field" width="16%">
<%=record.getStathbkel().toString().toUpperCase()%>
</td>
<input type=hidden value=<%=record.getStathbkel().trim()%> name=stkep<%=i%>>

                                              <td class="C-Field" width="19%">
<select  name=stat_hbkel<%=i%> boxdefault2 class="boxdefault" size="1">
<option value="0" selected>-- Sama dengan Semula--</option>
<%
     for(int cntr=0;cntr<=vt_hbn.size()-1;cntr++)
       {
          String element=(String)vt_hbn.elementAt(cntr);
          if (!(element.trim().equals(record.getStathbkel().trim())) && !(element.trim().equals("Kepala Keluarga/Head of Family")))
              out.println("<option value=" + (cntr+1)+ ">" + (cntr+1)+ "." + element + "</option>");

       }
%>
</select>
                                              </td>
                                              <td class="C-Field" width="10%">
                                                <div align="center">
<input type=checkbox name=che<%=i%> value=<%=record.getNik()%>>
                                                </div>
                                              </td>
                                             </tr>
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
<input type=hidden value=<%=NAMA_PET_ENTRI%> name=NAMA_PET_ENTRI>
<input type=hidden value=<%=NIP_PET_ENTRI%> name=NIP_PET_ENTRI>
<input type=hidden value=<%=TGL_ENTRI%> name=TGL_ENTRI>
<input type=hidden name=TC>
<input type=hidden name=flag value="<%=flag%>">
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
 <%=request.getParameter("nama_kep_des")%>
 <input type="hidden" name="nama_kep_des" value='<%=request.getParameter("nama_kep_des")%>'>
                                        </td>
                                        <td>Nama Petugas Entri</td>
                                        <td>:</td>
                                        <td><b><%=NAMA_PET_ENTRI%></b></td>
                                      </tr>
                                      <tr>
                                        <td>NIP Petugas Entri</td>
                                        <td>:</td>
                                        <td><b><%=NIP_PET_ENTRI%></b></td>
                                        <td>Tanggal Entri</td>
                                        <td>:</td>
                                        <td><b><%=TGL_ENTRI%></b> </td>
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
     <input class=boxstandard type=button value=SIMPAN  name="simpan" onclick="return ditem()">
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
<p class="linkyellow">&nbsp;</p>
</form>
</BODY>
</HTML>
<%
  }
 }
 else
{
  response.sendRedirect("index.jsp");
}
}
catch(Exception e) { e.printStackTrace();
response.sendRedirect("Logout.jsp");
}
finally{
remote.remove();
}
%>