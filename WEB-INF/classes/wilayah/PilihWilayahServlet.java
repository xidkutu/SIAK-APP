package wilayah;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import pendaftaran.LoginBean;

public class PilihWilayahServlet extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html";
  //Initialize global variables
  public void init() throws ServletException {
  }
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    String prefix="";
    String screen_code = request.getParameter("screen_code");
    String level = request.getParameter("level");
    String route = request.getParameter("route");
    String pick_year = request.getParameter("pick_year");
    String tahun = request.getParameter("tahun");

    if   (request.getParameter("prefix")!=null)
    prefix=request.getParameter("prefix");

    String path = null;
    ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
          Locale.getDefault());

    if (route!=null) {
        if (level==null) {
          throw new ServletException("No Destination");
        }

        if (level.equals("3")) {
          path = "stat_router.jsp";
        } else if (level.equals("4")) {
          path = "stat_router2.jsp";
        }
         else if(level.equals("2"))
                 {
          path = "stat_router0.jsp";
         }

        String title = res.getString("title"+screen_code);
        request.setAttribute("title",title);

        if ((pick_year!=null) && (pick_year.equals("true"))) {
          String nprop = request.getParameter("nprop");
          String nkab = request.getParameter("nkab");
          String nkec = request.getParameter("nkec");
          String naprop = request.getParameter("naprop");
          String nakab = request.getParameter("nakab");
          String nakec = request.getParameter("nakec");
          String cetakpdf = request.getParameter("cetakpdf");

          if (prefix!=null && !prefix.trim().equals("")) prefix="&prefix="+prefix;
          String query = "no_prop="+nprop+"&no_kab="+nkab+"&no_kec="+nkec+"&nama_prop="+naprop+"&nama_kab="+nakab+"&nama_kec="+nakec+"&tahun="+tahun+"&pick_year="+pick_year+prefix+"&cetakpdf="+cetakpdf;
          path = path+"?"+query;
        }
    } else {
      path = res.getString("screen"+screen_code);
    }
    if (path==null)
      throw new ServletException("No Destination");
    request.getRequestDispatcher(response.encodeURL(path)).forward(request, response);
  }
  //Clean up resources
  public void destroy() {
  }
}
