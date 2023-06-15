<%-- Declaration of variables --%>

<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,datawilayah.*,com.db.connection.ServiceController,pendaftaran.Login,siaktools.logwriter.*"%>

<%!
    int no_kel,no_kec,no_kab,no_prop;
    String nama_kel,SIM,TAM,KEL;
    Context entityContext;
    KelHome home;
    Kel remote;
    ServiceController factory;
    String nprop,nkab,nkec;

    private String padding(String msg, char pad, int length) {
        int diff = length - msg.length();
        for (int i=0; i<diff; i++) {
           msg = pad + msg;
        }
        System.out.println(msg);
        return msg;
    }
%>
<%-- Get the parameter from client --%>

<%
   SIM = new String("SIMPAN");
   TAM = new String("TAMPILKAN");
   KEL = new String("KELUAR");

nprop=request.getParameter("nprop").trim();
nkab=request.getParameter("nkab").trim();
nkec=request.getParameter("nkec").trim();
System.out.println("nprop=" +nprop);
System.out.println("nkab="+nkab);
System.out.println("nkec="+nkec);
%>

<%
try
{
if (session.getAttribute("remoteRef")!=null)
{
   factory=ServiceController.getInstance();
      home=(KelHome)factory.lookup("KelBean",KelHome.class);
      remote = home.create();

 if(request.getParameter("sim") != null)
     {
      if(request.getParameter("sim").equals(SIM))
      {
        System.out.println("dalam sim");
        no_kel = Integer.parseInt(request.getParameter("no_kel").trim());
        nama_kel = request.getParameter("nama_kel");
        no_kec = Integer.parseInt(request.getParameter("no_kec").trim());
        no_kab = Integer.parseInt(request.getParameter("no_kab").trim());
        no_prop = Integer.parseInt(request.getParameter("no_prop").trim());

System.out.println("no_prop="+no_prop);
System.out.println("no_kab="+no_kab);
System.out.println("no_kec="+no_kec);
System.out.println("no_kel="+no_kel);
System.out.println("nama_kel="+nama_kel);

boolean b = remote.checkKelurahan(no_kel,nama_kel,no_kec,no_kab,no_prop);


if(b == true)
         {
System.out.println("b true");
 /*      XmlReader remote1;
       XmlReaderHome home1;
       home1=(XmlReaderHome)factory.lookup("XmlReader",XmlReaderHome.class);
       remote1=home1.create();
       remote1.writeKels(padding(request.getParameter("no_prop").trim(),'0', 2) , padding(request.getParameter("no_kab").trim(),'0', 2), padding(request.getParameter("no_kec").trim(),'0', 2));
       remote1.remove();
*/
%>
System.out.println("dalam sim");
<jsp:forward page="List_Prop1.jsp">
<jsp:param name="nprop" value="<%=nprop%>"/>
<jsp:param name="nkab" value="<%=nkab%>"/>
<jsp:param name="nkec" value="<%=nkec%>"/>
<jsp:param name="flag" value="1"/>
</jsp:forward>
<%         }
         else
         {
System.out.println("b false");
%>
           <jsp:forward page="data_input_desa_kelurahan.jsp?n=2"/>
       <%}
      }
     }

     else if(request.getParameter("tam") != null)
     {
      if(request.getParameter("tam").equals(TAM))
      {
System.out.println("dalam tam");

%>

<jsp:forward page="List_Prop1.jsp">
<jsp:param name="flag" value="0"/>
<jsp:param name="nprop" value="<%=nprop%>"/>
<jsp:param name="nkab" value="<%=nkab%>"/>
<jsp:param name="nkec" value="<%=nkec%>"/>
</jsp:forward>
<%
      }
     }
      else
      {
        if(request.getParameter("kel").equals(KEL))
        {
System.out.println("dalam kel");
%>
          <jsp:forward page="menu_wilayah.jsp"/>
<%
       }
    }
     }
else
{
response.sendRedirect("index.jsp");
}
   }

    catch (Exception ne)
    {
      out.println("Exception Occured : " + ne);
    }
%>