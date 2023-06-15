<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
ServiceController factory=null;
%>

<%
String no_kk_asal=null;
String no_kk_tujuan=null,nama_kk_asal=null,alamat_lma=null,no_rt_lma=null;
String no_rw_lma=null,dusun_lma=null,kodepos_lma=null,telp_lma;
String renc_tgl=null,stat_no_kk_pdh=null,nama_cmat_lma=null,nama_kep_lma=null;
String NAMA_PET_LMA=null,NIP_PET_LMA=null,TGL_ENTRI_LMA=null,alamat_tuj=null;
String no_rt_tuj=null,no_rw_tuj=null,dusun_tuj=null,kodepos_tuj=null,telp_tuj=null;
String no_prop_tuj=null,no_kab_tuj=null,no_kec_tuj=null,no_kel_tuj=null;
String nama_prop_lma=null,nama_kab_lma=null,nama_kec_lma=null,nama_kel_lma=null;
String NIP_PET_BRU=null,TGL_ENTRI=null,m1=null,m2=null,m3=null,tgl_datang=null;
String anlist=null,NO_PROP=null,NO_KAB=null,nama_kep_bru=null;
String nama_cmat_bru=null,nama_bup_lma=null,nama_bup_bru=null,kwrn=null;
String NAMA_PET_BRU=null;
String no_prop_asl=null,no_kab_asl=null,no_kec_asl=null,no_kel_asl=null;

Kedatan_keluarga kedata_kel=null;
PindahAsalHome home=null;
PindahAsal remote=null;
Vector v=null;
GetKelrgaPindah kelpindah=null;

boolean result;
String niplrh_bru=null,nip_cmat_bru=null;

String source=null;
UserInfo1 record=null;

%>

<%
try
{
   record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
   {
 if (request.getParameter("source")!=null) source=request.getParameter("source").trim();

no_kk_tujuan=request.getParameter("no_kk_tujuan");
no_kk_asal=request.getParameter("no_kk_asal");
nama_kk_asal=request.getParameter("nama_kk_asal");
alamat_lma=request.getParameter("alamat_lma");
no_rt_lma=request.getParameter("no_rt_lma");
no_rw_lma=request.getParameter("no_rw_lma");
dusun_lma=request.getParameter("dusun_lma");
kodepos_lma=request.getParameter("kodepos_lma");
telp_lma=request.getParameter("telp_lma");

no_prop_asl=request.getParameter("no_prop_asl");
no_kab_asl=request.getParameter("no_kab_asl");
no_kec_asl=request.getParameter("no_kec_asl");
no_kel_asl=request.getParameter("no_kel_asl");

renc_tgl=request.getParameter("rentgl");
stat_no_kk_pdh=request.getParameter("stat_no_kk_pdh");
nama_cmat_lma=request.getParameter("nama_cmat_lma");
nama_kep_lma=request.getParameter("nama_kep_des_lma");
NAMA_PET_LMA=request.getParameter("namapet_lma");
NIP_PET_LMA=request.getParameter("nipet_lma");
TGL_ENTRI_LMA=request.getParameter("tglentlma");
alamat_tuj=request.getParameter("alamat_tjpndh");
no_rt_tuj=request.getParameter("no_rt_tjpndh");
no_rw_tuj=request.getParameter("no_rw_tjpndh");
dusun_tuj=request.getParameter("dusun_tjpndh");
kodepos_tuj=request.getParameter("kodepos");
telp_tuj=request.getParameter("telp");
no_prop_tuj=request.getParameter("no_prop_tuj");
no_kab_tuj=request.getParameter("no_kab_tuj");
no_kec_tuj=request.getParameter("no_kec_tuj");
no_kel_tuj=request.getParameter("no_kel_tuj");

nama_prop_lma=request.getParameter("namaprop_tjpndh");
nama_kab_lma=request.getParameter("namakab_tjpndh");
nama_kec_lma=request.getParameter("namakec_tjpndh");
nama_kel_lma=request.getParameter("namakel_tjpndh");

NAMA_PET_BRU=request.getParameter("namapetentri");
NIP_PET_BRU=request.getParameter("nippetentri");
TGL_ENTRI=request.getParameter("tglentri");

m1=request.getParameter("tgl_datngn");
m2=request.getParameter("bln_datngn");
m3=request.getParameter("thn_datngn");
tgl_datang= getFullDate(getTrimData(m1),getTrimData(m2),getTrimData(m3));

anlist=request.getParameter("alist");
NO_PROP=request.getParameter("no_prop");
NO_KAB=request.getParameter("no_kab");

if (source.equals("WNI"))
{
nama_kep_bru=request.getParameter("nama_kep_des");
nama_cmat_bru=request.getParameter("nama_cmat");
}
else if (source.equals("WNA"))
{
nama_bup_lma=request.getParameter("nama_bup_lma");
nama_bup_bru=request.getParameter("nama_bup");
}

v=new Vector();
StringTokenizer st = new StringTokenizer(anlist,"#");
//String kwrn="";

while (st.hasMoreTokens())
   {
if (source.equals("WNI"))
{
kwrn="1";
}
else if (source.equals("WNA"))
{
kwrn="2";
}

 kelpindah=new GetKelrgaPindah(st.nextToken(),st.nextToken(),getTrimData(no_kk_tujuan),
 st.nextToken(),st.nextToken(),st.nextToken(),kwrn);

 //String tmp=st.nextToken();      /for temporary use to identify kwrngra if need for WNA
     v.add(kelpindah);

System.out.println("kelpindah.getNik()" + kelpindah.getNik() + "," + "getNokk()" + kelpindah.getNokk() + "getNoKkBaru" + kelpindah.getNoKkBaru() + "getNamaKep" + kelpindah.getNamaKep() + "kelpindah.getStatHbkel()" + kelpindah.getStatHbkel() + "getJenisKlmin()" + kelpindah.getJenisKlmin() + "getKwrn()" + kelpindah.getKwrn());

}

//kedata_kel= new Kedatan_keluarga(no_prop_tuj,no_kab_tuj,no_kec_tuj,no_kel_tuj,no_kk_asal.trim(),nama_kk_asal.trim(),renc_tgl.trim(),alamat_lma.trim(),no_rt_lma.trim(),no_rw_lma.trim(),dusun_lma.trim(),kodepos_lma.trim(),telp_lma.trim(),"","",NAMA_PET_LMA.trim(),NIP_PET_LMA.trim(),TGL_ENTRI_LMA.trim(),no_kk_tujuan.trim(),"","",NAMA_PET_BRU.trim(),NIP_PET_BRU.trim(),TGL_ENTRI.trim(),tgl_datang.trim());

kedata_kel= new Kedatan_keluarga(
no_kk_tujuan,no_kk_asal,nama_kk_asal,
alamat_lma,no_rt_lma,no_rw_lma,
dusun_lma,kodepos_lma,telp_lma,
renc_tgl,nama_cmat_lma,nama_kep_lma,
NAMA_PET_LMA,NIP_PET_LMA,
TGL_ENTRI_LMA,alamat_tuj,no_rt_tuj,no_rw_tuj,
dusun_tuj,kodepos_tuj,telp_tuj,
no_prop_tuj,no_kab_tuj,no_kec_tuj,no_kel_tuj,
nama_cmat_bru,nama_kep_bru,NAMA_PET_BRU,
NIP_PET_BRU,TGL_ENTRI,tgl_datang,no_prop_asl,no_kab_asl,no_kec_asl,no_kel_asl);
kedata_kel.setSource(source);
kedata_kel.setStatusPindah(stat_no_kk_pdh);
kedata_kel.setAngo(v);
System.out.println("Staus yang pindah ####### from JSP" + kedata_kel.getStatusPindah());


factory=ServiceController.getInstance();

home = (PindahAsalHome) factory.lookup("PindahAsal",PindahAsalHome.class);
    remote = home.create();

if(home!=null)
    {
      result=remote.setKeluarga_Pindah(kedata_kel);

 if(result)
        {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript>
function ex()
{
var v=window.history.length;
history.go(-v);
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
	  </tr>
 </table>

<table width="100%" border="0" cellspacing="5" cellpadding="5" height="54%">
        <tr>
          <td height="407">
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>

                </td>
              </tr>
            </table>

      <table width="79%"  cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA"  >
        <tr>

          <td width="1%"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>

          <td height="1" width="98%"><img src="images/dot.gif" width="1" height="1"></td>

          <td width="1%"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>

          <td  width="1%">&nbsp;</td>

          <td  width="98%">
            <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center"  class="border" height="56">
              <tr>
                <td >
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="25" valign="middle">
                        <div align="center"><span class="subtitle">Data Daerah
                          Tujuan</span></div>
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
                      <td colspan="6" valign="top"> <b><font color="red"><%=no_kk_tujuan%>
                        </font></b> <img src="images/dot.gif" width="10" height="1"></td>
                    </tr>
                    <tr>
                      <td valign="top" width="24%">Nama Kepala Keluarga</td>
                      <td valign="top" width="1%">:</td>
                      <td colspan="5" valign="top"> <font color="#003366"><b><font color="#003366">
                        <b><%=nama_kk_asal.toString().toUpperCase()%></b></font>
                        </b></font></td>
                    </tr>
                    <tr>
                      <td valign="top" width="24%">Alamat Tujuan Pindah<span class="asterish"></span></td>
                      <td valign="top" width="1%">:</td>
                      <td colspan="5" valign="top"> <%=alamat_tuj.toString().toUpperCase()%>;
                        RT <%=no_rt_tuj%>; RW <%=no_rw_tuj%>; </td>
                    </tr>
                    <tr>
                      <td valign="top" width="24%">
                        <div align="right">Dusun/Kampung/Dukuh</div>
                      </td>
                      <td valign="top" width="1%">:</td>
                      <td valign="top" colspan="5"> <%=dusun_tuj.toString().toUpperCase()%></td>
                    </tr>
                    <tr>
                      <td valign="top" width="21%">
                        <div align="right">Kode Pos</div>
                      </td>
                      <td valign="top" width="1%">:</td>
                      <td valign="top" width="17%"> <%=kodepos_tuj%> </td>
                      <td valign="top" width="3%">&nbsp;</td>
                      <td valign="top" width="13%">
                        <div align="right">Telepon</div>
                      </td>
                      <td valign="top" width="2%">:</td>
                      <td valign="top" width="43%"> <%=telp_tuj%> </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>

          <td  width="1%">&nbsp;</td>
              </tr>
              <tr>

          <td height="8" width="1%"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>

          <td height="8" width="98%"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>

          <td height="8" width="1%"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
            <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b> </b></div>
                </td>
                <td>
     <div align="center"><b><%=printInfo("Data sudah disimpan")%> </b></div>
    <div align="center"><b>
<input class=boxstandard type=button  value=KELUAR  name="ent" onClick="document.location='<%=record.getModRefFile()%>'">
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
<%
  }
 else
      {
         response.sendRedirect("Keda_Tujuan_Wna.jsp?error=8&no_kk=" + no_kk_asal);
      }
  }
%>
<%}
else
{
  response.sendRedirect("index.jsp");
}
}
catch(Exception e)
{
System.out.println("error in nump_pindah_add jsp page "+e.toString());
e.printStackTrace();
}

%>