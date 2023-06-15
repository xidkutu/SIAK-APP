<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,viewkk.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*"%>
<%@ include file="Global.jsp"%>
<%
UserInfo1 record = null;
DaftarKKObject kkObject = null;
int next=0;
Vector vDaftarCetakKk = new Vector();
DaftarCetakKK daftarCetakKK = null;
long start=0;
long end=0;
long tot_rec=0;
long tot_page=0,page_no=0;
boolean access=true;
boolean finish=false;
String spesifik_kk=null;
boolean kk_one=false;
String valueStr="";
String radiobutton="";
String stat_print=null,stat_change=null;
ServiceController controller;
String update=null;
%>

<%
   try
   {
record = (UserInfo1)session.getAttribute("remoteRef");

if(record != null)
  {
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/trim.js">
</SCRIPT>
<SCRIPT language="javascript">

function showDialogBox()
{
 while(true)
    {
    var no_kk = trim(prompt("Masukkan Nomor Kartu Keluarga yang ingin dicari: ", ""));

    if(no_kk=="")
    {
       alert("Silakan Isi nomor KK yang dikehendaki.");
       //return false;
    }
    else if(no_kk!=null && isNaN(no_kk) )
    {
       alert("Isilah dengan Angka");
    }
    else if(no_kk!=null && no_kk.length!=16)
    {
       alert("Nomor KK Tidak boleh lebih/kurang dari 16 digit.");
    }
    else if(no_kk!=null && no_kk!="")
    {
      document.formDaftarKKWNA.spesifik_kk.value = no_kk;
      document.formDaftarKKWNA.action="DaftarKK_WNA.jsp?flag=0&spesifik_kk="+document.formDaftarKKWNA.spesifik_kk.value
      document.formDaftarKKWNA.submit();
      break;
    }
    else
    {
      return false;
    }

  }}

function viewKKPage(v)
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
        if(document.formDaftarKKWNA.cb[i].checked)
        {
           niks=document.formDaftarKKWNA.cb[i].value;
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
        niks = document.formDaftarKKWNA.cb.value;
        if(!document.formDaftarKKWNA.cb.checked)
        {
         window.alert('Belum Pilih Nomor KK');
        return;
        }
    }

     if(chk)
     {
         var radio = document.formDaftarKKWNA.radiobutton;
         var radioValue ="";
        for (i=0;i<radio.length;i++)
        {
            if (radio[i].checked)
            {
               radioValue= radio[i].value;
               break;
            }
        }

      for(i=0;i<x;i++)
         {
             param = param + "*" +arr[i];
         }

        param = param.substring(1);

         if(onemember)
         {
             param = niks;
         }
     window.open("cetak_KK_WNA.jsp?radiobutton="+radioValue+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&cb="+param+"&jabatan="+document.all["jabatan"].value+"&nama_pej="+document.all["nama_pej"].value+"&nip_pej="+document.all["nip_pej"].value, '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
   }
    else
     {
         window.alert('Belum Pilih Nomor KK');
     }
}
function checkRadioButton()
{
   var vchecked;
   var radio = document.formDaftarKKWNA.radiobutton;

   for (i=0;i<radio.length;i++)
  {
     if (radio[i].checked)
     {
        vchecked = true;
        break;
    }
   }
   if (!vchecked)
   {
     alert("Belum Pilih Jenis Cetak Kartu Keluarga (KK)!");
   }
   else
   {
      document.formDaftarKKWNA.action="DaftarKK_WNA.jsp"
      document.formDaftarKKWNA.submit();
   }
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>

<%
if (request.getParameter("radiobutton")!=null)
radiobutton = request.getParameter("radiobutton");

no_prop= request.getParameter("no_prop");
no_kab= request.getParameter("no_kab");
update=request.getParameter("update");
try{
if (request.getParameter("page_no")!=null) page_no=Long.parseLong(request.getParameter("page_no"));
}catch(Exception e1){}
try{
if (request.getParameter("tot_page")!=null) tot_page=Long.parseLong(request.getParameter("tot_page"));
}catch(Exception e2){}

spesifik_kk = request.getParameter("spesifik_kk");

if ((spesifik_kk!=null) && (!spesifik_kk.equals(""))) kk_one=true;

String nama_kel = request.getParameter("nama_kel");

controller = ServiceController.getInstance();
String brchk=null,perchk=null,ulgchk=null;




if (radiobutton!=null & !radiobutton.trim().equals(""))
{
       if(  radiobutton.trim().equalsIgnoreCase("Baru"))
       {
          stat_print="N";
          stat_change="N";
             brchk="checked";
       }
       else if( radiobutton.trim().equalsIgnoreCase("Perubahan"))
       {
          stat_print="Y";
          stat_change="Y";
            brchk="";
          perchk="checked";

       }
       else if( radiobutton.trim().equalsIgnoreCase("Ulang"))
       {
          stat_print="Y";
          stat_change="N";
            brchk="";
          perchk="";
          ulgchk="checked";
       }

    if ((update!=null) && (update.equals("ok")))
    {
        Vector vKK = new Vector();
       String param_kk = request.getParameter("param_kk");
       StringTokenizer st = new StringTokenizer(param_kk, "*");
       String token = "";

     while (st.hasMoreTokens())
     {
         token = st.nextToken();
         System.out.println("#PARAM_KK per token="+token);
         vKK.addElement(token);
     }
     ViewKK view = null;
     ViewKKHome home = (ViewKKHome)controller.lookup("ViewKKBean", ViewKKHome.class);
     view = home.create();

///////////////////////
/*
       ServiceController factory = ServiceController.getInstance();
       MonitorCetakUlangHome monHome = (MonitorCetakUlangHome) factory.lookup(
         "MonitorCetakUlang", MonitorCetakUlangHome.class);
       MonitorCetakUlang monitorBean = monHome.create();
*/
////////////////

     int result[] = view.updatePrintStatusWna(vKK, stat_print, stat_change);
//////////////////
/*
      Login temp = (Login) session.getAttribute("remoteSupv");
      if (temp!=null) {
         String  authBy = temp.getUserInfo().getUserId();
         String  authTo = record.getUserId();
         java.util.Date authDate = (java.util.Date) session.getAttribute("authDate");
         monitorBean.addCetakUlangAction("KK_WNA", "NO_KK", vKK, authBy, authTo, authDate);
         monitorBean.remove();
      }
*/
///////////////////////////
     view.remove();
     view=null;
     }
///////////////////////
//removeCetakUlangAttribute(session);
//////////////////////////
//Begin Specific KK

if (spesifik_kk!=null && !spesifik_kk.trim().equals(""))
   {
  DaftarCetakKKHome home = (DaftarCetakKKHome)controller.lookup("DaftarCetakKK", DaftarCetakKKHome.class);
  daftarCetakKK = home.create();
   vDaftarCetakKk=daftarCetakKK.getSpecifickkWna(spesifik_kk.trim(),stat_print,stat_change,record.getNoProp(),
   record.getNoKab());
  finish=true;
   }
//End Specific NIK
else
 {
//Begin For all Records
DaftarCetakKKHome home = (DaftarCetakKKHome)controller.lookup("DaftarCetakKK", DaftarCetakKKHome.class);
 daftarCetakKK = home.create();
try{
  if (request.getParameter("start")!=null)  start=Long.parseLong(request.getParameter("start"));
}catch(Exception e3){}
try{
  if (request.getParameter("end")!=null)     end=Long.parseLong(request.getParameter("end"));
}catch(Exception e4){}
try{
  if (request.getParameter("tot_rec")!=null)   tot_rec=Long.parseLong(request.getParameter("tot_rec"));
}catch(Exception e5){}
  if (tot_rec==0) access=false;

  start=end+1;
  end=end+5;

 vDaftarCetakKk=daftarCetakKK.getAllDataWna(record.getNoProp(),record.getNoKab(),String.valueOf(start),String.valueOf(end),stat_print,stat_change,access);
try{
 if (!access)  tot_rec=Long.parseLong(daftarCetakKK.getTotalRecordWna());
}catch(Exception e6){}

  if (end>=tot_rec)
  {
end=tot_rec;
finish=true;
  }

 if (start>=tot_rec) start=tot_rec;
//end for all records

tot_page=(long)(Math.ceil((double)tot_rec/5));

if (page_no>=tot_page)
page_no=tot_page;
else
page_no=page_no+1;
}}
%>

<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
<form method="post" name="formDaftarKKWNA">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">
    <input type="hidden" name="start" value="<%=start%>">
    <input type="hidden" name="end" value="<%=end%>">
    <input type="hidden" name="tot_rec" value="<%=tot_rec%>">
    <input type="hidden" name="tot_page" value="<%=tot_page%>">
    <input type="hidden" name="page_no" value="<%=page_no%>">
        <input type="hidden" name="nama_pej" value="<%=record.getKabNamaPej()%>">
        <input type="hidden" name="nip_pej" value="<%=record.getKabNipPej()%>">
        <input type="hidden" name="jabatan" value="<%=record.getKabJabatan()%>">
		<jsp:include page="top.html"/>
      </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                              <div align="center"><span class="submenu">
                                Daftar Cetak Kartu Keluarga (KK)</span><br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                       <td>
                          <jsp:include page="data_wilayah.jsp"> <jsp:param name="level" value="2"/>
                            <jsp:param name="no_prop" value="<%=record.getNoProp()%>"/>
                            <jsp:param name="nama_prop" value="<%=record.getNamaProp()%>"/>
                            <jsp:param name="no_kab" value="<%=record.getNoKab()%>"/>
                            <jsp:param name="nama_kab" value="<%=record.getNamaKab()%>"/>
                          </jsp:include>
			           </td>
                    </tr>
                    <tr>
                      <td valign="top" height="35">
                        <table width="290" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td class="C-BG">
                              <table border="0" cellspacing="1" cellpadding="3" align="center" width="100%">
                                <tr>
                                  <td class="C-Field" colspan="3">
                                    <div align="center"><b>Jenis Cetak Kartu Keluarga
                                      (KK)</b></div>
                                  </td>
                                </tr>

                                                       <tr>
                                  <td class="C-Field" width="27%">
                                    <div align="center">
                                      <input type="radio" name="radiobutton" value="Baru" <%=brchk%>>
                                      Baru</div>
                                  </td>
                                  <td class="C-Field" width="40%">
                                    <div align="center">
                                      <input type="radio" name="radiobutton" value="Perubahan" <%=perchk%>>
                                      Perubahan </div>
                                  </td>
                                  <td class="C-Field" width="33%">
                                    <div align="left">
                                      <input type="radio" name="radiobutton" value="Ulang" <%=ulgchk%>>
                                      Ulang</div>
                                  </td>
                                </tr>


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
                        <br>
                        <table width="475" border="0" cellspacing="2" cellpadding="0" align="center">
                          <tr>
                            <td width="214">
                              <div align="center"></div>
                            </td>
                            <td width="11">
                              <div align="center"></div>
                            </td>
                            <td width="242">
                              <div align="center"></div>
                            </td>
                          </tr>
                          <tr>
                            <td width="214">

                              <div align="center"><b>
<a href="#"  onClick="page_no.value=0;tot_page.value=0;start.value=0;end.value=0;tot_rec.value=0;checkRadioButton()">

<font color="#2A00AA">Tampilan
                                Semua Data</font></a></b></div>
                            </td>
                            <td width="11">
                              <div align="center"></div>
                            </td>
                            <td width="242">
                              <div align="center"><b><a href="#" onClick="showDialogBox()"><font color="#2A00AA">Tampilan
                                Berdasarkan Nomor KK</font></a></b></div>
                            </td>
                          </tr>
                          <tr>
                            <td width="214">
                            <input type="hidden" name="spesifik_kk">
                            &nbsp;
                            </td>
                            <td width="11">&nbsp;</td>
                            <td width="242">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
<%
if( radiobutton!=null && no_prop!=null && no_kab!=null)
{

try
{
   if (vDaftarCetakKk!=null)
    {
%>
             <table width="650" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="1" height="1"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
                        <table width="100%" border="0" cellspacing="1" cellpadding="3" class="C-BG">
                          <tr>
                            <td class="C-Fonts" width="10%">
                              <div align="center"> Pilih</div>
                            </td>
                            <td class="C-Fonts" width="16%">
                              <div align="center">Nomor KK</div>
                            </td>
                            <td class="C-Fonts" width="35%" nowrap>
                              <div align="center">Nama Kepala Keluarga</div>
                            </td>
                            <td class="C-Fonts" width="39%">
                              <div align="center">Alamat</div>
                            </td>
                          </tr>
<%
       if(vDaftarCetakKk.size()==0 && kkObject==null)
      {%>
                                <tr>
                                  <td class="C-Field" colspan="4">
                                    <div align="center"><b>
                                    Belum ada data!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(kkObject!=null && kkObject.getFound()==false)
      {%>
                                <tr>
                                  <td class="C-Field" colspan="4">
                                    <div align="center"><b>
                                    Data dengan Nomor KK <%=spesifik_kk%> tidak ditemukan!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(kkObject!=null && kkObject.getFound()==true)
      {%>
                          <tr>
                            <td class="C-Field" width="10%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=kkObject.getNomorKK()+"*"+kkObject.getNamaKep()+"*"+kkObject.getAlamat()+"*"+kkObject.getNo_rt()+"*"+kkObject.getNo_rw()+"*"+kkObject.getKode_pos()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="16%">
                              <div align="center"><%=kkObject.getNomorKK()%> </div>
                            </td>
                            <td class="C-Field" width="35%" nowrap>
                              <div align="center"> <%=kkObject.getNamaKep()%></div>
                            </td>
                            <td class="C-Field" width="39%" nowrap><%=kkObject.getAlamat()%>&nbsp;</td>
                          </tr>
      <%}
      else
      {

          for(int i=0;i<vDaftarCetakKk.size();i++)
          {
             DaftarKKObject obj = (DaftarKKObject)vDaftarCetakKk.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="10%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=obj.getNomorKK()+"*"+obj.getNamaKep()+"*"+obj.getAlamat()+"*"+obj.getNo_rt()+"*"+obj.getNo_rw()+"*"+obj.getKode_pos()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="16%">
                              <div align="center"><%=obj.getNomorKK()%> </div>
                            </td>
                            <td class="C-Field" width="35%" nowrap>
                              <div align="center"> <%=obj.getNamaKep()%></div>
                            </td>
                            <td class="C-Field" width="39%" nowrap><%=obj.getAlamat()%>&nbsp;</td>
                          </tr>
<%
          }
      }
%>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
<%
    }

}
catch(Exception e)
{
    e.printStackTrace();
    System.out.println("#daftarKK_wna ServiceController Error= "+e.toString());
}
%>

                    <tr>
                      <td height="1" width="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td width="1" height="1"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
<%}%>
              <tr>
                <td>
                  <table width="500" border="0" cellspacing="3" cellpadding="3" align="center">
                    <tr>
<%
if( radiobutton!=null && no_prop!=null && no_kab!=null)
{
%>
                      <td width="104">
                        <div align="center"><b>
                          <input class=boxstandard type=button value=   TAMPILKAN    name="tampilkan" onClick="if(document.formDaftarKKWNA.cb.length==undefined){viewKKPage(1);}else{viewKKPage(document.formDaftarKKWNA.cb.length);}" <%if( (vDaftarCetakKk.size()==0 && kkObject==null) || (kkObject!=null && kkObject.getFound()==false) ){%>disabled<%}%>>
                          </b></div>
                      </td>
                      <td width="101">
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNA_Menu.jsp'">
                          </b></div>
                      </td>
<%}
else
{%>
                      <td width="104"><div align="center"></div>
                      </td>
                      <td width="101">
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNA_Menu.jsp'">
                          </b></div>
                      </td>

<%}

if( radiobutton!=null && no_prop!=null && no_kab!=null)
{
%>
<td width="230">
<div align="center" style="position:absolute" id="vis">

<%
if ((start>5) && (vDaftarCetakKk.size()!=0))
{
%>
 <b>&lt;&lt;
<a name="previous" href="#1" onclick="javascript:history.back();">
<font color="#FFFFFF">Sebelumnya</font></a>
</b>
<%
}
%>
</div>
<%
if (!finish)
      {
      %>
   <div align="right">
<b>
. . .
     <a name="next" href="#2" onclick="checkRadioButton()">
   <font color="#FFFFFF">Berikutnya</font></a>
                          &gt;&gt;
          <%
}
%>
                          </b>
</div>
                   </td>
                    </tr>
                    <tr>
                      <td width="104">&nbsp;</td>
                      <td width="101">&nbsp;</td>
                            <td width="265">

                      <%if ( !kk_one && (vDaftarCetakKk.size()!=0) && (radiobutton!=null) && (!radiobutton.trim().equals("")))
                           {
                         %>
                           <b>
                               <center>
                             <font color="#FFFFFF">
                              Halaman &nbsp;<%=page_no%>&nbsp; dari &nbsp;<%=tot_page%>
                             </font>
                           </center>
                           </b>
                             <%
                            }
                            %>
                            </td>
                    </tr>
<%
    }
%>
                  </table>
                </td>
              </tr>
<%
if( radiobutton!=null && no_prop!=null && no_kab!=null)
{
%>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
<%
    }
%>
           </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td><input type="hidden" name="spesifik_kk">&nbsp;</td>
    <td><input type=hidden name="nkel" value="">
</td>
</tr>
</table>
</form>
</BODY>
<script language="javascript">
function bottom()
{
window.scroll(0,800);
}
bottom()
</script>
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
finally{
if (daftarCetakKK!=null)
  daftarCetakKK.remove();
finish=false;
start=0;
end=0;
tot_rec=0;
kk_one=false;
update=null;
}
%>
