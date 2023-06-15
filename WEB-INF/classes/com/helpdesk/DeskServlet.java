package com.helpdesk;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import pendaftaran.*;
import com.db.connection.*;

public class DeskServlet extends HttpServlet {
String  catgry=null, prio= null,pr_desc = null,sample = null,note=null;
 private static final String CONTENT_TYPE = "text/html";
  //Initialize global variables
  public void init() throws ServletException {
  }
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
 boolean _flag;
 HelpDeskHome home = null;
 HelpDesk remote = null;
 ServiceController factory = null;
 HttpSession session = null;
 UserInfo1 record = null;
 session = request.getSession();
 record = (UserInfo1) session.getAttribute("remoteRef");
 catgry= request.getParameter("catgry");
 prio= request.getParameter("prio");
 pr_desc = request.getParameter("pr_desc");
 sample = request.getParameter("sample");
 note=request.getParameter("note");
 factory = ServiceController.getInstance();
 home = (HelpDeskHome) factory.lookup("HelpDesk", HelpDeskHome.class);
 remote = home.create();
 _flag=remote.postMessage(record.getUserId(), record.getNoProp(),
                    record.getNoKab(), record.getNoKec(),
                    record.getModuleCode(), prio,catgry,record.getToday(), pr_desc,
                    sample,note);
if (_flag)
response.sendRedirect("form_problm.jsp?action=Y");
else
response.sendRedirect("form_problm.jsp?action=N");
}
catch (Exception err)
{
response.sendRedirect("form_problm.jsp?action=N");
}

}
 //Clean up resources
  public void destroy() {
  }
}
