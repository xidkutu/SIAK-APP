package cache;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class CacheListenerServlet extends HttpServlet implements Filter {
  private FilterConfig filterConfig;
  //Handle the passed-in FilterConfig
  public void init(FilterConfig filterConfig) {
    this.filterConfig = filterConfig;
  }
  //Process the request/response pair
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) {
    try {
      //System.out.println("NO CACHE");
      HttpServletResponse resp = (HttpServletResponse) response;
      filterChain.doFilter(request, resp);
    }
    catch(ServletException sx) {
      filterConfig.getServletContext().log(sx.getMessage());
    }
    catch(IOException iox) {
      filterConfig.getServletContext().log(iox.getMessage());
    }
  }
  //Clean up resources
  public void destroy() {
  }
}