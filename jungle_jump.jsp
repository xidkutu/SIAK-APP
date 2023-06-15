<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,keluargawna.*,com.db.connection.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0  topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td height="390">
      <%!
String no_kk,als_pndh,namakep,niplrh,namacmat,nipcmat,namapetentri,nippetentri,tglentri;
Vector v;
String alamat_tjpndh,no_rt_tjpndh,no_rw_tjpndh,kodepos_tjpndh,telp_tjpndh;
String no_prop,no_kab,no_kec,no_kel;
String jenis_kpndhn,renc_tgl_pindah,t1,t2,t3,klasf_pndh,dusun,lis_pindah,nik,nama_kk;
Pindah_Wni pindah;
PindaHome home;
Pinda remote;
ServiceController factory;
Pindah_Anggota pin_ang;
int a;
boolean b;
 String nprop="",nkab="",nkec="",nkel="";
 String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
 String  nama_cmat="",nip_cmat="",nip_lrh="",nama_kep_des="",nama_pet="",nip_pet="";

GetKelrgaPindah kelpindah;
/*
public String conDate(int s)
{
String str=null;
switch(s)
{
case 1:
      {
      str="jan";
      break;

      }
case 2:
      {str="feb";
      break;
      }
case 3:
      {str="mar";
      break;
      }
case 4:
      {str="apr";
      break;
      }
case 5:
      {str="may";
      break;
      }
case 6:
      {str="jun";
      break;
      }
case 7:
      {str="jul";
      break;
      }
case 8:
      {str="aug";
      break;
      }
case 9:
      {str="sep";
      break;
      }

case 10:
      {str="oct";
      break;
     }
case 11:
      {str="nov";
      break;
      }
case 12:
      {str="dec";
      break;
     }

}
return str;
}
*/
%>
  <%
if(request.getParameter("Numpang")!=null)
{
no_kk=request.getParameter("Numpangkk");

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
System.out.println("in Jungle Jump nip_cmat->" + nip_cmat);
nip_lrh=request.getParameter("nip_lrh_tmp");
nama_kep_des=request.getParameter("nama_kep_des_tmp");

System.out.println("inside Numpang");
%>
<jsp:forward page="Per_Numpang_Wni.jsp">
<jsp:param name="Numpangkk" value="<%=no_kk%>"/>

<jsp:param name="nama_prop_tmp" value="<%=nama_prop%>"/>
<jsp:param name="nama_kab_tmp" value="<%=nama_kab%>"/>
<jsp:param name="nama_kec_tmp" value="<%=nama_kec%>"/>
<jsp:param name="nama_kel_tmp" value="<%=nama_kel%>"/>
<jsp:param name="no_prop_tmp" value="<%=nprop%>"/>
<jsp:param name="no_kab_tmp" value="<%=nkab%>"/>
<jsp:param name="no_kec_tmp" value="<%=nkec%>"/>
<jsp:param name="no_kel_tmp" value="<%=nkel%>"/>
<jsp:param name="nama_cmat_tmp" value="<%=nama_cmat%>"/>
<jsp:param name="nip_cmat_tmp" value="<%=nip_cmat%>"/>
<jsp:param name="nip_lrh_tmp" value="<%=nip_lrh%>"/>
<jsp:param name="nama_kep_des_tmp" value="<%=nama_kep_des%>"/>
</jsp:forward>
<%
}
else if(request.getParameter("Kepindahan")!=null)
{
no_kk=request.getParameter("Kepindahankk");
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

System.out.println("in Jungle Jump nip_cmat->" + nip_cmat);
nip_lrh=request.getParameter("nip_lrh_tmp");
nama_kep_des=request.getParameter("nama_kep_des_tmp");
System.out.println("inside Kepindahan");
%>
<jsp:forward page="Daftar_Keluarga.jsp">
<jsp:param name="Kepindahankk" value="<%=no_kk%>"/>
<jsp:param name="nama_prop" value="<%=nama_prop%>"/>
<jsp:param name="nama_kab" value="<%=nama_kab%>"/>
<jsp:param name="nama_kec" value="<%=nama_kec%>"/>
<jsp:param name="nama_kel" value="<%=nama_kel%>"/>
<jsp:param name="no_prop" value="<%=no_prop%>"/>
<jsp:param name="no_kab" value="<%=no_kab%>"/>
<jsp:param name="no_kec" value="<%=no_kec%>"/>
<jsp:param name="no_kel" value="<%=no_kel%>"/>
<jsp:param name="nama_cmat" value="<%=nama_cmat%>"/>
<jsp:param name="nip_cmat" value="<%=nip_cmat%>"/>
<jsp:param name="nip_lrh" value="<%=nip_lrh%>"/>
<jsp:param name="nama_kep_des" value="<%=nama_kep_des%>"/>
<jsp:param name="nama_pet" value="<%=nama_pet%>"/>
<jsp:param name="nip_pet" value="<%=nip_pet%>"/>
</jsp:forward>
<%
}
else if(request.getParameter("sim")!=null)
{
System.out.println("Inside Simpan");
no_kk=request.getParameter("no_kk");
als_pndh=request.getParameter("als_pndh");
alamat_tjpndh=request.getParameter("alamat_tjpndh");
no_rt_tjpndh=request.getParameter("no_rt_tjpndh");
no_rw_tjpndh=request.getParameter("no_rw_tjpndh");
kodepos_tjpndh=request.getParameter("kodepos_tjpndh");
telp_tjpndh=request.getParameter("telp_tjpndh");
no_prop=request.getParameter("no_prop_ibu");
no_kab=request.getParameter("no_kab_ibu");
no_kec=request.getParameter("no_kec_ibu");
no_kel=request.getParameter("no_kel_ibu");
jenis_kpndhn=request.getParameter("jenis_kpndhn");
t1=request.getParameter("renc_tgl_pindah");
t2=request.getParameter("renc_bln_pindah");
t3=request.getParameter("renc_thn_pindah");
renc_tgl_pindah= t1.trim() +"-"+t2.trim()+"-"+t3.trim();
klasf_pndh=request.getParameter("klasf_pndh");

namakep=request.getParameter("nama_kep_des_tmp");
niplrh=request.getParameter("nip_lrh_tmp");
namacmat=request.getParameter("nama_cmat_tmp");
nipcmat=request.getParameter("nip_cmat_tmp");


namapetentri=request.getParameter("namapetentri");
nippetentri=request.getParameter("nippetentri");

tglentri=request.getParameter("tglentri");
dusun=request.getParameter("dusun_tjpndh");
lis_pindah=request.getParameter("pinlist");
nik=request.getParameter("nik");
nama_kk=request.getParameter("namakk");

nama_prop=request.getParameter("np");
nama_kab=request.getParameter("nb");
nama_kec=request.getParameter("nc");
nama_kel=request.getParameter("nl");

System.out.println(lis_pindah);

System.out.println("");

v=new Vector();

//v.add(no_kk);

StringTokenizer st = new StringTokenizer(lis_pindah,",");

 while (st.hasMoreTokens())
{

//  v.add(st.nextToken());
//  pin_ang=new Pindah_Anggota(st.nextToken(),st.nextToken(),st.nextToken(),st.nextToken(),st.nextToken());
// (String nik,String nokk,String namakep,String stathbkel,String jenisklmin,String kwrn)

kelpindah=new GetKelrgaPindah(st.nextToken(),st.nextToken(),st.nextToken(),st.nextToken(),st.nextToken(),"1");

   System.out.println("kelpindah.getNik() " + kelpindah.getNik());
   System.out.println("kelpindah.getNokk() " + kelpindah.getNokk());
   System.out.println("kelpindah.getNamaKep() " + kelpindah.getNamaKep());
   System.out.println("kelpindah.getJenisKlmin() " + kelpindah.getJenisKlmin());
   System.out.println("kelpindah.getStatHbkel() " + kelpindah.getStatHbkel());
   System.out.println("kelpindah.getKwrn() " + kelpindah.getKwrn() );
   v.add(pin_ang);
}

pindah=new Pindah_Wni(no_kk, als_pndh, alamat_tjpndh, no_rt_tjpndh, no_rw_tjpndh, kodepos_tjpndh, telp_tjpndh, no_prop, no_kab, no_kec, no_kel, jenis_kpndhn, renc_tgl_pindah, klasf_pndh, namakep, niplrh, namacmat, nipcmat, namapetentri, nippetentri, tglentri, dusun,nik,nama_kk,nama_prop,nama_kab,nama_kec,nama_kel);
pindah.setAngotta(v);
factory=ServiceController.getInstance();

try
  {
    home = (PindaHome) factory.lookup("Pinda",PindaHome.class);
    remote = home.create();
    b = remote.setPinda_wni(pindah,v);

    if(b)
     {
%>
      <table width="100%" border="0" cellspacing="5" cellpadding="5" height="54%">
        <tr>
          <td height="407">
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="45">
                        <div align="center"><span class="subtitle">Keterangan
                          Perpindahan WNI</span><br>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table width="80%"  cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" height="43%" >
              <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td height="289">&nbsp;</td>
                <td height="289">
                  <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="61%" class="border">
                    <tr>
                      <td valign="top" height="69">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" valign="middle">
                              <div align="center"><span class="subtitle">Data
                                Daerah AsaI</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                        </table>
<table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="8" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">Nomor Kartu Keluarga<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
<td colspan="6" valign="top">
<b><font color="red"><%=no_kk%> </font></b>
<img src="images/dot.gif" width="10" height="1"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">Nama Kepala Keluarga</td>
                            <td valign="top" width="1%">:</td>
<td colspan="5" valign="top">
<font color="#003366"><b><font color="#003366">
<b><%=nama_kk.toString().toUpperCase()%></b></font>
</b></font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">Alamat Tujuan Pindah<span class="asterish"></span></td>
                            <td valign="top" width="1%">:</td>
<td colspan="5" valign="top">
 <%=alamat_tjpndh.toString().toUpperCase()%>;
 RT <%=no_rt_tjpndh%>;
 RW <%=no_rw_tjpndh%>;
</td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">
                              <div align="right">Dusun/Kampung/Dukuh</div>
                            </td>
                            <td valign="top" width="1%">:</td>
<td valign="top" colspan="5">
<%=dusun.toString().toUpperCase()%></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">
                              <div align="right">Provinsi</div>
                            </td>
                            <td valign="top" width="1%">:</td>
<td valign="top" width="16%">
 <%=nama_prop.toString().toUpperCase()%></td>
                            <td valign="top" width="6%">&nbsp;</td>
                            <td valign="top" width="13%">
                              <div align="right">Kabupaten/Kota</div>
                            </td>
                            <td valign="top" width="1%">:</td>
<td valign="top" width="38%">
<%=nama_kab.toString().toUpperCase()%></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">
                              <div align="right">Kecamatan</div>
                            </td>
                            <td valign="top" width="1%">:</td>
<td valign="top" width="16%">
<%=nama_kec.toString().toUpperCase()%></td>
                            <td valign="top" width="6%">&nbsp;</td>
                            <td valign="top" width="13%">
                              <div align="right">Desa/Kelurahan</div>
                            </td>
                            <td valign="top" width="1%">:</td>
<td valign="top" width="38%">
<%=nama_kel.toString().toUpperCase()%></td>
                          </tr>
<tr>
                            <td valign="top" width="21%">
                              <div align="right">Kode Pos</div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" width="17%">
<%=kodepos_tjpndh%>
                            </td>
                            <td valign="top" width="3%">&nbsp;</td>
                            <td valign="top" width="13%">
                              <div align="right">Telepon</div>
                            </td>
                            <td valign="top" width="2%">:</td>
                            <td valign="top" width="43%">
<%=telp_tjpndh%>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">
                        <table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="8" height="10">
                              <div align="center">
                                <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#93BEE2">
                                  <tr>
                                    <td width="5" height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                                    <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                    <td width="1" height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td valign="middle" align="center">
                                      <table width="100%" border="0" cellspacing="1" cellpadding="3" class="C-BG">
                                        <tr>
                                          <td class="C-Fonts" width="4%">
                                            <div align="center"> No.</div>
                                          </td>
                                          <td class="C-Fonts" width="20%">
                                            <div align="center">NIK</div>
                                          </td>
                                          <td class="C-Fonts" width="31%">
                                            <div align="center">Nama Lengkap</div>
                                          </td>
                                          <td class="C-Fonts">
                                            <div align="center">SHDK dengan KK
                                              Asal</div>
<%
int y=1;

int z=v.size();
for(int x=1;x<z; x++)
{
%>
                                        <tr>
                                          <td class="C-Field" width="4%">
                                            <div align="center"><%=y%> </div>
                                          </td>
                                          <td class="C-Field" width="20%">
<div align="center">
<%=v.elementAt(x)%>
                                            </div>
                                          </td>
                                          <td class="C-Field" width="31%">
<div align="center">
<%=v.elementAt(x+1).toString().toUpperCase()%>
                                            </div>
                                          </td>
                                          <td class="C-Field" width="19%">
<div align="center">
<%=v.elementAt(x+2).toString().toUpperCase()%></div>
                                          </td>
                                        </tr>
<%
y++;
x=x+2;
}
%>
                                      </table>
                                    </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                    <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                    <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                                  </tr>
                                </table>
                                <img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="15%">&nbsp;</td>
                            <td valign="top" width="0%">&nbsp;</td>
                            <td colspan="5" valign="top" width="85%">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td><div align="center"><h4><font color="red">Data Sudah disimpan!</font></h4></div></td>
                    </tr>
                  </table>
                </td>
                <td height="289">&nbsp;</td>
              </tr>
              <tr>
                <td height="2"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td height="2"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td height="2"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
            <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b> </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
                  <div align="center"><b>
<input class=boxstandard type=button onClick="window.close()" value=KELUAR name="submit2322">
                    </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
                </td>
              </tr>
            </table>
                    </td>
        </tr>
      </table>
	  </td>
	  </tr>
	  </table>

<%
     }
 else
     {
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><div align="center"><h4><font color="red">Data sudah Ada !</font></h4></div></td>
</tr>
<tr>
<td>
<div align="center"><input class=boxstandard type=button onClick="window.close()" value=KELUAR name="submit2322"></div>
</td>
</tr>
</table>
<%
     }
  }catch(Exception e){}
}
%>