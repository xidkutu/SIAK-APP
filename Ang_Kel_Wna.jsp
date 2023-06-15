<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%
UserInfo1 record=null;
String no_kk="",als_pndh="",namakep="",niplrh="",namacmat="",nipcmat="",namapetentri="",nippetentri="",tglentri="";
Vector v=null,vt=null;
String alamat_tjpndh="",no_rt_tjpndh="",no_rw_tjpndh="",kodepos_tjpndh="",telp_tjpndh="";
String no_prop="",no_kab="",no_kec="",no_kel="";
String jenis_kpndhn="",renc_tgl_pindah="",t1="",t2="",t3="",klasf_pndh="",dusun="",lis_pindah="",nik="",nama_kk="";
Pindah_Wni pindah=null;
GetKelrgaPindah kelpindah=null;
PindahAsalHome home=null;
PindahAsal remote=null;
ServiceController factory=null;
String num_prop="",num_kab="",num_kec="",num_kel="";
String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
String prop_name="",kab_name="",kec_name="",kel_name="";
String nama_bup="";
boolean result=false;
String status="NL";
String source="";
%>

<%
   record = (UserInfo1)session.getAttribute("remoteRef");
try{
   if(record != null)
   {

  if (request.getParameter("source")!=null) source=request.getParameter("source");

   num_prop=(request.getParameter("no_prop")==null?"0":request.getParameter("no_prop"));
  num_kab=(request.getParameter("no_kab")==null?"0":request.getParameter("no_kab"));

 prop_name=(request.getParameter("nama_prop")==null?"-":request.getParameter("nama_prop"));
kab_name=(request.getParameter("nama_kab")==null?"-":request.getParameter("nama_kab"));

 if  (request.getParameter("status")!=null) status=request.getParameter("status").trim().toUpperCase();

     no_kk=(request.getParameter("no_kk")==null?"":request.getParameter("no_kk"));


if (request.getParameter("modtype")!=null)
 {
    if (request.getParameter("modtype").trim().equals("NP"))
      {
%>

<jsp:forward page="NumpangKK_Wna.jsp">
<jsp:param name="no_kk" value="<%=no_kk%>"/>
<jsp:param name="status" value="<%=status%>"/>
<jsp:param name="source" value="<%=source%>"/>
</jsp:forward>

<%
  }
else if (request.getParameter("modtype").trim().equals("KB"))
{
%>
<jsp:forward page="Pen_KKWna_SudapunyaNik.jsp">
<jsp:param name="no_kk" value="<%=no_kk%>"/>
<jsp:param name="nama_prop" value="<%=prop_name%>"/>
<jsp:param name="nama_kab" value="<%=kab_name.trim()%>"/>
<jsp:param name="no_prop" value="<%=num_prop%>"/>
<jsp:param name="no_kab" value="<%=num_kab%>"/>
<jsp:param name="status" value="<%=status%>"/>
<jsp:param name="source" value="<%=source%>"/>
</jsp:forward>
<%
}
else if (request.getParameter("modtype").trim().equals("SIM"))
{

if (session.getAttribute("no_kel")!=null) session.removeAttribute("no_kel");
if (session.getAttribute("nama_kel")!=null) session.removeAttribute("nama_kel");

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
renc_tgl_pindah=getFullDate(t1,t2,t3);


klasf_pndh=request.getParameter("klasf_pndh");


 if (source.equals("WNI"))
  {
namakep=nullFinder(request.getParameter("nama_kep_des"));

niplrh=nullFinder(request.getParameter("nip_lrh"));

namacmat=nullFinder(request.getParameter("nama_cmat"));

nipcmat=nullFinder(request.getParameter("nip_cmat"));
 }
else if (source.equals("WNA"))
{
nama_bup=request.getParameter("nama_bup");
}

num_kec=request.getParameter("no_kec");
num_kel=request.getParameter("no_kel");

namapetentri=nullFinder(request.getParameter("namapetentri"));

nippetentri=nullFinder(request.getParameter("nippetentri"));


tglentri=nullFinder(request.getParameter("tglentri"));



dusun=nullFinder(request.getParameter("dusun_tjpndh"));



lis_pindah=nullFinder(request.getParameter("pinlist"));



nik=nullFinder(request.getParameter("nik"));




nama_kk=request.getParameter("namakk");



nama_prop=request.getParameter("np");



nama_kab=request.getParameter("nb");


nama_kec=request.getParameter("nc");


nama_kel=request.getParameter("nl");

v=new Vector();

StringTokenizer st = new StringTokenizer(lis_pindah,"#");

 while (st.hasMoreTokens())
{
      kelpindah=new GetKelrgaPindah(st.nextToken(),st.nextToken(),st.nextToken(),st.nextToken() ,st.nextToken(),st.nextToken());
      v.add(kelpindah);
}

pindah=new Pindah_Wni(
no_kk, als_pndh, alamat_tjpndh,
no_rt_tjpndh,
no_rw_tjpndh,
kodepos_tjpndh,
telp_tjpndh,
no_prop,
no_kab,
no_kec,
no_kel,
jenis_kpndhn,
renc_tgl_pindah,
klasf_pndh,
namakep ,
niplrh ,
namacmat,
nipcmat,
nama_bup,
namapetentri,
nippetentri,
tglentri,
dusun,
nik,
nama_kk,
nama_prop,
nama_kab,
nama_kec,
nama_kel,
num_prop,
num_kab,
num_kec,
num_kel,
"",
"",
"",
"",
"",
"");

pindah.setAngotta(v);

 factory=ServiceController.getInstance();
    home = (PindahAsalHome) factory.lookup("PindahAsal",PindahAsalHome.class);
    remote = home.create();
    result = remote.setPinda_wna(pindah);

  if(result)
     {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<script language="javascript">
function closure(file)
{
if ((document.all['status'].value="TJ"))
    {
      self.close();
     }
else
   {
           document.location=file;
   }
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0  topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">
   <input type="hidden" name="status" value="<%=status%>">
   <input type="hidden" name="source" value="<%=source%>">
   <jsp:include page="top.html"/>
</td>
  </tr>
  <tr>
    <td height="390">
   <table width="100%" border="0" cellspacing="5" cellpadding="5" height="54%">
        <tr>
          <td height="407">
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="45">
<div align="center"><span class="subtitle">
Keterangan Perpindahan &nbsp;<%=source%> <% if (source.equals("WNA")) {%>&nbsp;KITAP<%}%></span><br>
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
GetKelrgaPindah  new_record;
String prefix="";
if (source.equals("WNA")) prefix="A";
vt=pindah.getAngotta();
int z=vt.size();

for(int x=0;x<z; x++)
{
new_record=(GetKelrgaPindah)vt.elementAt(x);
   if ((Integer.parseInt(pindah.getJeskpndhn().trim())==4) && (new_record.getStatHbkel().trim().equalsIgnoreCase("Kepala Keluarga")))   continue;
%>
                                        <tr>
                                          <td class="C-Field" width="4%">
                                            <div align="center"><%=y%> </div>
                                          </td>
                                          <td class="C-Field" width="20%">
<div align="center">
<%=prefix+new_record.getNik()%>
                                            </div>
                                          </td>
                                          <td class="C-Field" width="31%">
<div align="center">
<%=new_record.getNamaKep().toString().toUpperCase()%>
                                            </div>
                                          </td>
                                          <td class="C-Field" width="19%">
<div align="center">
<%=new_record.getStatHbkel().toString().toUpperCase()%></div>
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
<%=printInfo("Data Sudah disimpan!")%>
            <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b> </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
        <div align="center"><b>
<input class=boxstandard type=button  value=KELUAR name="submit2322" onClick="document.location='<%=record.getModRefFile()%>'">
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
   response.sendRedirect("Perpindahan_Wna.jsp?error=8&no_kk=" + no_kk +"&source=" + source);
  }
 }
}
 }
else
{
  response.sendRedirect(record.getModRefFile());
}
}catch(Exception err)
{
System.out.println(err.toString());
}
%>
