<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.ServiceController,javax.ejb.*" %>

 <%!
   LoginHome home=null;
   Login remote=null;
   public void recallRelease()
   {
     try{
       remote.remove();
       remote=null;
     }catch(Exception err)
      {
           remote=null;
           System.out.println("Error from LoginValidity.jsp File=" + err.toString());
      }
   }
 %>
<%
 String login=null,pwd=null,id=null;
    ServiceController factory=null;
    String pin=null;
    UserInfo1 record=null;

   login = request.getParameter("login");
   pwd = request.getParameter("pwd");
%>
<%
 try
  {
     factory=ServiceController.getInstance();
     home = (LoginHome)factory.lookup("Login",LoginHome.class);
     remote = home.create();
     record=(UserInfo1)remote.validate(login,pwd);

  if (session.getAttribute("remoteRef")!=null)  session.removeAttribute("remoteRef");
     session.setMaxInactiveInterval(1200);

if(record != null)
    {

 if (application.getAttribute(record.getUserId())==null)
    {
   if(record.getDivision() == null)
      {
      session.setAttribute("remoteRef", record);
      response.sendRedirect("siak_admin.jsp");
      }
      else if(record.getNipPetugas().equals(""))
      {
            session.setAttribute("remoteRef", record);
        response.sendRedirect("Pengguna_User.jsp");

      }
      else if(record.getUserStatus().trim().equals("N"))
       {
                  recallRelease();
      if( application.getAttribute(record.getUserId())!=null) application.removeAttribute(record.getUserId());
                  session.removeAttribute("remoteRef");
                  session.invalidate();
 response.sendRedirect("index.jsp?error=4");
    }
      else
      {

         if(record.getAuthKey()!=null && !record.getAuthKey().trim().equals(""))
         {
            id=session.getId();
            session.setAttribute("id",id);
            pin = (id.substring((id.length()-10)+1,id.length())).trim();
            session.setAttribute("pin",pin);
            session.setAttribute("authkey",record.getAuthKey());
            session.setAttribute("file",record.getModRefFile());
            response.sendRedirect("Pin_Pengguna_User.jsp");
            record.setAuth_key(null);
            record.setPin(null);
            session.setAttribute("remoteRef", record);
    }
          else
          {
       recallRelease();
  if( application.getAttribute(record.getUserId())!=null) application.removeAttribute(record.getUserId());
                  session.removeAttribute("remoteRef");
                  session.invalidate();


            response.sendRedirect("index.jsp?error=3");
          }
      }
  }
    else if(application.getAttribute(record.getUserId())!=null &&
           application.getAttribute(record.getUserId()+"*status*").toString().trim().equals("1"))
      {

                              recallRelease();
                              session.removeAttribute("remoteRef");
                              session.invalidate();
                response.sendRedirect("index.jsp?error=5");
      }
      else
      {
          response.sendRedirect(record.getModRefFile());

      }

//        response.sendRedirect(record.getModRefFile());
    }
    else
    {
    recallRelease();
    session.removeAttribute("remoteRef");
    session.invalidate();
    response.sendRedirect("index.jsp?error=2");
    }
   }
   catch(Exception e)
  {
e.printStackTrace();
             session.removeAttribute("remoteRef");
             session.invalidate();
  %>
               <jsp:forward page="license.jsp">
               </jsp:forward>
<%

     // e.printStackTrace();
  }
finally{
recallRelease();
record=null;
}
%>
