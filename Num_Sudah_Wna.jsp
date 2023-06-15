<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%!
String no_kk,no_kk_num;
String ango,m1,m2,m3,to_agt,no_prop,no_kab,no_kec,t,no_kel;
String NO_KK,NAMA_KEPALA_LMA,RENC_TGL,ALMT_LMA,ALMT_RT_LMA,ALMT_RW_LMA,dusun_lam,ALMT_KODEPOS_LMA,ALMT_TELP_LMA;
String NAMA_CMAT_LMA,NAMA_PET_LMA,NIP_PET_LMA,TGL_ENTRI_LMA;
String NAMA_CMAT_BRU,NAMA_PET_BRU,NIP_PET_BRU,TGL_ENTRI_BRU,TGL_DTNG,NAMA_LUR_LMA,NAMA_LUR_BRU;
int a,r;
pinda_num_suda nap;
Pindah_Nup_Anggo agt_detail;
PindahAsalHome home;
PindahAsal remote;
ServiceController factory;
Vector vt_npg,agt_vector;
String b=null;
    UserInfo1 record2=null;
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
if(request.getParameter("nump")!=null)
{
no_kk=request.getParameter("nokk");
no_kk_num=request.getParameter("num_nokk");
System.out.println("in numsudapinda jsp page :"+no_kk+"  "+no_kk_num);
%>
<jsp:forward page="Wna_Tuhuan_Nump.jsp">
<jsp:param name="nokk" value="<%=no_kk%>"/>
<jsp:param name="num_nokk" value="<%=no_kk_num%>"/>
</jsp:forward>
<%
}
%>

<%
NO_KK=request.getParameter("nokk");

no_kk_num=request.getParameter("num_nokk");

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
ango=request.getParameter("ng");

to_agt=request.getParameter("sa");
no_prop=request.getParameter("no_prop");
if(no_prop.length()==1)
{
no_prop="0"+no_prop;
}
no_kab=request.getParameter("no_kab");
if(no_kab.length()==1)
{
no_kab="0"+no_kab;
}
no_kec=request.getParameter("no_kec");
if(no_kec.length()==1)
{
no_kec="0"+no_kec;
}

no_kel=request.getParameter("no_kel");
if(no_kel==null)
{
no_kel="0";
}
if(no_kel.length()==1)
{
no_kel="0"+no_kel;
}
t=no_prop+no_kab+no_kec+no_kel;
StringTokenizer st = new StringTokenizer(ango,"#");
vt_npg=new Vector();
 while (st.hasMoreTokens())
{
   agt_detail=new Pindah_Nup_Anggo(st.nextToken(),st.nextToken(),st.nextToken());
   vt_npg.add(agt_detail);
}
nap=new pinda_num_suda(NO_KK,NAMA_KEPALA_LMA,RENC_TGL,ALMT_LMA,ALMT_RT_LMA,ALMT_RW_LMA,dusun_lam,ALMT_KODEPOS_LMA, ALMT_TELP_LMA,NAMA_CMAT_LMA,NAMA_LUR_LMA,NAMA_PET_LMA,NIP_PET_LMA,TGL_ENTRI_LMA,no_kk_num,NAMA_CMAT_BRU,NAMA_LUR_BRU,NAMA_PET_BRU, NIP_PET_BRU,TGL_ENTRI_BRU, TGL_DTNG);
nap.setAllAnggota(vt_npg);
factory=ServiceController.getInstance();

    home = (PindahAsalHome) factory.lookup("PindahAsal",PindahAsalHome.class);
    remote = home.create();
    if(home!=null)
    {
        b=remote.setSudah_Pindah(nap,to_agt,t,no_kk_num);
        if(b!=null)
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
                        <div align="center"><span class="subtitle">Keterangan Kedatangan WNA
</span><br>
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
                                 Daerah Tujuan</span></div>
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
<b><font color="red"><%=b.substring(0,16)%> </font></b>
<img src="images/dot.gif" width="10" height="1"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">Nama Kepala Keluarga</td>
                            <td valign="top" width="1%">:</td>
<td colspan="5" valign="top">
<font color="#003366"><b><font color="#003366">
<b><%=b.substring(16,b.length()).toString().toUpperCase()%></b></font>
</b></font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">Alamat Tujuan Pindah<span class="asterish"></span></td>
                            <td valign="top" width="1%">:</td>
<td colspan="5" valign="top">
 <%=ALMT_LMA.toString().toUpperCase()%>;
 RT <%=ALMT_RT_LMA%>;
 RW <%=ALMT_RW_LMA%>;
</td>
                          </tr>
                          <tr>
                            <td valign="top" width="24%">
                              <div align="right">Dusun/Kampung/Dukuh</div>
                            </td>
                            <td valign="top" width="1%">:</td>
<td valign="top" colspan="5">
<%=dusun_lam.toString().toUpperCase()%></td>
                          </tr>

<tr>
                            <td valign="top" width="21%">
                              <div align="right">Kode Pos</div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" width="17%">
<%=ALMT_KODEPOS_LMA%>
                            </td>
                            <td valign="top" width="3%">&nbsp;</td>
                            <td valign="top" width="13%">
                              <div align="right">Telepon</div>
                            </td>
                            <td valign="top" width="2%">:</td>
                            <td valign="top" width="43%">
<%=ALMT_TELP_LMA%>
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
<%
   }
  }
%>
</form>
</body>
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