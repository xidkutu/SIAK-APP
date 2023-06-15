package ulang;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import pendaftaran.*;
import ulang.*;
import com.db.connection.*;
import java.rmi.*;
import javax.ejb.*;
import javax.naming.*;
import java.sql.*;

public class OtorisasiServlet extends HttpServlet {
  private String otorisasiResponse = "Otorisasi Gagal!";
  //Initialize global variables
  public void init() throws ServletException {
  }
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    RequestDispatcher dispatch = null;
    ServiceController factory = null;

    int step = Integer.parseInt(request.getParameter("step"));
    String file = request.getParameter("file");
    String cancel = request.getParameter("cancel");
    System.out.println("step="+step);

    if ((cancel!=null) && (cancel.equals("true"))) {
      removeAtt(session);
      return;
    }

    String url = response.encodeURL("step"+step+".jsp?"+request.getQueryString());

    UserInfo1 operator = (UserInfo1) session.getAttribute("remoteRef");

    System.out.println("operator.getDivision()=" + operator.getDivision());
    System.out.println("operator.getLevelId()=" + operator.getLevelId());
    System.out.println("operator.getModRefFile()=" +
                        operator.getModRefFile());
    System.out.println("operator.getModuleCode()=" +
                        operator.getModuleCode());
    System.out.println("operator.getUserId()=" + operator.getUserId());
    System.out.println("operator.getUserStatus()=" +
                        operator.getUserStatus());

    Login supervisorHome=null;
    UserInfo1 supervisor1= (UserInfo1) session.getAttribute("remoteSupv");

    try {
      factory = ServiceController.getInstance();
      if (supervisor1==null) {
        LoginHome home = (LoginHome) factory.lookup("Login", LoginHome.class);
        supervisorHome = home.create();

      String login = request.getParameter("login");
      String pwd = request.getParameter("pwd");

       UserInfo1 record=(UserInfo1)supervisorHome .validate(login,pwd);
        session.setAttribute("remoteSupv", record);
      }
    }
    catch (Exception ex3) {
      ex3.printStackTrace();
      url = url + "&error="+otorisasiResponse;
      System.out.println(url);
      response.sendRedirect(url);
    }


    if (step == 1) {
      String login = request.getParameter("login");
      String pwd = request.getParameter("pwd");

      System.out.println("login="+login);
      System.out.println("pwd="+pwd);

      if ( (login != null) && (!login.trim().equals("")) && (pwd != null) && (!pwd.trim().equals(""))) {
        System.out.println("sebelum validate");

        UserInfo1 supervisor =(UserInfo1)supervisorHome.validate(login,pwd);

        System.out.println("sesudah validate");

        if (supervisor!=null) {
          System.out.println("supervisor.getDivision()=" + supervisor.getDivision());
          System.out.println("supervisor.getLevelId()=" + supervisor.getLevelId());
          System.out.println("supervisor.getModRefFile()=" +
                             supervisor.getModRefFile());
          System.out.println("supervisor.getModuleCode()=" +
                             supervisor.getModuleCode());
          System.out.println("supervisor.getUserId()=" + supervisor.getUserId());
          System.out.println("supervisor.getUserStatus()=" +
                             supervisor.getUserStatus());

          if(supervisor.getAuthKey()!=null && !supervisor.getAuthKey().trim().equals("")) {
            String id = session.getId();
            System.out.println("id="+id);

            session.setAttribute("idAuthSupv", id);
            String pin = (id.substring( (id.length() - 10) + 1, id.length())).trim();

            session.setAttribute("pinAuthSupv", pin);
            session.setAttribute("authkeyAuthSupv", supervisor.getAuthKey());
            session.setAttribute("file", file);
            session.setAttribute("authDate", getDate());
            System.out.println(session.getAttribute("authDate"));

            System.out.println("pinAuthSupv="+pin);
            System.out.println("authkeyAuthSupv="+supervisor.getAuthKey());
            System.out.println("file="+file);

            dispatch = request.getRequestDispatcher("step2.jsp");
          }
        } else {
          //gagal otorisasi
          url = url + "&error="+otorisasiResponse;
          System.out.println(url);
          response.sendRedirect(url);
        }
      }
    }
    else if (step == 2) {

      String pin = request.getParameter("ulang_pin");
      String auth = request.getParameter("no_autoriz");

      System.out.println("ulang_pin="+pin);
      System.out.println("no_autoriz="+auth);

      String authkey = (String)session.getAttribute("authkeyAuthSupv");
      String pin1 = (String)session.getAttribute("pinAuthSupv");

      System.out.println("authkeyAuthSupv="+authkey);
      System.out.println("pinAuthSupv="+pin1);

      if(auth.trim().equals(authkey) && pin.trim().equals(pin1)) {
        OtorisasiCetakUlang supv = (OtorisasiCetakUlang) session.getAttribute("remoteOto");
        if (supv==null) {
          try {
            System.out.println("lookup");
            OtorisasiCetakUlangHome supvHome = (OtorisasiCetakUlangHome) factory.lookup(
                "OtorisasiCetakUlang", OtorisasiCetakUlangHome.class);
            System.out.println("lookup ok");
            supv = supvHome.create();
            System.out.println("create ok");
            session.setAttribute("remoteOto", supv);
          }
          catch (Exception ex2) {
            ex2.printStackTrace();
            url = url + "&flag=1&error="+otorisasiResponse;
            System.out.println(url);
            response.sendRedirect(url);
          }
        }
        UserInfo1 supervisor = operator;
        try {
          System.out.println("create key");
          String authKey = supv.createOtorisasiKey(operator, supervisor);
          System.out.println("create key ok");
          session.setAttribute("authKey4CetakUlang", authKey);
          System.out.println("authKey4CetakUlang="+authKey);
        }
        catch (Exception ex1) {
          ex1.printStackTrace();
          url = url + "&flag=1&error="+otorisasiResponse;
          System.out.println(url);
          response.sendRedirect(url);
        }

        dispatch = request.getRequestDispatcher(file);
      } else {
        //gagal otorisasi
        url = url + "&flag=1&error="+otorisasiResponse;
        System.out.println(url);
        response.sendRedirect(url);
      }
    }
    dispatch.forward(request, response);
  }
    //Clean up resources
  public void destroy() {
  }

  private void removeAtt(HttpSession session) {
      session.removeAttribute("remoteSupv");
      session.removeAttribute("remoteOto");
      session.removeAttribute("authKey4CetakUlang");
      session.removeAttribute("pinAuthSupv");
      session.removeAttribute("authkeyAuthSupv");
      session.removeAttribute("file");
      System.out.println(" remove "+session.getAttribute("authDate"));
      session.removeAttribute("authDate");
    }

    private java.util.Date getDate() {
      System.out.println("test");
      Calendar cal = java.util.Calendar.getInstance();
      Connection conn = null;
      Statement st = null;
      try {
        conn = ConnectorDB.getConnection();
        st = conn.createStatement();
        ResultSet rs = st.executeQuery(
            "SELECT to_char(SYSDATE, 'dd-mm-yyyy hh24:mi:ss') FROM DUAL");

        cal = null;

        if (rs.next()) {
          String temp = rs.getString(1);
          System.out.println("temp="+temp);
          java.util.StringTokenizer st1 = new java.util.StringTokenizer(temp);

          int year = Integer.parseInt(st1.nextToken("-").trim());
          System.out.println("year="+year);
          int month = Integer.parseInt(st1.nextToken("-").trim());
          System.out.println("month="+month);
          int date = Integer.parseInt(st1.nextToken("-").trim());
          System.out.println("date="+date);
          int hour = Integer.parseInt(st1.nextToken(":").trim());
          System.out.println("hour="+hour);
          int minute = Integer.parseInt(st1.nextToken(":").trim());
          System.out.println("minute="+minute);
          int second = Integer.parseInt(st1.nextToken(":").trim());
          System.out.println("second="+second);

          cal.set(year, month, date, hour, minute, second);
        }
      }
      catch (Exception ex) {
      } finally {
        try {
          st.close();
          st = null;
        }
        catch (Exception ex1) {
        }
        try {
          conn.close();
          conn = null;
        }
        catch (Exception ex2) {
        }
      }
      return cal.getTime();
    }

}
