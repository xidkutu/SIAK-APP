<%@ page import="javax.ejb.*,javax.rmi.*,pendaftaran.*,com.db.connection.*,com.penan.*,siaktools.logwriter.*"%>
<%!
 SetupPenan remotePenan = null;
 SetupPenanHome homePenan = null;
 ServiceController controller;
 String no_kel,no_kec,no_kab,no_prop;
 String flttd;
 String jabatan=null,namapej=null,nippej=null,status=null,jabakel=null,namapejkel=null,niplur=null;
 boolean b,b1;

 private String padding(String msg, char pad, int length) {
        int diff = length - msg.length();
        for (int i=0; i<diff; i++) {
           msg = pad + msg;
        }
        return msg;
 }
%>
<%
if (session.getAttribute("remoteRef")!=null)
{
   no_kel = request.getParameter("no_kel").trim();
   no_kec = request.getParameter("no_kec").trim();
   no_kab = request.getParameter("no_kab").trim();
   no_prop = request.getParameter("no_prop").trim();
   flttd = request.getParameter("dokumenfile").trim();

 if((request.getParameter("jab_kec") != null) && (request.getParameter("nama_pejbt_kec2") != null) && (request.getParameter("nip_pejbt_cmt") != null))
   {
     jabatan=request.getParameter("jab_kec");
     namapej=request.getParameter("nama_pejbt_kec2");
     nippej=request.getParameter("nip_pejbt_cmt");
   }
   if((request.getParameter("jab_kel") != null) && (request.getParameter("nama_pejbt_kel") != null) && (request.getParameter("nip_lrh") != null))
   {
     jabakel=request.getParameter("jab_kel");
     namapejkel=request.getParameter("nama_pejbt_kel");
     niplur=request.getParameter("nip_lrh");
   }
   if(request.getParameter("radiobutton") != null)
   {
      status = request.getParameter("radiobutton");
   }

try
   {
      controller = ServiceController.getInstance();
      homePenan = (SetupPenanHome)controller.lookup("SetupPenan",SetupPenanHome.class);

      if(homePenan != null)
      {
          remotePenan = homePenan.create();
      }

      if(jabatan != null && namapej != null && nippej != null)
      {
           if ((status==null) || (status.trim().equals("null")))
           {
            status="";
           }
	//kecamatan
	System.out.println("masuk kondisi kecamatan");
         b = remotePenan.setupKec2(no_kec,no_kab,no_prop,jabatan,namapej,status,nippej,flttd);
      }
      else
      {
        jabatan=null;
        namapej=null;
        nippej=null;
      }

      if(jabakel != null && namapejkel != null && niplur != null)
      {
	  System.out.println("masuk kondisi kelurahan");
	//kelurahan
          b1 = remotePenan.setup_kel2(no_kel,no_kec,no_kab,no_prop,jabakel,namapejkel,niplur,flttd);
      }
      else
      {
        jabakel=null;
        namapejkel=null;
        niplur=null;
      }

 if(b == true || b1 == true)
      {

         System.out.println("ENtered into boolean");
         XmlReader remote1=null;
         XmlReaderHome home1=null;

        home1=(XmlReaderHome)controller.lookup("XmlReader",XmlReaderHome.class);
        remote1=home1.create();
        remote1.writeWilayah();
        //remote1.writeKels(padding(no_prop.trim(),'0', 2) , padding(no_kab.trim(),'0', 2), padding(no_kec.trim(),'0', 2));
        //remote1.remove();
        %>
         <jsp:forward page="setup_KTP_KK_Bio_WNIADV.jsp">
           <jsp:param name="n" value="1"/>
         </jsp:forward>
    <%
      }
      else
      {
        System.out.println("ENTERED inTO ELSE NOT BOOLEAN");
        %>
         <jsp:forward page="setup_KTP_KK_Bio_WNI.jsp">
           <jsp:param name="n" value="0"/>
         </jsp:forward>
     <%}
 }
   catch (Exception exception)
    {
      System.out.println("problem:"+ exception);
    }
 }
else
{
response.sendRedirect("index.jsp");
}
%>
