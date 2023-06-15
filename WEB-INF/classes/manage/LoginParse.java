package manage;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import siaktools.logwriter.*;
// User imports
import javax.naming.*;
import javax.rmi.*;
import java.util.*;
import pendaftaran.*;
import com.db.connection.ServiceController;
import javax.ejb.*;
import java.util.ResourceBundle;
import java.util.Locale;
import java.io.*;


public final class LoginParse
extends
weblogic.servlet.jsp.JspBase
implements weblogic.servlet.jsp.StaleIndicator
{
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


    public boolean _isStale() {
        weblogic.servlet.jsp.StaleChecker sci =(weblogic.servlet.jsp.StaleChecker)(getServletConfig().getServletContext());
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/LoginValidity.jsp", 1083669067562L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }

    public static boolean _staticIsStale(weblogic.servlet.jsp.StaleChecker sci) {
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/LoginValidity.jsp", 1083669067562L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }


 public void _jspService(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws java.io.IOException, javax.servlet.ServletException
    {
        javax.servlet.jsp.tagext.Tag _activeTag = null;
        Object page = this;
        javax.servlet.jsp.JspWriter out;
        javax.servlet.jsp.PageContext pageContext =
        javax.servlet.jsp.JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);
        out = pageContext.getOut();
        JspWriter _originalOut = out;
        javax.servlet.http.HttpSession session = request.getSession(true);
        session.setMaxInactiveInterval(1300);

  try { // error page try block

            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "private");
            out.print("\r\n");
            out.print("\r\n\r\n ");
            out.print("\r\n");
            String login=null,pwd=null,id=null;
            ServiceController factory=null;
            String pin=null;
            UserInfo1 record=null;
            login = request.getParameter("login");
            pwd = request.getParameter("pwd");
            out.print("\r\n");
       try
            {

if (UserRepository.getUserStatus(login).equals("0"))
        {
          factory = ServiceController.getInstance();
          home = (LoginHome) factory.lookup("Login", LoginHome.class);
          remote = home.create();
          record = (UserInfo1) remote.validate(login, pwd);
          if (record != null) {

            if (session.getAttribute("remoteRef") != null)
              session.removeAttribute("remoteRef");

            if (record.getDivision() == null) {
              session.setAttribute("remoteRef", record);
              response.sendRedirect("siak_admin.jsp");
            }
            else if (record.getModuleCode().equals("13")) {
              session.setAttribute("remoteRef", record);
              response.sendRedirect(record.getModRefFile());
            }
            else if (record.getNipPetugas().equals("")) {
              session.setAttribute("remoteRef", record);
              response.sendRedirect("penggunauser");
            }
            else if (record.getUserStatus().trim().equals("N")) {
              recallRelease();
              try {
                if (UserRepository.getUserStatus(record.getUserId()).equals("1"))
                  UserRepository.destroyUser(record.getUserId(),false);
              }
              catch (Exception uerr) {

              }
              session.removeAttribute("remoteRef");
              session.invalidate();
              response.sendRedirect("index.jsp?error=4");
            }
            else {
              if (record.getAuthKey() != null &&
                  !record.getAuthKey().trim().equals("")) { //[ /LoginValidity.jsp; Line: 77]
                id = session.getId();
                session.setAttribute("id", id);
                pin = (id.substring( (id.length() - 10) + 1, id.length())).trim();
                session.setAttribute("pin", pin);
                session.setAttribute("authkey", record.getAuthKey());
                session.setAttribute("remoteRef", record);
                session.setAttribute("file", record.getModRefFile());
                response.sendRedirect("pinview");
                record.setAuth_key(null);
                record.setPin(null);
              }
              else {
                recallRelease();
                try {
                  if (UserRepository.getUserStatus(record.getUserId()).equals(
                      "1"))
                    UserRepository.destroyUser(record.getUserId(),false);
                }
                catch (Exception uerr1) {

                }
                session.removeAttribute("remoteRef");
                session.invalidate();
                response.sendRedirect("index.jsp?error=3");
              }
            }

          }
          else {
            recallRelease();
            session.removeAttribute("remoteRef");
            session.invalidate();
            response.sendRedirect("index.jsp?error=2");
          }

    }
     else  if (UserRepository.getUserStatus(login).equals("1"))
                            {
                                recallRelease();
                                session.removeAttribute("remoteRef");
                                session.invalidate();
                                response.sendRedirect("index.jsp?error=5");
                            }
                            else
                            {
                                response.sendRedirect(record.getModRefFile()); //[ /LoginValidity.jsp; Line: 113]

                            }

   }
            catch(Exception e)
            {
              try{
                     ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                                           Locale.getDefault());
              SiakWriter wr = new SiakWriter(res.getString("JSP_PATH"));
               wr.writeFile(e, "LoginParse");

                             }catch(Exception err)
                                  {

                                  }

                e.printStackTrace();
                session.removeAttribute("remoteRef");
                session.invalidate();
                out.print("\r\n               ");
                if (true) {
                    out.clear();
                    String __thePage =
                    "license.jsp";
                    pageContext.forward(__thePage);
                    return;
                }
                out.print("\r\n");

            }
            finally{
                recallRelease();
                record=null;
            }

            out.print("\r\n");

        } catch (Throwable __ee) {
            while (out != null && out != _originalOut) out = pageContext.popBody();
            ((weblogic.servlet.jsp.PageContextImpl)pageContext).handlePageException((Throwable)__ee);
        }
        //before final close brace...
    }
}
