<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@include file="Global.jsp"%>

<%!
    UserInfo1 record=null;
%>

<%
String no_kk="";
int kk;
String status="";  //NL-Normal Entry,AL-Asal,TJ-Tujuan
String source="";

   try
   {
    record=(UserInfo1)session.getAttribute("remoteRef");

   if(record != null)
   {
//   System.out.println("Wna");
 if (request.getParameter("source")!=null)   source= request.getParameter("source").trim();

   if (source.equals("WNA"))
         {
   nprop=record.getNoProp();
   nkab=record.getNoKab();
         }
     else if (source.equals("WNI"))
      {
        nprop=record.getNoProp();
        nkab=record.getNoKab();
        nkec=record.getNoKec();
        nama_kec=record.getNamaKec();
     }
   System.out.println("Wna head biodata");
    if (request.getParameter("status")!=null)
     {
       status=request.getParameter("status").trim().toUpperCase();
      }
      no_kk="";
      if (request.getParameter("no_kk")!=null)         no_kk=request.getParameter("no_kk");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/numpangwna.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/keymapper.js">
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onhelp="doKeyDown(event);"; onKeyDown="callKeyDown()" onload="window.history.forward(1)">
<SCRIPT language="JavaScript">
var firedBefore=false;
</SCRIPT>
<form name=numpang method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">
      <input type="hidden" name="source" value="<%=source%>">
      <input type="hidden" name="status" value="<%=status%>">
	  <jsp:include page="top.html"/>
      </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="45">
<div align="center"><span class="submenu">Permohonan Menumpang KK <%=source%></span><br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
<%/* if (source.equals("WNI")) {*/%>

<input type="hidden" name="namakel" value="<%=(request.getParameter("namakel")==null?"":request.getParameter("namakel"))%>">
<SCRIPT language="javascript">
function resetPage(obj) {
document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;
return true;
}</SCRIPT>
<%// } %>

<td>
<% String jsp = "";
   if (source.equals("WNI")) {
     jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
   } else if (source.equals("WNA")) {
    jsp = "data_wilayah.jsp?level=4&sublevel=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();

%>
                                               <script language="javascript">
                                                   function resetKec(obj) {
                                                      document.all['no_kec'].value=obj.value;
                                                      pilih_kel_with_textbox(document.all['no_prop'].value,document.all['no_kab'].value, document.all['no_kec'].value, document.all['no_kel'], document.all['nama_kel']);
                                                      return true;
                                                   }
                                                </script>

                                             </td>
<%
  }
%>
                      <jsp:include page="<%=jsp%>"/>
  </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" valign="middle">
                                    <div align="center"><span class="subtitle">Data
                                      Permohonan Menumpang KK</span></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                             </table>
          </td>
          </tr>
                          <tr>
                              <td valign="top" >
                                <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                                  <tr>
                                    <td colspan="11"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="../../images/dot.gif" width="1" height="10"></b></font></td>
                                  </tr>
                                  <tr valign="top">
                                    <td width="225"> Nomor Kartu Keluarga Lama<span class="asterish">*</span></td>
                                    <td>:</td>
                                    <td colspan="9">
                                      <input class=boxdefault value="<%=no_kk%>" size=18 name=no_kk_lama maxlength="16" onKeyUp="return semu()">
                                      <b> </b></td>
                                  </tr>
                                  <tr valign="top">
<td>Nomor Kartu Kepala Keluarga Yang Ditempati<span class="asterish">*</span></td>
<td>:</td>
<td colspan="9">
<input class=boxdefault size=18 name=no_kk_tmpt maxlength="16" onKeyUp="return yung()">
<b>
<input class=boxstandard type=button value=PERIKSA name="submit22" onClick="return startPost(this.form)">
                                  <%
                         if (status.equals("AL"))
                                   {
                                if (session.getAttribute("no_kel")!=null)
                                 no_kel=(String)session.getAttribute("no_kel");
                          if (session.getAttribute("nama_kel")!=null)
                                nama_kel=(String)session.getAttribute("nama_kel");
                                 %>
                       <input  name="klbtn" onClick="return closure('Dis_Per_Wna.jsp?no_kk=<%=no_kk%>&status=<%=status%>&source=<%=source%>&no_kel=<%=no_kel%>&nama_kel=<%=nama_kel%>&namakel=<%=nama_kel%>')" class=boxstandard type=button value=KELUAR name="button22">
                                  <%
                                   }
                        else
                             {
                                  %>
              <input name="klbtn"   onClick="return closure('<%=record.getModRefFile()%>')" class=boxstandard type=button value=KELUAR name="button22">
                              <%}
                                %>
                                      </b></td>
                                  </tr>
                                </table>
                                  <%if (request.getParameter("error")!=null)
                                           {
               				%>
                                <%=printError(errMsg(request.getParameter("error"),""))%>
                                <%
                                           }
					%>
                              </td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                </tr>
            </table>
            </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table></form>
<p class="linkyellow">&nbsp;</p>
</BODY>
<SCRIPT language=javascript>
function closure(file)
{
if ((document.all['status'].value=="TJ"))
    {
       self.close();
     }
else
   {
           document.location=file;
   }
}
</SCRIPT>
</HTML>
<%}
else
{
  response.sendRedirect("index.jsp");
}
   }
catch(Exception e)
{
e.printStackTrace();
}
%>
