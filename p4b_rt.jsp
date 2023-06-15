<%@ page language="java" import="java.util.*,p4b.*"%>
<%@ include file="Global.jsp"%>
<%@ include file="CommonFile.jsp"%>

<%
RtDTO rtdto=null;
RtArtDTO artdto=null;
UserInfo1 record = null;
Vector parent=null,child=null;
String start=null;
String action="",name="";
 record=(UserInfo1)session.getAttribute("remoteRef");
//   if(record != null) {
      nprop = (request.getParameter("nprop")==null?"0":request.getParameter("nprop"));
      naprop = (request.getParameter("naprop")==null?"-":request.getParameter("naprop"));
      nkab = (request.getParameter("nkab")==null?"0":request.getParameter("nkab"));
      nakab = (request.getParameter("nakab")==null?"-":request.getParameter("nakab"));
      nkec = (request.getParameter("nkec")==null?"0":request.getParameter("nkec"));
      nakec = (request.getParameter("nakec")==null?"-":request.getParameter("nakec"));
      nkel = (request.getParameter("nkel")==null?"0":request.getParameter("nkel"));
      nakel = (request.getParameter("nakel")==null?"-":request.getParameter("nakel"));
      if (nkab.trim().equals("")) nakab="-";
      if (nkec.trim().equals("")) nakec="-";
      if (nkel.trim().equals("")) nakel="-";
if (request.getParameter("action")!=null)
action=request.getParameter("action");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<style type="text/css">
<!--
.tbl {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; background-color: #FFFFFF; border: #000000; border-style: inset; border-top-width: thin; border-right-width: thin; border-bottom-width: thin; border-left-width: thin}
.unnamed1 {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px}
.tblbdr {  border: thin #333366 solid; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px}
.Ltable {border-top:0 none buttonface;border-left:0 none buttonface;border-bottom:1 groove buttonshadow;border-right:1 groove buttonshadow;}
-->
</style>
		<style>
		.Atable TD {border-top:1 inset buttonface;border-left:1 inset buttonface;border-bottom:1 inset buttonshadow;border-right:1 inset buttonshadow;}
		</style>

<SCRIPT language="JavaScript">
//document.oncontextmenu=new Function("return false");
function printPage(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Data Rumah Tangga P4B akan di cetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['panel1'].style.visibility='hidden';
              document.all['panel2'].style.visibility='hidden';
              zoom('divpanel',"1");
              window.print();
              obj.style.visibility='visible';
              document.all['panel1'].style.visibility='visible';
              document.all['panel2'].style.visibility='visible';
              zoom('divpanel',"2");
         }
    }
}
function zoom(id,fl)
{
if (fl=="1")
document.all[id].style.zoom="80%";
else
document.all[id].style.zoom="100%";
}
function navig(action)
{
if (action=='A')
{
document.all['ack'].style.visibility="visible"
document.location="p4b_rt.jsp?naprop=<%=naprop%>&nakab=<%=nakab%>&nakec=<%=nakec%>&nakel=<%=nakel%>&nprop=<%=nprop%>&nkab=<%=nkab%>&nkec=<%=nkec%>&nkel=<%=nkel%>&start=1&action="+action;
}
if (action=='N')
{
var name=prompt("Silakan isi nama yang akan anda cari","");

if (name!=null)
{
document.all['ack'].style.visibility="visible"
document.location="p4b_rt.jsp?naprop=<%=naprop%>&nakab=<%=nakab%>&nakec=<%=nakec%>&nakel=<%=nakel%>&nprop=<%=nprop%>&nkab=<%=nkab%>&nkec=<%=nkec%>&nkel=<%=nkel%>&start=1&name="+name+"&action="+action;
}
}
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000">
<div id="ack" style="visibility:hidden">
<img src="images/wait.gif" width="50" height="15" border=0><br>
<font face="verdana" color="blue" size=3><i>Processing.....</i></font>
</div>
<div id="panel1">
<table align="center">
<tr align="center">
<td align="center" >
<div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printPage(this)">
</b></div>
           </td>
            <td>
<div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
</b></div>
</td>
 </tr>
</table>
</div>

<table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Daftar
        Data Rumah Tangga P4B</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4">
                              <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
                                <tr>
                                  <td width="40%">PROVINSI</td>
                                  <td width="2%">:</td>
                                  <td><%=naprop%></td>
                                </tr>
                                <tr>
                                  <td>KABUPTEN/KOTA</td>
                                  <td>:</td>
                                  <td><%=nakab%></td>
                                </tr>
                                <tr>
                                  <td>KECAMATAN</td>
                                  <td>:</td>
                                  <td><%=nakec%></td>
                                </tr>
                                <tr>
                                  <td>DESA/KELURAHAN</td>
                                  <td>:</td>
                                  <td><%=nakel%></td>
                                </tr>
                                <tr>
                                  <td>
                                    TANGGAL
                                  </td>
                                  <td>:</td>
                                  <td><%=record.getToday()%></td>
                                </tr>
</table></td></tr></table>
<div id="panel2">
<table align="center">
<tr align="center">
<td colspan=2 valign="center">
Tampilkan
</td>
</tr>
  <tr align="center">
    <td align="center" >
      <div align="center"><b>
        <input class=boxstandard type=button  name="Cet2" value="SEMUA" onClick="navig('A')">
        </b></div>
    </td>
	   <td align="center" >
      <div align="center"><b>
        <input class=boxstandard type=button  name="Cet2" value="NAMA" onClick="navig('N')">
        </b></div>
    </td>
 </tr>
</table>
</div>
<%
 try{
if (request.getParameter("start")!=null)
   {
   if (action.equals("A"))
     {
  parent=new DelegateRT().getDaftarData(nprop,nkab,nkec,nkel);
     }
   if (action.equals("N"))
     {
  name=request.getParameter("name");
  parent=new DelegateRT().getDaftarData(nprop,nkab,nkec,nkel,name);
     }

if(parent.isEmpty()) {
%>
<%=printError("Data Belum Ada")%>
<%
 }
      else
         {

%>
<div id="divpanel" align="center" style="zoom:100%">
  <table border="0" cellspacing="1" cellpadding="3" class="Atable" align="center">
    <tr>
      <td width="37">
        <div align="center">NBS&nbsp;</div>
      </td>
      <td width="41">
        <div align="center">No. Urut</div>
      </td>
      <td width="52">
        <div align="center">No.KK</div>
      </td>
      <td align="center"  width="66">Nama Kepala</td>
      <td align="center"  width="6">Alamat </td>
      <td colspan="2" width="759">
        <div align="center">Anggota Rumah Tangga</div>
      </td>
 </tr>
<%
int prnt=parent.size();
%>

    <%
               int sno=1;
               int flag=0;
               int i=0;
while(i<parent.size())
{
         rtdto=(RtDTO)parent.elementAt(i);
			  %>
    <tr>
      <td   valign="top" width="37"> <%=rtdto.getNbs()%> </td>
      <td  nowrap valign="top" width="41"><%=rtdto.getNurt()%></td>
      <td  nowrap valign="top" width="52">
        <%
try
{%>
        <%=rtdto.getNoKK().substring(0,rtdto.getNoKK().indexOf(","))%>
        <%
}catch(Exception ep)
{
out.print("-");
}
%>
      </td>
      <td  nowrap valign="top"  width="66">
        <%
try
{%>
        <%=rtdto.getNoKK().substring(rtdto.getNoKK().indexOf(",")+1)%>
        <%
}catch(Exception ep)
{
out.print("-");
}%>
      </td>
      <td   valign="top" width="6"><%=rtdto.getAlamat()%></td>
      <td width="759">
        <table  border="0" cellspacing="0" cellpadding="0" class="Atable">
          <%if (flag==0)
                  {%>
          <tr >
            <td  width="200"   align="center">Nama Lengkap</td>
            <td   width="200" align="center">Tmpt.Lahir</td>
         <td  align="center"  width="20" >Tgl.Lahir</td>
            <td  width="180" align="center">SHDRT</td>
               <td  width="12" align="center">Jenis Kelamin</td>
            <td  width="11" align="center">Status Kawin</td>
          </tr>
          <%}
					 else
					  {
					 %>
          <tr >
            <td   width="24%">&nbsp;</td>
            <td  width="24%">&nbsp;</td>
            <td width="10%"  >&nbsp;</td>
            <td nowrap width="19%"  >&nbsp;</td>
            <td width="12%"  >&nbsp;</td>
            <td width="11%"  >&nbsp;</td>
          </tr>
          <%
					  }
				   child=rtdto.getAnggotaKeluarga();
                                    int j=0;
                                     while(j<rtdto.getAnggotaKeluarga().size())
			                 {
			               artdto=(RtArtDTO)child.elementAt(j);
				  %>
          <tr>
            <td   width="24%"><%=artdto.getNama()%></td>
            <td  nowrap width="24%"><%=artdto.getTmplahir()%></td>
            <td nowrap  width="19%" ><%=artdto.getTglLahir()%></td>
            <td  nowrap  width="10%"><%=artdto.getStdlmrt()%></td>
            <td  width="12%"  align="center"><%=artdto.getJenisKl()%></td>
            <td  nowrap width="11%"><%=artdto.getStkawin()%></td>
          </tr>
          <%
                              flag=1;
                                       j++;
					  }
					 %>
</table>
</td>
 </tr>
<%
i++;
}
%>
<script language="javascript">
document.all['ack'].style.visibility="hidden"
</script>
</table>
</div>
</BODY>
</HTML>
<%
}
       }
 }catch(Exception err)
{
%>
<%=printError("Data Belum Ada")%>
<%
}
%>
