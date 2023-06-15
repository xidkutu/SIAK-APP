package manage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import pendaftaran.UserInfo1;
import pendaftaran.Login;
import java.rmi.*;
import javax.ejb.*;

public class LoginManageServlet extends HttpServlet implements SingleThreadModel, HttpSessionListener {
  //Notification that a session was created
  public void sessionCreated(HttpSessionEvent se) {
    HttpSession session = se.getSession();
  }
  //Notification that a session was invalidated
  public void sessionDestroyed(HttpSessionEvent se) {
    HttpSession session = se.getSession();
    cleanUp(session);
  }

  private synchronized void cleanUp(HttpSession session) {
      UserInfo1 record = (UserInfo1)session.getAttribute("remoteRef");

 try {
          if (record != null) {
            UserRepository.updateTimeoutUser(record.getUserId());
            //UserRepository.destroyUser(record.getUserId());
          }
  }
      catch (Exception ex) {
        ex.printStackTrace();
      }
 }
}
