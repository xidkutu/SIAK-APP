<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>

<%
String t1="",t2="",t3="",agama="";
String tp1="",tp2="",tp3="",tb1="",tb2="",tb3="";
String tt1="",tt2="",tt3="",tl1="",tl2="",tl3="";
String ttt1="",ttt2="",ttt3="",ned="",niped="",m1="",m2="",m3="",m4="",m5="",m6="",m7="";
String t4="",t5="",t6="",hh="";
String jns="",tot="",a="",b="",c="",d="",e="",f="",bb="",nik="",nokk="",NP="",NB="",NRT="",NRW="",DUS="",KOD="",TLP="",NC="",NL="";
String returnval1="",returnval="",s1="",s2="",s3="",s="",sss="";
int aa,bbb,cc,dd,ee,ff,gg;

boolean result=false;
   String NIK="",NAMA_KLRGA="",NAMA_PERTMA="",JENIS_KLMIN="",TMPT_LHR="",TGL_LHR="",KWRNGRN="";
   String AGAMA="",GOL_DRH="",STAT_KWN="",PDDK_AKH="",JENIS_PKRJN="",ALAMAT_SPSOR="",NO_RT="",NO_RW="";
   String KODEPOS="",TELEPON="",DATNG_DARI="",TUJUAN_DTNG="",NO_PASPOR="",TGL_PASPOR="",TGL_AKH_PASPOR="";
   String NAMA_SPSOR="",TIPE_SPSOR="",DOK_IMGR="",NO_DOK="",TMPT_DTBIT="",TGL_DTBIT="",TGL_AKH_DOK="";
   String TMPT_DTNG_PERT="",TGL_DTNG_PERT="",NO_STLD="",TGL_DFT="",NAMA_DIN="",NAMA_KEP_DIN="";
   String NIP_KEP_DIN="",NAMA_PET_ENTRI="",NIP_PET_ENTRI="",TGL_ENTRI="",NO_KK="",NO_PROP="",NO_KAB="",STAT_HBKEL="1";
   String nama_kep="",dalamat="",dno_rt="",dno_rw="",ddusun="",dkode_pos="",dtelp="",NO_KEC="",NO_KEL="";


MeadHome home=null;
Mead remote=null;
GdataWna  rec_wna=null;
ServiceController factory=null;
Vector data_wna=null;
%>
<%
   try
   {
if (session.getAttribute("remoteRef")!=null)
{
data_wna=new Vector();
NIK = request.getParameter("nik");
NAMA_KLRGA=request.getParameter("nama_klrga");
NP=request.getParameter("nprop");
NB=request.getParameter("nkab");
NC=request.getParameter("nkec");
NL=request.getParameter("nkek");
NO_KK=request.getParameter("nokk");
NAMA_PERTMA=request.getParameter("nama_pertma");
TMPT_LHR=request.getParameter("tmpt_lhr");
KWRNGRN=request.getParameter("kwrngrn");
AGAMA=request.getParameter("agama");
STAT_KWN=request.getParameter("stat_kwn");
f=request.getParameter("nkap");
e=request.getParameter("ala");
JENIS_KLMIN=request.getParameter("jenis_klmin");
t1= request.getParameter("t1");
t2= request.getParameter("t2");
t3= request.getParameter("t3");

TGL_LHR=getFullDate(t1,t2,t3);

System.out.println("TGL_LHR" + TGL_LHR);



GOL_DRH=request.getParameter("gol_drh");

PDDK_AKH=request.getParameter("pddk_akh");
JENIS_PKRJN=request.getParameter("jenis_pkrjn");
ALAMAT_SPSOR=request.getParameter("alamat_spsor");
NO_RT=request.getParameter("nrt");
NO_RW=request.getParameter("nrw");
KODEPOS=request.getParameter("kpos");
TELEPON=request.getParameter("tlp");
DATNG_DARI=request.getParameter("datng_dari");
TUJUAN_DTNG=request.getParameter("tujuan_dtng");
NO_PASPOR=request.getParameter("num_paspor");
tp1= request.getParameter("tp1");
tp2= request.getParameter("tp2");
tp3= request.getParameter("tp3");
TGL_PASPOR=getFullDate(tp1,tp2,tp3);
System.out.println("TGL_PASPOR" + TGL_PASPOR);
tb1= request.getParameter("tb1");
tb2= request.getParameter("tb2");
tb3= request.getParameter("tb3");
TGL_AKH_PASPOR=getFullDate(tb1,tb2,tb3);
System.out.println("TGL_AKH_PASPOR" + TGL_AKH_PASPOR);
NAMA_SPSOR=request.getParameter("nama_spsor");
TIPE_SPSOR=request.getParameter("tipe_spsor");
DOK_IMGR=request.getParameter("dok_imgr");
NO_DOK=request.getParameter("num_dok");
TMPT_DTBIT=request.getParameter("tmpt_dtbit");
tt1= request.getParameter("tt1");
tt2= request.getParameter("tt2");
tt3= request.getParameter("tt3");
TGL_DTBIT=getFullDate(tt1,tt2,tt3);
System.out.println("TGL_DTBIT" + TGL_DTBIT);
tl1= request.getParameter("tl1");
tl2= request.getParameter("tl2");
tl3= request.getParameter("tl3");
TGL_AKH_DOK=getFullDate(tl1,tl2,tl3);
System.out.println("TGL_AKH_DOK" + TGL_AKH_DOK);
TMPT_DTNG_PERT=request.getParameter("tmpt_dtng_pert");
ttt1= request.getParameter("ttt1");
ttt2= request.getParameter("ttt2");
ttt3= request.getParameter("ttt3");
TGL_DTNG_PERT=getFullDate(ttt1,ttt2,ttt3);
System.out.println("TGL_DTNG_PERT" + TGL_DTNG_PERT);
NO_STLD=request.getParameter("num_stld");
t4= request.getParameter("t4");
t5= request.getParameter("t5");
t6= request.getParameter("t6");
TGL_DFT=getFullDate(t4,t5,t6);
System.out.println("TGL_DFT" + TGL_DFT);
NAMA_DIN=request.getParameter("nama_din");
NAMA_KEP_DIN=request.getParameter("nama_kep_din");
NIP_KEP_DIN=request.getParameter("nip_din");
NAMA_PET_ENTRI=request.getParameter("ned");
NIP_PET_ENTRI=request.getParameter("niped");
TGL_ENTRI=request.getParameter("dd");
NO_PROP=NP;
NO_KAB=NB;
if (request.getParameter("stat_hbkel")!=null) STAT_HBKEL=request.getParameter("stat_hbkel");

    rec_wna=new GdataWna(NIK,NAMA_KLRGA,NAMA_PERTMA,JENIS_KLMIN, TMPT_LHR,TGL_LHR,KWRNGRN,AGAMA,GOL_DRH,STAT_KWN,PDDK_AKH,JENIS_PKRJN, ALAMAT_SPSOR, NO_RT, NO_RW,KODEPOS, TELEPON, DATNG_DARI, TUJUAN_DTNG,NO_PASPOR,TGL_PASPOR,TGL_AKH_PASPOR,NAMA_SPSOR,TIPE_SPSOR,DOK_IMGR,NO_DOK,TMPT_DTBIT,TGL_DTBIT,TGL_AKH_DOK,TMPT_DTNG_PERT,TGL_DTNG_PERT,NO_STLD,TGL_DFT, NAMA_DIN,NAMA_KEP_DIN, NIP_KEP_DIN,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI,NO_KK,NO_PROP,NO_KAB,STAT_HBKEL,NC,NL);
    factory=ServiceController.getInstance();
    home = (MeadHome) factory.lookup("Mead",MeadHome.class);
    remote = home.create();
    result = remote.setPeruwna(rec_wna);

  if(result){
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<table width="100%" border="0" cellspacing="3" cellpadding="3">
  <tr> </tr>
  <tr>
    <td>
      <table border="0" cellspacing="3" cellpadding="2" align="center">
        <tr>
          <td colspan="3" height="1">
            <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
          </td>
        </tr>
        <tr>
          <td colspan="3" height="25">
            <div align="center"><span class="subtitle">Daftar Keluarga WNA</span></div>
          </td>
        </tr>
        <tr>
          <td colspan="3" height="1">
            <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
          </td>
        </tr>
        <tr>
          <td colspan="3" height="10">
            <table border="0" cellspacing="3" cellpadding="0" align="center" width="100%">
              <tr>
                <td width="193" valign="top">
                  <div align="right"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif">Nomor
                    KK</font></b></font></div>
                </td>
                <td width="14" valign="top">
                  <div align="center"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif">:</font></b></font></div>
                </td>
                <td colspan="2" valign="top" width="242">
                  <div align="left"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif"><%=NO_KK%></font></b></font></div>
                </td>
              </tr>
                          </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> </tr>
  <tr>
    <td height="35" valign="bottom">
      <div align="center">
        <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
          <tr>
            <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
            <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="C-BG">
              <table border="0" cellspacing="1" cellpadding="3" align="center">
                <tr>
                  <td class="C-Fonts">
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">
                      No.</font></div>
                  </td>
                  <td class="C-Fonts">
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">NIK</font></div>
                  </td>
                  <td class="C-Fonts">
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Nama
                      Keluarga</font></div>
                  </td>
                  <td class="C-Fonts">
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Nama
                      Perthama</font></div>
                  </td>
                  <td class="C-Fonts"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">No.Paspor</font></td>
                </tr>
                <tr>
                  <td class="C-Field">
                    <div align="center">
                      <p><%=1%></p>
                    </div>
                  </td>
                  <td class="C-Field">
                    <div align="center">
                      <p><%="A"+NIK.trim()%></p>
                    </div>
                  </td>
                  <td class="C-Field">
                    <div align="center"><%=NAMA_KLRGA.toString().toUpperCase()%></div>
                  </td>
                  <td class="C-Field"><%=NAMA_PERTMA.toString().toUpperCase()%> </td>
                  <td class="C-Field"><%=NO_PASPOR.toString().toUpperCase()%></td>
                </tr>
              </table>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
            <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
            <td height="5" width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
          </tr>
        </table>

        <b> </b></div>
    </td>
  </tr>
<tr>
<td align="center">
<input class=boxstandard type="button" value=KELUAR name="btnkel"  onClick="document.location='WNA_Menu.jsp'">
</td>
</tr>
</table>
<%=printInfo("Data sudah disimpan !")%>
</body>
</html>
<%
}
else
{
response.sendRedirect("Perubahan_Wna.jsp?flag=3");

}
}
else
{
  response.sendRedirect("index.jsp");
}
   }
catch(Exception err)
{
System.out.println("Error in Update_peru_wna.jsp=" + e.toString());
err.printStackTrace();
}

%>