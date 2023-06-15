<%@ page import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*,pendaftaran.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>

<%
String no_kk_lama="",no_kk_tmpt="",tc="",als_numpang="";
Vector vt_npg=null;
ServiceController factory=null;
Numpang_Anggota_Wni nap=null;
AngotasMoveHome home=null;
AngotasMove remote=null;
String kk_baru=null;
boolean result=false;
UserInfo1 record = null;


String status="";
String nama_kep_lma="";
String alamat="",no_rt="",no_rw="",dusun="",kodepos="",telp="";
String ditemkel="",ditemkec="",ditemkab="",ditemprop="";
String no_prop_ditem="",no_kab_ditem="",no_kec_ditem="",no_kel_ditem="";
String no_kec="",no_kel="";
int agtcntr=0;
String source="";
String nama_kep_des="";


String nama_kepala_kk_lama="";
%>

<%
try
      {
   record=(UserInfo1)session.getAttribute("remoteRef");

no_prop=record.getNoProp();
no_kab=record.getNoKab();

nama_prop=record.getNamaProp();
nama_kab=record.getNamaKab();

if (request.getParameter("no_kec")!=null) no_kec=request.getParameter("no_kec");
if (request.getParameter("no_kel")!=null) no_kel=request.getParameter("no_kel");
nama_kec=request.getParameter("nama_kec");
nama_kel=(request.getParameter("nama_kel")==null?"":request.getParameter("nama_kel"));

no_kk_lama=(request.getParameter("no_kk_lama")==null?"":request.getParameter("no_kk_lama"));
no_kk_tmpt=(request.getParameter("no_kk_tmpt")==null?"":request.getParameter("no_kk_tmpt"));
als_numpang=(request.getParameter("als_numpang")==null?"":request.getParameter("als_numpang"));
nama_kep_lma=(request.getParameter("nama_kep_lma")==null?"":request.getParameter("nama_kep_lma"));

if (request.getParameter("source")!=null) source=request.getParameter("source");


  if (source.equals("WNI"))
      {
       nama_kep_des=(request.getParameter("nama_kep_des")==null?"":request.getParameter("nama_kep_des"));
      }

if (request.getParameter("alamat")!=null) alamat=request.getParameter("alamat");
if (request.getParameter("no_rt")!=null)  no_rt=request.getParameter("no_rt");
if (request.getParameter("no_rw")!=null)  no_rw=request.getParameter("no_rw");
if (request.getParameter("dusun")!=null)  dusun=request.getParameter("dusun");
if (request.getParameter("kodepos")!=null)  kodepos=request.getParameter("kodepos");
if (request.getParameter("telp")!=null)  telp=request.getParameter("telp");

if (request.getParameter("ditemkel")!=null)  ditemkel=request.getParameter("ditemkel");
if (request.getParameter("ditemkec")!=null)  ditemkec=request.getParameter("ditemkec");
if (request.getParameter("ditemkab")!=null)  ditemkab=request.getParameter("ditemkab");
if (request.getParameter("ditemprop")!=null)  ditemprop=request.getParameter("ditemprop");

if (request.getParameter("no_prop_ditem")!=null)  no_prop_ditem=request.getParameter("no_prop_ditem");
if (request.getParameter("no_kab_ditem")!=null)  no_kab_ditem=request.getParameter("no_kab_ditem");
if (request.getParameter("no_kec_ditem")!=null)  no_kec_ditem=request.getParameter("no_kec_ditem");
if (request.getParameter("no_kel_ditem")!=null)  no_kel_ditem=request.getParameter("no_kel_ditem");
if (request.getParameter("nama_kepala_kk_lama")!=null) nama_kepala_kk_lama=request.getParameter("nama_kepala_kk_lama");

tc= (request.getParameter("TC")==null?"":request.getParameter("TC"));
status=(request.getParameter("status")==null?"":request.getParameter("status"));

StringTokenizer st = new StringTokenizer(tc,"@");

vt_npg=new Vector();


while (st.hasMoreTokens())
{
//System.out.println("check");

  nap=new Numpang_Anggota_Wni(st.nextToken(),st.nextToken(),st.nextToken(),no_kk_tmpt,nama_kep_lma,als_numpang,st.nextToken());
  vt_npg.add(nap);
//System.out.println(st.nextToken().toString() + "," + st.nextToken().toString() + "," + st.nextToken().toString() + "," + no_kk_tmpt + "," + nama_kep_lma + "," + als_numpang + "," + st.nextToken().toString());
//System.out.println("##");
  agtcntr++;
}

    factory=ServiceController.getInstance();
    home = (AngotasMoveHome) factory.lookup("AngotasMove",AngotasMoveHome.class);
    remote = home.create();
    result= remote.nump_insert(vt_npg,source,no_prop,no_kab,no_kec,no_kel,no_kk_lama);


if(result)
   {
 if (status.trim().equals("NL"))
  {
%>
<html>
<head>
<style type="text/css">
<!--
.flat {  background-color: #CCCCCC; border-style: solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px}
-->
</style>
</head>
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript" src="Templates/pindah.js">
</SCRIPT>
<SCRIPT language="JavaScript" src="Templates/wil.js">
</script>
<script language="javascript">
function closure(file)
{
if ((document.all['status'].value=="TJ"))
    {
      self.close();
     }
else
   {
           document.location=file;
   }
}
</script>
<body bgColor="#93BEE2" onload="window.history.forward(1)">
 <br><br><br><br>
<div align="center">

<input type="hidden" name="source" value="<%=source%>">
<input type="hidden" name="status" value="<%=status%>">
  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                          <tr>

                          </tr>

                          <tr>
                            <td valign="top">

              <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
			                      <tr>
                                  <td height="1" colspan=2>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="25" colspan=2>
                                    <div align="center"><span class="subtitle">Daftar
                                      Keluarga Pemohon</span></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="1" colspan=2>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                <tr valign="top">
                  <td width="174"> Nomor KK Lama</td>
                  <td width="534">:<%=no_kk_lama%> </td>
                </tr>
                <tr valign="top">
                  <td width="174"> Nama KK</td>
                  <td width="534">:<%=nama_kepala_kk_lama%></td>
                </tr>
                <tr valign="top">
                  <td width="174"> Nomor KK Ditempati<span class="asterish"></span></td>
                  <td width="534">:<%=no_kk_tmpt%></td>
                </tr>
                <tr valign="top">
                  <td width="174">Nama KK</td>
                  <td width="534">:<%=nama_kep_lma%></td>
                </tr>
              </table>
            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                <tr>
                                  <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                </tr>
                                <tr valign="top">
                                  <td>
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
                            <td class="C-Fonts" rowspan="2" width="4%">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="20%">
                              <div align="center">NIK</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="31%">
                              <div align="center">Nama Lengkap</div>
                            </td>

                          </tr>
                          <tr> </tr>
    <%
int cntr=0;
for (int i=0;i<vt_npg.size();i++)
   {
														 %>
                          <tr>
                            <td class="C-Field" width="4%">
                              <div align="center"><%=++cntr%></div>
                            </td>
                            <td class="C-Field" width="20%">
                              <div align="center"> <%=((Numpang_Anggota_Wni)vt_npg.elementAt(i)).getNik()%></div>
                            </td>
                            <td class="C-Field" width="31%">
                              <div align="center"><%=((Numpang_Anggota_Wni)vt_npg.elementAt(i)).getNamaLgkp()%></div>
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
                                        <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                        <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                        <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>

          <td valign="top">&nbsp; </td>
                          </tr>
                          <tr>
                            <td valign="top" height="25">&nbsp;</td>
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
				  <br>
  <center><font color="#003399">
    <input type="button" name="kel" value="KELUAR" class="boxstandard"  onClick="return closure('<%=record.getModRefFile()%>')">
    </font></center>
<br>
     <%=printInfo("Data sudah disimpan")%>
</div>

</body>
</html>
<%
}
else if (status.trim().equals("AL"))
{
%>
<html>
<head>
<style type="text/css">
<!--
.flat {  background-color: #CCCCCC; border-style: solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px}
-->
</style>
</head>
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/pindah.js">
</SCRIPT>
<SCRIPT language="JavaScript" src="Templates/wil.js">
</script>

<script language="javascript">
function closure(file)
{
if ((document.all['status'].value=="TJ"))
    {
      self.close();
     }
else
   {
           document.location=file;
   }
}
</script>


<body bgColor="#93BEE2">
<form method="post" action="Dis_Per_Wna.jsp" name="frmnum">
 <br><br><br><br>
<input type="hidden" name="source" value="<%=source%>">
<input type="hidden" name="status" value="<%=status%>">
<input type="hidden" name="no_kk" value="<%=no_kk_lama%>">
<input type="hidden"  name="no_prop" value="<%=no_prop%>">
<input type="hidden"  name="no_kab" value="<%=no_kab%>">

<input type="hidden"  name="no_kec" value="<%=no_kec%>">
<input type="hidden"  name="nama_kec" value="<%=nama_kec%>">

<input type="hidden"  name="no_kel" value="<%=no_kel%>">
<input type="hidden"  name="nama_kel" value="<%=nama_kel%>">

<input type="hidden"  name="nama_propinsi" value="<%=nama_prop%>">
<input type="hidden"  name="nama_kabupaten" value="<%=nama_kab%>">

<div align="center">
 <table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                          <tr>

                          </tr>

                          <tr>
                            <td valign="top">

              <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
			                      <tr>
                                  <td height="1" colspan=2>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="25" colspan=2>
                                    <div align="center"><span class="subtitle">Daftar
                                      Keluarga Pemohon</span></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="1" colspan=2>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                <tr valign="top">
                  <td width="174"> Nomor KK Lama</td>
                  <td width="534">:<%=no_kk_lama%> </td>
                </tr>
                <tr valign="top">
                  <td width="174"> Nama KK</td>
                  <td width="534">:<%=nama_kepala_kk_lama%></td>
                </tr>
                <tr valign="top">
                  <td width="174"> Nomor KK Ditempati<span class="asterish"></span></td>
                  <td width="534">:<%=no_kk_tmpt%></td>
                </tr>
                <tr valign="top">
                  <td width="174">Nama KK</td>
                  <td width="534">:<%=nama_kep_lma%></td>
                </tr>
              </table>
            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                <tr>
                                  <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                </tr>
                                <tr valign="top">
                                  <td>
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
                            <td class="C-Fonts" rowspan="2" width="4%">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="20%">
                              <div align="center">NIK</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="31%">
                              <div align="center">Nama Lengkap</div>
                            </td>

                          </tr>
                          <tr> </tr>
    <%
int cntr=0;
for (int i=0;i<vt_npg.size();i++)
   {
														 %>
                          <tr>
                            <td class="C-Field" width="4%">
                              <div align="center"><%=++cntr%></div>
                            </td>
                            <td class="C-Field" width="20%">
                              <div align="center"> <%=((Numpang_Anggota_Wni)vt_npg.elementAt(i)).getNik()%></div>
                            </td>
                            <td class="C-Field" width="31%">
                              <div align="center"><%=((Numpang_Anggota_Wni)vt_npg.elementAt(i)).getNamaLgkp()%></div>
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
                                        <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                        <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                        <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>

          <td valign="top">&nbsp; </td>
                          </tr>
                          <tr>
                            <td valign="top" height="25">&nbsp;</td>
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
				  <br>
  <center><font color="#003399">
    <input type="button" name="kel" value="KELUAR" class="boxstandard"  onClick="frmnum.submit()">
    </font></center>
<br>
     <%=printInfo("Data sudah disimpan")%>

</div>
</form>
</body>
</html>
<%
}
else if (status.trim().equals("TJ"))
{
%>

<html>
<head>
<style type="text/css">
<!--
.flat {  background-color: #CCCCCC; border-style: solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px}
-->
</style>
</head>
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/pindah.js">
</SCRIPT>
<SCRIPT language="JavaScript" src="Templates/wil.js">
</script>

<script language="javascript">
function closure(file)
{
if ((document.all['status'].value=="TJ"))
    {
      self.close();
     }
else
   {
           document.location=file;
   }
}
</script>
<body bgColor="#93BEE2">
 <br><br><br><br>
<div align="center">
<input type="hidden" name="source" value="<%=source%>">
<input type="hidden" name="status" value="<%=status%>">
<input type="hidden" name="no_kk" value="<%=no_kk_lama%>">
<input type="hidden"  name="no_prop" value="<%=no_prop%>">
<input type="hidden"  name="no_kab" value="<%=no_kab%>">
<input type="hidden"  name="no_kel" value="<%=no_kel%>">
<input type="hidden"  name="nama_kel" value="<%=nama_kel%>">
<input type="hidden"  name="nama_propinsi" value="<%=nama_prop%>">
<input type="hidden"  name="nama_kabupaten" value="<%=nama_kab%>">



 <table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                          <tr>

                          </tr>

                          <tr>
                            <td valign="top">

              <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
			                      <tr>
                                  <td height="1" colspan=2>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="25" colspan=2>
                                    <div align="center"><span class="subtitle">Daftar
                                      Keluarga Pemohon</span></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="1" colspan=2>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                <tr valign="top">
                  <td width="174"> Nomor KK Lama</td>
                  <td width="534">:<%=no_kk_lama%> </td>
                </tr>
                <tr valign="top">
                  <td width="174"> Nama KK</td>
                  <td width="534">:<%=nama_kepala_kk_lama%></td>
                </tr>
                <tr valign="top">
                  <td width="174"> Nomor KK Ditempati<span class="asterish"></span></td>
                  <td width="534">:<%=no_kk_tmpt%></td>
                </tr>
                <tr valign="top">
                  <td width="174">Nama KK</td>
                  <td width="534">:<%=nama_kep_lma%></td>
                </tr>
              </table>
            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                <tr>
                                  <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                </tr>
                                <tr valign="top">
                                  <td>
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
                            <td class="C-Fonts" rowspan="2" width="4%">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="20%">
                              <div align="center">NIK</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="31%">
                              <div align="center">Nama Lengkap</div>
                            </td>

                          </tr>
                          <tr> </tr>
    <%
int cntr=0;
for (int i=0;i<vt_npg.size();i++)
   {
														 %>
                          <tr>
                            <td class="C-Field" width="4%">
                              <div align="center"><%=++cntr%></div>
                            </td>
                            <td class="C-Field" width="20%">
                              <div align="center"> <%=((Numpang_Anggota_Wni)vt_npg.elementAt(i)).getNik()%></div>
                            </td>
                            <td class="C-Field" width="31%">
                              <div align="center"><%=((Numpang_Anggota_Wni)vt_npg.elementAt(i)).getNamaLgkp()%></div>
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
                                        <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                        <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                        <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>

          <td valign="top">&nbsp; </td>
                          </tr>
                          <tr>
                            <td valign="top" height="25">&nbsp;</td>
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
				  <br>
  <center><font color="#003399">
    <input type="button" name="kel" value="KELUAR" class="boxstandard" onClick="valueTujuanSetter()">
    </font></center>
<br>
     <%=printInfo("Data sudah disimpan")%>
</div>
</body>
</html>

<script language="javascript">

function closure(file)
{
if ((document.all['status'].value=="TJ"))
    {
      self.close();
    }
else
   {
           document.location=file;
   }
}

function valueTujuanSetter()
{
opener.document.all['no_kk_tujuan'].value="<%=no_kk_tmpt%>"
opener.document.all['alamat_tjpndh'].value="<%=alamat%>"
opener.document.all['no_rt_tjpndh'].value="<%=no_rt%>"
opener.document.all['no_rw_tjpndh'].value="<%=no_rw%>"
opener.document.all['dusun_tjpndh'].value="<%=dusun%>"
opener.document.all['kodepos'].value="<%=kodepos%>"
opener.document.all['telp'].value="<%=telp%>"
opener.document.all['nama_kk_asal'].value="<%=nama_kep_lma%>"

/*opener.document.all['namaprop_tjpndh'].value="<%=ditemprop%>"
opener.document.all['nama_prop_tuj'].value="<%=ditemprop%>"
opener.document.all['namaprop_tjpndh'].disabled=true
*/
/*
opener.document.all['namakab_tjpndh'].value="<%=ditemkab%>"
opener.document.all['nama_kab_tuj'].value="<%=ditemkab%>"
opener.document.all['namakab_tjpndh'].disabled=true

opener.document.all['namakec_tjpndh'].value="<%=ditemkec%>"
opener.document.all['nama_kec_tuj'].value="<%=ditemkec%>"
opener.document.all['namakec_tjpndh'].disabled=true

opener.document.all['namakel_tjpndh'].value="<%=ditemkel%>"
opener.document.all['nama_kel_tuj'].value="<%=ditemkel%>"
opener.document.all['namakel_tjpndh'].disabled=true
*/

opener.document.all['no_prop_tuj'].value="<%=no_prop_ditem%>"
opener.document.all['no_kab_tuj'].value="<%=no_kab_ditem%>"
opener.document.all['no_kec_tuj'].value="<%=no_kec_ditem%>"
opener.document.all['no_kel_tuj'].value="<%=no_kel_ditem%>"

<%
String hubun="";
for(cntr=0;cntr<agtcntr;cntr++)
{
 if ((((Numpang_Anggota_Wni)vt_npg.elementAt(cntr)).getStatHubun()!=null) && !((Numpang_Anggota_Wni)vt_npg.elementAt(cntr)).getStatHubun().trim().equals("0")&& !((Numpang_Anggota_Wni)vt_npg.elementAt(cntr)).getStatHubun().trim().equals(""))
    {
       if (source.equals("WNA"))
            {
         hubun=getStatHubunganWna(((Numpang_Anggota_Wni)vt_npg.elementAt(cntr)).getStatHubun().trim());
             }
       else if (source.equals("WNI"))
           {
                 System.out.println("NUMpang before error");
        hubun=getStatHubungan(((Numpang_Anggota_Wni)vt_npg.elementAt(cntr)).getStatHubun().trim());
                 System.out.println("NUMpang after error");
           }
           out.println("opener.document.all['shdk" + cntr + "'].value='" + hubun + "'");
    }
}
%>

self.close();
}
</script>

<%
}
   }
else
{
   response.sendRedirect("NumpangKK_Wna.jsp?error=8&source="+source+"&status="+status);
}
} catch(Exception e)
{
    response.sendRedirect("index.jsp");
    e.printStackTrace();
    System.out.println("Error in Angotas_Moving.jsp :"+ e.toString());
}
%>
