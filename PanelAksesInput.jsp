<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.ServiceController"%>

<%!
    String no_kel,nama_kel,select,id1=null;

    String [] data = {"nama_grup","pwd","nama_lvl","nprop","nkab","nkec",
    "nama_div","jenis_mod"};

    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory=null;
    PanelSessionHome home = null;
    PanelSession remote1;
    String sim,kel;
    String newUser=null;
String offline=null;
%>

<%
     factory=ServiceController.getInstance();
     v = new Vector();

     sim = new String("SIMPAN");
     kel = new String("KELUAR");

     try
     {
       record=(UserInfo1)session.getAttribute("remoteRef");
if(record != null)
{
System.out.println("record TIDAK null di PANELAKSESINPUT");
     if(request.getParameter("sim") != null)
     {
      if(request.getParameter("sim").equals(sim))
      {
        for(int i=0; i < data.length;i++)
        {
          if(request.getParameter(data[i]) != null)
          {
             v.addElement((Object)request.getParameter(data[i]));
          }
          else
          {
             v.addElement((Object)"0");
          }
        }
        offline=request.getParameter("offline");
         try
         {
           factory = ServiceController.getInstance();
           home = (PanelSessionHome)factory.lookup("PanelSession",PanelSessionHome.class);
           if(home != null)
           {
             remote1 = home.create();
             System.out.println("AFTER HOME CREATE IN PANEL AKSES INPUT");
             newUser = remote1.insertAkses(v,offline);
           }
           if(newUser == null)
           {
                System.out.println("NEW USER ==  NULL");
%>
               <jsp:forward page="Insert_Akses_Error.jsp"/>

           <%}
           else
           {
                System.out.println("SHOW USER. JSP");
%>
               <jsp:forward page="ShowUser.jsp">
               <jsp:param name="newUser" value="<%=newUser%>"/>
               </jsp:forward>
           <%}
         }
         catch(Exception user)
         {
           System.out.print("Exception in User_Master insertion = " + user);
         }
      }
     }
    else if(request.getParameter("kel") != null)
    {
      if(request.getParameter("kel").equals(kel))
      {%>
         <jsp:forward page="Menu_Siak_Security.jsp"/>
<%    }
    }
}
else
{
System.out.println("record null di PANELAKSESINPUT");
response.sendRedirect("index.jsp");
}
     }
     catch(Exception e)
     {
e.printStackTrace();
      }

%>
