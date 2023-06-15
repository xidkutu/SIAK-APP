/* compiled from JSP: /pinauthen
*
* This code was automatically generated at 6:32:04 PM on May 4, 2004
* by weblogic.servlet.jsp.Jsp2Java -- do not edit.
*/

package manage;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

// User imports
import javax.naming.*; //[ /pinauthen; Line: 1]
import javax.rmi.*; //[ /pinauthen; Line: 1]
import java.util.*; //[ /pinauthen; Line: 1]
import pendaftaran.*; //[ /pinauthen; Line: 1]


// built-in init parameters:
// boolean             _verbose -- wants debugging

// Well-known variables:
// JspWriter out                  -- to write to the browser
// HttpServletRequest  request    -- the request object.
// HttpServletResponse response   -- the response object.
// PageContext pageContext        -- the page context for this JSP
// HttpSession session            -- the session object for the client (if any)
// ServletContext application     -- The servlet (application) context
// ServletConfig config           -- The ServletConfig for this JSP
// Object page                    -- the instance of this page's implementation class (i.e., 'this')

/**
* This code was automatically generated at 6:32:04 PM on May 4, 2004
* by weblogic.servlet.jsp.Jsp2Java -- do not edit.
*
* Copyright (c) 2004 by BEA Systems, Inc. All Rights Reserved.
*/
public final class Pinauthen
extends
weblogic.servlet.jsp.JspBase
implements weblogic.servlet.jsp.StaleIndicator
{

    // StaleIndicator interface
    public boolean _isStale() {
        weblogic.servlet.jsp.StaleChecker sci =(weblogic.servlet.jsp.StaleChecker)(getServletConfig().getServletContext());
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/pinauthen", 1083665900343L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }

    public static boolean _staticIsStale(weblogic.servlet.jsp.StaleChecker sci) {
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/pinauthen", 1083665900343L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }


    public void _jspService(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws java.io.IOException, javax.servlet.ServletException
    {

        // declare and set well-known variables:
        //javax.servlet.ServletConfig config = getServletConfig();
//        javax.servlet.ServletContext application = config.getServletContext();
        javax.servlet.jsp.tagext.Tag _activeTag = null;
        // variables for Tag extension protocol
        Object page = this;
        javax.servlet.jsp.JspWriter out;
        javax.servlet.jsp.PageContext pageContext =
        javax.servlet.jsp.JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);

        out = pageContext.getOut();
        JspWriter _originalOut = out;

        javax.servlet.http.HttpSession session = request.getSession(true);


        try { // error page try block

            out.print("\r\n\r\n");
            //[ /pinauthen; Line: 3]
            Vector v = null; //[ /pinauthen; Line: 4]
            String sim,kel,auth=null,authkey=null,pin,pin1; //[ /pinauthen; Line: 5]
            boolean b = false; //[ /pinauthen; Line: 6]
            UserInfo1 record=null; //[ /pinauthen; Line: 7]
            out.print("\r\n\r\n");
            //[ /pinauthen; Line: 10]
            try //[ /pinauthen; Line: 11]
            { //[ /pinauthen; Line: 12]
                if(session.getAttribute("remoteRef")!=null) //[ /pinauthen; Line: 13]
                { //[ /pinauthen; Line: 14]
                    auth=request.getParameter("no_autoriz"); //[ /pinauthen; Line: 15]
                    pin=request.getParameter("ulang_pin"); //[ /pinauthen; Line: 16]
                    //[ /pinauthen; Line: 17]
                    authkey = (String)session.getAttribute("authkey"); //[ /pinauthen; Line: 18]
                    pin1 = (String)session.getAttribute("pin"); //[ /pinauthen; Line: 19]
                    //[ /pinauthen; Line: 20]
                    if(auth.trim().equals(authkey) && pin.trim().equals(pin1)) //[ /pinauthen; Line: 21]
                    { //[ /pinauthen; Line: 22]
                        String file = (String)session.getAttribute("file"); //[ /pinauthen; Line: 23]
                        session.removeAttribute("authkey"); //[ /pinauthen; Line: 24]
                        session.removeAttribute("pin"); //[ /pinauthen; Line: 25]
                        session.removeAttribute("file"); //[ /pinauthen; Line: 26]
                        record=(UserInfo1)session.getAttribute("remoteRef"); //[ /pinauthen; Line: 27]
                        record.setAuth_key(authkey); //[ /pinauthen; Line: 28]
                        record.setPin(pin1); //[ /pinauthen; Line: 29]
                        session.setAttribute("remoteRef", record); //[ /pinauthen; Line: 30]
if(record.getDivision() != null) //[ /LoginValidity.jsp; Line: 49]
             { //[ /LoginValidity.jsp; Line: 50]
    if (UserRepository.getUserStatus(record.getUserId()).equals("1"))
               {
                 session.removeAttribute("remoteRef");
                 session.invalidate();
                 response.sendRedirect("index.jsp?error=5");
               }
            else
                {
                  if  (UserRepository.addUser(record.getUserId(),request.getRemoteAddr()))
                        {
                          response.addCookie(new Cookie("uid",record.getUserId()));
                          response.sendRedirect(file); //[ /pinauthen; Line: 31]
                        }
                        else
                        {
                          session.removeAttribute("remoteRef");
                          session.invalidate();
                          response.sendRedirect("index.jsp?error=5");
                        }
                       //application.setAttribute(record.getUserId(),record); //[ /LoginValidity.jsp; Line: 51]
                       //application.setAttribute(record.getUserId()+"*status*", "1"); //[ /LoginValidity.jsp; Line: 52]
                }
                     } //[ /LoginValidity.jsp; Line: 53]
               } //[ /pinauthen; Line: 32]
                    else //[ /pinauthen; Line: 33]
                    { //[ /pinauthen; Line: 34]
                      response.sendRedirect("pinview?error=7"); //[ /pinauthen; Line: 35]
                    } //[ /pinauthen; Line: 36]
                } //[ /pinauthen; Line: 37]
                else //[ /pinauthen; Line: 38]
                { //[ /pinauthen; Line: 39]
                    response.sendRedirect("index.jsp"); //[ /pinauthen; Line: 40]
                } //[ /pinauthen; Line: 41]
            } //[ /pinauthen; Line: 42]
            catch(Exception gen) //[ /pinauthen; Line: 43]
            { //[ /pinauthen; Line: 44]
                response.sendRedirect("index.jsp"); //[ /pinauthen; Line: 45]
                gen.printStackTrace(); //[ /pinauthen; Line: 46]
            } //[ /pinauthen; Line: 47]
            finally{ //[ /pinauthen; Line: 48]
                pin1=""; //[ /pinauthen; Line: 49]
                authkey=""; //[ /pinauthen; Line: 50]
                pin=""; //[ /pinauthen; Line: 51]
                auth=""; //[ /pinauthen; Line: 52]
            } //[ /pinauthen; Line: 53]
            out.print("\r\n\r\n");
        } catch (Throwable __ee) {
            while (out != null && out != _originalOut) out = pageContext.popBody();
            ((weblogic.servlet.jsp.PageContextImpl)pageContext).handlePageException((Throwable)__ee);
        }


        //before final close brace...
    }


}
