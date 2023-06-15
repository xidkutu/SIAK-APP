<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>

<%!
String no_kk_num,ango,m1,m2,m3,nprop,nkab,nkec,nkel;
String NO_KK,NAMA_KEPALA_LMA,RENC_TGL,ALMT_LMA,ALMT_RT_LMA,ALMT_RW_LMA,dusun_lam,ALMT_KODEPOS_LMA,ALMT_TELP_LMA;
String NAMA_CMAT_LMA,NAMA_PET_LMA,NIP_PET_LMA,TGL_ENTRI_LMA;
String NAMA_CMAT_BRU,NAMA_PET_BRU,NIP_PET_BRU,TGL_ENTRI_BRU,TGL_DTNG,NAMA_LUR_LMA,NAMA_LUR_BRU;
int a,r;
    UserInfo1 record2=null;
pinda_num_suda nap;
Pindah_Nup_Anggo agt_detail;
PindahAsalHome home;
PindahAsal remote;
ServiceController factory;
Vector vt_npg,agt_vector;
boolean b=false;
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
public String Datefor(String s)
{
String y=null,m=null,d=null;
int b=0;
StringTokenizer stoken = new StringTokenizer(s,"-");
while (stoken.hasMoreTokens())
{
 y=stoken.nextToken();
 b=Integer.parseInt(stoken.nextToken());
 m=conDate(b);
 d=stoken.nextToken();
}
return (d+"-"+m+"-"+y);
}
%>
<%
   try
   {
    record2=(UserInfo1)session.getAttribute("remoteRef");

if(record2 != null)
{
NO_KK=request.getParameter("nokk");
NAMA_KEPALA_LMA=request.getParameter("namakk");
RENC_TGL=Datefor(request.getParameter("rectgllam"));
ALMT_LMA=request.getParameter("alamatlam");
ALMT_RT_LMA=request.getParameter("nortlam");
ALMT_RW_LMA=request.getParameter("norwlam");
dusun_lam=request.getParameter("dusunlam");
ALMT_KODEPOS_LMA=request.getParameter("kodlam");
ALMT_TELP_LMA=request.getParameter("tlplam");
NAMA_CMAT_LMA=request.getParameter("namacmatlam");
NAMA_LUR_LMA=request.getParameter("namalurlam");
NAMA_PET_LMA=request.getParameter("namapetlam");
NIP_PET_LMA=request.getParameter("nippetlam");
TGL_ENTRI_LMA=Datefor(request.getParameter("tglentrilam"));
no_kk_num=request.getParameter("nokk_num");
NAMA_CMAT_BRU=request.getParameter("cmatbru");
NAMA_LUR_BRU=request.getParameter("namalurbru");
NAMA_PET_BRU=request.getParameter("namapetbru");
NIP_PET_BRU=request.getParameter("nippetbru");
TGL_ENTRI_BRU=request.getParameter("tegentribru");
m1=request.getParameter("tgl_datngn");
a=Integer.parseInt(request.getParameter("bln_datngn"));
m2=conDate(a);
m3=request.getParameter("thn_datngn");
TGL_DTNG=m1+"-"+m2+"-"+m3;
ango=request.getParameter("numpang");
System.out.println(ango);
nprop=request.getParameter("no_prop");
nkab=request.getParameter("no_kab");
nkec=request.getParameter("no_kec");
nkel=request.getParameter("no_kel");
StringTokenizer st = new StringTokenizer(ango,",");

vt_npg=new Vector();
r=0;
 while (st.hasMoreTokens())
{
   agt_detail=new Pindah_Nup_Anggo(st.nextToken(),st.nextToken(),st.nextToken());
   vt_npg.add(agt_detail);
}
nap=new pinda_num_suda(NO_KK,NAMA_KEPALA_LMA,RENC_TGL,ALMT_LMA,ALMT_RT_LMA,ALMT_RW_LMA,dusun_lam,ALMT_KODEPOS_LMA, ALMT_TELP_LMA,NAMA_CMAT_LMA,NAMA_LUR_LMA,NAMA_PET_LMA,NIP_PET_LMA,TGL_ENTRI_LMA,no_kk_num,NAMA_CMAT_BRU,NAMA_LUR_BRU,NAMA_PET_BRU, NIP_PET_BRU,TGL_ENTRI_BRU, TGL_DTNG);
nap.setAllAnggota(vt_npg);

factory=ServiceController.getInstance();
try
  {
    home = (PindahAsalHome) factory.lookup("PindahAsal",PindahAsalHome.class);
    remote = home.create();
    if(home!=null)
    {
        b=remote.setNumpang_Wna(nap,nprop,nkab,nkec,nkel);
        if(b)
        {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form method="post" action="Keda_Tujuan_Wna.jsp" name="">
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
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="45">
                        <div align="center"><span class="subtitle">Keterangan Perpindahan WNA</span><br>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

        <table width="80%"  cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA"
height="48%" >
          <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>

            <td height="229">&nbsp;</td>

            <td height="229">
              <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center"
height="100%" class="border">
                <tr>
                      <td valign="top" height="69">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" valign="middle">
                              <div align="center"><span class="subtitle">Data
                                 Daerah Tujuan</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div align="center"><img src="images/batas_dot.gif" width="461"
height="1"></div>
                            </td>
                          </tr>
                        </table>
<table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="8" height="10"><img src="images/dot.gif" width="1"
height="10"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">Nomor Kartu Keluarga<span
class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
<td colspan="6" valign="top">
<b><font color="red"><%=nap.getNokkNum()%> </font></b>
<img src="images/dot.gif" width="10" height="1"></td>
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
                                <table width="700" border="0" cellspacing="0" cellpadding="0"
align="center" bgcolor="#93BEE2">
                                  <tr>
                                    <td width="5" height="5"><img src="images/v_sdt_kr_up3.gif"
width="5" height="5"></td>
                                    <td height="1"><img src="images/dot.gif" width="1"
height="1"></td>
                                    <td width="1" height="1"><img src="images/v_sdt_kn_up3.gif"
width="5" height="5"></td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td valign="middle" align="center">
                                      <table width="100%" border="0" cellspacing="1" cellpadding="3"
class="C-BG">
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

<%
int y=1;

Pindah_Nup_Anggo detail_record;
agt_vector=nap.getAllAnggota();

for(int x=0;x<agt_vector.size(); x++)
{
detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(x);
%>
                                        <tr>
                                          <td class="C-Field" width="4%">
                                            <div align="center"><%=y%> </div>
                                          </td>
                                          <td class="C-Field" width="20%">
<div align="center">
<%=detail_record.getNik()%>
                                            </div>
                                          </td>
                                          <td class="C-Field" width="31%">
<div align="center">
<%=detail_record.getNamaLgkp().toString().toUpperCase()%>
                                            </div>
                                          </td>

                                        </tr>
<%
y++;
}
%>
                                      </table>
                                    </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif"
width="5" height="5"></td>
                                    <td height="1"><img src="images/dot.gif" width="1" height="1"
hspace="1"></td>
                                    <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif"
width="5" height="5"></td>
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

                  <td height="40">
                    <div align="center"><h4><font color="red">Data Sudah
disimpan!</font></h4></div></td>
                    </tr>
                  </table>
                </td>

            <td height="229">&nbsp;</td>
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
<input type="hidden" value=<%=NO_KK%> name="kednumsuda">
<input class=boxstandard type=submit  value=Entri name="ent">
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
</form>
</body>

<%
   }
  }
}catch(Exception e){System.out.println("error in nump_pindah_add jsp page "+e.toString());}
%>
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
