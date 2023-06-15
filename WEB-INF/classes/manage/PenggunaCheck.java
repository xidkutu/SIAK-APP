/* compiled from JSP: /PenggunaInput.jsp
*
* This code was automatically generated at 6:44:39 PM on May 4, 2004
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
import javax.naming.*; //[ /PenggunaInput.jsp; Line: 1]
import javax.rmi.*; //[ /PenggunaInput.jsp; Line: 1]
import java.util.*; //[ /PenggunaInput.jsp; Line: 1]
import pendaftaran.*; //[ /PenggunaInput.jsp; Line: 1]
import com.db.connection.ServiceController; //[ /PenggunaInput.jsp; Line: 1]


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
* This code was automatically generated at 6:44:39 PM on May 4, 2004
* by weblogic.servlet.jsp.Jsp2Java -- do not edit.
*
* Copyright (c) 2004 by BEA Systems, Inc. All Rights Reserved.
*/
public final class PenggunaCheck
extends
weblogic.servlet.jsp.JspBase
implements weblogic.servlet.jsp.StaleIndicator
{

    //[ /PenggunaInput.jsp; Line: 3]
    String [] data = {"nama_lgkp","nip_pguna","tmpt_lhr","no_akta_lh_dd", //[ /PenggunaInput.jsp; Line: 4]
        "no_akta_lh_mm","no_akta_lh_yy","jenis_klmin","pgt", //[ /PenggunaInput.jsp; Line: 5]
        "gol_pguna","jabatan","nama_ktr","alamat_ktr","tlp_ktr" //[ /PenggunaInput.jsp; Line: 6]
    }; //[ /PenggunaInput.jsp; Line: 7]
    //[ /PenggunaInput.jsp; Line: 8]
    Vector v = null; //[ /PenggunaInput.jsp; Line: 9]
    ServiceController factory=null; //[ /PenggunaInput.jsp; Line: 10]
    UserInfo1 record = null; //[ /PenggunaInput.jsp; Line: 11]
    Login remote; //[ /PenggunaInput.jsp; Line: 12]
    LoginHome home=null; //[ /PenggunaInput.jsp; Line: 13]
    String sim,kel,userId; //[ /PenggunaInput.jsp; Line: 14]
    boolean b = false; //[ /PenggunaInput.jsp; Line: 15]
    //[ /PenggunaInput.jsp; Line: 16]
    // StaleIndicator interface
    public boolean _isStale() {
        weblogic.servlet.jsp.StaleChecker sci =(weblogic.servlet.jsp.StaleChecker)(getServletConfig().getServletContext());
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/PenggunaInput.jsp", 1083214231375L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }

    public static boolean _staticIsStale(weblogic.servlet.jsp.StaleChecker sci) {
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/PenggunaInput.jsp", 1083214231375L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }




    public void _jspService(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws java.io.IOException, javax.servlet.ServletException
    {

        // declare and set well-known variables:
       // javax.servlet.ServletConfig config = getServletConfig();
      //  javax.servlet.ServletContext application = config.getServletContext();
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
            out.print("\r\n\r\n");
            //[ /PenggunaInput.jsp; Line: 18]
            try //[ /PenggunaInput.jsp; Line: 19]
            { //[ /PenggunaInput.jsp; Line: 20]
                record=(UserInfo1)session.getAttribute("remoteRef"); //[ /PenggunaInput.jsp; Line: 21]
                //[ /PenggunaInput.jsp; Line: 22]
                if(record != null) //[ /PenggunaInput.jsp; Line: 23]
                { //[ /PenggunaInput.jsp; Line: 24]
                    //[ /PenggunaInput.jsp; Line: 25]
                    factory=ServiceController.getInstance(); //[ /PenggunaInput.jsp; Line: 26]
                    v = new Vector(); //[ /PenggunaInput.jsp; Line: 27]
                    //[ /PenggunaInput.jsp; Line: 28]
                    userId = record.getUserId(); //[ /PenggunaInput.jsp; Line: 29]
                    //[ /PenggunaInput.jsp; Line: 30]
                    sim = new String("DAFTAR"); //[ /PenggunaInput.jsp; Line: 31]
                    kel = new String("KELUAR"); //[ /PenggunaInput.jsp; Line: 32]
                    out.print("\r\n\r\n");
                    //[ /PenggunaInput.jsp; Line: 35]
                    try //[ /PenggunaInput.jsp; Line: 36]
                    { //[ /PenggunaInput.jsp; Line: 37]
                        if(request.getParameter("sim") != null) //[ /PenggunaInput.jsp; Line: 38]
                        { //[ /PenggunaInput.jsp; Line: 39]
                            if(request.getParameter("sim").equals(sim)) //[ /PenggunaInput.jsp; Line: 40]
                            { //[ /PenggunaInput.jsp; Line: 41]
                                for(int i=0; i < data.length;i++) //[ /PenggunaInput.jsp; Line: 42]
                                { //[ /PenggunaInput.jsp; Line: 43]
                                    if(request.getParameter(data[i]) != null) //[ /PenggunaInput.jsp; Line: 44]
                                    { //[ /PenggunaInput.jsp; Line: 45]
                                        v.addElement((Object)request.getParameter(data[i])); //[ /PenggunaInput.jsp; Line: 46]
                                    } //[ /PenggunaInput.jsp; Line: 47]
                                    else //[ /PenggunaInput.jsp; Line: 48]
                                    { //[ /PenggunaInput.jsp; Line: 49]
                                        v.addElement((Object)"0"); //[ /PenggunaInput.jsp; Line: 50]
                                    } //[ /PenggunaInput.jsp; Line: 51]
                                } //[ /PenggunaInput.jsp; Line: 52]
                                //[ /PenggunaInput.jsp; Line: 53]
                                v.addElement((Object)userId); //[ /PenggunaInput.jsp; Line: 54]
                                //[ /PenggunaInput.jsp; Line: 55]
                                try //[ /PenggunaInput.jsp; Line: 56]
                                { //[ /PenggunaInput.jsp; Line: 57]
                                    home = (LoginHome)factory.lookup("Login",LoginHome.class); //[ /PenggunaInput.jsp; Line: 58]
                                    //[ /PenggunaInput.jsp; Line: 59]
                                    if(home != null) //[ /PenggunaInput.jsp; Line: 60]
                                    { //[ /PenggunaInput.jsp; Line: 61]
                                        remote = home.create(); //[ /PenggunaInput.jsp; Line: 62]
                                        b = remote.insertUserReg(v); //[ /PenggunaInput.jsp; Line: 63]
                                    } //[ /PenggunaInput.jsp; Line: 64]
                                    if(b == true) //[ /PenggunaInput.jsp; Line: 65]
                                    { //[ /PenggunaInput.jsp; Line: 66]
                                        //[ /PenggunaInput.jsp; Line: 66]
                                        out.print("\r\n               ");
                                        if (true) { //forwarding request //[ /PenggunaInput.jsp; Line: 67]
                                            out.clear(); // clear current output buffer //[ /PenggunaInput.jsp; Line: 67]
                                            String __thePage =  //[ /PenggunaInput.jsp; Line: 67]
                                            //[ /PenggunaInput.jsp; Line: 67]
                                            "ShowReg.jsp"; //[ /PenggunaInput.jsp; Line: 67]
                                            pageContext.forward(__thePage); //[ /PenggunaInput.jsp; Line: 67]
                                            return; //[ /PenggunaInput.jsp; Line: 67]
                                        } //[ /PenggunaInput.jsp; Line: 67]
                                        out.print("\r\n           ");
                                    } //[ /PenggunaInput.jsp; Line: 68]
                                    else //[ /PenggunaInput.jsp; Line: 69]
                                    { //[ /PenggunaInput.jsp; Line: 70]
                                        response.sendRedirect("User_Reg_Error.jsp"); //[ /PenggunaInput.jsp; Line: 71]
                                    } //[ /PenggunaInput.jsp; Line: 72]
                                } //[ /PenggunaInput.jsp; Line: 73]
                                catch(Exception reg) //[ /PenggunaInput.jsp; Line: 74]
                                { //[ /PenggunaInput.jsp; Line: 75]
                                    System.out.print("Exception in User_Reg insertion = " + reg); //[ /PenggunaInput.jsp; Line: 76]
                                } //[ /PenggunaInput.jsp; Line: 77]
                                //[ /PenggunaInput.jsp; Line: 78]
                            } //[ /PenggunaInput.jsp; Line: 79]
                        } //[ /PenggunaInput.jsp; Line: 80]
                        else if(request.getParameter("kel") != null) //[ /PenggunaInput.jsp; Line: 81]
                        { //[ /PenggunaInput.jsp; Line: 82]
                            if(request.getParameter("kel").equals(kel)) //[ /PenggunaInput.jsp; Line: 83]
                            { //[ /PenggunaInput.jsp; Line: 84]
                                //[ /PenggunaInput.jsp; Line: 84]
                                out.print("\r\n         ");
                                if (true) { //forwarding request //[ /PenggunaInput.jsp; Line: 85]
                                    out.clear(); // clear current output buffer //[ /PenggunaInput.jsp; Line: 85]
                                    String __thePage =  //[ /PenggunaInput.jsp; Line: 85]
                                    //[ /PenggunaInput.jsp; Line: 85]
                                    "index.jsp"; //[ /PenggunaInput.jsp; Line: 85]
                                    pageContext.forward(__thePage); //[ /PenggunaInput.jsp; Line: 85]
                                    return; //[ /PenggunaInput.jsp; Line: 85]
                                } //[ /PenggunaInput.jsp; Line: 85]
                                out.print("\r\n");
                            } //[ /PenggunaInput.jsp; Line: 86]
                        } //[ /PenggunaInput.jsp; Line: 87]
                    } //[ /PenggunaInput.jsp; Line: 88]
                    catch(Exception gen) //[ /PenggunaInput.jsp; Line: 89]
                    { //[ /PenggunaInput.jsp; Line: 90]
                        out.println("Exception = " + gen); //[ /PenggunaInput.jsp; Line: 91]
                    } //[ /PenggunaInput.jsp; Line: 92]
                } //[ /PenggunaInput.jsp; Line: 93]
                else //[ /PenggunaInput.jsp; Line: 94]
                { //[ /PenggunaInput.jsp; Line: 95]
                    response.sendRedirect("index.jsp"); //[ /PenggunaInput.jsp; Line: 96]
                } //[ /PenggunaInput.jsp; Line: 97]
            } //[ /PenggunaInput.jsp; Line: 98]
            catch(Exception e) //[ /PenggunaInput.jsp; Line: 99]
            { //[ /PenggunaInput.jsp; Line: 100]
                e.printStackTrace(); //[ /PenggunaInput.jsp; Line: 101]
            } //[ /PenggunaInput.jsp; Line: 102]
            //[ /PenggunaInput.jsp; Line: 103]
            out.print("\r\n<!--Mark1-->\r\n");
        } catch (Throwable __ee) {
            while (out != null && out != _originalOut) out = pageContext.popBody();
            ((weblogic.servlet.jsp.PageContextImpl)pageContext).handlePageException((Throwable)__ee);
        }


        //before final close brace...
    }


}
