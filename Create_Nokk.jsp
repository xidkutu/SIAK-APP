<%@ page import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.ServiceController"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>

<%
String t1,t2,t3,agama;
String tp1,tp2,tp3,tb1,tb2,tb3;
String tt1,tt2,tt3,tl1,tl2,tl3;
String ttt1,ttt2,ttt3;
String t4,t5,t6;
String wilayah_concat,ALAMAT,NP,NB,NRT,NRW,DUS,KOD,TLP,NC,NL;
String _rtData="";

   String NIK="",NAMA_KLRGA="",NAMA_PERTMA="",JENIS_KLMIN="",TMPT_LHR="",TGL_LHR="",KWRNGRN="";
   String AGAMA="",GOL_DRH="",STAT_KWN="",PDDK_AKH="",JENIS_PKRJN="",ALAMAT_SPSOR="",NO_RT="",NO_RW="";
   String KODEPOS="",TELEPON="",DATNG_DARI="",TUJUAN_DTNG="",NO_PASPOR="",TGL_PASPOR="",TGL_AKH_PASPOR="";
   String NAMA_SPSOR="",TIPE_SPSOR="",DOK_IMGR="",NO_DOK="",TMPT_DTBIT="",TGL_DTBIT="",TGL_AKH_DOK="";
   String TMPT_DTNG_PERT="",TGL_DTNG_PERT="",NO_STLD="",TGL_DFT="",NAMA_DIN="",NAMA_KEP_DIN="";
   String NIP_KEP_DIN="",NAMA_PET_ENTRI="",NIP_PET_ENTRI="",TGL_ENTRI="",NO_KK="",NO_PROP="",NO_KAB="",STAT_HBKEL="";
   String nama_kep="",dalamat="",dno_rt="",dno_rw="",ddusun="",dkode_pos="",dtelp="",no_kec="",no_kel="";

MeadHome home;
Mead remote;
GdataKelu rec_kelu;
GdataWna  rec_wna;

ServiceController factory;

try
   {
  if (session.getAttribute("remoteRef")!=null)
{

NAMA_PERTMA=request.getParameter("nama_pertma");
ALAMAT=request.getParameter("alamat");
NRT=request.getParameter("no_rt");
NRW=request.getParameter("no_rw");
DUS=request.getParameter("dusun");
KOD=request.getParameter("kodepos");
TLP=request.getParameter("telp");

NP=request.getParameter("np");   //No Prop
NB=request.getParameter("nb");  //No Kab
NC=request.getParameter("nc");  //No Kec
NL=request.getParameter("nl");  //No Kel

wilayah_concat=NP.trim() +NB.trim()+NC.trim();

NAMA_KLRGA=request.getParameter("nama_klrga");

JENIS_KLMIN=request.getParameter("jenis_klmin");


TMPT_LHR=request.getParameter("tmpt_lhr");

t1= request.getParameter("t1");    //tgl_lahir
t2= request.getParameter("t2");
t3= request.getParameter("t3");

TGL_LHR=getFullDate(t1,t2,t3);

KWRNGRN=request.getParameter("kwrngrn");
AGAMA=request.getParameter("agama");

if(AGAMA.equals("Lainnya/Others".trim()))
{
AGAMA=request.getParameter("agama_lainnya");
}

GOL_DRH=request.getParameter("gol_drh");
STAT_KWN=request.getParameter("stat_kwn");
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

tp1= request.getParameter("tp1");    //tgl pasport
tp2= request.getParameter("tp2");
tp3= request.getParameter("tp3");

//tp2=conDate(bbb);

TGL_PASPOR=getFullDate(tp1,tp2,tp3);

tb1= request.getParameter("tb1");   //tgl Berakhir Paspor
tb2= request.getParameter("tb2");
tb3= request.getParameter("tb3");

TGL_AKH_PASPOR=getFullDate(tb1,tb2,tb3);      //tgl Berakhir Paspor  concatination

NAMA_SPSOR=request.getParameter("nama_spsor");
TIPE_SPSOR=request.getParameter("tipe_spsor");
DOK_IMGR=request.getParameter("dok_imgr");
NO_DOK=request.getParameter("num_dok");
TMPT_DTBIT=request.getParameter("tmpt_dtbit");

tt1= request.getParameter("tt1");    //Tanggal Penerbitan
tt2= request.getParameter("tt2");
tt3= request.getParameter("tt3");

TGL_DTBIT=getFullDate(tt1,tt2,tt3); //Tanggal Penerbitan concatination

tl1= request.getParameter("tl1");     //Tanggal Berakhir Dokumen
tl2= request.getParameter("tl2");
tl3= request.getParameter("tl3");

TGL_AKH_DOK=getFullDate(tl1,tl2,tl3);  //Tanggal Berakhir Dokumen  concatination
TMPT_DTNG_PERT=request.getParameter("tmpt_dtng_pert");

ttt1= request.getParameter("ttt1");   //Tanggal Kedatangan Pertama
ttt2= request.getParameter("ttt2");
ttt3= request.getParameter("ttt3");

TGL_DTNG_PERT=getFullDate(ttt1,ttt2,ttt3);

NO_STLD=request.getParameter("num_stld");

t4= request.getParameter("t4");   //Tanggal Pendaftaran
t5= request.getParameter("t5");
t6= request.getParameter("t6");

TGL_DFT=getFullDate(t4,t5,t6);      //Tanggal Pendaftaran concatination

NAMA_DIN=request.getParameter("nama_din");
NAMA_KEP_DIN=request.getParameter("nama_kep_din");
NIP_KEP_DIN=request.getParameter("nip_din");
NAMA_PET_ENTRI=request.getParameter("ned");

if( request.getParameter("niped")!=null && !request.getParameter("niped").trim().equals("") )
{
NIP_PET_ENTRI=request.getParameter("niped");
}

TGL_ENTRI=request.getParameter("dd");
STAT_HBKEL=request.getParameter("stat_hbkel");


rec_kelu=new GdataKelu(NO_KK.trim() ,NAMA_PERTMA.trim(),ALAMAT.trim(),NRT,NRW,DUS,KOD,TLP,NP.trim(),NB.trim(),NC.trim(),NL.trim());
rec_wna=new GdataWna(NIK.trim(),NAMA_KLRGA.trim(),NAMA_PERTMA.trim(),JENIS_KLMIN.trim(), TMPT_LHR.trim(),TGL_LHR.trim(),KWRNGRN.trim(),AGAMA.trim(),GOL_DRH.trim(),STAT_KWN.trim(),PDDK_AKH.trim(),JENIS_PKRJN.trim(), ALAMAT_SPSOR.trim(), NO_RT.trim(), NO_RW.trim(),KODEPOS.trim(), TELEPON.trim(), DATNG_DARI.trim(), TUJUAN_DTNG.trim(),NO_PASPOR.trim(),TGL_PASPOR.trim(),TGL_AKH_PASPOR.trim(),NAMA_SPSOR.trim(),TIPE_SPSOR.trim(),DOK_IMGR.trim(),NO_DOK.trim(),TMPT_DTBIT.trim(),TGL_DTBIT.trim(),TGL_AKH_DOK.trim(),TMPT_DTNG_PERT.trim(),TGL_DTNG_PERT.trim(),NO_STLD.trim(),TGL_DFT.trim(), NAMA_DIN.trim(),NAMA_KEP_DIN.trim(), NIP_KEP_DIN.trim(),NAMA_PET_ENTRI.trim(),NIP_PET_ENTRI.trim(),TGL_ENTRI.trim(),NO_KK.trim(),NP.trim(),NB.trim(),STAT_HBKEL.trim(),NC.trim(),NL.trim());

 factory=ServiceController.getInstance();

 home = (MeadHome) factory.lookup("Mead",MeadHome.class);
 remote = home.create();

 _rtData = remote.setDataKelWna(rec_wna,rec_kelu,wilayah_concat.trim(),TGL_LHR.trim(),JENIS_KLMIN.trim());

 System.out.println("nokk+nik is "+_rtData);

 if(_rtData!=null){

  NO_KK=_rtData.substring(0,16);
  NIK=_rtData.substring(16,32);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript>
function ex()
{
var v=window.history.length;
history.go(-v);
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<FORM action="BioAngo.jsp" method=post>
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
                      <p><%=NIK%></p>
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
<div align="center">
<b>
<h4><font color=red><%=printInfo("Data Sudah disimpan !")%>
</font></h4>
          </b></div>
<input type = hidden name=no_kk value=<%=NO_KK%>>
<input type = hidden name=no_prop value="<%=NP%>">
<input type = hidden name=no_kab value="<%=NB%>">
<input type = hidden name=no_kec value="<%=NC%>">
<input type = hidden name=no_kel value="<%=NL%>">
<input type = hidden name=ala value="<%=ALAMAT%>">
<input type = hidden name=namkep value="<%=NAMA_PERTMA%>">
<input type = hidden name=RT value="<%=NRT%>">
<input type = hidden name=RW value="<%=NRW%>">
<input type = hidden name=DU value="<%=DUS%>">
<input type = hidden name=KD value="<%=KOD%>">
<input type = hidden name=TL value="<%=TLP%>">
<b> </b></div></td></tr>
</table>
<table width="350" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
<tr>
<td align="center">
<input class=boxstandard  type=submit value=ENTRI name="ENT"></td>
<td height="55" align="center">
<input class=boxstandard type=button value=KELUAR  onclick="document.location='WNA_Menu.jsp'">
</td>
</tr>
</table>
</form></body></html>
<%
}
}
else
{
response.sendRedirect("index.jsp");
}
  }catch(Exception e){
System.out.println("Error in Create_Nokk.jsp=" + e.toString());
 }

%>