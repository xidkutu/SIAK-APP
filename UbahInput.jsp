<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
    Vector v = null;
    UserInfo1 record1=null;
    String sim,kel,user=null,old_pwd=null,new_pwd=null;
    boolean result = false;
  LoginHome home=null;
  Login remote=null;
  ServiceController factory=null;
%>

<%
     user=request.getParameter("nama_pguna");
     old_pwd=request.getParameter("psw_lama");
     new_pwd=request.getParameter("psw_baru");

     sim = new String("SIMPAN");
     kel = new String("KELUAR");

try
{
record1=(UserInfo1)session.getAttribute("remoteRef");

if(record1 != null)
              {
    if(request.getParameter("sim") != null)
     {
      if(request.getParameter("sim").equals(sim))
      {
          factory=ServiceController.getInstance();
          home = (LoginHome)factory.lookup("Login",LoginHome.class);
          remote = home.create();
          result=remote.ubahPwd(record1.getUserId(),record1.getPassword(),new_pwd);
          if (result)
              {
          record1=(UserInfo1)remote.validate(record1.getUserId(),new_pwd);
              }
         if(result == true && record1!=null)
         {
                     session.setAttribute("remoteRef", record1);
                     remote.remove();
                     remote=null;
                     factory=null;
               response.sendRedirect("UbahPassword.jsp?s=1");
         }
         else
         {
                           response.sendRedirect("UbahPassword.jsp?s=0");
         }
        }
      }

    else if(request.getParameter("kel") != null)
    {
      if(request.getParameter("kel").equals(kel))
      {
System.out.println("Record File=" + record1.getModRefFile());
%>
         <jsp:forward page="<%=record1.getModRefFile()%>"/>
<%    }
    }
}
}
catch(Exception gen)
{
gen.printStackTrace();
}
finally{
record1=null;
}
%>

