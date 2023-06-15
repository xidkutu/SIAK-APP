<%@ page import="javax.naming.*,javax.rmi.*,pendaftaran.*,manage.*" %>

<%!
UserInfo1 record=null;
%>
<%
try
   {
      Cookie client[]=request.getCookies();
      String uid="";

          if (client.length==2)
          {
                 uid=client[1].getValue();
          }
  try{
      UserRepository.destroyUser(uid,false);
     }catch(Exception err){  }
     session.invalidate();

     Cookie killcookie=new Cookie("uid",null);
     killcookie.setMaxAge(0);
     killcookie.setPath("/");
     response.addCookie(killcookie);
//     out.println("<html><body bgColor='#93BEE2' onload='window.history.forward(1)'></body></html><script language='javascript'>  if (confirm('Apakah akan keluar dari SIAK ?')){self.opener=null;self.close();}else{self.location='index.jsp';}</script>");
     response.getOutputStream().println("<html><body bgColor='#93BEE2' onload='window.history.forward(1)'></body></html><script language='javascript'>  if (confirm('Apakah akan keluar dari SIAK ?')){self.opener=null;self.close();}else{self.location='index.jsp';}</script>");
     }
   catch(Exception e)
   {
     System.out.println("Exception in Logout = " + e);
     e.printStackTrace();
     response.sendRedirect("index.jsp");
   }
%>

