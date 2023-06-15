<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*,com.db.connection.*,java.sql.*,java.lang.String,java.lang.Integer"%>

<%!
UserInfo1 record = null;
String nprop,nkab,nkec,nkel,naprop,nakab,nakec;
String str,strb;
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_Wilayah;
Vector vData = new Vector();
Connection conn=null;
Connection conn1 = null;
ConnectorDB connectorDb;
ConnectorDB connectorDb2;
ResultSet rs = null;

String query="";
int temp=0;
int temp1 = 0;
%>

<%
try {
    record=(UserInfo1)session.getAttribute("remoteRef");
    
    if(record != null) {
        nprop=request.getParameter("nprop");
        nkab=request.getParameter("nkab");
        nkec=request.getParameter("nkec");
        
        naprop=request.getParameter("naprop");
        nakab=request.getParameter("nakab");
        nakec=request.getParameter("nakec");
        
        if(nkab.trim().equals("")) {
            str="Kota/Kabupaten";
            strb="Jumlah per Provinsi";
        } else if(nkec.trim().equals("")) {
            str="Kecamatan";
            strb="Jumlah per Kabupaten";
        } else {
            str="Desa/Kelurahan";
            strb="Jumlah per Kecamatan";
        }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
        <TITLE>adminduk SIAK online</TITLE>
        <META http-equiv=Content-Type content="text/html; charset=windows-1252">
        <LINK href="Templates/s.css" rel=stylesheet>
        <META content="MSHTML 6.00.2800.1141" name=GENERATOR>
    </HEAD>
    
    <SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printKTP(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Jumlah Penduduk Menurut Agama ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=5";
              window.close();
          }
    }
}
    </script>
    
    <BODY leftMargin=0
          topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
        <table align="center">
            <tr align="center"><td align="center" >
                    <div align="center"><b>
                            <input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printKTP(this)">
                    </b></div>
                </td>
                <td>
                    <div align="center"><b>
                            <input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
                    </b></div>
                    
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="100">
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="5" cellpadding="5" align="center">
                        <tr>
                            <td valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="3" cellpadding="3">
                                                <tr>
                                                    <td>
                                                        <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                                                            <tr>
                                                                <td colspan="4" height="1">
                                                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" height="25">
                                                                    <div align="center"><span class="subtitle">Jumlah
                                                                    Penduduk Menurut Agama</span></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" height="1">
                                                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="10" colspan="4">
                                                                    <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
                                                                        <tr>
                                                                            <td width="40%">PROVINSI</td>
                                                                            <td width="2%">:</td>
                                                                            <b><td><%=naprop.toString().toUpperCase()%></td></b>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>KABUPTEN/KOTA</td>
                                                                            <td>:</td>
                                                                            <b><td><%=nakab.toString().toUpperCase()%></td></b>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>KECAMATAN</td>
                                                                            <td>:</td>
                                                                            <b><td><%=nakec.toString().toUpperCase()%></td></b>
                                                                        </tr>
                                                                        <tr>
                                                                            
                                                                            <td width="40%">
                                                                                Tanggal
                                                                            </td>
                                                                            <td width="2%">:</td>
                                                                            <b><td><%=record.getToday()%></td>
                                                                            </b>
                                                                            
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
                                        <%
                                        factory=ServiceController.getInstance();
                                        home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
                                        remoteList_Wilayah = home.create();
                                        vData=remoteList_Wilayah.getAgama(nprop,nkab,nkec);
                                        
                                        if (vData.isEmpty()) {
                                        %>
                                        <html>
                                            <body>
                                                <div align="center"><b>
                                                        <h4><font color=red>Data Belum Ada !</font></h4>
                                                </b></div>
                                            </body>
                                        </html>
                                        
                                        <%
                                        } else {
                                        %>
                                        <td valign="top">
                                            <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="575">
                                                <tr>
                                                    <td width="0%"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                                                    <td width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                                                    <td width="0%"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                                                </tr>
                                                <tr>
                                                    <td width="0%">&nbsp;</td>
                                                    <td valign="middle" align="center" width="100%">
                                                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
                                                            <tr>
                                                                <td class="C-Fonts" rowspan="2" width="17">
                                                                    <div align="center"> No</div>
                                                                </td>
                                                                <td class="C-Fonts" rowspan="2" width="109">
                                                                    <div align="center">Desa/Kelurahan</div>
                                                                </td>
                                                                <td class="C-Fonts" colspan="7">
                                                                    <div align="center">Agama (jiwa)</div>
                                                                    <div align="center"></div>
                                                                </td>
                                                                <td class="C-Fonts" rowspan="2" width="64">
                                                                    <div align="center">Jumlah Penduduk</div>
                                                                    <div align="center">(jiwa)</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="C-Fonts" width="52">
                                                                    <div align="center">Islam</div>
                                                                </td>
                                                                <td class="C-Fonts" width="64">
                                                                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Kristen</span></div>
                                                                </td>
                                                                <td class="C-Fonts" width="68">
                                                                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Katholik</span></div>
                                                                </td>
                                                                <td class="C-Fonts" width="64"><div align="center">Budha</div></td>
                                                                <td class="C-Fonts" width="64">
                                                                    <div align="center">Hindu</div>
                                                                </td>
                                                                <td class="C-Fonts" width="64">
                                                                    <div align="center">Kong Hu Chu</div>
                                                                </td>
                                                                <td class="C-Fonts" width="64">
                                                                    <div align="center">Lainnya</div>
                                                                </td>
                                                            </tr>
                                                            <%
                                                            
                                                            long cntr= 1;
                                                            long jmlIslam=0,jmlKristen=0,jmlKatolik=0,jmlHindu=0,jmlBudha=0,jmlLainnya=0;
                                                            long pddkrow=0;
                                                            long total=0;
                                                            int JmlLainnya=0;
                                                            //Connection conn=null;
                                                            //ConnectorDB connectorDb;
                                                            //ConnectorDB connectorDb2;
                                                            Statement stmt,stmt1,stmt2,stmt3,stmt4;
                                                            connectorDb = new ConnectorDB();
                                                            connectorDb2 = new ConnectorDB();
                                                            ResultSet rs1 = null;
                                                            ResultSet rs2 = null;
                                                            ResultSet rs3 = null;
                                                            ResultSet rs4 = null;
                                                            for(int i=0;i<vData.size();i++) {
                                                                
                                                                AgamaInfo obj = (AgamaInfo)vData.elementAt(i);
                                                                
                                                                jmlIslam = jmlIslam + Long.parseLong(obj.getJmlIslam().trim());
                                                                jmlKristen = jmlKristen + Long.parseLong(obj.getJmlKristen().trim());
                                                                jmlKatolik = jmlKatolik + Long.parseLong(obj.getJmlKatolik().trim());
                                                                jmlHindu = jmlHindu + Long.parseLong(obj.getJmlHindu().trim());
                                                                jmlBudha = jmlBudha + Long.parseLong(obj.getJmlBudha().trim());
                                                                
                                                                nprop=request.getParameter("nprop");
                                                                nkab=request.getParameter("nkab");
                                                                nkec=request.getParameter("nkec");
                                                                
                                                                conn = connectorDb.getConnection();
                                                                conn1 = connectorDb.getConnection();
                                                                stmt = conn.createStatement();
                                                                stmt1 = conn.createStatement();
                                                                stmt2 = conn.createStatement();
                                                                stmt3 = conn.createStatement();
                                                                if (!(nprop.equalsIgnoreCase("")) && !(nkab.equalsIgnoreCase("")) && !(nkec.equalsIgnoreCase(""))){
                                                                    
                                                                    rs = null;
                                                                    //ResultSet rs = null;
                                                                    String query="";
                                                                    query = "select count(*) from biodata_wni a,setup_kel b where a.no_kel = (select no_kel from setup_kel where nama_kel ='";
                                                                    query = query + obj.getNama() + "' and a.no_prop= " + nprop + " and no_kab= " + nkab + " and no_kec = " + nkec + ")";
                                                                    query = query + " and a.agama='Kong Hu Chu' and a.no_prop=";
                                                                    query = query + nprop + " and a.no_kab= " + nkab + " and a.no_kec = " + nkec + " and a.no_kel = b.no_kel and b.nama_kel='";
                                                                    query = query + obj.getNama()+ "'";
                                                                    System.out.println(query);
                                                                    //select count(*) from biodata_wni a,setup_kel b where a.agama='Kong Hu Chu'
                                                                    //        and a.no_prop=33 and a.no_kab=18 and a.no_kec=01 and a.no_kel = b.no_kel and b.n
                                                                    //        ama_kel='KUWAWUR';
                                                                    try {
                                                                        conn = connectorDb.getConnection();
                                                                        stmt = conn.createStatement();
                                                                        rs=stmt.executeQuery(query.trim());
                                                                        
                                                                        while (rs.next()) {
                                                                            temp = rs.getInt(1);
                                                                        }
                                                                        if(rs!=null) {rs.close();}
                                                                        if(stmt!=null) {stmt.close();}
                                                                        
                                                                        System.out.println("masuk  0");
                                                                        conn = connectorDb.getConnection();
                                                                        System.out.println("masuk  1");
                                                                        String query1 = "";
                                                                        System.out.println("masuk  2");
                                                                        rs1 = null;
                                                                        System.out.println("masuk  3");
                                                                        query1 = "select count(*) from biodata_wni where agama='Kong Hu Chu' and no_prop=";
                                                                        query1 = query1 + nprop + " and no_kab= " + nkab + " and no_kec = " + nkec;
                                                                        System.out.println(query1);
                                                                        
                                                                        stmt1 = conn.createStatement();
                                                                        rs1=stmt1.executeQuery(query1.trim());
                                                                        System.out.println("masuk  4");
                                                                        while (rs1.next()){
                                                                            temp1 = rs1.getInt(1);
                                                                        }
                                                                        if(rs1!=null) {rs1.close();}
                                                                        if(stmt1!=null) {stmt1.close();}
                                                                        
                                                                        jmlLainnya = jmlLainnya - temp + Long.parseLong(obj.getJmlLainnya().trim());
                                                                        pddkrow=Long.parseLong(obj.getJmlIslam().trim()) +
                                                                                Long.parseLong(obj.getJmlKristen().trim())
                                                                                +Long.parseLong(obj.getJmlKatolik().trim())+Long.parseLong(obj.getJmlHindu().trim())
                                                                                +Long.parseLong(obj.getJmlBudha().trim())+Long.parseLong(obj.getJmlLainnya().trim());
                                                                        
                                                                        total = total + pddkrow;
                                                                    } catch(Exception e){
                                                                        System.out.println("Masuk Exception Agama");
                                                                        System.out.println(e.getStackTrace());
                                                                        System.out.println(e.getMessage());
                                                                    }
                                                                    
                                                                }else if (!(nprop.equalsIgnoreCase("")) && !(nkab.equalsIgnoreCase("")) && nkec.equalsIgnoreCase("")){
                                                                    
                                                                    rs2 = null;
                                                                    rs4 = null;
                                                                    String query2="";
                                                                    String query4="";
                                                                    
                                                                    System.out.println("baris b1");
                                                                    query2 = "select count(*) from biodata_wni where UPPER(agama)='KONG HU CHU' and no_prop=";
                                                                    query2 = query2 + nprop + " and no_kab= " + nkab + " and no_kec=(select no_kec from setup_kec where nama_kec ='";
                                                                    query2 = query2 + obj.getNama()+ "' and no_prop = " + nprop + " and no_kab="+ nkab + ")";
                                                                    System.out.println("baris b2");
                                                                    System.out.println(query2);
                                                                    try {
                                                                        conn = connectorDb.getConnection();
                                                                        //rs2=conn.prepareStatement(query2).executeQuery();
                                                                        stmt2 = conn.createStatement();
                                                                        rs2=stmt2.executeQuery(query2.trim());
                                                                        while (rs2.next()) {
                                                                            temp = rs2.getInt(1);
                                                                        }
                                                                        if(rs2!=null) {rs2.close();}
                                                                        if(stmt2!=null) {stmt2.close();}
                                                                        //-----------------------------------------------------------------
                                                                        System.out.println("Setelah while ke-2");
                                                                        conn = connectorDb.getConnection();
                                                                        System.out.println("masuk  b1");
                                                                        String query3 = "";
                                                                        System.out.println("masuk  b2");
                                                                        rs3 = null;
                                                                        System.out.println("masuk  b3");
                                                                        query3 = "select count(*) from biodata_wni where agama='Kong Hu Chu' and no_prop=";
                                                                        query3 = query3 + nprop + " and no_kab= " + nkab;
                                                                        System.out.println(query3);
                                                                        //rs3=conn.prepareStatement(query3).executeQuery();
                                                                        
                                                                        stmt3 = conn.createStatement();
                                                                        rs3=stmt3.executeQuery(query3.trim());
                                                                        
                                                                        System.out.println("masuk  b4");
                                                                        while (rs3.next()){
                                                                            temp1 = rs3.getInt(1);
                                                                        }
                                                                        if(rs3!=null) {rs3.close();}
                                                                        if(stmt3!=null){stmt3.close();}
                                                                        //----------------------------------------------------------------
                                                                        query4 = "select count(*) from biodata_wni where UPPER(agama) NOT IN('KONG HU CHU','BUDHA','ISLAM','KATHOLIK','KRISTEN','HINDU') and no_prop=";
                                                                        query4 = query4 + nprop + " and no_kab= " + nkab + " and no_kec=(select no_kec from setup_kec where nama_kec ='";
                                                                        query4 = query4 + obj.getNama()+ "' and no_prop = " + nprop + " and no_kab="+ nkab + ")";
                                                                        System.out.println("Query 4:"+query4);
                                                                        conn = connectorDb.getConnection();
                                                                        System.out.println("Abis 4");
                                                                        stmt4 = conn.createStatement();
                                                                        System.out.println("Abis 41");
                                                                        rs4 = stmt4.executeQuery(query4.trim());
                                                                        System.out.println("Abis 42");
                                                                        System.out.println("Masuk Query 4");
                                                                        while (rs4.next()){
                                                                            JmlLainnya = rs4.getInt(1);
                                                                        }
                                                                        if(rs4!=null) {rs4.close();}
                                                                        if(stmt4!=null){stmt4.close();}
                                                                        System.out.println("Jumlah Lainya baru: "+JmlLainnya);
                                                                        
                                                                        jmlLainnya = jmlLainnya + Long.parseLong(Integer.toString(JmlLainnya));
                                                                        //jmlLainnya = JmlLainnya + obj.getJmlLainnya();
                                                                        System.out.println("Jumlah lainnya kondisi2: " +jmlLainnya);
                                                                        pddkrow=Long.parseLong(obj.getJmlIslam().trim()) +
                                                                                Long.parseLong(obj.getJmlKristen().trim())
                                                                                +Long.parseLong(obj.getJmlKatolik().trim())+Long.parseLong(obj.getJmlHindu().trim())
                                                                                +Long.parseLong(obj.getJmlBudha().trim())+jmlLainnya;
                                                                        System.out.println("Jumlah pddkrow: " +pddkrow);
                                                                        total = total + pddkrow;
                                                                    } catch(Exception e){
                                                                        System.out.println("Masuk Exception Agama");
                                                                        System.out.println(e.getStackTrace());
                                                                        System.out.println(e.getMessage());
                                                                    }
                                                                    
                                                                }
                                                            %>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            <tr>
                                                                <td class="C-Field" width="17"><%=cntr%></td>
                                                                <td class="C-Field" width="109">
                                                                    <div align="left"><%=obj.getNama()%></div>
                                                                </td>
                                                                <td class="C-Field" width="52">
                                                                    <div align="center"><%=obj.getJmlIslam()%></div><% System.out.println("objgetislam = "+ obj.getJmlIslam());%>
                                                                </td>
                                                                <td class="C-Field" width="64">
                                                                    <div align="center"><%=obj.getJmlKristen()%></div>
                                                                </td>
                                                                <td class="C-Field" width="68">
                                                                    <div align="center"><%=obj.getJmlHindu()%></div>
                                                                </td>
                                                                <td class="C-Field" width="64">
                                                                    <div align="center"><%=obj.getJmlBudha()%></div>
                                                                </td>
                                                                <td class="C-Field" width="64">
                                                                    <div align="center"><%=obj.getJmlKatolik()%></div>
                                                                </td>
                                                                <td class="C-Field" width="64">
                                                                    <div align="center"><%=temp%></div>
                                                                </td>
                                                                <% int a = 0;
                                                                if (!(nprop.equalsIgnoreCase("")) && !(nkab.equalsIgnoreCase("")) && nkec.equalsIgnoreCase("")) {
                                                                    a = JmlLainnya;
                                                                    
                                                                }else if (temp>0){//kong bhu chu
                                                                    a = Integer.parseInt(obj.getJmlLainnya());
                                                                    System.out.println("Jumlah lainnya:" + a);
                                                                    a = a-temp;
                                                                }else{
                                                                    a = Integer.parseInt(obj.getJmlLainnya());
                                                                }
                                                                %>
                                                                <td class="C-Field" width="68">
                                                                    <div align="center"><%=a%></div><% System.out.println("jumlah penduduk: " + obj.getJmlPenduduk());%>
                                                                </td>
                                                                <% int totalRow = Integer.parseInt(obj.getJmlBudha()) + Integer.parseInt(obj.getJmlHindu());
                                                                totalRow = totalRow + Integer.parseInt(obj.getJmlIslam()) + Integer.parseInt(obj.getJmlKatolik());
                                                                totalRow = totalRow + Integer.parseInt(obj.getJmlKristen()) + temp + a;
                                                                %>
                                                                <td class="C-Field" width="64">
                                                                    <div align="center"><%=totalRow%></div>
                                                                </td>
                                                            </tr>
                                                            <%         cntr++;
                                                            }
                                                            %>
                                                            <tr>
                                                                <td class="C-Field" colspan="2" height="15">
                                                                    <div align="left"><%=strb%></div>
                                                                </td>
                                                                <td class="C-Field" width="52" height="15">
                                                                    <div align="center"><b><%=jmlIslam%></b></div>
                                                                </td>
                                                                <td class="C-Field" width="64" height="15">
                                                                    <div align="center"><b><%=jmlKristen%></b></div>
                                                                </td>
                                                                <td class="C-Field" width="68" height="15">
                                                                    <div align="center"><b><%=jmlHindu%></b></div>
                                                                </td>
                                                                <td class="C-Field" width="64" height="15">
                                                                    <div align="center"><b><%=jmlBudha%></b></div>
                                                                </td>
                                                                
                                                                <td class="C-Field" width="64" height="15">
                                                                    <div align="center"><b><%=jmlKatolik%></b></div>
                                                                </td>
                                                                <td class="C-Field" width="64" height="15">
                                                                    <div align="center"><b><%=temp1%></b></div>
                                                                </td>
                                                                <td class="C-Field" width="64" height="15">
                                                                    <div align="center"><b><%=jmlLainnya%></b></div>
                                                                </td>
                                                                <% long totalRow1 = jmlIslam + jmlKristen + jmlHindu + jmlBudha +jmlKatolik + temp1 + jmlLainnya;
                                                                
                                                                %>
                                                                <td class="C-Field" width="64" height="15">
                                                                    <div align="center"><b><%=totalRow1%></b></div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="0%">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td width="0%"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                                    <td width="100%"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                                    <td width="0%"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
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
</BODY></HTML>
<%}
}
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
