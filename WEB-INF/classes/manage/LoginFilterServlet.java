package manage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import pendaftaran.Login;
import pendaftaran.UserInfo1;
import pendaftaran.LoginHome;
import siaktools.logwriter.*;
import com.db.connection.ServiceController;
import java.util.ResourceBundle;
import java.util.Locale;
import java.io.*;
import com.siak.validate.*;

public class LoginFilterServlet extends HttpServlet implements Filter {
  private FilterConfig filterConfig;
//Handle the passed-in FilterConfig
  String jsp_path=null;
  String LOG_PATH=null;
  public void init(FilterConfig filterConfig) {
    this.filterConfig = filterConfig;
    try{

       ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
       jsp_path = res.getString("JSP_PATH");
       LOG_PATH=res.getString("LOG_PATH");
}catch(Exception err)
     {

     }

  }
  //Process the request/response pair

public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) {
    try {
      HttpServletResponse resp = (HttpServletResponse) response;
      HttpServletRequest req = (HttpServletRequest) request;
      HttpSession session = req.getSession();
      resp.setHeader("Pragma", "No-cache");
      resp.setDateHeader("Expires", 0);
      resp.setHeader("Cache-Control", "no-cache");
      resp.setHeader("Cache-Control", "private");

      UserInfo1 record = null;
      record = (UserInfo1) session.getAttribute("remoteRef");
      int pos1 = req.getRequestURI().indexOf("index.jsp");
      int pos2=req.getRequestURI().indexOf("Login.jsp");
      int pos3=req.getRequestURI().indexOf("Logout.jsp");
      int pos4=req.getRequestURI().indexOf("hellopdf.jsp");

      if ((req.getRequestURI().indexOf("index.jsp")!=-1) || (req.getRequestURI().indexOf("Login.jsp")!=-1))
        {
          if (!ValidateLicense.validateLicense(LOG_PATH.trim()+"siak.lic"))
          {
            resp.sendRedirect("active.htm");
          }
        }

if (pos1==-1 && pos2==-1 &&  pos3==-1 &&  pos4==-1)
      {
if (record==null)
    {
      String uid="";
      Cookie client[]=req.getCookies();
      if (client.length==2)
         {
           uid=client[1].getValue();
         }
if ((uid != null) && (!uid.trim().equals(""))) {
         if (UserRepository.isTimeOut(uid)==1)
          {
            UserRepository.destroyUser(uid,true);
            SiakWriter wr = new SiakWriter(jsp_path);
            wr.writeFile( uid + " Timedout","LoginFilterServlet");
            resp.sendRedirect("index.jsp");
          }
          else
          {
            SiakWriter wr = new SiakWriter(jsp_path);
            wr.writeFile( uid + " Rebuilt","LoginFilterServlet");
            LoginHome home = null;
            Login remote = null;
            ServiceController factory = null;
            factory = ServiceController.getInstance();
            home = (LoginHome) factory.lookup("Login", LoginHome.class);
            remote = home.create();
            record = (UserInfo1) remote.validate(uid);
            session.setAttribute("remoteRef", record);
            UserRepository.updateUserRecovered(uid);
          }
      }
      else
      {
            SiakWriter wr = new SiakWriter(jsp_path);
            wr.writeFile(uid + " Unexpected Error","LoginFilterServlet");
            resp.sendRedirect("index.jsp");
      }
 }
if ((record!=null && record.getDivision()!=null && record.getAuthKey()==null))
     {
       session.invalidate();
       resp.sendRedirect("index.jsp?error=3");
     }
    }

 if (!resp.isCommitted())
 {
     filterChain.doFilter(request, response);
 }

 }
    catch(Exception sx) {
      try{
        SiakWriter wr = new SiakWriter(jsp_path);
        wr.writeFile(sx, "LoginFilterServlet");
      }catch(Exception err)
      {

      }
    }
}

  public void destroy() {
  }
}
