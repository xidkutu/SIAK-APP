/* compiled from JSP: /Pengguna_User.jsp
*
* This code was automatically generated at 6:41:34 PM on May 4, 2004
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
import javax.naming.*; //[ /Pengguna_User.jsp; Line: 1]
import javax.rmi.*; //[ /Pengguna_User.jsp; Line: 1]
import java.util.*; //[ /Pengguna_User.jsp; Line: 1]
import pendaftaran.*; //[ /Pengguna_User.jsp; Line: 1]


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
* This code was automatically generated at 6:41:34 PM on May 4, 2004
* by weblogic.servlet.jsp.Jsp2Java -- do not edit.
*
* Copyright (c) 2004 by BEA Systems, Inc. All Rights Reserved.
*/
public final class Penggunauser
extends
weblogic.servlet.jsp.JspBase
implements weblogic.servlet.jsp.StaleIndicator
{

    //[ /Pengguna_User.jsp; Line: 3]
    String no_kel,nama_kel,select,id1=null; //[ /Pengguna_User.jsp; Line: 4]
    UserInfo1 record = null; //[ /Pengguna_User.jsp; Line: 5]
    Vector v = null; //[ /Pengguna_User.jsp; Line: 6]
    int level=0; //[ /Pengguna_User.jsp; Line: 7]
    //[ /Pengguna_User.jsp; Line: 8]
    // StaleIndicator interface
    public boolean _isStale() {
        weblogic.servlet.jsp.StaleChecker sci =(weblogic.servlet.jsp.StaleChecker)(getServletConfig().getServletContext());
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/Pengguna_User.jsp", 1082780616265L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }

    public static boolean _staticIsStale(weblogic.servlet.jsp.StaleChecker sci) {
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
        //if (sci.isResourceStale("/Pengguna_User.jsp", 1082780616265L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }




    public void _jspService(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws java.io.IOException, javax.servlet.ServletException
    {

        // declare and set well-known variables:
  //      javax.servlet.ServletConfig config = getServletConfig();
   //     javax.servlet.ServletContext application = config.getServletContext();
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
            //[ /Pengguna_User.jsp; Line: 10]
            try //[ /Pengguna_User.jsp; Line: 11]
            { //[ /Pengguna_User.jsp; Line: 12]
                record=(UserInfo1)session.getAttribute("remoteRef"); //[ /Pengguna_User.jsp; Line: 13]
                //[ /Pengguna_User.jsp; Line: 14]
                if(record != null) //[ /Pengguna_User.jsp; Line: 15]
                { //[ /Pengguna_User.jsp; Line: 16]
                    level = Integer.parseInt( record.getLevelId() ); //[ /Pengguna_User.jsp; Line: 17]
                    out.print("\r\n<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML><HEAD>\r\n<TITLE>adminduk SIAK online</TITLE>\r\n<META http-equiv=Content-Type content=\"text/html; charset=windows-1252\">\r\n<LINK href=\"Templates/s.css\" rel=stylesheet>\r\n<SCRIPT language=JavaScript src=\"scripts/Pengguna_User.js\">\r\n</SCRIPT>\r\n<META content=\"MSHTML 6.00.2800.1141\" name=GENERATOR>\r\n</HEAD>\r\n<BODY leftMargin=0 topMargin=0 MARGINHEIGHT=\"0\" MARGINWIDTH=\"0\" bgColor=#93BEE2 text=\"#000000\" onload='window.history.forward(1)'>\r\n<form name=\"form1\" method=\"post\" action=\"penggunacheck\">\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tr>\r\n      <td background=\"images/v_bg_header.gif\">");
                    { /* include block for 'top.html' */ //[ /Pengguna_User.jsp; Line: 32]
                        String __thePage =  //[ /Pengguna_User.jsp; Line: 32]
                        //[ /Pengguna_User.jsp; Line: 32]
                        "top.html"; //[ /Pengguna_User.jsp; Line: 32]
                        pageContext.include(__thePage); //[ /Pengguna_User.jsp; Line: 32]
                    } /* end include block for 'top.html' */ //[ /Pengguna_User.jsp; Line: 32]
                    out.print("</td>\r\n  </tr>\r\n  <tr>\r\n    <td>\r\n      <table width=\"100%\" border=\"0\" cellspacing=\"5\" cellpadding=\"5\">\r\n        <tr>\r\n          <td valign=\"top\">\r\n            <table width=\"625\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n              <tr>\r\n                <td>\r\n                  <table width=\"100%\" border=\"0\" cellspacing=\"3\" cellpadding=\"3\">\r\n                    <tr>\r\n                      <td>\r\n                        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                          <tr>\r\n                            <td height=\"35\">\r\n                              <div align=\"center\"><span class=\"submenu\">Pendaftaran\r\n                                Pengguna/User</span><br>\r\n                                <br>\r\n                              </div>\r\n                            </td>\r\n                          </tr>\r\n                        </table>\r\n                      </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td>\r\n");
                    if(level>1) //[ /Pengguna_User.jsp; Line: 59]
                    { //[ /Pengguna_User.jsp; Line: 60]
                        //[ /Pengguna_User.jsp; Line: 60]
                        out.print("\r\n                        <table width=\"500\" border=\"0\" cellspacing=\"3\" cellpadding=\"2\" align=\"center\">\r\n                          <tr>\r\n                            <td colspan=\"3\" height=\"1\">\r\n                              <div align=\"center\"><img src=\"images/batas_dot.gif\" width=\"461\" height=\"1\"></div>\r\n                            </td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td colspan=\"3\" height=\"25\">\r\n                              <div align=\"center\"><span class=\"subtitle\">Data\r\n                                Wilayah</span></div>\r\n                            </td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td colspan=\"3\" height=\"1\">\r\n                              <div align=\"center\"><img src=\"images/batas_dot.gif\" width=\"461\" height=\"1\"></div>\r\n                            </td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td colspan=\"3\" height=\"10\">");
                        out.print("\r\n                              <table width=\"440\" border=\"0\" cellspacing=\"3\" cellpadding=\"0\" align=\"center\">\r\n                                <tr>\r\n                                  <td>Kode-Nama Provinsi</td>\r\n                                  <td width=\"10\"> :</td>\r\n                                    <td width=\"4\">\r\n                                      <input\r\n                                class=boxdefault size=4 name=no_prop  value=\"\" onFocus=\"this.blur()\" maxlength=\"2\">\r\n                                    </td>\r\n                                    <td width=\"80\">\r\n                                      <input\r\n                                class=boxdefault size=22 name=nama_prop value=\"\" maxlength=\"60\" onFocus=\"this.blur()\">\r\n                                    </td>\r\n                                </tr>\r\n");
                        //[ /Pengguna_User.jsp; Line: 93]
                        if(record.getNoProp() != null && record.getNamaProp() != null) //[ /Pengguna_User.jsp; Line: 94]
                        { //[ /Pengguna_User.jsp; Line: 95]
                            //[ /Pengguna_User.jsp; Line: 95]
                            out.print("\r\n    <script language=\"JavaScript\">\r\n\r\n      form1.no_prop.value=\"");
                            out.print(String.valueOf(record.getNoProp()));  //[ /Pengguna_User.jsp; Line: 98]
                            out.print("\"\r\n      form1.nama_prop.value=\"");
                            out.print(String.valueOf(record.getNamaProp()));  //[ /Pengguna_User.jsp; Line: 99]
                            out.print("\"\r\n\r\n    </script>\r\n\r\n");
                        } //[ /Pengguna_User.jsp; Line: 103]
                        out.print("\r\n\r\n");
                        if(level>=3) //[ /Pengguna_User.jsp; Line: 106]
                        { //[ /Pengguna_User.jsp; Line: 107]
                            //[ /Pengguna_User.jsp; Line: 107]
                            out.print("\r\n                                <tr>\r\n                                  <td>Kode-Nama Kabupaten/Kota</td>\r\n                                  <td width=\"10\"> :</td>\r\n                                    <td width=\"4\">\r\n                                      <input\r\n                                class=boxdefault size=4 name=no_kab value=\"\" onFocus=\"this.blur()\" maxlength=\"2\">\r\n                                    </td>\r\n                                    <td width=\"80\">\r\n                                      <input\r\n                                class=boxdefault size=22 name=nama_kab value=\"\" onFocus=\"this.blur()\" maxlength=\"60\">\r\n                                    </td>\r\n                                </tr>\r\n");
                            //[ /Pengguna_User.jsp; Line: 120]
                            if(record.getNoKab() != null && record.getNamaKab() != null) //[ /Pengguna_User.jsp; Line: 121]
                            { //[ /Pengguna_User.jsp; Line: 122]
                                //[ /Pengguna_User.jsp; Line: 122]
                                out.print("\r\n    <script language=\"JavaScript\">\r\n\r\n      form1.no_kab.value=\"");
                                out.print(String.valueOf(record.getNoKab()));  //[ /Pengguna_User.jsp; Line: 125]
                                out.print("\"\r\n      form1.nama_kab.value=\"");
                                out.print(String.valueOf(record.getNamaKab()));  //[ /Pengguna_User.jsp; Line: 126]
                                out.print("\"\r\n\r\n    </script>\r\n\r\n");
                            } //[ /Pengguna_User.jsp; Line: 130]
                            //[ /Pengguna_User.jsp; Line: 130]
                            out.print("\r\n");
                        } //[ /Pengguna_User.jsp; Line: 131]
                        if(level==4) //[ /Pengguna_User.jsp; Line: 132]
                        { //[ /Pengguna_User.jsp; Line: 133]
                            //[ /Pengguna_User.jsp; Line: 133]
                            out.print("\r\n                                <tr>\r\n                                  <td>Kode-Nama Kecamatan</td>\r\n                                  <td width=\"10\"> :</td>\r\n                                    <td width=\"4\">\r\n                                      <input\r\n                                class=boxdefault size=4 name=no_kec value=\"\" onFocus=\"this.blur()\" maxlength=\"2\">\r\n                                    </td>\r\n                                    <td width=\"80\">\r\n                                      <input\r\n                                class=boxdefault size=22 name=nama_kec  value=\"\" onFocus=\"this.blur()\" maxlength=\"60\">\r\n                                    </td>\r\n");
                            //[ /Pengguna_User.jsp; Line: 145]
                            //[ /Pengguna_User.jsp; Line: 146]
                            if(record.getNoKec() != null && record.getNamaKec() != null) //[ /Pengguna_User.jsp; Line: 147]
                            { //[ /Pengguna_User.jsp; Line: 148]
                                //[ /Pengguna_User.jsp; Line: 148]
                                out.print("\r\n    <script language=\"JavaScript\">\r\n\r\n      form1.no_kec.value=\"");
                                out.print(String.valueOf(record.getNoKec()));  //[ /Pengguna_User.jsp; Line: 151]
                                out.print("\"\r\n      form1.nama_kec.value=\"");
                                out.print(String.valueOf(record.getNamaKec()));  //[ /Pengguna_User.jsp; Line: 152]
                                out.print("\"\r\n\r\n    </script>\r\n\r\n");
                            } //[ /Pengguna_User.jsp; Line: 156]
                            out.print("\r\n\r\n                                </tr>\r\n");
                        } //[ /Pengguna_User.jsp; Line: 160]
                        //[ /Pengguna_User.jsp; Line: 160]
                        out.print("\r\n                              </table>\r\n                              <img src=\"images/dot.gif\" width=\"1\" height=\"10\"></td>\r\n                          </tr>\r\n                        </table>\r\n");
                    } //[ /Pengguna_User.jsp; Line: 165]
                    //[ /Pengguna_User.jsp; Line: 165]
                    out.print("\r\n                      </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td>\r\n                        <table width=\"400\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#CBE0FA\">\r\n                          <tr>\r\n                            <td width=\"5\"><img src=\"images/v_sdt_kr_up.gif\" width=\"5\" height=\"5\"></td>\r\n                            <td height=\"1\"><img src=\"images/dot.gif\" width=\"1\" height=\"1\"></td>\r\n                            <td width=\"5\" height=\"5\"><img src=\"images/v_sdt_kn_up.gif\" width=\"5\" height=\"5\"></td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td>&nbsp;</td>\r\n                            <td>\r\n                                <table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"5\" align=\"center\" class=\"C-BG\">\r\n                                  <tr>\r\n                                    <td class=\"C-Field\" width=\"40%\"> Nama Lengkap<font color=\"#000099\" class=\"asterish\">*</font></td>\r");
                    out.print("\n                                    <td class=\"C-Field\">\r\n                                      <div align=\"center\">:</div>\r\n                                    </td>\r\n                                    <td class=\"C-Field\">\r\n                                      <input\r\n                                class=boxdefault size=30 name=nama_lgkp maxlength=\"60\" onKeyUp=\"return char(form1.nama_lgkp)\">\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\"> Tempat Lahir<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">\r\n                                      <div align=\"center\">:</div>\r\n                                    </td>\r\n                                    <td class=\"C-Field\">\r\n                                      <input\r\n                                class=boxdefault size=22 name=tmpt_lhr maxlength=\"40\"  onKeyUp=\"return c");
                    out.print("har(form1.tmpt_lhr)\">\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\"> Tanggal Lahir<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">\r\n                                      <div align=\"center\">:</div>\r\n                                    </td>\r\n                                    <td class=\"C-Field\">\r\n                                      <table width=\"100\" border=\"0\" cellspacing=\"3\" cellpadding=\"0\">\r\n                                        <tr>\r\n                                          <td>\r\n                                            <input\r\n                                class=boxdefault size=2 name=no_akta_lh_dd maxlength=\"2\" onKeyUp=\"return tab1()\">\r\n                                          </td>\r\n                                          <td>/ </td>\r\n                                          <td>\r\n            ");
                    out.print("                                <input\r\n                                class=boxdefault size=2 name=no_akta_lh_mm maxlength=\"2\" onKeyUp=\"return tab2()\">\r\n                                          </td>\r\n                                          <td>/</td>\r\n                                          <td>\r\n                                            <input\r\n                                class=boxdefault size=4 name=no_akta_lh_yy maxlength=\"4\" onKeyUp=\"return tab3()\">\r\n                                          </td>\r\n                                        </tr>\r\n                                      </table>\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\">Jenis Kelamin<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">:</td>\r\n                                    <td class=\"C-Field\">\r\n                                      ");
                    out.print("<select\r\n                  name=jenis_klmin boxdefault2 class=\"boxdefault\">\r\n                                        <option value=\"0\" selected>-- Pilih Jenis\r\n                                        Kelamin --</option>\r\n                                        <option value=\"1\">1. Laki-laki</option>\r\n                                        <option value=\"2\">2. Perempuan</option>\r\n                                      </select>\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\">Pangkat/Golongan<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">:</td>\r\n                                    <td class=\"C-Field\">\r\n                                      <select name=\"gol\"\r\nonChange=\"form1.gol_pguna.value=this.value;data();jabatan.focus()\">\r\n                                        <option value=\"0\" selected>-Pilih-</option>\r\n        ");
                    out.print("                                <option value=\"Juru Muda\">Ia</option>\r\n                                        <option value=\"Juru Muda Tk. I\">Ib</option>\r\n                                        <option value=\"Juru\">Ic</option>\r\n                                        <option value=\"Juru Tk. I\">Id</option>\r\n                                        <option value=\"Pengatur Muda\">IIa</option>\r\n                                        <option value=\"Pengatur Muda Tk. I\">IIb</option>\r\n                                        <option value=\"Pengatur\">IIc</option>\r\n                                        <option value=\"Pengatur Tk.I\">IId</option>\r\n                                        <option value=\"Penata Muda\">IIIa</option>\r\n                                        <option value=\"Penata Muda Tk. I\">IIIb</option>\r\n                                        <option value=\"Penata\">IIIc</option>\r\n                                        <option value=\"Penata Tk. I\">IIId</option>\r\n                                        <op");
                    out.print("tion value=\"Pembina\">IVa</option>\r\n                                        <option value=\"Pembina Tk. I\">IVb</option>\r\n                                        <option value=\"Pembina Utama Muda\">IVc</option>\r\n                                        <option value=\"Pembina Utama Madya\">IVd</option>\r\n                                        <option value=\"Pembina Utama\">IVe</option>\r\n                                      </select>\r\n                                      <input\r\n                                class=boxdefault size=22 name=gol_pguna maxlength=\"40\" onFocus=\"this.blur()\">\r\n                                    </td>\r\n                                    <input type=\"hidden\" name=\"pgt\" value=\"\">\r\n                                    <script language=\"javascript\">\r\n\r\nfunction data()\r\n{\r\n form1.pgt.value=form1.gol.options[form1.gol.selectedIndex].text\r\n}\r\n</script>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\">Jabatan");
                    out.print("<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">:</td>\r\n                                    <td class=\"C-Field\">\r\n                                      <input\r\n                                class=boxdefault size=22 name=jabatan maxlength=\"40\" onKeyUp=\"return char(form1.jabatan)\">\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\">NIP<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">&nbsp;</td>\r\n                                    <td class=\"C-Field\">\r\n                                      <input\r\n                                class=boxdefault size=9 name=nip_pguna maxlength=\"20\">\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\">");
                    out.print("Nama Kantor<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">:</td>\r\n                                    <td class=\"C-Field\">\r\n                                      <input\r\n                                class=boxdefault size=30 name=nama_ktr maxlength=\"40\" onKeyUp=\"return char(form1.nama_ktr)\">\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                    <td class=\"C-Field\">Alamat Kantor<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">:</td>\r\n                                    <td class=\"C-Field\">\r\n                                      <input\r\n                                class=boxdefault size=30 name=alamat_ktr maxlength=\"120\">\r\n                                    </td>\r\n                                  </tr>\r\n                                  <tr>\r\n                                   ");
                    out.print(" <td class=\"C-Field\">Telepon/Fax<font color=\"#000099\" class=\"asterish\">*</font></td>\r\n                                    <td class=\"C-Field\">:</td>\r\n                                    <td class=\"C-Field\">\r\n                                      <input\r\n                                class=boxdefault size=20 name=tlp_ktr maxlength=\"40\">\r\n                                    </td>\r\n                                  </tr>\r\n                                </table>\r\n                            </td>\r\n                            <td>&nbsp;</td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td height=\"1\"><img src=\"images/v_sdt_kr_btm.gif\" width=\"5\" height=\"5\"></td>\r\n                            <td><img src=\"images/dot.gif\" width=\"1\" height=\"1\" hspace=\"1\"></td>\r\n                            <td height=\"5\" width=\"5\"><img src=\"images/v_sdt_kn_btm.gif\" width=\"5\" height=\"5\"></td>\r\n                          </tr>\r\n                        </table>\r\n\r\n                      </");
                    out.print("td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td height=\"35\" valign=\"bottom\">\r\n                        <div align=\"center\">\r\n                          <table width=\"350\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" height=\"55\">\r\n                            <tr>\r\n                              <td width=\"33\">\r\n                                <div align=\"center\"><b> </b></div>\r\n                              </td>\r\n                              <td width=\"151\">\r\n                                <div align=\"center\"><b> </b></div>\r\n                                <div align=\"center\"><b>\r\n                                  <input class=boxstandard type=\"submit\" value=\"DAFTAR\" name=\"sim\"  onClick=\"return penuser()\">\r\n                                  </b></div>\r\n                              </td>\r\n                              <td width=\"166\">\r\n                                <div align=\"center\"><b>\r\n                                  <input class=boxstandard type=\"button");
                    out.print("\" value=KELUAR name=\"kel\" onclick=\"document.location=\'Logout.jsp\'\">\r\n                                  </b></div>\r\n                              </td>\r\n                            </tr>\r\n                          </table>\r\n\r\n                        </div>\r\n                        </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n              <tr>\r\n                <td>&nbsp; </td>\r\n              </tr>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td>&nbsp;</td>\r\n  </tr>\r\n</table>\r\n</form>\r\n</BODY></HTML>\r\n");
                } //[ /Pengguna_User.jsp; Line: 372]
                else //[ /Pengguna_User.jsp; Line: 373]
                { //[ /Pengguna_User.jsp; Line: 374]
                    response.sendRedirect("index.jsp"); //[ /Pengguna_User.jsp; Line: 375]
                } //[ /Pengguna_User.jsp; Line: 376]
                //[ /Pengguna_User.jsp; Line: 377]
            } //[ /Pengguna_User.jsp; Line: 378]
            catch(Exception e) //[ /Pengguna_User.jsp; Line: 379]
            { //[ /Pengguna_User.jsp; Line: 380]
                System.out.print("Exception in Pengguna_User = " + e); //[ /Pengguna_User.jsp; Line: 381]
                response.sendRedirect("index.jsp"); //[ /Pengguna_User.jsp; Line: 382]
            } //[ /Pengguna_User.jsp; Line: 383]
            //[ /Pengguna_User.jsp; Line: 384]
            out.print("\r\n");
        } catch (Throwable __ee) {
            while (out != null && out != _originalOut) out = pageContext.popBody();
            ((weblogic.servlet.jsp.PageContextImpl)pageContext).handlePageException((Throwable)__ee);
        }


        //before final close brace...
    }


}
