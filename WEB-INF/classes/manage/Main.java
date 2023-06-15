/* compiled from JSP: /index.jsp
*
* This code was automatically generated at 6:23:05 PM on May 4, 2004
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
import pendaftaran.UserInfo1; //[ /Global.jsp; Line: 1]
import jmlpddk.agama.InfoWilayah; //[ /Global.jsp; Line: 1]
import javax.xml.parsers.*; //[ /Global.jsp; Line: 2]
import javax.xml.parsers.*; //[ /Global.jsp; Line: 3]
import java.io.*; //[ /Global.jsp; Line: 4]
import org.xml.sax.*; //[ /Global.jsp; Line: 5]
import org.w3c.dom.*; //[ /Global.jsp; Line: 6]
import java.util.*; //[ /Global.jsp; Line: 7]
import jmlpddk.agama.*; //[ /Global.jsp; Line: 8]
import kartukeluarga.DataKelurahan; //[ /Global.jsp; Line: 9]
import com.pkrjn.*; //[ /Global.jsp; Line: 10]


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
* This code was automatically generated at 6:23:05 PM on May 4, 2004
* by weblogic.servlet.jsp.Jsp2Java -- do not edit.
*
* Copyright (c) 2004 by BEA Systems, Inc. All Rights Reserved.
*/
public final class Main
extends
weblogic.servlet.jsp.JspBase
implements weblogic.servlet.jsp.StaleIndicator
{

    //[ /Global.jsp; Line: 11]
    final int TIDAKADA = 0; //[ /Global.jsp; Line: 12]
    final int ADAEXIST = 1; //[ /Global.jsp; Line: 13]
    final int ADANOTEXIST = 2; //[ /Global.jsp; Line: 14]
    public Vector vProp,vKab,vKec,vKel; //[ /Global.jsp; Line: 15]
    public String no_prop="",no_kab="",no_kec="",no_kel=""; //[ /Global.jsp; Line: 16]
    public String nama_prop="",nama_kab="", nama_kec="", nama_kel=""; //[ /Global.jsp; Line: 17]
    public String naprop="",nprop="",nkab="",nakab="",nkec="",nakec="",nkel="",nakel=""; //[ /Global.jsp; Line: 18]
    public String prop_dis="",kab_dis="",kec_dis="",kel_dis=""; //[ /Global.jsp; Line: 19]
    //public String base="/usr/local/bea/logs/siaklog/"; //[ /Global.jsp; Line: 20]
    public String base="C:\\bea\\logs\\siaklog\\"; //[ /Global.jsp; Line: 20]
    //public String base="c:\\bea\\logs\\siaklog\\"; //[ /Global.jsp; Line: 21]
    //[ /Global.jsp; Line: 22]
    //[ /Global.jsp; Line: 32]
    public String initCap(String str) //[ /Global.jsp; Line: 33]
    { //[ /Global.jsp; Line: 34]
        str=str.toLowerCase(); //[ /Global.jsp; Line: 35]
        char ch=' '; //[ /Global.jsp; Line: 36]
        boolean start=false; //[ /Global.jsp; Line: 37]
        String newstr=""; //[ /Global.jsp; Line: 38]
        for(int i=0;i<str.length();i++) //[ /Global.jsp; Line: 39]
        { //[ /Global.jsp; Line: 40]
            ch=str.charAt(i); //[ /Global.jsp; Line: 41]
            //[ /Global.jsp; Line: 42]
            if (start) { //[ /Global.jsp; Line: 43]
                ch=Character.toUpperCase(ch); //[ /Global.jsp; Line: 44]
            } //[ /Global.jsp; Line: 45]
            newstr=newstr+String.valueOf(ch); //[ /Global.jsp; Line: 46]
            if (ch==' ')     start=true;   else       start=false; //[ /Global.jsp; Line: 47]
            //[ /Global.jsp; Line: 48]
        } //[ /Global.jsp; Line: 49]
        return (newstr.substring(0,1).toUpperCase().trim()+newstr.substring(1).trim()); //[ /Global.jsp; Line: 50]
    } //[ /Global.jsp; Line: 51]
    //[ /Global.jsp; Line: 52]
    public String setLiner(int tot_width,int cur_len,int denom) //[ /Global.jsp; Line: 53]
    { //[ /Global.jsp; Line: 54]
        int top_len=62; //[ /Global.jsp; Line: 55]
        int width=0; //[ /Global.jsp; Line: 56]
        width=100-(tot_width+cur_len); //[ /Global.jsp; Line: 57]
        if (width<top_len) width=width+(top_len-width); //[ /Global.jsp; Line: 58]
        if (cur_len<20) width=width+(20-cur_len)+11; //[ /Global.jsp; Line: 59]
        String lines=""; //[ /Global.jsp; Line: 60]
        for(int i=1;i<=(width+denom);i++) lines=lines+"-"; //[ /Global.jsp; Line: 61]
        return lines; //[ /Global.jsp; Line: 62]
    } //[ /Global.jsp; Line: 63]
    //[ /Global.jsp; Line: 64]
    public String getKabupaten(String strkab) //[ /Global.jsp; Line: 65]
    { //[ /Global.jsp; Line: 66]
        String kab=""; //[ /Global.jsp; Line: 67]
        if ((strkab!=null) && (!strkab.trim().equals(""))) //[ /Global.jsp; Line: 68]
        { //[ /Global.jsp; Line: 69]
            if (!strkab.trim().toUpperCase().startsWith("KOTA")) kab="Kabupaten " + strkab.trim(); //[ /Global.jsp; Line: 70]
            else kab="Kota " + strkab.toUpperCase().substring(4,strkab.length()); //[ /Global.jsp; Line: 71]
        } //[ /Global.jsp; Line: 72]
        return kab; //[ /Global.jsp; Line: 73]
    } //[ /Global.jsp; Line: 74]
    //[ /Global.jsp; Line: 75]
    public void setSecureWilayah(int user_level, UserInfo1 rec) //[ /Global.jsp; Line: 76]
    { //[ /Global.jsp; Line: 77]
        switch(user_level) //[ /Global.jsp; Line: 78]
        { //[ /Global.jsp; Line: 79]
            case 2: //[ /Global.jsp; Line: 80]
            nprop = rec.getNoProp(); //[ /Global.jsp; Line: 81]
            naprop = rec.getNamaProp(); //[ /Global.jsp; Line: 82]
            prop_dis="disabled"; //[ /Global.jsp; Line: 83]
            kab_dis=""; //[ /Global.jsp; Line: 84]
            kec_dis=""; //[ /Global.jsp; Line: 85]
            kel_dis=""; //[ /Global.jsp; Line: 86]
            break; //[ /Global.jsp; Line: 87]
            case 3: //[ /Global.jsp; Line: 88]
            nprop = rec.getNoProp(); //[ /Global.jsp; Line: 89]
            naprop = rec.getNamaProp(); //[ /Global.jsp; Line: 90]
            nkab=rec.getNoKab(); //[ /Global.jsp; Line: 91]
            nakab=rec.getNamaKab(); //[ /Global.jsp; Line: 92]
            prop_dis="disabled"; //[ /Global.jsp; Line: 93]
            kab_dis="disabled"; //[ /Global.jsp; Line: 94]
            break; //[ /Global.jsp; Line: 95]
            case 4: //[ /Global.jsp; Line: 96]
            nprop = rec.getNoProp(); //[ /Global.jsp; Line: 97]
            naprop = rec.getNamaProp(); //[ /Global.jsp; Line: 98]
            nkab=rec.getNoKab(); //[ /Global.jsp; Line: 99]
            nakab=rec.getNamaKab(); //[ /Global.jsp; Line: 100]
            nkec=rec.getNoKec(); //[ /Global.jsp; Line: 101]
            nakec=rec.getNamaKec(); //[ /Global.jsp; Line: 102]
            prop_dis="disabled"; //[ /Global.jsp; Line: 103]
            kab_dis="disabled"; //[ /Global.jsp; Line: 104]
            kec_dis="disabled"; //[ /Global.jsp; Line: 105]
            break; //[ /Global.jsp; Line: 106]
            default: //[ /Global.jsp; Line: 107]
            prop_dis=""; //[ /Global.jsp; Line: 108]
            kab_dis=""; //[ /Global.jsp; Line: 109]
            kec_dis=""; //[ /Global.jsp; Line: 110]
        } //[ /Global.jsp; Line: 111]
    } //[ /Global.jsp; Line: 112]
    //[ /Global.jsp; Line: 113]
    private Vector getWilayahList(String path, String noProp, String noKab, String noKec, int classType) { //[ /Global.jsp; Line: 114]
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); //[ /Global.jsp; Line: 115]
        Vector list = new Vector(); //[ /Global.jsp; Line: 116]
        //[ /Global.jsp; Line: 117]
        try { //[ /Global.jsp; Line: 118]
            DocumentBuilder db = dbf.newDocumentBuilder(); //[ /Global.jsp; Line: 119]
            path = base + path; //[ /Global.jsp; Line: 120]
            //[ /Global.jsp; Line: 121]
            try { //[ /Global.jsp; Line: 122]
                Document doc = db.parse(path); //[ /Global.jsp; Line: 123]
                NodeList rows = doc.getElementsByTagName("row"); //[ /Global.jsp; Line: 124]
                int count = rows.getLength(); //[ /Global.jsp; Line: 125]
                for (int i=0; i<count; i++) { //[ /Global.jsp; Line: 126]
                    String no = rows.item(i).getChildNodes().item(1).getChildNodes().item(0).getNodeValue(); //[ /Global.jsp; Line: 127]
                    String nama = rows.item(i).getChildNodes().item(3).getChildNodes().item(0).getNodeValue(); //[ /Global.jsp; Line: 128]
                    Object obj = null; //[ /Global.jsp; Line: 129]
                    if (classType==1) { //[ /Global.jsp; Line: 130]
                        obj = new ListProp(no, nama, String.valueOf(count)); //[ /Global.jsp; Line: 131]
                    } else if (classType==2) { //[ /Global.jsp; Line: 132]
                        obj = new ListKab(no, nama, noProp, String.valueOf(count)); //[ /Global.jsp; Line: 133]
                    } else if (classType==3) { //[ /Global.jsp; Line: 134]
                        obj = new ListKec(no, nama, noKab, noProp, String.valueOf(count)); //[ /Global.jsp; Line: 135]
                    } else if (classType==4) { //[ /Global.jsp; Line: 136]
                        obj = new ListKel(no, nama, noKec, noKab, noProp); //[ /Global.jsp; Line: 137]
                    }else if (classType==5) { //[ /Global.jsp; Line: 138]
                        //[ /Global.jsp; Line: 139]
                        String jabatan = rows.item(i).getChildNodes().item(11).getChildNodes().item(0).getNodeValue(); //[ /Global.jsp; Line: 140]
                        String namaLur = rows.item(i).getChildNodes().item(13).getChildNodes().item(0).getNodeValue(); //[ /Global.jsp; Line: 141]
                        String nipLur = rows.item(i).getChildNodes().item(15).getChildNodes().item(0).getNodeValue(); //[ /Global.jsp; Line: 142]
                        obj = new DataKelurahan(no, nama, jabatan, namaLur, nipLur); //[ /Global.jsp; Line: 143]
                    } //[ /Global.jsp; Line: 144]
                    //[ /Global.jsp; Line: 145]
                    if (obj!=null) //[ /Global.jsp; Line: 146]
                    list.addElement(obj); //[ /Global.jsp; Line: 147]
                } //[ /Global.jsp; Line: 148]
            } //[ /Global.jsp; Line: 149]
            catch (IOException ex) { //[ /Global.jsp; Line: 150]
                ex.printStackTrace(); //[ /Global.jsp; Line: 151]
                return null; //[ /Global.jsp; Line: 152]
            } //[ /Global.jsp; Line: 153]
            catch (SAXException ex) { //[ /Global.jsp; Line: 154]
                ex.printStackTrace(); //[ /Global.jsp; Line: 155]
                return null; //[ /Global.jsp; Line: 156]
            } //[ /Global.jsp; Line: 157]
        } //[ /Global.jsp; Line: 158]
        catch (ParserConfigurationException ex) { //[ /Global.jsp; Line: 159]
            ex.printStackTrace(); //[ /Global.jsp; Line: 160]
            return null; //[ /Global.jsp; Line: 161]
        } //[ /Global.jsp; Line: 162]
        //[ /Global.jsp; Line: 163]
        return list; //[ /Global.jsp; Line: 164]
    } //[ /Global.jsp; Line: 165]
    //[ /Global.jsp; Line: 166]
    public Vector getPkrjn() //[ /Global.jsp; Line: 167]
    { //[ /Global.jsp; Line: 168]
        return getPkrjnList("pkrjn.xml"); //[ /Global.jsp; Line: 169]
    } //[ /Global.jsp; Line: 170]
    //[ /Global.jsp; Line: 171]
    private Vector getPkrjnList(String path) { //[ /Global.jsp; Line: 172]
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); //[ /Global.jsp; Line: 173]
        Vector list = new Vector(); //[ /Global.jsp; Line: 174]
        //[ /Global.jsp; Line: 175]
        try { //[ /Global.jsp; Line: 176]
            DocumentBuilder db = dbf.newDocumentBuilder(); //[ /Global.jsp; Line: 177]
            path = base + path; //[ /Global.jsp; Line: 178]
            try { //[ /Global.jsp; Line: 179]
                Document doc = db.parse(path); //[ /Global.jsp; Line: 180]
                NodeList rows = doc.getElementsByTagName("row"); //[ /Global.jsp; Line: 181]
                int count = rows.getLength(); //[ /Global.jsp; Line: 182]
                //[ /Global.jsp; Line: 183]
                for (int i=0; i<count; i++) { //[ /Global.jsp; Line: 184]
                    String no = rows.item(i).getChildNodes().item(1).getChildNodes().item(0).getNodeValue(); //[ /Global.jsp; Line: 185]
                    String nama = rows.item(i).getChildNodes().item(3).getChildNodes().item(0).getNodeValue(); //[ /Global.jsp; Line: 186]
                    Object obj = null; //[ /Global.jsp; Line: 187]
                    obj = new Pkrjn(no, nama); //[ /Global.jsp; Line: 188]
                    if (obj!=null) //[ /Global.jsp; Line: 189]
                    list.addElement(obj); //[ /Global.jsp; Line: 190]
                } //[ /Global.jsp; Line: 191]
            } //[ /Global.jsp; Line: 192]
            catch (IOException ex) { //[ /Global.jsp; Line: 193]
                ex.printStackTrace(); //[ /Global.jsp; Line: 194]
                return null; //[ /Global.jsp; Line: 195]
            } //[ /Global.jsp; Line: 196]
            catch (SAXException ex) { //[ /Global.jsp; Line: 197]
                ex.printStackTrace(); //[ /Global.jsp; Line: 198]
                return null; //[ /Global.jsp; Line: 199]
            } //[ /Global.jsp; Line: 200]
        } //[ /Global.jsp; Line: 201]
        catch (ParserConfigurationException ex) { //[ /Global.jsp; Line: 202]
            ex.printStackTrace(); //[ /Global.jsp; Line: 203]
            return null; //[ /Global.jsp; Line: 204]
        } //[ /Global.jsp; Line: 205]
        return list; //[ /Global.jsp; Line: 206]
    } //[ /Global.jsp; Line: 207]
    //[ /Global.jsp; Line: 208]
    public Vector getPropinsiList() { //[ /Global.jsp; Line: 209]
        String path = "setup_prop.xml"; //[ /Global.jsp; Line: 210]
        return getWilayahList(path, null, null, null, 1); //[ /Global.jsp; Line: 211]
    } //[ /Global.jsp; Line: 212]
    //[ /Global.jsp; Line: 213]
    public Vector getKabupatenList(String noProp) { //[ /Global.jsp; Line: 214]
        String path = "p"+noProp+".xml"; //[ /Global.jsp; Line: 215]
        return getWilayahList(path, noProp, null, null, 2); //[ /Global.jsp; Line: 216]
    } //[ /Global.jsp; Line: 217]
    //[ /Global.jsp; Line: 218]
    public Vector getKecamatanList(String noProp, String noKab) { //[ /Global.jsp; Line: 219]
        String path = "kb"+noProp+noKab+".xml"; //[ /Global.jsp; Line: 220]
        return getWilayahList(path, noProp, noKab, null, 3); //[ /Global.jsp; Line: 221]
    } //[ /Global.jsp; Line: 222]
    //[ /Global.jsp; Line: 223]
    public Vector getKelurahanList(String noProp, String noKab, String noKec) { //[ /Global.jsp; Line: 224]
        String path = "kc"+noProp+noKab+noKec+".xml"; //[ /Global.jsp; Line: 225]
        return getWilayahList(path, noProp, noKab, noKec, 4); //[ /Global.jsp; Line: 226]
    } //[ /Global.jsp; Line: 227]
    //[ /Global.jsp; Line: 228]
    public Vector getDataKelurahan(String noProp, String noKab, String noKec) { //[ /Global.jsp; Line: 229]
        String path = "kc"+noProp+noKab+noKec+".xml"; //[ /Global.jsp; Line: 230]
        return getWilayahList(path, noProp, noKab, noKec, 5); //[ /Global.jsp; Line: 231]
    } //[ /Global.jsp; Line: 232]
    //[ /Global.jsp; Line: 233]
    public String printError(String msg, String align) //[ /Global.jsp; Line: 234]
    { //[ /Global.jsp; Line: 235]
        String msgstr="<table border='0' cellspacing='0' cellpadding='0' align='"+align+"'>"; //[ /Global.jsp; Line: 236]
        //System.out.println("msgstr="+msgstr); //[ /Global.jsp; Line: 237]
        msgstr=msgstr+"<tr>"; //[ /Global.jsp; Line: 238]
        msgstr=msgstr+"<td width='13%'>"; //[ /Global.jsp; Line: 239]
        msgstr=msgstr+"<div align='right'><img src='images/nondynamic_restart.gif' width='16' height='16'></div>"; //[ /Global.jsp; Line: 240]
        msgstr=msgstr+"</td>"; //[ /Global.jsp; Line: 241]
        msgstr=msgstr+"<td width='87%' nowrap><font face='Verdana, Arial, Helvetica, sans-serif' size='2' color='#FF0000'><b><font size='1'>"; //[ /Global.jsp; Line: 242]
        msgstr=msgstr+"&nbsp;&nbsp;<font color='#FF0000'>&nbsp;" + msg; //[ /Global.jsp; Line: 243]
        msgstr=msgstr+"</font></font></b></font></td> </tr></table>"; //[ /Global.jsp; Line: 244]
        return msgstr; //[ /Global.jsp; Line: 245]
    } //[ /Global.jsp; Line: 246]
    //[ /Global.jsp; Line: 247]
    public String printError(String msg) //[ /Global.jsp; Line: 248]
    { //[ /Global.jsp; Line: 249]
        return printError(msg, "center"); //[ /Global.jsp; Line: 250]
    } //[ /Global.jsp; Line: 251]
    //[ /Global.jsp; Line: 252]
    public String printInfo(String msg) //[ /Global.jsp; Line: 253]
    { //[ /Global.jsp; Line: 254]
        String msgstr="<table border='0' cellspacing='0' cellpadding='0' align='center'>"; //[ /Global.jsp; Line: 255]
        msgstr=msgstr+"<tr>"; //[ /Global.jsp; Line: 256]
        msgstr=msgstr+"<td width='13%'>"; //[ /Global.jsp; Line: 257]
        msgstr=msgstr+"<div align='right'><img src='images/info.gif'></div>"; //[ /Global.jsp; Line: 258]
        msgstr=msgstr+"</td>"; //[ /Global.jsp; Line: 259]
        msgstr=msgstr+"<td width='87%' nowrap><font face='Verdana, Arial, Helvetica, sans-serif' size='3' color='#FF0000'><b><font size='2'>"; //[ /Global.jsp; Line: 260]
        msgstr=msgstr+"&nbsp;&nbsp;<font color='#FF0000'>&nbsp;" + msg; //[ /Global.jsp; Line: 261]
        msgstr=msgstr+"</font></font></b></font></td> </tr></table>"; //[ /Global.jsp; Line: 262]
        return msgstr; //[ /Global.jsp; Line: 263]
    } //[ /Global.jsp; Line: 264]
    //[ /Global.jsp; Line: 265]
    public String errMsg(String errcode,String addmsg) //[ /Global.jsp; Line: 266]
    { //[ /Global.jsp; Line: 267]
        String msg=""; //[ /Global.jsp; Line: 268]
        switch(Integer.parseInt(errcode)) //[ /Global.jsp; Line: 269]
        { //[ /Global.jsp; Line: 270]
            case 1: //[ /Global.jsp; Line: 271]
            msg="Nomor KK &nbsp;"+ addmsg + "&nbsp; Belum Ada Anggota/Belum terdaftar!"; //[ /Global.jsp; Line: 272]
            break; //[ /Global.jsp; Line: 273]
            case 2: //[ /Global.jsp; Line: 274]
            msg="Nama Pengguna/Kata Kunci salah!"; //[ /Global.jsp; Line: 275]
            break; //[ /Global.jsp; Line: 276]
            case 3: //[ /Global.jsp; Line: 277]
            msg="Pengguna Belum di Autorisasi!"; //[ /Global.jsp; Line: 278]
            break; //[ /Global.jsp; Line: 279]
            case 4: //[ /Global.jsp; Line: 280]
            msg="Pengguna sedang tidak Aktif!"; //[ /Global.jsp; Line: 281]
            break; //[ /Global.jsp; Line: 282]
            case 5: //[ /Global.jsp; Line: 283]
            msg="Pengguna sudah Login!"; //[ /Global.jsp; Line: 284]
            break; //[ /Global.jsp; Line: 285]
            case 6: //[ /Global.jsp; Line: 286]
            msg="Nomor KK Lama/Ditempati salah. Periksa kembali!"; //[ /Global.jsp; Line: 287]
            break; //[ /Global.jsp; Line: 288]
            case 7: //[ /Global.jsp; Line: 289]
            msg="Pin/Authorisation Key Anda Salah!"; //[ /Global.jsp; Line: 290]
            break; //[ /Global.jsp; Line: 291]
            case 8: //[ /Global.jsp; Line: 292]
            msg="Nomor KK " + addmsg + " Salah/Tidak Tersimpan.Silakan coba lagi!"; //[ /Global.jsp; Line: 293]
            break; //[ /Global.jsp; Line: 294]
            case 9: //[ /Global.jsp; Line: 295]
            msg="Nomor KK " + addmsg + " Belum terdaftar!"; //[ /Global.jsp; Line: 296]
            break; //[ /Global.jsp; Line: 297]
            case 10: //[ /Global.jsp; Line: 298]
        } //[ /Global.jsp; Line: 299]
        return msg; //[ /Global.jsp; Line: 300]
    } //[ /Global.jsp; Line: 301]
    //[ /Global.jsp; Line: 302]
    public void removeCetakUlangAttribute(HttpSession session) { //[ /Global.jsp; Line: 303]
        session.removeAttribute("remoteSupv"); //[ /Global.jsp; Line: 304]
        session.removeAttribute("remoteOto"); //[ /Global.jsp; Line: 305]
        session.removeAttribute("authKey4CetakUlang"); //[ /Global.jsp; Line: 306]
        session.removeAttribute("pinAuthSupv"); //[ /Global.jsp; Line: 307]
        session.removeAttribute("authkeyAuthSupv"); //[ /Global.jsp; Line: 308]
        session.removeAttribute("file"); //[ /Global.jsp; Line: 309]
        System.out.println("remove "+session.getAttribute("authDate")); //[ /Global.jsp; Line: 310]
        session.removeAttribute("authDate"); //[ /Global.jsp; Line: 311]
    } //[ /Global.jsp; Line: 312]
    //[ /Global.jsp; Line: 313]
    public String getSplitString(String orignal) //[ /Global.jsp; Line: 314]
    { //[ /Global.jsp; Line: 315]
        String str1=""; //[ /Global.jsp; Line: 316]
        String str2=""; //[ /Global.jsp; Line: 317]
        int wc=0; //[ /Global.jsp; Line: 318]
        //[ /Global.jsp; Line: 319]
        StringTokenizer tkn=new StringTokenizer(orignal+""," "); //[ /Global.jsp; Line: 320]
        while(tkn.hasMoreTokens()) //[ /Global.jsp; Line: 321]
        { //[ /Global.jsp; Line: 322]
            if (wc<=2) //[ /Global.jsp; Line: 323]
            { //[ /Global.jsp; Line: 324]
                str1=str1+" "+ tkn.nextToken(); //[ /Global.jsp; Line: 325]
            } //[ /Global.jsp; Line: 326]
            else //[ /Global.jsp; Line: 327]
            str2=str2+" "+tkn.nextToken(); //[ /Global.jsp; Line: 328]
            wc++; //[ /Global.jsp; Line: 329]
        } //[ /Global.jsp; Line: 330]
        return (str1 + "|" + str2); //[ /Global.jsp; Line: 331]
    } //[ /Global.jsp; Line: 332]
    //[ /Global.jsp; Line: 333]
    // StaleIndicator interface
    public boolean _isStale() {
        weblogic.servlet.jsp.StaleChecker sci =(weblogic.servlet.jsp.StaleChecker)(getServletConfig().getServletContext());
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
       // if (sci.isResourceStale("/index.jsp", 1083669697843L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
       // if (sci.isResourceStale("/Global.jsp", 1083660285609L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }

    public static boolean _staticIsStale(weblogic.servlet.jsp.StaleChecker sci) {
        java.io.File f = null;
        long lastModWhenBuilt = 0L;
       // if (sci.isResourceStale("/index.jsp", 1083669697843L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
       // if (sci.isResourceStale("/Global.jsp", 1083660285609L, "WebLogic Server 7.0  Thu Jun 20 11:47:11 PDT 2002 190955 ")) return true;
        return false;
    }




    public void _jspService(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws java.io.IOException, javax.servlet.ServletException
    {

        // declare and set well-known variables:
        javax.servlet.ServletConfig config = getServletConfig();
        javax.servlet.ServletContext application = config.getServletContext();
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

            //INCLUDE /Global.jsp //[ /index.jsp; Line: 1]
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n");
            out.print("\r\n\r\n");
            //[ /Global.jsp; Line: 24]
            vProp=null;vKab=null;vKec=null;vKel=null; //[ /Global.jsp; Line: 25]
            no_prop="";no_kab="";no_kec="";no_kel=""; //[ /Global.jsp; Line: 26]
            nama_prop="";nama_kab="";nama_kec=""; nama_kel=""; //[ /Global.jsp; Line: 27]
            naprop="";nprop="";nkab="";nakab="";nkec="";nakec="";nkel="";nakel=""; //[ /Global.jsp; Line: 28]
            prop_dis="";kab_dis="";kec_dis="";kel_dis=""; //[ /Global.jsp; Line: 29]
            out.print("\r\n\r\n");
            out.print("\r\n<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML><HEAD>\r\n<TITLE>adminduk project</TITLE>\r\n<META http-equiv=Content-Type content=\"text/html; charset=windows-1252\">\r\n<LINK href=\"Templates/s.css\" rel=stylesheet>\r\n<SCRIPT language=JavaScript src=\"Templates/ajlib.js\">\r\n</SCRIPT>\r\n<SCRIPT language=JavaScript src=\"Templates/ajmenu.js\">\r\n</SCRIPT>\r\n<SCRIPT language=JavaScript src=\"Templates/js_menutama_geser.js\">\r\n</SCRIPT>\r\n<SCRIPT language=javascript src=\"scripts/Login.js\">\r\n</SCRIPT>\r\n<SCRIPT language=\"javascript\">\r\nfunction startlogin()\r\n{\r\n\tif(document.form1.login.value == \"\")\r\n\t{\r\n\t\talert(\"Nama Pengguna belum diisi !.\")\r\n\t\tdocument.form1.login.focus()\r\n\t\treturn(false)\r\n\t}\r\n\telse if(document.form1.pwd.value == \"\")\r\n\t{\r\n\t\talert(\"Kata Kunci belum diisi !.\")\r\n\t\tdocument.form1.pwd.focus()\r\n\t\treturn(false);\r\n\t}\r\ndocument.form1.action=\"loginparse\"\r\ndocument.form1.submit();\r\ndocument.all[\'btnlogin\'].disabled=true;\r\n//\"mywin011=popUP(\'I.Login/SIAK super user/menu_super_user.htm\'/*tpa=welcome.htm*/");
                out.print(",430,347,null,null,\'mywin011\',5,true,true,true);return false\"\r\n}\r\n</SCRIPT>\r\n<META content=\"MSHTML 6.00.2800.1141\" name=GENERATOR></HEAD>\r\n<BODY leftMargin=0 topMargin=0 MARGINHEIGHT=\"0\" MARGINWIDTH=\"0\" bgColor=\"#93BEE2\">\r\n<form name=\"form1\" method=\"post\">\r\n  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"100%\">\r\n    <tr>\r\n    <td valign=\"middle\" align=\"center\">\r\n      <table width=\"100\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\" align=\"center\" height=\"100\">\r\n        <tr>\r\n          <td bgcolor=\"#FFFFFF\" valign=\"top\">\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" background=\"images/q_bg1.gif\">\r\n             <tr>\r\n                <td background=\"images/login_bg.jpg\">&nbsp; </td>\r\n              </tr>\r\n              <tr>\r\n                <td background=\"images/login_bg.jpg\">\r\n                  <table width=\"100\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                    <tr>\r\n                      <td><img src=\"images/login1.gif\" width=\"343\" height=\"1\">");
            out.print("</td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td> <div align=\"center\"><img src=\"images/login2.gif\" width=\"49\" height=\"54\"></div></td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td> <div align=\"center\"><img src=\"images/login3.gif\" width=\"169\" height=\"24\"></div></td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td valign=\"bottom\" height=\"55\"> <div align=\"center\"><img src=\"images/logo_ddn.gif\" width=\"241\" height=\"39\"></div></td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td> <div align=\"center\"></div>\r\n                        <div align=\"center\"><object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"swflash.cab#version=5,0,0,0\" width=\"343\" height=\"120\">\r\n                            <param name=movie value=\"flash_DDN2.swf\">\r\n                            <param name=quality value=high>\r\n                            <embed src=\"flash_DDN2.swf\" quality=high pluginspag");
            out.print("e=\"\" type=\"application/x-shockwave-flash\" width=\"343\" height=\"120\">\r\n                            </embed>\r\n                          </object></div>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n              <tr>\r\n                <td bgcolor=\"#93BEE2\">\r\n                  <table width=\"300\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#CBE0FA\" height=\"100\">\r\n                    <tr>\r\n                      <td><img src=\"images/v_sdt_kr_up.gif\" width=\"5\" height=\"5\"></td>\r\n                      <td height=\"1\"><img src=\"images/dot.gif\" width=\"1\" height=\"1\"></td>\r\n                      <td><img src=\"images/v_sdt_kn_up.gif\" width=\"5\" height=\"5\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td>&nbsp;</td>\r\n                      <td>\r\n                        <table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\" align=\"center\">\r\n                          <tr>\r\n         ");
            out.print("                   <td width=\"20\">&nbsp; </td>\r\n                            <td height=\"15\">\r\n                              <div align=\"right\"></div>\r\n                            </td>\r\n                            <td> <i> </i></td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td width=\"20\" rowspan=\"2\">&nbsp; </td>\r\n                            <td width=\"150\">\r\n                              <div align=\"right\">Nama Pengguna :</div>\r\n</td>\r\n<td> <i>\r\n<input type=\"text\" class=boxdefault size=22 name=\"login\" maxlength=\"30\" onKeyUp=\"return space(form1.login)\">\r\n                              </i></td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td width=\"150\">\r\n                              <div align=\"right\">Kata Kunci :</div>\r\n                            </td>\r\n                            <td><i>\r\n                              <input type=\"password\"\r\n                                class=boxdefault size=22 name=\"p");
            out.print("wd\" maxlength=\"30\">\r\n                              </i></td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td width=\"20\">&nbsp;</td>\r\n                            <td colspan=\"2\" height=\"35\">\r\n                              <div align=\"center\">\r\n                                <table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\" align=\"center\">\r\n                                  <tr>\r\n                                    <td height=\"35\">\r\n<div align=\"center\">\r\n<font face=\"Arial Black\" size=\"2\">\r\n<font color=\"#FFFF00\">\r\n<input type=\"button\" value=\"Login\" name=\"btnlogin\" class=boxstandard onclick=\"return startlogin()\">\r\n</font>\r\n</font>\r\n</div>\r\n</td>\r\n</tr>\r\n\r\n                                </table>\r\n                              </div>\r\n                            </td>\r\n                          </tr>\r\n                        </table>\r\n                 </td>\r\n                      <td>&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n  ");
            out.print("                    <td height=\"1\"><img src=\"images/v_sdt_kr_btm.gif\" width=\"5\" height=\"5\"></td>\r\n                      <td><img src=\"images/dot.gif\" width=\"1\" height=\"1\" hspace=\"1\"></td>\r\n                      <td><img src=\"images/v_sdt_kn_btm.gif\" width=\"5\" height=\"5\"></td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n              <tr>\r\n                <td bgcolor=\"#93BEE2\"><br>\r\n                  </td>\r\n              </tr>\r\n            </table>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n        <!--\r\n<a href=\"../install.exe\">\r\nClick disini untuk self configurasi\r\n</a>\r\n-->\r\n        ");
            if (request.getParameter("error")!=null) //[ /index.jsp; Line: 160]
            { //[ /index.jsp; Line: 161]
                //[ /index.jsp; Line: 162]
                //[ /index.jsp; Line: 162]
                out.print("\r\n        ");
                out.print(String.valueOf(printError(errMsg(request.getParameter("error"),""))));  //[ /index.jsp; Line: 163]
                out.print("\r\n        ");
                //[ /index.jsp; Line: 164]
            } //[ /index.jsp; Line: 165]
            //[ /index.jsp; Line: 166]
            //[ /index.jsp; Line: 166]
            out.print("\r\n      </td>\r\n  </tr>\r\n</table>\r\n</form>\r\n</BODY>\r\n</HTML>\r\n\r\n<script language=\"javascript\">\r\ndocument.all[\"login\"].focus()\r\n</script>");
        } catch (Throwable __ee) {
            while (out != null && out != _originalOut) out = pageContext.popBody();
            ((weblogic.servlet.jsp.PageContextImpl)pageContext).handlePageException((Throwable)__ee);
        }


        //before final close brace...
    }


}
