<%@page import="com.db.connection.ServiceController,java.util.Vector"%>
<%@page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,jmlpddk.agama.InfoWilayah,jmlpddk.agama.ListProp,jmlpddk.agama.ListKab,jmlpddk.agama.ListKec"%>
<%@page import="com.wilayah.*,siak.security.*"%>
<%@include file="Global.jsp"%>

<%!
    int level;
    UserInfo1 record = null;
    public String assign(String source, String dest) {
       if (dest==null) {
          dest ="";
       }
       else if (!dest.equals("")){
          return dest;
       }
       if ((source!=null) && (!source.equals(""))) {
           dest=source;
       }
       return dest;
    }
String idxprop=null,idxkab=null,idxkec=null;

boolean checkValue(String str)
{
if ((str!=null) && !str.trim().equals("") && !str.trim().equals("0") && !str.trim().equals("null")) return true;
return false;
}
%>
<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript" src="Templates/Wilayah.js">
</SCRIPT>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</SCRIPT>
<SCRIPT language="javascript">
function checkCombo(division)
{
   var radio = document.pilwil.divisi;
if(radio[0].checked && document.all['level'].value==2 && division==4 )
{
document.all['nakab'].selectedIndex=0;
document.all['nkab'].value="";
document.all['nakab'].disabled=false;
}
else if(radio[2].checked && document.all['level'].value==2 && division==4 )
{
document.all['na_kab'].selectedIndex=0;
document.all['n_kab'].value="";
document.all['na_kab'].disabled=true;
}
}

function checkComboBox(v, idx)
{
    var niks="";
    var arr = new Array(v);
    var chk=false;

    var idxchk=0;

     for(i=0;i<v;i++)
     {
        if(document.pilwil.chk[i].checked)
        {
           niks=document.pilwil.chk[i].value;
           idxchk = i;
           chk=true;
            break;
        }
     }

     if(v==undefined && document.pilwil.chk.checked==true && chk==false)
     {
         niks = document.pilwil.chk.value;
         window.open('Pengguna_User_Display.jsp?user_id='+niks,'','fullscreen=no,scrollbars=no,resizable=no,menubar=no,toolbar=no,width=500,height=450');
     }
     else if(chk && idx==idxchk)
     {
         window.open('Pengguna_User_Display.jsp?user_id='+niks,'','fullscreen=no,scrollbars=no,resizable=yes,menubar=no,toolbar=no,width=500,height=450');
     }
     else
     {
         window.alert('Belum Pilih Nama Pengguna');
     }
}

function terima(v)
{
    var niks="";
    var arr = new Array(v);
    var x = 0;
    var chk=false;
    var param="";
    var onemember=false;

    var hidden = 0;
    if(v>1)
    {
     for(i=0;i<v;i++)
     {
        if(document.pilwil.chk[i].checked)
        {
           niks=document.pilwil.chk[i].value;
           hidden = i;
           arr[x] = niks;
           x++;
           chk=true;
            //break;
        }
     }
    }
    else
    {
        chk=true;
        onemember=true;
        niks = document.pilwil.chk.value;
        if(!document.pilwil.chk.checked)
        {
         window.alert('Belum Pilih Nama Pengguna');
        return;
        }
    }

     if(chk)
     {

         for(i=0;i<x;i++)
         {
             param = param + "|" +arr[i];
         }

         param = param.substring(1);
         if(onemember)
         {
             param = niks;
         }

         //document.location='Persetujuan.jsp?user_id='+param;

   if(document.all["level"].value==1)
   {
      document.pilwil.action="Persetujuan.jsp?user_id="+param+"&no_prop="+document.all["nprop"].value+"&nama_prop="+document.all["cur_naprop"].value;
      document.pilwil.submit();
   }
   else if(document.all["level"].value==2)
   {
      document.pilwil.action="Persetujuan.jsp?user_id="+param+"&no_prop="+document.all["nprop"].value+"&nama_prop="+document.all["cur_naprop"].value+ "&no_kab="+document.all["nkab"].value+"&nama_kab="+document.all["cur_nakab"].value;
      document.pilwil.submit();
   }
   else if(document.all["level"].value==3)
   {
      document.pilwil.action="Persetujuan.jsp?user_id="+param+"&no_prop="+document.all["nprop"].value+"&nama_prop="+document.all["cur_naprop"].value+ "&no_kab="+document.all["nkab"].value+"&nama_kab="+document.all["cur_nakab"].value+ "&no_kec="+document.all["nkec"].value+"&nama_kec="+document.all["cur_nakec"].value;
      document.pilwil.submit();
   }
     }
}
function checkRadioButton()
{
   var vchecked;
   var radio = document.pilwil.divisi;
   var ell;

   for (i=0;i<radio.length;i++)
  {
     if (radio[i].checked)
     {
        vchecked = true;
        ell=i;
        break;
    }
   }
   if (!vchecked)
   {
     alert("Belum Pilih Divisi!");
   }
   else if(document.all["level"].value==1 && radio[ell].value=="Operator")
   {
     alert("Tidak ada Operator di Pusat!");

   }
   else if(document.all["level"].value==1)
   {
      document.pilwil.action="Persetujuan.jsp?no_prop="+document.all["nprop"].value+"&nama_prop="+document.all["cur_naprop"].value;
      document.pilwil.submit();
   }
   else if(document.all["level"].value==2 && radio[ell].value=="Operator")
   {
     alert("Tidak ada Operator di Provinsi!");

   }
   else if(document.all["level"].value==2)
   {
      document.pilwil.action="Persetujuan.jsp?no_prop="+document.all["nprop"].value+"&nama_prop="+document.all["cur_naprop"].value+ "&no_kab="+document.all["nkab"].value+"&nama_kab="+document.all["cur_nakab"].value;
      document.pilwil.submit();
   }
   else if(document.all["level"].value==3)
   {
      document.pilwil.action="Persetujuan.jsp?no_prop="+document.all["nprop"].value+"&nama_prop="+document.all["cur_naprop"].value+ "&no_kab="+document.all["nkab"].value+"&nama_kab="+document.all["cur_nakab"].value+ "&no_kec="+document.all["nkec"].value+"&nama_kec="+document.all["cur_nakec"].value;
      document.pilwil.submit();
   }
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<input type=hidden name=cur_naprop value="<%=record.getNamaProp()%>">
<input type=hidden name=cur_nakab value="<%=record.getNamaKab()%>">
<input type=hidden name=cur_nakec value="<%=record.getNamaKec()%>">
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name=pilwil method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
<%
//prop_dis="";
//kab_dis="";
//kec_dis="";
SecurityAuthorize secure = null;

String user_id = request.getParameter("user_id");
if(user_id!=null && !user_id.trim().equals(""))
{
System.out.println("USER_ID: "+user_id);

try
{
         Vector vUser_auth_id = new Vector();
         ServiceController statelessController = ServiceController.getInstance();
         SecurityAuthorizeHome home = (SecurityAuthorizeHome)statelessController.lookup("SecurityAuthorize", SecurityAuthorizeHome.class);
         secure = home.create();

    StringTokenizer st = new StringTokenizer(user_id, "|");
    String token = "";
     while (st.hasMoreTokens())
     {
         token = st.nextToken();
         System.out.println("#userid per token="+token);
         vUser_auth_id.addElement(token);
     }

         boolean status = secure.authorizeUser(vUser_auth_id, record.getUserId());
System.out.println("BOOLEAN status: "+status);
}
catch(Exception e)
{
e.printStackTrace();
System.out.println("ERROR DI pilwil JSP: "+e.toString());
}
}
level=Integer.parseInt(record.getLevelId());
System.out.println("LEVEL DI PAGE pilwil JSP: "+level);
setSecureWilayah(level, record);

String divisi = request.getParameter("divisi");
//System.out.println("DIVISI: "+divisi);

String link="";
if(level==1) link="Menu_Siak_Security.jsp";
if(level==2 || level==3) link="menu_supv_otor.jsp";

%>
      <td background="images/v_bg_header.gif">
        <input type=hidden name="level" value=<%=level%>>
        <jsp:include page="top.html"/>
		</td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                              <div align="center"><span class="submenu">Persetujuan
                                Permohonan Pengguna/User</span><br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="10">
                              <table width="439" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                  <td width="240" valign="top">Divisi</td>
                                  <td width="10" valign="top"> :</td>
                                  <td colspan="2" valign="top">
                                    <input type="radio" name="divisi" value="Supervisor" <%if(divisi!=null && divisi.trim().equals("Supervisor")){%>checked<%}%> onclick="checkCombo('<%=record.getDivision()%>')">
                                    Supervisor<br>
                                    <input type="radio" name="divisi" value="Operator" <%if(divisi!=null && divisi.trim().equals("Operator")){%>checked<%}%> <%if(level==1 || level==2){%>disabled<%}%>>
                                    Operator<br>
                                    <input type="radio" name="divisi" value="Umum" <%if(divisi!=null && divisi.trim().equals("Umum")){%>checked<%}%> onclick="checkCombo('<%=record.getDivision()%>')">
                                    Umum </td>
                                </tr>
<%
String sysdate = "";

nprop = request.getParameter("no_prop");
nkab = request.getParameter("no_kab");
nkec = request.getParameter("no_kec");

nprop = assign(record.getNoProp(), nprop);
nkab = assign(record.getNoKab(), nkab);
nkec = assign(record.getNoKec(), nkec);

naprop = request.getParameter("nama_prop");
nakab = request.getParameter("nama_kab");
nakec = request.getParameter("nama_kec");

naprop = assign(record.getNamaProp(), naprop);
nakab = assign(record.getNamaKab(), nakab);
nakec = assign(record.getNamaKec(), nakec);

%>
                          <tr>
                            <td>Kode-Nama Provinsi </td>
                            <td width="10"> :</td>
                            <td width="4">
<input class=boxdefault size=4 name=nprop onFocus="this.blur()" maxlength="2" <%if(nprop!=null && !nprop.trim().equals("")){%>value="<%=nprop%>"<%}else{%> value="<%=record.getNoProp()%>"<%}%>>
</td>
<td width="80">
<%
idxprop=request.getParameter("idxprop");
idxkab=request.getParameter("idxkab");
idxkec=request.getParameter("idxkec");
%>
<input type="hidden" name="idxprop" value=<%=idxprop%>>
<input type="hidden" name="idxkab" value=<%=idxkab%>>
<input type="hidden" name="idxkec" value=<%=idxkec%>>

<% //disable propinsi?
if (prop_dis.equals("disabled")) {
%>
<input class=boxdefault size=20 name=naprop onFocus="this.blur()" maxlength="30" value="<%=record.getNamaProp()%>">
<%
}else {
%>
<select  name=naprop onChange="pilwil.nprop.value=this.value;document.all['cur_naprop'].value=this.options[this.selectedIndex].text;idxprop.value=this.selectedIndex;" class="boxdefault">
<option value="" selected>-- Pilih Provinsi --</option>
</select>
<%}%>
<%
 if (level==1)
    {
%>
<script language="javascript">
   getProps();
</script>
<%
    }
else
 {
 %>
   <script language="javascript">
    pilwil.naprop.value="<%=naprop%>"
    pilwil.nprop.value="<%=nprop%>"
  </script>
<%
 }
%>
    </td>
                          </tr>
<%if(level>1 && level<4)
{%>
                          <tr>
                            <td>Kode-Nama Kabupaten/Kota </td>
                            <td width="10"> :</td>
                            <td width="4">
<input class=boxdefault size=4 name=nkab onFocus="this.blur()" maxlength="2" <%if(nkab!=null && !nakab.trim().equals("")){%>value="<%=nkab%>"<%}else{%> value="<%=record.getNoKab()%>"<%}%>>
</td>
<td width="80">
<% //disable kabupaten
if (kab_dis.equals("disabled")) {
%>
<input class=boxdefault size=20 name=nakab onFocus="this.blur()" maxlength="30" value="<%=record.getNamaKab()%>">
<%
}else {
%>
<select name=nakab onChange="pilwil.nkab.value=this.value;document.all['cur_nakab'].value=this.options[this.selectedIndex].text;idxkab.value=this.selectedIndex;" class="boxdefault">
<option selected value="">-- Pilih Kabupaten/Kota --</option>
</select>
<%}%>

<%if(level==2)
{
%>
<script language="javascript">
ch_kab(pilwil.nprop.value,pilwil.nakab, 'false', 'true');
pilwil.nkab.value="<%=nkab%>"
</script>
<%
}
else if (level!=1)
{
 %>
   <script language="javascript">
    pilwil.nakab.value="<%=nakab%>"
    pilwil.nkab.value="<%=nkab%>"
  </script>
<%
}
%>
                            </td>
                          </tr>
<%
if(level==3)
{%>
                          <tr>
                            <td>Kode-Nama Kecamatan </td>
                            <td width="10"> :</td>
                            <td width="4">
<input  class=boxdefault size=4 name=nkec onFocus="this.blur()" maxlength="2" <%if(nkec!=null && !nkec.trim().equals("")){%>value="<%=nkec%>"<%}else{%> value="<%=record.getNoKec()%>"<%}%>>
                            </td>
                            <td width="80">
<% //disable kecamatan?
if (kec_dis.equals("disabled")) {
%>
<input class=boxdefault size=20 name=nakec onFocus="this.blur()" maxlength="30" value="<%=record.getNamaKec()%>">
<%
}else {
%>
<select name=nakec onChange="nkec.value=this.value;document.all['cur_nakec'].value=this.options[this.selectedIndex].text;idxkec.value=this.selectedIndex;" class="boxdefault">
<option selected value="">-- Pilih Kecamatan --</option>
</select>
<%}%>
<% if(level==3)
{
%>
<script language="javascript">
ch_kec(pilwil.nprop.value, pilwil.nkab.value, pilwil.nakec, 'false', 'true');
 pilwil.nkec.value="<%=nkec%>"
</script>
<%
}
else if(!((level==1) || (level==2)))
{
 %>
   <script language="javascript">
    pilwil.nakec.value="<%=nakec%>"
    pilwil.nkec.value="<%=nkec%>"
  </script>
<%
}
%>
                            </td>
                          </tr>
<%}
}%>
                              </table>
                            </td>
                          </tr>
                        </table>
<script language="javascript">

<%if (checkValue(idxprop))
{
%>
pilwil.naprop.options[<%=idxprop%>].selected=true;
<%
}
%>

<%if (checkValue(idxkab))
{
%>
pilwil.nakab.options[<%=idxkab%>].selected=true;
<%
}
%>

<%if (checkValue(idxkec))
{
%>
pilwil.nakec.options[<%=idxkec%>].selected=true;
<%
}
%>
</script>
                      </td>
                    </tr>
<tr>
                      <td>
                        <table width="463" border="0" cellspacing="2" cellpadding="0" align="center" height="65">
                          <tr>
                            <td width="459">
                              <div align="center"><b> <a href="javascript:checkRadioButton()"><font color="#2A00AA">Tampilkan
                                Daftar Pengguna</font></a></b></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
<%
Vector vData = null;
if(divisi!=null)
{
try
{
   if(secure==null)
   {
         ServiceController statelessController = ServiceController.getInstance();
         SecurityAuthorizeHome home = (SecurityAuthorizeHome)statelessController.lookup("SecurityAuthorize", SecurityAuthorizeHome.class);
         secure = home.create();
   }
System.out.println("level sebelum secure.getDaftarPengguna= "+level);
         vData = secure.getDaftarPengguna(level, divisi, nprop, nkab, nkec);
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
secure.remove();
}

%>
                    <tr>
                      <td height="35" valign="bottom">
                        <div align="center">
                          <table width="725" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                            <tr>
                              <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                              <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                              <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="C-BG">
                                <table width="100%" border="0" cellspacing="1" cellpadding="3">
                                  <tr>
                                    <td class="C-Fonts" width="5%">
                                      <div align="center"> Pilih</div>
                                    </td>
                                    <td class="C-Fonts" width="32%">
                                      <div align="center">Nama Pengguna/User</div>
                                    </td>
                                    <td class="C-Fonts" width="13%">
                                      <div align="center">NIP</div>
                                    </td>
                                    <td class="C-Fonts" width="23%">
                                      <div align="center">Divisi</div>
                                    </td>
                                    <td class="C-Fonts" width="27%">
                                      <div align="center">Konfirmasi</div>
                                    </td>
                                  </tr>
<%
if( vData!=null && vData.size()>0)
{
for(int i=0;i<vData.size();i++)
{
SecurityObject obj = (SecurityObject)vData.elementAt(i);

%>
                                  <tr>
                                    <td class="C-Field" width="5%">
                                      <div align="center">
                                        <input type=checkbox name=chk value="<%=obj.getUser_id()%>">
                                      </div>
                                    </td>
                                    <td class="C-Field" width="32%">
                                      <div align="center">
                                       <%=obj.getNama_lgkp()%>
                                      </div>
                                    </td>
                                    <td class="C-Field" width="13%">
                                      <div align="center">
                                       <%=obj.getNip()%>
                                      </div>
                                    </td>
                                    <td class="C-Field" width="23%">
                                      <div align="center"><%=obj.getDivision()%></div>
                                    </td>
                                    <td class="C-Field" width="27%">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td>
                                            <div align="center"><b>
                                              <input class=boxstandard type=button value=   Periksa    name="periksa" onclick="checkComboBox(document.pilwil.chk.length, <%=i%>)">
                                              </b></div>
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
<%}
}
else if(vData.size()==0)
{%>
                                <tr>
                                  <td class="C-Field" colspan="5">
                                    <div align="center"><b>
                                    Belum ada data!
                                      </b></div>
                                  </td>
                                </tr>
<%}%>
                                </table>
                              </td>
                              <td>&nbsp;</td>
                            </tr>

                            <tr>
                              <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                              <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                              <td height="5" width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                            </tr>
                          </table>
                          <b> </b></div>
                      </td>
                    </tr>
<%}%>
                    <tr>
                      <td height="45" valign="bottom">
                        <table width="300" border="0" cellspacing="5" cellpadding="5" align="center">
                          <tr>
                            <td width="8">
                              <div align="center"><b> </b></div>
                            </td>
                            <td width="124">
                              <div align="center"><b> </b></div>
                              <div align="center"><b>
                                <input class=boxstandard type="button" value="TERIMA" name="sim"  onClick="terima(document.pilwil.chk.length)" <%if(vData==null || vData.size()==0 || divisi==null){%>disabled<%}%>>
                                </b></div>
                            </td>
                            <td width="118">
                              <div align="center"><b>

<input class=boxstandard type="button" value=KELUAR name="kel" onclick="document.location='<%=link%>'">

                                </b></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr>
                <td><div align="center">
</div>
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
</form>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }catch(Exception err)
{
err.printStackTrace();
}
finally{
idxprop=null;
idxkab=null;
idxkec=null;
}
%>
