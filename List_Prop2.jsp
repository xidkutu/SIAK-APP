<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,datawilayah.*,com.db.connection.ServiceController"%>
<%@ include file="Global.jsp"%>
<%!
    String flag=null;
    int ii,jj;
    Vector v_prop;
    String login=null,pwd=null,select,id1=null;
    Vector v = null;
    ServiceController factory;
    int i,j,k,l,z;
    String prop;
    KabHome home;
    Kab remoteKab;


%>

<%
   factory=ServiceController.getInstance();

   nprop=request.getParameter("np");
   no_prop=request.getParameter("no_prop");

   flag=request.getParameter("flag");

   try
   {
      v = new Vector();
if (session.getAttribute("remoteRef")!=null)
{
      v_prop= getPropinsiList();

%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="frm" method="post" action="DataInput_Parameter.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span class="subtitle">Setup Wilayah
                          Kabupaten/Kota</span></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr>
                      <td>
                        <table width="450" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td>Kode-Nama Provinsi</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name=no_prop onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">
<input type="hidden" name="np" value="<%=nprop%>">
                              <select name="nama_prop"
                  onChange="frm.no_prop.value=frm.nama_prop.options[this.selectedIndex].value;np.value=frm.nama_prop.selectedIndex;able()" class="boxdefault">

    <option>-- Pilih Provinsi --</option>

<%
for(int k=0;k<v_prop.size();k++)
{
%>
<option value="<%=((jmlpddk.agama.ListProp)v_prop.elementAt(k)).getNo_prop()%>">
 <%=((jmlpddk.agama.ListProp)v_prop.elementAt(k)).getNama_prop()%></option>
<%
}
%>

                              </select>

                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input class=boxdefault size=4 name="no_kab" maxlength="2" onKeyup="frm.sim.disabled=false;return test()">
                            </td>
                            <td width="80">
                              <input class=boxdefault size=22 name="nama_kab" onKeyUP="return test1()">
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr valign="bottom">
                      <td height="45" valign="top">
                        <div align="center"></div>
                        <div align="center"><b> </b>
                          <table width="100" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                              <td><b>
                                <input class=boxstandard type="submit" value="SIMPAN" name="sim" disabled onclick="return blank()">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value="TAMPILKAN" name="tam">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value="KELUAR" name="kel" onclick="">
                                </b></td>
                            </tr>
                          </table>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
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
</table>
<center>

<%

if(request.getParameter("no_prop") != null)
{
  try
  {
      home=(KabHome)factory.lookup("KabBean",KabHome.class);
      remoteKab = home.create();

      v = new Vector();
      v = remoteKab.list(request.getParameter("no_prop").trim());
  }
  catch(Exception ee)
  {
   out.println("Exception in vector : " + ee);
  }

  if(v.isEmpty())
  {
    out.println("<h3><font color=red>Data belum ada !.");
  }
  else
  {

         j=v.size();
         k=j/4;
         l=0;
         z=1;
%>
              <tr>
                <td valign="top">
                  <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="25">
                        <div align="center"><span class="subtitle">Daftar Kabupaten/Kota</span></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="15">&nbsp; </td>
              </tr>
              <tr>
                <td>
                  <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td class="C-BG">
                        <table width="500" border="0" cellspacing="1" cellpadding="3">
                          <tr>
                            <td class="C-Fonts">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Kode Kabupaten/Kota</div>
                            </td>
                            <td class="C-Fonts">
                              <div align="center">Nama Kabupaten/Kota</div>
                            </td>
                          </tr>
<%
for(int i = 0; i < j;)
{

%>
                          <tr>
                            <td class="C-Field">
                              <div align="center"> <%=z%>.</div>
                            </td>


                            <td class="C-Field">
                              <div align="center">
                                <%=v.elementAt(i)%>
                              </div>
                            </td>
                            <td class="C-Field">
                              <div align="center">
                               <%=v.elementAt(i+1).toString().toUpperCase()%>
                              </div>
                            </td>
</tr>
<%

z=z+1;

i=i+2;
}

}%>

<script language="JavaScript">
<%
if (flag.equals("1"))
{%>
alert("Data Sudah disimpan !")
<%
}
%>

      document.all["nama_prop"].selectedIndex=<%=nprop%>
      document.all["no_prop"].value="<%=no_prop%>"

      </script>



                        </table>

</td></tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td height="5" width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
    </td>
  </tr>
<%
     }

%>
<tr>
    <td>&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>
</center>
<SCRIPT language=JavaScript src="scripts/kabu_vali1.js">
</script>

<SCRIPT language=JavaScript>
document.all["no_kab"].focus()
</SCRIPT>
</form>
</BODY>
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
