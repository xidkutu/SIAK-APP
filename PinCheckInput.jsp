<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%
    Vector v = null;
    String sim,kel,auth=null,authkey=null,pin,pin1;
    boolean b = false;
   UserInfo1 record=null;
%>

<%
try
{
  if(session.getAttribute("remoteRef")!=null)
 {
     auth=request.getParameter("no_autoriz");
     pin=request.getParameter("ulang_pin");

     authkey = (String)session.getAttribute("authkey");
     pin1 = (String)session.getAttribute("pin");

  if(auth.trim().equals(authkey) && pin.trim().equals(pin1))
         {
           String file = (String)session.getAttribute("file");
           session.removeAttribute("authkey");
           session.removeAttribute("pin");
           session.removeAttribute("file");
           record=(UserInfo1)session.getAttribute("remoteRef");
           record.setAuth_key(authkey);
           record.setPin(pin1);
           session.setAttribute("remoteRef", record);
           response.sendRedirect(file);
         }
         else
         {
             response.sendRedirect("Pin_Pengguna_User.jsp?error=7");
         }
}
else
{
response.sendRedirect("index.jsp");
}
}
catch(Exception gen)
{
response.sendRedirect("index.jsp");
gen.printStackTrace();
}
finally{
pin1="";
authkey="";
pin="";
auth="";
}
%>

