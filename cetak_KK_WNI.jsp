<%@page import="com.db.connection.*,java.sql.*,com.db.connection.ServiceController,kartukeluarga.*,java.util.*,viewkk.*,pendaftaran.*,
manage.KendaliProses,manage.KendaliProsesObject,java.lang.String,java.lang.Integer"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*,com.penan.ViewTtd"%>
<%@ page import="com.wilayah.*"%>
<%!
UserInfo1 record = null;
String jab_lur="";
String status="";
KendaliProses KendaliOke  = null;
String deKdl="";
//File_TandaTangan deFile_TandaTangan =null;
ViewTtd obj_ttd=null;
String demana=null;

%>


<%

record=(UserInfo1)session.getAttribute("remoteRef");
if(record != null) {
    System.out.println("No Propinsi =" +record.getNoProp());
    System.out.println("No Kabupaten =" + record.getNoKab());
    System.out.println("No Kecamatan =" + record.getNoKec());
    System.out.println("No Kelurahan =" + request.getParameter("no_kel"));
    System.out.println("Tidak NULL");
    
    KendaliOke = new KendaliProses();
//deKdl = KendaliOke.CekKendali(record.getNoProp().trim(),record.getNoKab().trim());
%>
<%--
<%@include file="CommonOtorisasi.jsp"%>
<%
  String statusCetak = request.getParameter("radiobutton");
  String no_kel=request.getParameter("no_kel");
   System.out.println("statusCetak="+statusCetak);
   if ( (!authorized) && (statusCetak.equalsIgnoreCase("ULANG"))) {
         //otorisasi dialog?
         %>
         <script language="JavaScript">
            if (confirm("Anda belum diotorisasi untuk melakukan cetak ulang, Lakukan Otorisasi?")) {
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=cetak_KK_WNI.jsp";
              } else {
                self.close();
              }

         </script>
   <%
   } else {

   %>
--%>
<% String no_kel=request.getParameter("no_kel");
{
%>
<html>
    <head>
        <title>siakOnline</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="Templates/s.css" type="text/css">
    </head>
    
    <SCRIPT>
window.onbeforeprint =
function ()
{
 //document.all.printLink.style.display = 'none';
//   document.body.style='landscape';
};
    </SCRIPT>
    
    <script language="javascript">

  document.oncontextmenu=new Function("return false")

 function printKK(obj)
 {
     if (window.print)
     {
        if (confirm("Apakah benar Kartu Keluarga ini akan dicetak ?"))
            {
             obj.style.visibility='hidden';
             document.form1.close.style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
             window.print();
             window.opener.location="DaftarKK.jsp?no_kel=<%=no_kel%>&update=ok&radiobutton=Ulang&param_kk="+document.all["param_kk"].value;
             window.close();
        }
    }
}

function zoom(id)
{
    if(document.all[id].style.zoom=="50%")
    {
       document.all[id].style.zoom="100%";
    }
    else
    {
       document.all[id].style.zoom="50%";
    }
}

                                          </script>
    <body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onKeyDown="alert('Please use the print button')" onload="window.history.forward(1)">
        <form name="form1" method="post" action="">
            <%
            
            String nama_prop= request.getParameter("nama_prop");
            String nama_kec = request.getParameter("nama_kec");
            String nama_kab = request.getParameter("nama_kab");
            String nama_kel = request.getParameter("nama_kel");
            String no_prop= request.getParameter("no_prop");
            String no_kab= request.getParameter("no_kab");
            String no_kec= request.getParameter("no_kec");
            
            String radiobutton = request.getParameter("radiobutton");
            System.out.println("Testing 1: Value" + no_prop);
            System.out.println("RADIOBUTTON di cetak_KK_WNI = "+radiobutton);
            String jpkendali = request.getParameter("jpkendali");
            int nokendali=0;
            System.out.println("apakah pakai nomor kendali = "+jpkendali);
            if (jpkendali!=null) {
                if (jpkendali.trim().equals("YA")) {
                    nokendali=1;
                }
            }
            String jabatan = request.getParameter("jabatan");
            String nama_pej="";
            String nip_pej="";
            //--------------------------------------------------------------
            
            String kembali="";
            Connection conn=null;
            ConnectorDB connectorDb = new ConnectorDB();
            ResultSet rs = null;
            Statement stmt = null;
            try {
                conn = connectorDb.getConnection();
                stmt = conn.createStatement();
                
                String query = "select FILE_TTD from setup_kec where no_prop=" + record.getNoProp().trim() + "and no_kab=" +
                        record.getNoKab().trim() + "and no_kec=" + record.getNoKec().trim();
                
                rs = stmt.executeQuery(query.trim());
                while (rs.next()) {
                    kembali = rs.getString("FILE_TTD");
                }
                
                if(rs!=null) {rs.close();}
                
                if(stmt!=null) {stmt.close();}
                
            } catch(Exception e) {
                e.printStackTrace();
                //siakWriter.writeFile(e);
            }
            
            
            
            //-----------------------------------
            
            
            obj_ttd = new ViewTtd();
            //demana =  obj_ttd.getFileTandaTangan(record.getNoProp().trim(),record.getNoKab().trim(),record.getNoKec().trim(),request.getParameter("no_kel"));
            demana = kembali;
            System.out.println("Yang tandantangan :"+demana);
            if (jabatan!=null & !jabatan.trim().equals("") && !jabatan.trim().equals("null")) {
                nama_pej = request.getParameter("nama_pej");
                nip_pej = request.getParameter("nip_pej");
                status="camat";
            }
            String jab_lur = request.getParameter("jab_lur");
            String nama_lur="";
            String nip_lur="";
            
            if ((jab_lur!=null) && !jab_lur.trim().equals("") && !jab_lur.trim().equals("null")) {
                status="lurah";
                nama_lur = request.getParameter("nama_lur");
                nip_lur = request.getParameter("nip_lur");
            }
            
            String stat_print="", stat_change="";
            
            if(radiobutton!=null) {
                if(  radiobutton.trim().equalsIgnoreCase("Baru")) {
                    stat_print="N";
                    stat_change="N";
                } else if( radiobutton.trim().equalsIgnoreCase("Perubahan")) {
                    stat_print="Y";
                    stat_change="Y";
                } else if( radiobutton.trim().equalsIgnoreCase("Ulang")) {
                    stat_print="Y";
                    stat_change="N";
                }
            }
            
            if(nama_kel!=null) {
                nama_kel = nama_kel.substring(nama_kel.indexOf('.')+1);
            }
            System.out.println("cetak KK nama_kel="+ nama_kel);
            
            String no_kk="",nama_kep="",alamat="";
            String no_rt="", no_rw="", kode_pos="";
            
            String cb = request.getParameter("cb");
            System.out.println("cetak KK combo="+cb);
            Vector vData = new Vector();
            ViewDataAlamat data = null;
            
            String param_kk = "";
            
            StringTokenizer st = new StringTokenizer(cb, "*");
            String token = "";
            System.out.println("All Tokens=" + cb);
            
            while (st.hasMoreTokens()) {
                no_kk=st.nextToken();
                nama_kep= st.nextToken();
                alamat=st.nextToken();
                no_rt=st.nextToken();
                no_rw= st.nextToken();
                kode_pos=st.nextToken();
                data = new ViewDataAlamat(no_kk , nama_kep, alamat, no_rt, no_rw, kode_pos);
                vData.addElement(data);
                param_kk = param_kk +"*" +no_kk;
            }
            param_kk = param_kk.substring(1);
            %>
            <input type="hidden" name="param_kk" value="<%=param_kk%>">
            <%
            int totalPage = vData.size();
            %>
            <table width="400" border="0" cellspacing="1" cellpadding="0" align="center">
                <tr>
                    <td>
                        <div align="center">
                            <input class=boxstandard type="button" name="Print" value="Print" onclick="printKK(this);">
                            <input class=boxstandard type="button" name="close" value="Close" onclick="window.close();;">
                            <input type="hidden" name="totalpage" value=<%=totalPage%>>
                            </div>
                    </td>
                </tr>
            </table>
            <%
            ViewKK view = null;
            try {
                ServiceController statefulController = ServiceController.getInstance();
                ViewKKHome home = (ViewKKHome)statefulController.lookup("ViewKKBean", ViewKKHome.class);
                view = home.create();
                Vector vBigData=null;
                vBigData=view.retrieveData(vData, "WNI");
            %>
            
            <%
            for(int i=0;i<vData.size();i++) {
                    //nama_kep=((ViewDataAlamat)vData.elementAt(i)).getNama_kep().toUpperCase();
                    nama_kep=((ViewDataAlamat)vData.elementAt(i)).getNama_kep();
            %>
            <div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative;media:printer;" onClick="zoom(this.id)">
                <table width="400" border="0" cellspacing="1" cellpadding="0" align="center">
                    <tr>
                        <td bgcolor="#FFFFFF" valign="top">
                            <table width="100%" border="0" cellspacing="1" cellpadding="10">
                                <tr>
                                    <td bgcolor="#FFFFFF" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td valign="top" height="15">&nbsp; </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center">
                                                        <tr>
                                                            <td colspan="2">
                                                                <table width="500" border="0" cellspacing="1" cellpadding="0" align="center">
                                                                    <tr>
                                                                        <td>
                                                                            <div align="center"><font face="Times New Roman, Times, serif" size="4"><b><font size="6">KARTU
                                                                            KELUARGA </font></b></font></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table width="150" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                <tr>
                                                                                    <td width="7"><font face="Arial, Helvetica, sans-serif" size="4"><b>No.</b></font></td>
                                                                                    <td width="5">
                                                                                    </td>
                                                                                    <td bgcolor="#000000">
                                                                                        <table width="100%" border="0" cellspacing="1" cellpadding="2">
                                                                                            <tr>
                                                                                                <td bgcolor="#FFFFFF">
                                                                                                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="4"><b>
                                                                                                    <%=((ViewDataAlamat)vData.elementAt(i)).getNo_kk().toUpperCase()%></b></font></div>
                                                                                                    <% System.out.println("Proses Kendali :"+((ViewDataAlamat)vData.elementAt(i)).getNo_kk().toUpperCase());
                                                                                                    %>
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
                                                                if (nokendali==1) {
                                                                                                        deKdl = KendaliOke.getNomorKendali(record.getNoProp().trim(),record.getNoKab().trim(),((ViewDataAlamat)vData.elementAt(i)).getNo_kk().toUpperCase());
                                                                } else {
                                                                                                        deKdl="";
                                                                }
                                                                %>
                                                            <div align="right"><%=deKdl %> </div></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" height="15">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" width="63%">
                                                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                    <tr>
                                                                        <td class="fonts_KT_KK" nowrap>Nama Kepala Keluarga</td>
                                                                        <td class="fonts_KT_KK" width="10">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" nowrap width="384">&nbsp;<%=nama_kep.toUpperCase()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">Alamat</td>
                                                                        <td class="fonts_KT_KK" width="10">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" width="384">&nbsp;<%=((ViewDataAlamat)vData.elementAt(i)).getAlamat().toUpperCase()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">RT/RW</td>
                                                                        <td class="fonts_KT_KK" width="10">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" width="384">&nbsp;<%=((ViewDataAlamat)vData.elementAt(i)).getNo_rt().toUpperCase()+"/"+((ViewDataAlamat)vData.elementAt(i)).getNo_rw().toUpperCase()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">Kelurahan/Desa</td>
                                                                        <td class="fonts_KT_KK" width="10">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" width="384">&nbsp;<%=nama_kel.toUpperCase()%></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td valign="top" width="37%">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="right">
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">Kecamatan</td>
                                                                        <td class="fonts_KT_KK" width="3">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" width="200">&nbsp;<%=nama_kec.toUpperCase()%>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK" nowrap>Kabupaten/Kota</td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">&nbsp;<%=nama_kab.toUpperCase()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">Kode Pos</td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">&nbsp;<%=((ViewDataAlamat)vData.elementAt(i)).getKode_pos().toUpperCase()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">Provinsi</td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">&nbsp;<%=nama_prop.toUpperCase()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">&nbsp;</td>
                                                                        <td class="fonts_KT_KK">&nbsp;</td>
                                                                        <td class="fonts_KT_KK">&nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td bgcolor="#000000"><img src="images/dot.gif" width="1" height="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="#000000">
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td width="3" class="fonts_KT_KK" bgcolor="#FFFFFF">
                                                                            <div align="center">No.</div>
                                                                        </td>
                                                                        <td width="270" class="fonts_KT_KK">
                                                                            <div align="center">Nama Lengkap</div>
                                                                        </td>
                                                                        <td width="70" class="fonts_KT_KK">
                                                                            <div align="center">NIK</div>
                                                                        </td>
                                                                        <td width="120" class="fonts_KT_KK">
                                                                            <div align="center">Jenis Kelamin</div>
                                                                        </td>
                                                                        <td width="120" class="fonts_KT_KK">
                                                                            <div align="center">Tempat Lahir</div>
                                                                        </td>
                                                                        <td width="100" class="fonts_KT_KK">
                                                                            <div align="center">Tanggal Lahir</div>
                                                                        </td>
                                                                        <td width="70" class="fonts_KT_KK">
                                                                            <div align="center">Agama</div>
                                                                        </td>
                                                                        <td width="130" class="fonts_KT_KK">
                                                                            <div align="center">Pendidikan </div>
                                                                        </td>
                                                                        <td width="200" class="fonts_KT_KK">
                                                                            <div align="center">Pekerjaan </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#DDDDDD">
                                                                        <td width="0" height="2" class="fonts_KT_KK">
                                                                            <div align="center"><img src="images/dot.gif" width="1" height="1">
                                                                            </div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">1</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">2</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">3</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">4</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">5</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">6</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"> <div align="center">7</div></td>
                                                                        <td class="fonts_KT_KK"> <div align="center">8</div></td>
                                                                    </tr>
                                                                    <%int ct=1;
                                                                    String  bgcolor="#FFFFFF";
                                                                    Vector vTemp = (Vector)vBigData.elementAt(i);
                                                                    if (nama_kep.toUpperCase().trim().equals("ANONYMOUS"))  bgcolor="#FF6666";
                                                                    
                                                                    for(int j=0;j<vTemp.size();j++)
                                                                    {
                                                                    
                                                                    %>
                                                                    <tr bgcolor="<%=bgcolor%>">
                                                                        <td class="fonts_KT_KK" valign="top">
                                                                            <div align="right"><%=ct%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"  nowrap>
                                                                            <div align="left"></div>&nbsp;
                                                                        <%=" "+((ViewKKObject)vTemp.elementAt(j)).getNama_lgkp().toUpperCase()%></td>
                                                                        <td class="fonts_KT_KK" nowrap>
                                                                            <div align="left"></div>&nbsp;
                                                                        <%=" "+((ViewKKObject)vTemp.elementAt(j)).getNik().toUpperCase()%></td>
                                                                        <td class="fonts_KT_KK" nowrap>
                                                                            <div align="left"></div>&nbsp;
                                                                        <%=" "+((ViewKKObject)vTemp.elementAt(j)).getJenis_klmin().toUpperCase()%></td>
                                                                        <td class="fonts_KT_KK" nowrap>
                                                                            <div align="left">&nbsp;
                                                                        <%=" "+((ViewKKObject)vTemp.elementAt(j)).getTmpt_lhr().toUpperCase()%></div></td>
                                                                        <td class="fonts_KT_KK" nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getTgl_lhr().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" nowrap>
                                                                            <div align="center"><%=" "+((ViewKKObject)vTemp.elementAt(j)).getAgama().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getPddk_akh().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getJenis_pkjrn().toUpperCase()%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <%ct++;
                                                                    //bgcolor="#FFFFFF";
                                                                    }
                                                                    if(vTemp.size()<10)
                                                                    {
                                                                    for(int j=0;j<10-vTemp.size();j++)
                                                                    {
                                                                    %>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td class="fonts_KT_KK" valign="top">
                                                                            <div align="right"><%=ct%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                    </tr>
                                                                    <%ct++;
                                                                    }
                                                                    }
                                                                    %>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#000000"><img src="images/dot.gif" width="1" height="3"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" height="10"><img src="images/dot.gif" width="1" height="1">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td bgcolor="#000000"><img src="images/dot.gif" width="1" height="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="#000000">
                                                                    <tr>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" rowspan="2">No.</td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" rowspan="2">
                                                                            <div align="center">Status Perkawinan</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" rowspan="2" width="180">
                                                                            <div align="center">Status Hubungan Dalam Keluarga</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" rowspan="2">
                                                                            <div align="center">Kewarganegaraan</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" colspan="2">
                                                                            <div align="center">Dokumen Imigrasi</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" colspan="2">
                                                                            <div align="center">Nama Orang Tua</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" width="70">
                                                                            <div align="center">No. Paspor</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" width="100">
                                                                            <div align="center">No. KITAS/KITAP</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" width="180">
                                                                            <div align="center">Ayah</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" bgcolor="#FFFFFF" width="180">
                                                                            <div align="center">Ibu</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#DDDDDD">
                                                                        <td class="fonts_KT_KK"><img src="images/dot.gif" width="1" height="1">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">9</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">10</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">11</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">12</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">13</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">14</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">15</div>
                                                                        </td>
                                                                    </tr>
                                                                    <%ct=1;
                                                                    bgcolor="#FFFFFF";
                                                                    if (nama_kep.toUpperCase().trim().equals("ANONYMOUS"))  bgcolor="#FF6666";
                                                                    for(int j=0;j<vTemp.size();j++)
                                                                    {
                                                                    %>
                                                                    <tr  bgcolor="<%=bgcolor%>">
                                                                        <td class="fonts_KT_KK"   valign="top">
                                                                            <div align="right"><%=ct%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"  nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getStat_kwn().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"   nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getStat_hbkel().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"   nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getKwrngrn().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"   nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getNo_paspor().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"   nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getNo_dok().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"   nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getNama_lgkp_ayah().toUpperCase()%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"   nowrap>
                                                                            <div align="left">&nbsp;
                                                                            <%=" "+((ViewKKObject)vTemp.elementAt(j)).getNama_lgkp_ibu().toUpperCase()%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <%ct++;
                                                                    //bgcolor="#FFFFFF";
                                                                    }
                                                                    if(vTemp.size()<10)
                                                                    {
                                                                    for(int j=0;j<10-vTemp.size();j++)
                                                                    {%>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td class="fonts_KT_KK" valign="top">
                                                                            <div align="right"><%=ct%></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                        <td class="fonts_KT_KK">
                                                                        </td>
                                                                    </tr>
                                                                    <%ct++;
                                                                    }
                                                                    }%>
                                                                    
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#000000"><img src="images/dot.gif" width="1" height="3"></td>
                                                        </tr>
                                                    </table>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center">
                                                        <tr>
                                                            <td valign="top">&nbsp; </td>
                                                            <td valign="top" width="230">
                                                                <table width="300" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td class="fonts_KT_KK" width="100" nowrap>Dikeluarkan
                                                                                                                   Tanggal 
                                                                                                                   </td>
                                                                        <td class="fonts_KT_KK" width="15">
                                                                            <div align="center">:</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"  colspan="3">
                                                                            <table border="0" cellspacing="0" cellpadding="0" class="border">
                                                                                <tr>
                                                                                    <td bgcolor="#FFFFFF" align="center"> <%=((ViewKKObject)vTemp.elementAt(0)).getDkel_tgl().toUpperCase()%>&nbsp;</td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">&nbsp;</td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center"></div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" colspan="3">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">LEMBAR :</td>
                                                                        <td class="fonts_KT_KK" >
                                                                            <div align="center">I</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" colspan="3">Kepala Keluarga</td>
                                                                        
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">&nbsp;</td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">II</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK" colspan="3">RT</td>
                                                                    </tr>
                                                                    
                                                                    
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">&nbsp;</td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">III</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"  colspan="3">Desa / Kelurahan</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fonts_KT_KK">&nbsp;</td>
                                                                        <td class="fonts_KT_KK">
                                                                            <div align="center">IV</div>
                                                                        </td>
                                                                        <td class="fonts_KT_KK"  colspan="3">Kecamatan</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td valign="top">
                                                                <table width="400" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td>
                                                                            <table width="150" border="0" cellspacing="1" cellpadding="0" align="center">
                                                                                <tr>
                                                                                    <td>
                                                                                        <div align="center" class="fonts_KT_KK">Kepala Keluarga,</div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="55">&nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <tr><td nowrap><div align="center"><%=nama_kep.toUpperCase()%></div></td></tr>
                                                                                    <td bgcolor="#000000" height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div align="center" class="fonts_KT_KK">Tanda
                                                                                        Tangan / Cap Jempol</div>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="25"><img src="images/dot.gif" width="25" height="8"></td>
                                                                        <td>
                                                                            <%if (status.trim().equals("lurah"))
                                                                            {
                                                                            %>
                                                                            <table width="150" border="0" cellspacing="1" cellpadding="0" align="center">
                                                                                <tr>
                                                                                    <td>
                                                                                        <div align="center" class="fonts_KT_KK">
                                                                                        <%=jab_lur%>,</div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="55">&nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <tr>
                                                                                        <td nowrap>
                                                                                            <div align="center"><%=nama_lur.toUpperCase()%></div>
                                                                                    </td></tr>
                                                                                    <td bgcolor="#000000" height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div align="center" class="fonts_KT_KK">NIP
                                                                                        :<%=" "+nip_lur.toUpperCase()%></div>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <%}
                                                                            else if (status.trim().equals("camat"))
                                                                            {
                                                                            %>
                                                                            <table width="150" border="0" cellspacing="1" cellpadding="0" align="center">
                                                                                <tr>
                                                                                    <td>
                                                                                        <div align="center" class="fonts_KT_KK"><%=jabatan%>,</div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="fonts_KTP_sub"  colspan="2" height="55" valign="bottom">
                                                                                        <div align="center">
                                                                                            <p>
                                                                                            <img src="images/dot.gif" width="100" height="50" align="bottom"></p>
                                                                                        </div>
                                                                                    </td> 
                                                                                </tr>
                                                                                
                                                                                <tr>
                                                                                    <tr>
                                                                                        <td nowrap>
                                                                                            <div align="center"><%=nama_pej.toUpperCase()%></div>
                                                                                    </td></tr>
                                                                                    <td bgcolor="#000000" height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div align="center" class="fonts_KT_KK">NIP
                                                                                        :<%=" "+nip_pej.toUpperCase()%></div>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <%
                                                                            }
                                                                            %>
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
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <%if (i<(vData.size()-1))
            {
            %>
            <p style="page-break-before:auto">&nbsp; </p>
            <%
            }
            }
            %>
        </form>
    </body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
finally
{
view.remove();
}%>
<%
}
}
else
{
response.sendRedirect("index.jsp");
}
%>
