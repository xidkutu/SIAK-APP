<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,setupwilayah.*,com.db.connection.ServiceController, siaktools.logwriter.*"%>
<%!
String nama_kec,S,TT,tt,si;
String nprop,nkab;
int no_prop,no_kab,no_kec;
ServiceController factory=null;
KecHome home;
Kec remote;

   private String padding(String msg, char pad, int length) {
        int diff = length - msg.length();
        for (int i=0; i<diff; i++) {
           msg = pad + msg;
        }
        System.out.println(msg);
        return msg;
    }
%>
<%
  no_prop = Integer.parseInt(request.getParameter("no_prop"));
  no_kab = Integer.parseInt(request.getParameter("no_kab"));
  no_kec = Integer.parseInt(request.getParameter("no_kec"));
  nama_kec = request.getParameter("nama_kec");

  nprop=request.getParameter("nprop");
  nkab=request.getParameter("nkab");

  S=request.getParameter("SIM");
  TT = request.getParameter("T");
  tt=new String("TAMPILKAN");
  si=new String("SIMPAN");

if(S==null)
{
S="SIM";
}
else if(TT==null)
{
TT="TAM";
}

if(TT.equals(tt))
{
%>
<jsp:forward page="List_Keca.jsp">
<jsp:param name="flag" value="0"/>

<jsp:param name="nprop" value="<%=nprop%>"/>
<jsp:param name="nkab" value="<%=nkab%>"/>
<jsp:param name="no_prop" value="<%=no_prop%>"/>
<jsp:param name="no_kab" value="<%=no_kab%>"/>
</jsp:forward>
<%
}
 try
   {
      factory=ServiceController.getInstance();
      home = (KecHome) factory.lookup("Kec",KecHome.class);
      remote = home.create();
      boolean b = remote.setKec(no_prop,no_kab,no_kec,nama_kec);

     if (b)
       {
System.out.println("SAVE");
       XmlReader remote1;
       XmlReaderHome home1;
       home1=(XmlReaderHome)factory.lookup("XmlReader",XmlReaderHome.class);
       remote1=home1.create();
       remote1.writeKecs(padding(request.getParameter("no_prop").trim(),'0', 2), padding(request.getParameter("no_kab").trim(),'0', 2));
       remote1.remove();
%>
 <jsp:forward page="List_Keca.jsp">
 <jsp:param name="flag" value="1"/>
<jsp:param name="nprop" value="<%=nprop%>"/>
<jsp:param name="nkab" value="<%=nkab%>"/>
<jsp:param name="noprop" value="<%=no_prop%>"/>
<jsp:param name="nokab" value="<%=no_kab%>"/>
 </jsp:forward>
<%
 }
      else
{
System.out.println("NGAK SAVE");
%>

<jsp:forward page="SetKec1.jsp">
<jsp:param name="flag" value="0"/>
<jsp:param name="nprop" value="<%=nprop%>"/>
<jsp:param name="nkab" value="<%=nkab%>"/>
<jsp:param name="noprop" value="<%=no_prop%>"/>
<jsp:param name="nokab" value="<%=no_kab%>"/>
</jsp:forward>
<%
}
   }
   catch (Exception ne)
    {
      out.println("Exception Occured : " + ne);
    }
%>