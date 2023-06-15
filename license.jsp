<%@ page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,ktp.wni.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*"%>
<%@ page import="com.wilayah.*"%>
<%@ include file="Global.jsp"%>
<%
    UserInfo1 record = null;
    String valueStr="";
    String radiobutton="";
    KTPWniObject wniObject=null;
    String stat_print=null;
    Vector vDataKelurahan = new Vector();
    CetakKTP cetakKTP = null;

String spesifik_nik=null;
String selidx="";

boolean nik_one=false;
boolean access=true;
boolean finish=false;

ServiceController controller;
long start=0,end=0,tot_rec=0;
long tot_page=0,page_no=0;
String update=null;
String stat_change="";
%>


<%
Vector vKtp = new Vector();
//System.out.println(32);
   try
   {
    record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
  {
%>
<%
 /*String jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&selidx="+ selidx;
*/
String jsp="data_wilayah.jsp?level=4&no_prop=" + record.getNoProp()+ "&nama_prop=" + record.getNamaProp()+"&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() +"&no_kec=" + record.getNoKec()+ "&nama_kec=" + record.getNamaKec() +"&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&selidx="+ selidx;
%>
<jsp:include page="<%=jsp%>" flush="true"/>
<%
}
else
{
response.sendRedirect("index.jsp");
}
   }
catch(Exception e){
e.printStackTrace();
}
finally{
//System.out.println(1016);
if (cetakKTP!=null)
   cetakKTP.remove();
finish=false;
start=0;
end=0;
tot_rec=0;
nik_one=false;
stat_print=null;
}
%>