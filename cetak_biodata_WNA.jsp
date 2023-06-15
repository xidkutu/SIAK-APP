<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,biodata.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*"%>
<%@ include file="Global.jsp"%>
<%
UserInfo1 record = null;
ServiceController controller;
BiodataWNIObject wniObject = null;
String radiobutton="";
String stat_print=null,stat_change=null;
Vector vBiodata = new Vector();
Vector vDataKelurahan = new Vector();

Biodata biodata = null;
//String no_prop="",no_kab="",no_kec="",no_kel="";
String selidx="";
long start=0;
long end=0;
long tot_rec=0;
long tot_page=0,page_no=0;
boolean access=true;
boolean finish=false;
String spesifik_nik=null;
boolean nik_one=false;
String update=null;

%>

<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="javascript">
function showDialogBox()
{
    while(true)
    {
    var nik = prompt("Masukkan NIK yang ingin dicari: ", "");

    if(nik==null
       || nik=="" )
    {
       alert("Silakan Isi NIK yang dikehendaki.");
       return false;
    }
    else if(nik.length!=17)
    {
       alert("Nomor NIK Tidak boleh lebih/kurang dari 16 digit.");
    }
    else
    {
      document.formbiodatawna.spesifik_nik.value = nik;
      document.formbiodatawna.action="cetak_biodata_WNA.jsp?flag=0&spesifik_nik="+document.formbiodatawna.spesifik_nik.value;
      document.formbiodatawna.submit();
      break;

    }
    }
}

function viewBiodataIndividu(v)
{
    var niks="";
    var arr = new Array(v);
    var x = 0;
    var chk=false;

    var param="";
    var onemember=false;

    if(v>1)
    {
     for(i=0;i<v;i++)
     {
        if(document.formbiodatawna.cb[i].checked)
        {
           niks=document.formbiodatawna.cb[i].value;
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
        niks = document.formbiodatawna.cb.value;
        if(!document.formbiodatawna.cb.checked)
        {
         window.alert('Belum Pilih NIK');
        return;
        }

    }

     if(chk)
     {
         var radio = document.formbiodatawna.radiobutton;
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
             param = param + "|" +arr[i];
         }

         param = param.substring(1);
         if(onemember)
         {
             param = niks;
         }

         window.open("cetak_biodata_WNA_Lamp.jsp?radiobutton="+radioValue+"&cb="+param+"&nama_pej="+document.formbiodatawna.nama_pej.value+"&nip_pej="+document.formbiodatawna.nip_pej.value+"&jabatan="+document.formbiodatawna.jabatan.value+"&nama_kab="+document.formbiodatawna.nama_kab.value, '','fullscreen=yes,scrollbars=yes,menubar=no,toolbar=no' );
     }
     else
     {
         window.alert('Belum Pilih NIK');
     }
}

function checkRadioButton(flag)
{
   var vchecked;
   var radio = document.formbiodatawna.radiobutton;

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
     alert("Belum Pilih Jenis Biodata WNA!");
   }
   else
   {
      document.formbiodatawna.action="cetak_biodata_WNA.jsp"
      document.formbiodatawna.submit();
   }
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>

<%
if (request.getParameter("radiobutton")!=null)
radiobutton = request.getParameter("radiobutton");

String no_prop= request.getParameter("no_prop");
String no_kab= request.getParameter("no_kab");
update=request.getParameter("update");

try{
if (request.getParameter("page_no")!=null) page_no=Long.parseLong(request.getParameter("page_no"));
}catch(Exception e1){}
try{
if (request.getParameter("tot_page")!=null) tot_page=Long.parseLong(request.getParameter("tot_page"));
}catch(Exception e2){}

spesifik_nik = request.getParameter("spesifik_nik");
if ((spesifik_nik!=null) && (!spesifik_nik.equals(""))) nik_one=true;

controller = ServiceController.getInstance();

if (update!=null && update.trim().equals("ok"))
 {
   Vector vNik=new Vector();
  String param_nik = request.getParameter("param_nik");
   StringTokenizer st = new StringTokenizer(param_nik, "|");
   String token = "";

    while (st.hasMoreTokens())
     {
         token = st.nextToken();
         System.out.println("#param_nik per token="+token);
         vNik.addElement(token);
     }

  BiodataHome home = (BiodataHome)controller.lookup("BiodataBean", BiodataHome.class);
  biodata = home.create();
///////////////////////
/*
       ServiceController factory = ServiceController.getInstance();
       MonitorCetakUlangHome monHome = (MonitorCetakUlangHome) factory.lookup(
         "MonitorCetakUlang", MonitorCetakUlangHome.class);
       MonitorCetakUlang monitorBean = monHome.create();
*/
////////////////


        int result[] = biodata.updatePrintStatusWna(vNik);
//////////////////
/*
      Login temp = (Login) session.getAttribute("remoteSupv");
      if (temp!=null) {
         String  authBy = temp.getUserInfo().getUserId();
         String  authTo = record.getUserId();
         java.util.Date authDate = (java.util.Date) session.getAttribute("authDate");
         monitorBean.addCetakUlangAction("biodata_WNA", "NIK", vNik, authBy, authTo, authDate);
         monitorBean.remove();
      }
*/
///////////////////////////
 }
///////////////////////
//removeCetakUlangAttribute(session);
//////////////////////////
String brchk="",perchk="",ulgchk="";


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

   if (biodata==null)
      {
   BiodataHome home = (BiodataHome)controller.lookup("BiodataBean", BiodataHome.class);
   biodata = home.create();
      }

//Begin Specific NIK
if (spesifik_nik!=null && !spesifik_nik.trim().equals(""))
   {
   System.out.println("Entered Step3 specific");
   vBiodata=biodata.getSpecificNikWna(spesifik_nik.trim(),stat_print,stat_change,record.getNoProp(),record.getNoKab());
   finish=true;
   }
//End Specific NIK
else
  {
//Begin For all Records
System.out.println("Entered Step4 ALL");
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
 vBiodata=biodata.getAllDataWna(record.getNoProp(),record.getNoKab(),String.valueOf(start),String.valueOf(end),stat_print,stat_change,access);
try{
if (!access)  tot_rec=Long.parseLong(biodata.getTotalRecordWna());
}catch(Exception e6){}

  if (end>=tot_rec)
  {
end=tot_rec;
finish=true;
  }
  if (start>=tot_rec) start=tot_rec;
//end for all records
tot_page=(long)(Math.ceil((double)tot_rec/5));

if (page_no>=tot_page) page_no=tot_page;
else page_no=page_no+1;
}}
System.out.println("Entered Step5 ");
%>

</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
<form method="post" name="formbiodatawna">
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
                                <div align="center"><span class="submenu">Daftar
                                  Cetak Biodata WNA</span><br>
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
                                    <div align="center"><b>Cetak Biodata WNA</b></div>
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
                              <div align="center">
<b>
<a href="#"  onClick="page_no.value=0;tot_page.value=0;start.value=0;end.value=0;tot_rec.value=0;checkRadioButton()">
<font color="#2A00AA">Tampilan  Semua Data</font>
</a>
</b>
</div>
</td>
                            <td width="11">
                              <div align="center"></div>
                            </td>
                            <td width="242">
   <div align="center"><b><a href="#" onClick="showDialogBox()">
    <font color="#2A00AA">Tampilan Berdasarkan NIK</font></a></b></div>

                            </td>
                          </tr>

                          <tr>
                         <td colspan="3">&nbsp;

                         </td>
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
   if (vBiodata!=null)
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
                            <td class="C-Fonts" width="5%">
                              <div align="center"> Pilih</div>
                            </td>
                            <td class="C-Fonts" width="15%" nowrap>
                              <div align="center">Nomor KK</div>
                            </td>
                            <td class="C-Fonts" width="13%" nowrap>
                              <div align="center">NIK</div>
                            </td>
                            <td class="C-Fonts" width="18%" nowrap>
                                <div align="center">Nama Pertama</div>
                            </td>
                            <td class="C-Fonts" width="17%" nowrap>
                              <div align="center">Jenis Kelamin</div>
                            </td>
                            <td class="C-Fonts" width="32%" nowrap>
                              <div align="center">Alamat</div>
                            </td>
                          </tr>
<%
       if(vBiodata.size()==0 && wniObject==null)
      {
%>
                                <tr>
                                  <td class="C-Field" colspan="9">
                                    <div align="center"><b>
                                    Belum ada data!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(wniObject!=null && wniObject.getFound()==false)
      {%>
                                <tr>
                                  <td class="C-Field" colspan="9">
                                    <div align="center"><b>
                                    Data dengan Nik <%=spesifik_nik%> tidak ditemukan!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(wniObject!=null && wniObject.getFound()==true)
      {
%>
                          <tr>
                            <td class="C-Field" width="5%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=wniObject.getNik()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="15%" nowrap>
                              <div align="center"><%=wniObject.getNo_kk()%></div>
                            </td>
                            <td class="C-Field" width="13%" nowrap>
                              <div align="center"><%=wniObject.getNik()%></div>
                            </td>
                            <td class="C-Field" width="18%" nowrap><%=wniObject.getNama_lgkp()%>&nbsp;</td>
                            <td class="C-Field" width="17%" nowrap><%=wniObject.getJenis_klmin()%>&nbsp;</td>
                            <td class="C-Field" width="32%" nowrap><%=wniObject.getAlamat()%>&nbsp;</td>
                          </tr>

      <%}
      else
      {
System.out.println("Entered Step 6 ");
          for(int i=0;i<vBiodata.size();i++)
          {
System.out.println("Entered Step 7 ");
             BiodataWNIObject obj = (BiodataWNIObject)vBiodata.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="5%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=obj.getNik()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="15%" nowrap>
                              <div align="center"><%=obj.getNo_kk()%></div>
                            </td>
                            <td class="C-Field" width="13%" nowrap>
                              <div align="center"><%=obj.getNik()%></div>
                            </td>
                            <td class="C-Field" width="18%" nowrap><%=obj.getNama_lgkp()%>&nbsp;</td>
                            <td class="C-Field" width="17%" nowrap><%=obj.getJenis_klmin()%>&nbsp;</td>
                            <td class="C-Field" width="32%" nowrap><%=obj.getAlamat()%>&nbsp;</td>
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
    System.out.println("#ServiceController Error= "+e.toString());
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
              <tr>
                <td>
                  <table width="500" border="0" cellspacing="3" cellpadding="3" align="center">
                    <tr>
                      <td width="104">
                        <div align="center"><b>
                          <input class=boxstandard type=button value=   TAMPILKAN    name="tampilkan" onclick="if(document.formbiodatawna.cb.length==undefined){viewBiodataIndividu(1);}else{viewBiodataIndividu(document.formbiodatawna.cb.length);}" <%if( (vBiodata.size()==0 && wniObject==null) || (wniObject!=null && wniObject.getFound()==false) ){%>disabled<%}%>>
                          </b></div>
                      </td>
                      <td width="101">
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNA_Menu.jsp'">
                          </b></div>
                      </td>
                      <td width="230">
<div align="center" style="position:absolute" id="vis">

<%
if ((start>5) && (vBiodata.size()!=0))
{
%>
 <b>&lt;&lt;
<a name="previous" href="#1" onclick="javascript:history.back();">
<font color="#FFFFFF">Sebelumnya</font></a>
<%
}
%>


</b>
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
                          <%}%>
  </b>
</div>
                    </td>
                    </tr>
                    <tr>
                      <td width="104">&nbsp;</td>
                      <td width="101">&nbsp;</td>
                      <td width="265">

                      <%if ( !nik_one && (vBiodata.size()!=0) && (radiobutton!=null) && (!radiobutton.trim().equals("")))
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
                  </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
<%
    }
else
{
%>
<div align="center">
<b>
<input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNA_Menu.jsp'">
</b>
</div>
<%
}
%>
           </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
<input type="hidden" name="nkel" value=""></td>
    <td><input type="hidden" name="spesifik_nik">

<script language="javascript">
function bottom()
{
window.scroll(0,800);
}
bottom()
</script>
</td>
  </tr>
</table>
</form>
</BODY>
</HTML>
<%
}
else
{
response.sendRedirect("index.jsp");
}
}
catch(Exception err){
 err.printStackTrace();
}
finally{
biodata.remove();
finish=false;
start=0;
end=0;
tot_rec=0;
nik_one=false;
update=null;
}
%>

