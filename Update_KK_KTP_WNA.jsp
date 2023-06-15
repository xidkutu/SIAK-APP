<%@ page import="javax.ejb.*,java.math.BigDecimal,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*,siaktools.logwriter.*,com.penan.*"%>
<%!
 UserInfo1 record = null;
 ServiceController controller=null;
 SetupPenan remotePenan = null;
 SetupPenanHome homePenan = null;

 String no_kab,no_prop;
 String jabatan=null,namapej=null,nippej=null,status=null;

 boolean b;
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
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{

   no_kab = request.getParameter("no_kab").trim();
   no_prop = request.getParameter("no_prop").trim();



   if((request.getParameter("jab_kec") != null) && (request.getParameter("nama_pejbt_kec2") != null) && (request.getParameter("nip_pejbt_cmt") != null))
   {
     jabatan=request.getParameter("jab_kec");
     namapej=request.getParameter("nama_pejbt_kec2");
     nippej=request.getParameter("nip_pejbt_cmt");
   }
   else
   {
     jabatan = null;
     namapej = null;
     nippej = null;
   }

   if(request.getParameter("radiobutton") != null)
   {
      status = request.getParameter("radiobutton");
   }
   else
   {
      status = null;
   }
      System.out.println("Status = " + status);
      controller = ServiceController.getInstance();
     homePenan = (SetupPenanHome)controller.lookup("SetupPenan",SetupPenanHome.class);

   if(homePenan != null)
      {
          remotePenan = homePenan.create();
      }
      if(jabatan != null && namapej != null && nippej != null)
      {
      b=remotePenan.setupKab(no_kab,no_prop,jabatan,namapej,status,nippej);
      }

      if(b == true)
      {
        System.out.println("Entered into Boolean Kabu");
       XmlReader remote1;
       XmlReaderHome home1;
       home1=(XmlReaderHome)controller.lookup("XmlReader",XmlReaderHome.class);
       remote1=home1.create();
       remote1.writeKecs(padding(no_prop.trim(),'0', 2) , padding(no_kab.trim(),'0', 2));
       remote1.remove();
     %>
         <jsp:forward page="Setup_KTP_KK_Bio_WNA.jsp">
           <jsp:param name="n" value="1"/>
         </jsp:forward>
    <%}
      else
      {%>
         <jsp:forward page="Setup_KTP_KK_Bio_WNA.jsp">
           <jsp:param name="n" value="0"/>
         </jsp:forward>
     <%}
}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch (Exception exception)
   {
exception.printStackTrace();
      System.out.println("problem:"+ exception);
   }
%>
