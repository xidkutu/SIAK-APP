<%-- Declaration of variables --%>

<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,datawilayah.*,com.db.connection.ServiceController,pendaftaran.Login, siaktools.logwriter.*" %>
<%!
    String no_prop,no_kab,nama_kab,sim=null,tam=null,SIM,TAM,KEL,nprop;
    int no_prop_num,no_kab_num;
    Context entityContext;
    KabHome home;
    Kab remote;
     boolean b=false;
    Vector v;

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
  try
  {
   sim = request.getParameter("np").trim();

   SIM = new String("SIMPAN");
   TAM = new String("TAMPILKAN");
   KEL = new String("KELUAR");
   nprop=request.getParameter("np").trim();
   ServiceController factory;

     factory=ServiceController.getInstance();
      home=(KabHome)factory.lookup("KabBean",KabHome.class);
      remote = home.create();

     if(request.getParameter("sim") != null)
     {
      if(request.getParameter("sim").equals(SIM))
      {
         no_prop_num = Integer.parseInt(request.getParameter("no_prop").trim());
         no_kab_num = Integer.parseInt(request.getParameter("no_kab").trim());
         nama_kab = request.getParameter("nama_kab");

         b = remote.checkPropinsi(no_kab_num,nama_kab,no_prop_num);

         if(b == true)
         {
       XmlReader remote1;
       XmlReaderHome home1;
       home1=(XmlReaderHome)factory.lookup("XmlReader",XmlReaderHome.class);
       remote1=home1.create();
       remote1.writeKabs(padding(request.getParameter("no_prop").trim(),'0', 2));
       remote1.remove();


%>

        <jsp:forward page="List_Prop2.jsp">
        <jsp:param name="nprop" value="<%=nprop%>"/>
<jsp:param name="flag" value="1"/>
</jsp:forward>

<%         }
         else
         {%>
           <jsp:forward page="data_input_kabupaten_kota.jsp?i=2"/>
       <%}
      }
     }
     else if(request.getParameter("tam") != null)
     {
      if(request.getParameter("tam").equals(TAM))
      {%>
        <jsp:forward page="List_Prop2.jsp">
<jsp:param name="flag" value="0"/>
<jsp:param name="nprop" value="<%=nprop%>"/>
        </jsp:forward>


<%
      }
     }
      else
      {
        if(request.getParameter("kel").equals(KEL))
        {%>
          <jsp:forward page="menu_wilayah.jsp"/>

<%
       }
    }
     }
    catch (Exception ne)
    {
     ne.printStackTrace();
    }

%>