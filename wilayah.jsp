<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,setupwilayah.*,com.db.connection.ServiceController,pendaftaran.*,siaktools.logwriter.*"%>
<%!
    UserInfo1 record = null;
%>
<%
if (session.getAttribute("remoteRef")!=null)
{
%>

<html>
<head>
<title>
adminduk SIAK online
</title>
</head>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name=ack action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
</table>
<%!

    String nama_prop,TAM,S,t,si,KE,k;
    int no_prop,i;
    SetupPropHome home;
    SetupProp remote;
    ServiceController factory;
    boolean b;

%>

<%
   no_prop = Integer.parseInt(request.getParameter("no_prop"));
   nama_prop = request.getParameter("nama_prop");
   S= request.getParameter("SIM");
   TAM= request.getParameter("TAMP");
   KE=request.getParameter("KEL");
   t=new String("TAMPILKAN");
   si=new String("SIMPAN");
   k= new String("KELUAR");

if(S==null)
{
S="SIM";
}
else if(TAM==null)
{

TAM="TAM";
}
if(nama_prop==null)
{
nama_prop="abc";
}

if (S.equals(si))
{

    try
   {

      factory=ServiceController.getInstance();
      home = (SetupPropHome) factory.lookup("SetupProp",SetupPropHome.class);
      remote = home.create();
      b = remote.postPropinsi(no_prop,nama_prop);

      if(b == true)
      {
try{
   ServiceController factory=null;
   XmlReader remote;
   XmlReaderHome home;
   factory=ServiceController.getInstance();
   home=(XmlReaderHome)factory.lookup("XmlReader",XmlReaderHome.class);
   remote=home.create();
   remote.writeWilayah();
   System.out.println("WRITE PROPS..");
  }catch(Exception err)
  {
    err.printStackTrace();
  }
%>

       <jsp:forward page="List_Prop.jsp">
       <jsp:param name="flag" value="1"/>
       </jsp:forward>
<%
      }
      else
      {

%>
        <jsp:forward page="SetProp1.jsp"/>

<%
      }
   }
   catch (Exception ne)
    {
      out.println("Exception Occured : " + ne);
    }
}
else if (TAM.equals(t) )
{
%>
<jsp:forward page="List_Prop.jsp">
<jsp:param name="flag" value="0"/>
</jsp:forward>
<%
}
%>
</form>
</body>
</html>
<%
}
else
{
response.sendRedirect("index.jsp");
}
%>
