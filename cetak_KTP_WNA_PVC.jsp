<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,ktp.wni.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*"%>
<%@ page import="com.wilayah.*"%>
<%@ include file="Global.jsp"%>
<%
    UserInfo1 record = null;
    String valueStr="";
    String radiobutton="";
    KTPWniObject wnaObject=null;
    String stat_print=null;
    Vector vKtp = new Vector();
    Vector vDataKelurahan = new Vector();
    CetakKTP cetakKTP = null;
    String spesifik_nik=null;

    boolean nik_one=false;
    boolean access=true;
    boolean finish=false;

    ServiceController controller;
    long start=0,end=0,tot_rec=0;
    long tot_page=0,page_no=0;
    String update=null;
    String stat_change="";
    int level=2;
%>

<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
  {
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT LANGUAGE="JavaScript">
function checkedAll() {
  if(document.formktpwna.cb!=null && document.formktpwna.cb.length!=undefined) {
     for (i=0; i<document.formktpwna.cb.length; i++)  {
        document.formktpwna.cb[i].checked = document.formktpwna.cekcb.checked;
     }
  }
}
    extArray = new Array(".gif", ".jpg");
    function LimitAttach(form, file, image)
    {
        var filename =file;
        allowSubmit = false;
        if (!file) return;
        while (file.indexOf("\\") != -1)
           file = file.slice(file.indexOf("\\") + 1);
           ext = file.slice(file.indexOf(".")).toLowerCase();
       for (var i = 0; i < extArray.length; i++)
       {
           if (extArray[i] == ext) { allowSubmit = true; break; }
       }

       if (allowSubmit)
       {
            image.src = "file://"+filename;
            image.style.visibility='visible';
       }
       else
          alert("Please only upload files that end in types:  "
          + (extArray.join("  ")) + "\nPlease select a new "
          + "file to upload");
    }
</SCRIPT>

<SCRIPT language="javascript">
function unchecked(len)
{
if(len==6 && document.all["member"].value=="2")
{
      if( !document.formktpwna.cb.checked && (document.all["imgfoto0"].src!= null
               || document.all["imgfoto0"].src!="") )
     {
          document.all["imgfoto0"].src="";
          document.all["imgfoto0"].style.visibility='hidden';

          document.all["uploadfile0"].value="";
          document.all["uploadfile0"].replaceAdjacentText("beforeBegin", "");

     }
}
else if(document.all["member"].value=="1")
{
      if( !document.formktpwna.cb.checked && (document.all["imgfoto"].src!= null
               || document.all["imgfoto"].src!="") )
     {
          document.all["imgfoto"].src="";
          document.all["imgfoto"].style.visibility='hidden';

          document.all["uploadfile"].style.visibility='hidden';
     }
     else
     {
          document.all["uploadfile"].style.clear;
          document.all["uploadfile"].style.visibility='visible';
     }
}
else if(len!=6 &&document.all["member"].value=="2")
{
      if( !document.formktpwna.cb[len].checked && (document.all["imgfoto"+len].src!= null
               || document.all["imgfoto"+len].src!="") )
      {
          document.all["imgfoto"+len].src="";
          document.all["imgfoto"+len].style.visibility='hidden';

          document.all["uploadfile"+len].value="";
          document.all["uploadfile"+len].replaceAdjacentText("beforeBegin", "");
      }
}
}
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
    //else if( isNaN(nik) )
    //{
       //alert("Isilah dengan Angka");
    //}
    else if(nik.length>17)
    {

       alert("NIK Tidak boleh lebih dari 16 digit.");
    }
    else if(nik.length<17)
    {
       alert("NIK Tidak boleh kurang dari 16 digit.");
    }
    else
    {
      document.formktpwna.spesifik_nik.value = nik;
      document.formktpwna.action="cetak_KTP_WNA_PVC.jsp?flag=0&spesifik_nik="+document.formktpwna.spesifik_nik.value;
      document.formktpwna.submit();
      break;

    }
    }
}

function viewKTP_WNAPage(v)
{
    var niks="";
    var arr = new Array(v);
    var x = 0;
    var chk=false;

    var param="";
    var onemember=false;

    var indexFoto = 0;
    var oneimgfoto = false;

    if(v>1)
    {
     if (document.all["imgdokumen"].src==null || document.all["imgdokumen"].src=="") {
        window.alert('Penandatangan Dokumen belum disetup');
        return;
     }
     for(i=0;i<v;i++)
     {
        if(document.formktpwna.cb[i].checked)
        {
           niks=document.formktpwna.cb[i].value;
           indexFoto = i;
           if(document.all["imgfoto"+indexFoto].src!=null && document.all["imgfoto"+indexFoto].src!="" &&
              document.all["imgperson"+indexFoto].src!=null && document.all["imgperson"+indexFoto].src!="")
           {
               arr[x] = niks+"|"+document.all["imgfoto"+indexFoto].src+"|"+document.all["imgperson"+indexFoto].src;
           }
           else
           {
               alert("Belum Pilih Foto / Tandatangan / Sidik Jari ke "+indexFoto+"!");
               return;
           }
           x++;
           chk=true;
        }
     }
    }
    else if(document.formktpwna.cb.length==undefined)
    {
        chk=true;
        onemember=true;
        oneimgfoto = true;
        if(document.formktpwna.member.value==2)
        {
        niks = document.formktpwna.cb.value+"|"+document.all["imgfoto"+indexFoto].src+"|"+document.all["imgperson"+indexFoto].src;
        }
        else if(document.formktpwna.member.value==1)
        {
        niks = document.formktpwna.cb.value+"|"+document.all["imgfoto"].src+"|"+document.all["imgperson"].src;
        }
        if(!document.formktpwna.cb.checked)
        {
         window.alert('Belum Pilih NIK');
        return;
        }
    }
    else
    {
        chk=true;
        onemember=true;
        if(document.formktpwna.member.value==2)
        {
            niks = document.formktpwna.cb.value+"|"+document.all["imgfoto"+indexFoto].src+"|"+document.all["imgperson"+indexFoto].src;
        }
        else if(document.formktpwna.member.value==1)
        {
            niks = document.formktpwna.cb.value+"|"+document.all["imgfoto"].src+"|"+document.all["imgperson"].src;
        }
        if(!document.formktpwna.cb.checked)
        {
         window.alert('Belum Pilih NIK');
        return;
        }
    }

     if(chk)
     {
         var radio = document.formktpwna.radiobutton;
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
             if (param.indexOf(arr[i])<0) {
               param = param + "^" +arr[i];
             }
         }

         param = param.substring(1);

         if(onemember)
         {
             param = niks;
         }

        if( oneimgfoto==false)
        {
            if ( document.all["imgfoto"+indexFoto].src==null || document.all["imgfoto"+indexFoto].src=="") {
            alert("Belum Pilih Foto!");
            return;
            }
            if ( document.all["imgperson"+indexFoto].src==null || document.all["imgperson"+indexFoto].src=="") {
            alert("Belum Pilih Tandatangan / Sidik Jari!");
            return;
            }
        }
        else if( oneimgfoto==true &&  document.formktpwna.member.value==1)
        {
            if (document.all["imgfoto"].src==null || document.all["imgfoto"].src=="") {
               alert("Belum Pilih Foto!");
            return;
            }
            if (document.all["imgperson"].src==null || document.all["imgperson"].src=="") {
               alert("Belum Pilih Tandatangan / Sidik Jari!");
            return;
            }
        }
        else if( oneimgfoto==true && document.formktpwna.member.value==2)
        {
            if ( document.all["imgfoto0"].src==null || document.all["imgfoto0"].src=="") {
            alert("Belum Pilih Foto!");
            return;
            }
            if ( document.all["imgperson0"].src==null || document.all["imgperson0"].src=="") {
               alert("Belum Pilih Tandatangan / Sidik Jari!");
            return;
            }
        }


        {
               window.open("cetak_KTP_Lampiran_WNA_PVC.jsp?kewarganegaraan=WNA&radiobutton="+radioValue+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&cb="+param+"&imgdokumen="+document.all["imgdokumen"].src+"&nama_pej="+document.all["nama_pej"].value+"&nip_pej="+document.all["nip_pej"].value+"&a_n="+document.all["a_n"].value, '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no' );
        }
     }
     else
     {
         window.alert('Belum Pilih Nomor Nik');
     }
}

function checkRadioButton(flag)
{
   var vchecked;
   var radio = document.formktpwna.radiobutton;

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
     alert("Belum Pilih Jenis Cetak Kartu Tanda Penduduk (KTP)!");
   }
   else
   {
      document.formktpwna.action="cetak_KTP_WNA_PVC.jsp?flag=" + flag;
      document.formktpwna.submit();
   }
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>

<%
if (request.getParameter("radiobutton")!=null)
radiobutton = request.getParameter("radiobutton");

level=2;
no_prop=request.getParameter("no_prop");
no_kab=request.getParameter("no_kab");
update = request.getParameter("update");
try{
if (request.getParameter("page_no")!=null) page_no=Long.parseLong(request.getParameter("page_no"));
}catch(Exception e1){}

try{
if (request.getParameter("tot_page")!=null) tot_page=Long.parseLong(request.getParameter("tot_page"));
}catch(Exception e2){}

spesifik_nik = request.getParameter("spesifik_nik");

 if ((spesifik_nik!=null) && (!spesifik_nik.equals(""))) nik_one=true;
  controller = ServiceController.getInstance();
  String brchk="",perchk="",ulgchk="";


if (radiobutton!=null & !radiobutton.trim().equals(""))
{
       if( radiobutton.trim().equalsIgnoreCase("Baru"))
       {
          stat_print="1";
          brchk="checked";
       }
       else if( radiobutton.trim().equalsIgnoreCase("Penggantian"))
       {
          stat_print="2";
          brchk="";
          perchk="checked";
       }
       else if( radiobutton.trim().equalsIgnoreCase("Perpanjangan"))
       {
          stat_print="3";
             brchk="";
          perchk="";
          ulgchk="checked";
       }

 if ((update!=null) && (update.trim().equals("ok")))
   {
 Vector vNik = new Vector();

   if (session.getAttribute("ktpInfo")!=null)
       {
       vNik=(Vector)session.getAttribute("ktpInfo");
        System.out.println("Update ok entered!!!! " +vNik.size() );
       CetakKTPHome home = (CetakKTPHome)controller.lookup("CetakKTPBean", CetakKTPHome.class);
     cetakKTP=home.create();
///////////////////////
/*
       ServiceController factory = ServiceController.getInstance();
       MonitorCetakUlangHome monHome = (MonitorCetakUlangHome) factory.lookup(
         "MonitorCetakUlang", MonitorCetakUlangHome.class);
       MonitorCetakUlang monitorBean = monHome.create();
*/
////////////////


 int result[] = cetakKTP.updatePrintStatus(vNik, stat_print, "");
//////////////////
/*
      Login temp = (Login) session.getAttribute("remoteSupv");
      if (temp!=null) {
         String  authBy = temp.getUserInfo().getUserId();
         String  authTo = record.getUserId();
         java.util.Date authDate = (java.util.Date) session.getAttribute("authDate");
         monitorBean.addCetakUlangAction("KTP_WNA", "NIK", vNik, authBy, authTo, authDate);
         monitorBean.remove();
      }
*/
///////////////////////////
      //vNik.removeAllElements();
  session.removeAttribute("ktpInfo");
       }
  }
///////////////////////
//removeCetakUlangAttribute(session);
//////////////////////////
if (spesifik_nik!=null && !spesifik_nik.trim().equals(""))
   {
if (cetakKTP==null)
{
 CetakKTPHome home = (CetakKTPHome)controller.lookup("CetakKTPBean", CetakKTPHome.class);
 cetakKTP=home.create();
}
   vKtp=cetakKTP.getSpecificNikWna(spesifik_nik.trim(),record.getNoProp(),
record.getNoKab(),stat_print);
   finish=true;
   }
 else
  {
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
if (cetakKTP==null)
{
 CetakKTPHome home = (CetakKTPHome)controller.lookup("CetakKTPBean", CetakKTPHome.class);
 cetakKTP=home.create();
}
 vKtp=cetakKTP.getAllDataWna(record.getNoProp(),record.getNoKab(),String.valueOf(start),String.valueOf(end),stat_print,access);
try{
if (!access)  tot_rec=Long.parseLong(cetakKTP.getTotalRecordWna());
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
 }
}
%>
   <BODY leftMargin=0  topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
      <form method="post" name="formktpwna">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td background="images/v_bg_header.gif">
                  <input type="hidden" name="start" value="<%=start%>">
                  <input type="hidden" name="end" value="<%=end%>">
                  <input type="hidden" name="tot_rec" value="<%=tot_rec%>">
                  <input type="hidden" name="tot_page" value="<%=tot_page%>">
                  <input type="hidden" name="page_no" value="<%=page_no%>">
                  <input type="hidden" name="stat_print" value="<%=stat_print%>">
                  <input type="hidden" name="nip_pej" value="<%=record.getKabNipPej()%>">
                  <input type="hidden" name="nama_pej" value="<%=record.getKabNamaPej()%>">
                  <input type="hidden" name="a_n" value="<%=record.getKabJabatan()%>">
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
                                 <td></td>
								 <td>
								 <table width="100%" border="0" cellspacing="3" cellpadding="3">
                                       <tr>
                                          <td>
                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                   <td height="35">
                                                      <div align="center"><span class="submenu">Daftar
                                                         Cetak Kartu Tanda Penduduk (KTP)</span><br>
                                                      </div>
                                                   </td>
                                                </tr>
                                             </table>
                                          </td>
                                       </tr>
					<tr>
					<td>
					<jsp:include page="data_wilayah.jsp"  flush="true"> <jsp:param name="level" value="2"/>
                                                <jsp:param name="no_prop" value="<%=record.getNoProp()%>"/>
                                                <jsp:param name="nama_prop" value="<%=record.getNamaProp()%>"/>
                                                <jsp:param name="no_kab" value="<%=record.getNoKab()%>"/>
                                                <jsp:param name="nama_kab" value="<%=record.getNamaKab()%>"/>
                                             </jsp:include>
					</td>
					</tr>
                                       <tr>
                                          <td>
					<%
					System.out.println("record.getNoProp() "+record.getNoProp());
					System.out.println("record.getNamaProp() "+record.getNamaProp());
					System.out.println("record.getNoKab() "+record.getNoKab());
					System.out.println("record.getNamaKab() "+record.getNamaKab());
					level = 2;
					no_prop = record.getNoProp();
					nama_prop = record.getNamaProp();
					no_kab = record.getNoKab();
					nama_kab = record.getNamaKab();
					%>
                                             <table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
  				<tr>
    				<td colspan="9" height="1">
      				<div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
    				</td>
  				</tr>
  				<tr>
    				<td colspan="9" height="25">
     				 <div align="center"><span class="subtitle">Data Wilayah</span></div>
    				</td>
  				</tr>
  				<tr>
    				<td colspan="9" height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
    				</td>
  				</tr>
 				 <tr>
                                 <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10">
   				 </td>
  				</tr>
  <%
                       if (level>0) {%>
  <tr>
    <td>Kode-Nama Propinsi</td>
    <td>:</td>
    <td width="5">
      <input
                                class=boxdefault size=4 name="no_prop"  maxlength="2" value="<%=no_prop%>" onFocus="this.blur()">
    </td>
    <td width="33">
      <input
                                class=boxdefault size=22 name=nama_prop value="<%=nama_prop%>" maxlength="60" onFocus="this.blur()">
    </td>
    <td><img src="images/dot.gif" width="1" height="1"></td>
    <td>
      <%if (level>1) {%>
      Kode-Nama Kabupaten/Kota
      <%}%>
    </td>
    <td>:</td>
    <td width="8">
      <%if (level>1) {%>
      <input
                                class=boxdefault size=4 name="no_kab"  maxlength="2" value="<%=no_kab%>" onFocus="this.blur()">
      <%}%>
    </td>
    					<td width="22">
     						 <%if (level>1) {%>
      						<input
                                class=boxdefault size=22 name=nama_kab  maxlength="60" value="<%=nama_kab%>" onFocus="this.blur()">
      						<%}%>
    						</td>
  						</tr>
						<tr>
    <td colspan="9" height="10">&nbsp;
    </td>
  </tr>
					<%}%>
					</table>

                                          </td>
                                       </tr>
                                       <tr>
                                          <td valign="top" height="35">
                                             <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                                                            <td class="C-Field" colspan="4">
                                                               <div align="center"><b>Cetak Kartu Tanda Penduduk KTP)</b></div>
                                                            </td>
                                                         </tr>
                                                         <tr>
                                                            <td class="C-Field" width="27%">
                                                               <div align="center">
                                                                  <input type="radio" name="radiobutton" value="Baru" <%=brchk%>> Baru
                                                               </div>
                                                            </td>
                                                            <td class="C-Field" width="40%">
                                                               <div align="center">
                                                                  <input type="radio" name="radiobutton" value="Penggantian" <%=perchk%>> Penggantian
                                                               </div>
                                                            </td>
                                                            <td class="C-Field" width="33%">
                                                               <div align="left">
                                                                  <input type="radio" name="radiobutton" value="Perpanjangan" <%=ulgchk%>> Perpanjangan
                                                               </div>
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
                                             </table> <br>
                                             <table width="475" border="0" cellspacing="2" cellpadding="0" align="center">
                                                <tr>
                                                   <td width="214">
                                                      <div align="center">
                                                         <input type=hidden name="member" value="">
                                                      </div>
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
                                                         <b><a href="#"  onClick="page_no.value=0;tot_page.value=0;start.value=0;end.value=0;tot_rec.value=0;checkRadioButton()">
                                                            <font color="#2A00AA">Tampilan Semua Data</font>
                                                         </a></b>
                                                      </div>
                                                   </td>
                                                   <td width="11">
                                                      <div align="center"></div>
                                                   </td>
                                                   <td width="242">
                                                      <div align="center"><b><a href="#" onClick="showDialogBox()"><font color="#2A00AA">Tampilan Berdasarkan NIK</font></a></b></div>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td width="214"><input type="hidden" name="spesifik_nik">&nbsp;</td>
                                                   <td width="11">&nbsp;</td>
                                                   <td width="242">&nbsp;</td>
                                                </tr>
                                             </table>
                                          </td>
                                       </tr>
                                    </table>
                                 </td>
								 <td></td>
                              </tr>
							  <tr>
							     <td>&nbsp;
							     </td>
							  </tr>

<%
System.out.println("test radio");
System.out.println("stat_print : "+stat_print);
System.out.println("no_prop " + no_prop);
System.out.println("no_kab " + no_kab);
//if( radiobutton!=null && no_prop!=null && no_kab!=null)
if( stat_print!=null && no_prop!=null && no_kab!=null)
{
System.out.println("test radio oke");
try
{
 System.out.println("test vktp");
   if (vKtp!=null)
    {
	System.out.println("test vktp oke");
	%>

		                              <tr>
                                 <td></td>
                                 <td valign="top">
								 <table border="0" cellspacing="0" cellpadding="0" align="left" bgcolor="#CBE0FA">
                                       <tr>
                                          <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                                          <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                          <td width="1" height="1"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                                       </tr>
                                       <tr>
                                          <td>&nbsp;</td>
                                          <td valign="middle" align="center">

      <table border="0" cellspacing="1" cellpadding="3" class="C-BG">
        <tr>
          <td class="C-Fonts" width="8%">
            <div align="center">Masukan tandatangan pejabat</div>
          </td>
          <td class="C-Fonts" width="15%"nowrap>
            <div align="center">Tampilan</div>
          </td>
        </tr>
        <tr>
          <td class="C-Field" width="8%">
            <div align="center"><b>
              <div align="center">
                <input class=boxstandard type=file name="dokumenfile" onchange="LimitAttach(this.form, this.form.dokumenfile.value,this.form.imgdokumen)" onkeydown="this.blur()">
              </div>
              </b> </div>
          </td>
          <td class="C-Field" width="15%">
            <div align="center"> <img name="imgdokumen" width="52" height="65" style="visibility:hidden">
            </div>
          </td>
        </tr>
      </table>
                                          </td>
                                          <td>&nbsp;</td>
                                       </tr>
									   <tr>
                                         <td height="1" width="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                                         <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                         <td width="1" height="1"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                                     </tr>
                                    </table>
								 </td>
								 <td></td>
								 </tr>
								 <tr>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
								 <td>&nbsp;</td>
								 </tr>

	                              <tr>
                                 <td></td>
                                 <td valign="top">
                                    <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                                       <tr>
                                          <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                                          <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                          <td width="1" height="1"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                                       </tr>
                                       <tr>
                                          <td>&nbsp;</td>
                                          <td valign="middle" align="center">
                                             <table border="0" cellspacing="1" cellpadding="3" class="C-BG">
                                                <tr>
                                                   <td class="C-Fonts" width="3%">

                                <div align="center"> Pilih
                                  <input type=checkbox name="cekcb" onClick="checkedAll();">
                                </div>
                                                   </td>
                                                   <td class="C-Fonts" width="15%" >
                                                      <div align="center">NIK</div>
                                                   </td>
                                                   <td class="C-Fonts" width="15%" nowrap>
                                                      <div align="center">Nama Pertama</div>
                                                   </td>
                                                   <td class="C-Fonts" width="13%" nowrap>
                                                      <div align="center">Tanggal Lahir</div>
                                                   </td>
                                                   <td class="C-Fonts" width="31%">
                                                      <div align="center">Alamat</div>
                                                   </td>
                                                   <td class="C-Fonts" width="8%">
                                                      <div align="center">Masukan Foto</div>
                                                   </td>
                                                   <td class="C-Fonts" width="15%"nowrap>
                                                      <div align="center">Tampilan Foto</div>
                                                   </td>
                                                   <td class="C-Fonts" width="15%"nowrap>

                                <div align="center">Masukan <br>Tandatangan / <br>Sidik
                                  Jari </div>
                                                   </td>
                                                   <td class="C-Fonts" width="15%"nowrap>
                                                      <div align="center">Tampilan <br>Tandatangan / <br>Sidik
                                  Jari</div>
                                                   </td>
                                                </tr>
<%if( vKtp.size()==0 && wnaObject==null )
      {%>
                                                <script language="javascript">
                                                   document.formktpwna.member.value="0";
                                                </script>

                                                <tr>
                                                   <td class="C-Field" colspan="9">
                                                      <div align="center"><b>Belum ada data!</b></div>
                                                   </td>
                                                </tr>
      <%}
      else if(wnaObject!=null && wnaObject.getFound()==false)
      {%>
                                                <script language="javascript">
                                                   document.formktpwna.member.value="0";
                                                </script>
                                                <tr>
                                                   <td class="C-Field" colspan="9">
                                                      <div align="center"><b>Data dengan NIK <%=spesifik_nik%> tidak ditemukan!</b></div>
                                                   </td>
                                                </tr>
      <%}

      else if(wnaObject!=null && wnaObject.getFound()==true )
      {
%>
                                                <script language="javascript">
                                                   document.formktpwna.member.value="1";
                                                </script>
                                                <tr>
                                                   <td class="C-Field" width="3%">
                                                      <div align="center">
                                                         <input type=checkbox name="cb" value="<%=wnaObject.getNik()%>" onclick="unchecked(1);">
                                                      </div>
                                                   </td>
                                                   <td class="C-Field" width="15%">
                                                      <div align="center"><%=wnaObject.getNik()%></div>
                                                   </td>
                                                   <td class="C-Field" width="15%"nowrap>
                                                      <div align="center"><%=wnaObject.getNama_lgkp()%></div>
                                                   </td>
                                                   <td class="C-Field" width="13%" nowrap>
                                                      <div align="center"><%=wnaObject.getTgl_lhr()%></div>
                                                   </td>
                                                   <td class="C-Field" width="31%" >
                                                      <div align="left"><%=wnaObject.getAlamat()%></div>
                                                   </td>
                                                   <td class="C-Field" width="8%">
                                                      <div align="center"><b><div align="center"><input class=boxstandard type=file name="uploadfile" onchange="LimitAttach(this.form, this.form.uploadfile.value,this.form.imgfoto)" onkeydown="this.blur()"></div></b>
                                                      </div>
                                                   </td>
                                                   <td class="C-Field" width="15%">
                                                      <div align="center">
                                                         <img name="imgfoto" width="52" height="65" style="visibility:hidden">
                                                      </div>
                                                   </td>
                                                   <td class="C-Field" width="15%">

            <div align="center"> <b>
              <input class=boxstandard type=file name="personfile" onChange="LimitAttach(this.form, this.form.personfile.value,this.form.imgperson)" onKeyDown="this.blur()">
              </b></div>
                                                   </td>
                                                   <td class="C-Field" width="15%">

            <div align="center"> <img name="imgperson" width="52" height="65" style="visibility:hidden">
            </div>
                                                   </td>
                                                </tr>

      <%}
      else
      {%>
                                                <script language="javascript">
                                                   document.formktpwna.member.value="2";
                                                </script>

<%
  for(int i=0;i<vKtp.size();i++)
          {
             KTPWniObject obj = (KTPWniObject)vKtp.elementAt(i);
%>

                                                <tr>
                                                   <td class="C-Field" width="3%">
                                                      <div align="center">
                                                         <input type=checkbox name="cb" value="<%=obj.getNik()%>" <%if(vKtp.size()==1){%>onclick="unchecked('6');"<%}else{%>onclick="unchecked('<%=i%>');"<%}%>>
                                                      </div>
                                                   </td>
                                                   <td class="C-Field" width="15%">
                                                      <div align="center"><%=obj.getNik()%></div>
                                                   </td>
                                                   <td class="C-Field" width="15%" >
                                                      <div align="center"><%=obj.getNama_lgkp()%></div>
                                                   </td>
                                                   <td class="C-Field" width="13%" >
                                                      <div align="center"><%=obj.getTgl_lhr()%></div>
                                                   </td>
                                                   <td class="C-Field" width="31%" >
                                                      <div align="left"><%=obj.getAlamat()%></div>
                                                   </td>
                                                   <td class="C-Field" width="8%">
                                                      <div align="center"><b>
                                                         <input class=boxstandard type=file name="uploadfile<%=i%>" onchange="LimitAttach(this.form, this.form.uploadfile<%=i%>.value,this.form.imgfoto<%=i%>)" onkeydown="this.blur()"></b>
                                                      </div>
                                                   </td>
                                                   <td class="C-Field" width="15%">
                                                      <div align="center">
                                                         <img name="imgfoto<%=i%>" width="40" height="51" style="visibility:hidden">
                                                      </div>
                                                   </td>
                                                   <td class="C-Field" width="15%">

            <div align="center"> <b>
              <input class=boxstandard type=file name="personfile<%=i%>" onChange="LimitAttach(this.form, this.form.personfile<%=i%>.value,this.form.imgperson<%=i%>)" onKeyDown="this.blur()">
              </b></div>
                                                   </td>
                                                   <td class="C-Field" width="15%">
                                                      <div align="center">
                                                         <img name="imgperson<%=i%>" width="40" height="51" style="visibility:hidden">
                                                      </div>
                                                   </td>
                                                </tr>
<%
          }
      }
%>
                                             </table>
                                          </td>
                                          <td>&nbsp;</td>
                                       </tr>
									   	      <tr>
                                         <td height="1" width="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                                         <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                         <td width="1" height="1"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                                     </tr>
                                    </table>

                                 </td>
								 <td></td>
                              </tr>
									<%
    }

}
catch(Exception e)
{
    e.printStackTrace();
    System.out.println("#ServiceController Error= "+e.toString());
}
}%>

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
<%
if( stat_print!=null && no_prop!=null && no_kab!=null)
{
%>

                                 <td width="104">
                                    <div align="center"><b><input class=boxstandard type=button value=   TAMPILKAN    name="tampilkan" onClick="if(document.formktpwna.cb.length==undefined){viewKTP_WNAPage(1);}else{viewKTP_WNAPage(document.formktpwna.cb.length);}" <%if( (vKtp.size()==0 && wnaObject==null)|| (wnaObject!=null && wnaObject.getFound()==false) ){%>disabled<%}%>> </b></div>
                                 </td>
                                 <td width="101">
                                    <div align="center">
                                       <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNA_Menu.jsp'">
                                    </div>
                                 </td>
<%}
else
{%>
                                 <td>&nbsp;</td>
                                 <td width="101">
                                    <div align="center">
                                       <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNA_Menu.jsp'">
                                    </div>
                                 </td>


<%}
if( stat_print!=null && no_prop!=null && no_kab!=null)
{
%>
                                 <td width="265">
                                    <div align="center" style="position:absolute" id="vis">
<%
if ((start>5) && (vKtp.size()!=0))
{
%>
                                       <b>&lt;&lt;<a name="previous" href="#1" onclick="javascript:history.back();">
                                             <font color="#FFFFFF">Sebelumnya</font>
                                       </a></b>
<%
}
%>
                                    </div>

<%
if (!finish)
      {
      %>
                                    <div align="right">
                                       <b>. . .<a name="next" href="#2" onclick="checkRadioButton()">
                                          <font color="#FFFFFF">Berikutnya</font></a>&gt;&gt;
                                       </b>
                                   </div>
   <%
}
%>


                                 </td>
                              </tr>
<%
    }
%>

                              <tr>
                                 <td width="104">&nbsp;</td>
                                 <td width="101">&nbsp;</td>
                                 <td width="265">
   <%if ( !nik_one && (vKtp.size()!=0) && (radiobutton!=null) && (!radiobutton.trim().equals("")))
                           {
                         %>
                                    <b><center><font color="#FFFFFF">Halaman &nbsp;<%=page_no%>&nbsp; dari &nbsp;<%=tot_page%></font></center></b>
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
               </td>
            </tr>
         </table>
         <input type=hidden name="nkel" <%if(nama_kel!=null && !nama_kel.trim().equals("")){%>value="<%=nama_kel%>"<%}%>> &nbsp;
         <script language="javascript">
            function bottom() {
               window.scroll(0,800);
            } bottom()
         </script>
      </form>
   </BODY>
</HTML>
<% } else {
     response.sendRedirect("index.jsp");
   }
 } catch (Exception e) {
    e.printStackTrace();
 } finally {
    finish=false; start=0; end=0; tot_rec=0; nik_one=false; stat_print=null;
 }
%>