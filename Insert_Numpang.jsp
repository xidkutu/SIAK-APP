<%@ page language="java" import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%!
String no_kk_lama,no_kk_tmpt,tc,als_numpang;
Vector vt_npg;
ServiceController factory;
Numpang_Anggota_Wni nap;
Wni_NumpangHome home;
Wni_Numpang remote;
String kk_baru,flag="";
boolean result;
 String nprop="",nkab="",nkec="",nkel="";
 String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
 String  nama_cmat="",nip_cmat="",nip_lrh="",nama_kep_des="",nama_pet="",nip_pet="";
%>

<%
try
  {
if (session.getAttribute("remoteRef")!=null)
{
no_kk_lama=request.getParameter("no_kk_lama");
no_kk_tmpt=request.getParameter("no_kk_tmpt");
als_numpang=request.getParameter("als_numpang");
tc=request.getParameter("TC");


if ((request.getParameter("flag"))!=null && (!(request.getParameter("flag").trim().equals(""))))
 {
System.out.println("Inside FLAG NOT NULL AND NOT SPACE");
flag=request.getParameter("flag");
nama_prop=request.getParameter("nama_prop_tmp");
nama_kab= request.getParameter("nama_kab_tmp");
nama_kec=request.getParameter("nama_kec_tmp");
nama_kel=request.getParameter("nama_kel_tmp");
nprop=request.getParameter("no_prop_tmp");
nkab=request.getParameter("no_kab_tmp");
nkec=request.getParameter("no_kec_tmp");
nkel=request.getParameter("no_kel_tmp");
nama_cmat=request.getParameter("nama_cmat_tmp");
System.out.println("nama_cmat" + nama_cmat);
nip_cmat=request.getParameter("nip_cmat_tmp");
System.out.println("nip_cmat" + nip_cmat);
nip_lrh=request.getParameter("nip_lrh_tmp");
System.out.println("nip_lrh" + nip_lrh);
nama_kep_des=request.getParameter("nama_kep_des_tmp");
System.out.println("nama_kep_des" + nama_kep_des);
 }


//out.println("old kk"+no_kk_lama);
//out.println("Numpant gg"+no_kk_tmpt);
//out.println("String token"+tc);
StringTokenizer st = new StringTokenizer(tc,",");
vt_npg=new Vector();

 while (st.hasMoreTokens())
{
   nap=new Numpang_Anggota_Wni(st.nextToken(),st.nextToken(),no_kk_tmpt,als_numpang);
   vt_npg.add(nap);
}

    factory=ServiceController.getInstance();
    home = (Wni_NumpangHome) factory.lookup("Wni_Numpang",Wni_NumpangHome.class);
    remote = home.create();
    result= remote.nump_insert(vt_npg);

System.out.println("flag=" + flag);

 if(result)
{
if ((flag!=null) && (!(flag.trim().equals(""))))
{
%>
<jsp:forward page="Dis_Per_Wni.jsp">
<jsp:param name="fg" value="<%=no_kk_lama%>"/>
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
}else
{
%>

<html>
<head>
<style type="text/css">
<!--
.unnamed1 {  border-style: none; border-top-width: thin; border-right-width: thin; border-bottom-width: thin; border-left-width: thin}
-->
<!--
.flat {  background-color: #CCCCCC; border-style: solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px}
-->
</style>
</head>
<body bgColor="#93BEE2" onload="window.history.forward(1)">
 <br><br><br><br>
<div align="center">
<table border="1" cellspacing="1" cellpadding="0" bgcolor="#93BEE2" class="unnamed1">
   <tr>
    <td><font size=2 face="verdana"><b>Nomor KK Lama </b></font></td>
    <td><font size=2 face="verdana"><b >Nik Pemohon </b></font></td>
      <td><font size=2 face="verdana"><b>Nomor KK Ditempati</b></font></td>
   </tr>
   <%for (int i=0;i<vt_npg.size();i++)
      {
 %>
       <tr>
   <td><font size=2 face="verdana"><%=no_kk_lama%></font></td><td><font size=2 face="verdana"><%=((Numpang_Anggota_Wni)vt_npg.elementAt(i)).getNik()%></font></td><td><font size=2 face="verdana"><%=no_kk_tmpt%></font></td>
       </tr>
<%
      }
%>
 <tr>
     <td colspan=3></td>
   </tr>
</table>
</div>
  <div align="center"><font size=3 color="red" > <b>Data Sudah di simpan ! </b> </font> </div>
<br>
<div align="center">
<input  class="flat" type=button value=KELUAR name="button22" onClick="document.location='WNI_Menu.jsp'">
</div>
</body>
</html>
<%

}
}
// out.println("record updated");
else
{
out.println("record not updated");
}
}
else
{
response.sendRedirect("index.jsp");
}
  }catch(Exception e)
{
System.out.println(e.toString());
e.printStackTrace();
}

%>