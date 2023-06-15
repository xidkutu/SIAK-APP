<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<%@page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,viewkk.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*"%>
<%@ page import="com.wilayah.*"%>
<%@ include file="Global.jsp"%>

<%
UserInfo1 record = null;
ServiceController controller;
String nama_lur="";
String nip_lur="";
String jab_lur="";
//String nkel="";
String selidx="";
long start=0;
long end=0;
long tot_rec=0;
long tot_page=0,page_no=0;
boolean access=true;
boolean finish=false;
String spesifik_kk=null;
boolean kk_one=false;
DaftarKKObject kkObject = null;
String valueStr="";
String radiobutton="";
String stat_print=null,stat_change=null;
  //WilayahSettingModule view_kel = null;
Vector vDaftarCetakKk = new Vector();
Vector vDataKelurahan = new Vector();
DaftarCetakKK daftarCetakKK = null;
//String no_prop="",no_kab="",no_kec="",no_kel="";
String suno_rw="",suno_rt="",suno_pos="";
String update=null;
%>

<%
System.out.println(42);
try
   {
record = (UserInfo1)session.getAttribute("remoteRef");

if(record != null)
    {
if (request.getParameter("nama_lur") !=null) nama_lur=request.getParameter("nama_lur");
if (request.getParameter("nip_lur") !=null) nip_lur=request.getParameter("nip_lur");
if (request.getParameter("jab_lur") !=null) jab_lur=request.getParameter("jab_lur");
if (request.getParameter("nkel") !=null) nkel=request.getParameter("nkel");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/lurah.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/trim.js">
</SCRIPT>

<SCRIPT language="javascript">
function showDialogBox()
{
    if(formDaftarKK.no_kel.value=="")
    {
        alert("Nama Kelurahan belum Diisi !!");
        formDaftarKK.nama_kel.focus();
        return false;
    }

//alert("prompmt= "+prompt("Masukkan Nomor Kartu Keluarga yang ingin dicari: ", ""));
 while(true)
    {
    var no_kk = prompt("Masukkan Nomor Kartu Keluarga yang ingin dicari: ", "");

     if (no_kk!=null) no_kk=trim(no_kk);
    //if ((no_kk!="") && (no_kk!=null) && (no_kk.length==16) && !isNaN(no_kk))
    if ((no_kk!="") && (no_kk!=null))
    {
      document.formDaftarKK.spesifik_kk.value = no_kk;
      document.formDaftarKK.action="DaftarKK.jsp?flag=0&spesifik_kk="+document.formDaftarKK.spesifik_kk.value;
      document.formDaftarKK.submit();
      break;
    }
    else
    {
      return false;
    }

    }
}

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
        if(document.formDaftarKK.cb[i].checked)
        {
           niks=document.formDaftarKK.cb[i].value;
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
        niks = document.formDaftarKK.cb.value;
        if(!document.formDaftarKK.cb.checked)
        {
         window.alert('Belum Pilih Nomor KK');
        return;
        }
    }

     if(chk)
     {
         var radio = document.formDaftarKK.radiobutton;
         var radioValue ="";
        for (i=0;i<radio.length;i++)
        {
            if (radio[i].checked)
            {
               radioValue= radio[i].value;
               break;
            }
        }

	var kendali = document.formDaftarKK.jpkendali;
         var kendaliValue ="";
        for (i=0;i<kendali.length;i++)
        {
            if (kendali[i].checked)
            {
               kendaliValue= kendali[i].value;
               break;
            }
        }

         for(i=0;i<x;i++)
         {
//             param = param + "^" +arr[i];
               param = param + arr[i];
         }

         param = param.substring(1);
         if(onemember)
         {
             param = niks;
         }

         window.open("cetak_KK_WNI.jsp?no_kel=" + document.all['no_kel'].value + "&radiobutton="+radioValue+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&nama_kec="+document.all["nama_kec"].value+"&cb="+param+"&nama_kel="+document.all["nkel"].value+"&jabatan="+document.all["jabatan"].value+"&nama_pej="+document.all["nama_pej"].value+"&nip_pej="+document.all["nip_pej"].value + "&jab_lur=" + document.all['jab_lur'].value + "&nama_lur="+document.all["nama_lur"].value+"&nip_lur="+document.all["nip_lur"].value+"&jpkendali="+kendaliValue, '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no' );
     }
     else
     {
         window.alert('Belum Pilih Nomor KK');
     }
}

function checkComboBox(no_kel_value)
{
    document.formDaftarKK.no_kel.value=no_kel_value;
}

function checkRadioButton()
{
    if(formDaftarKK.no_kel.value=="")
    {
        alert("Nama Kelurahan belum Diisi !!");
        formDaftarKK.nama_kel.focus();
        return false;
    }

   var vchecked;
   var radio = document.formDaftarKK.radiobutton;

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
      document.formDaftarKK.action="DaftarKK.jsp?nama_kel="+document.all["nkel"].value+"&no_kel="+document.all["no_kel"].value;
      document.formDaftarKK.submit();
   }
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>

<%
System.out.println(210);
 if (request.getParameter("radiobutton")!=null)
  radiobutton =request.getParameter("radiobutton");

selidx=request.getParameter("selidx");
no_prop= request.getParameter("no_prop");
no_kab= request.getParameter("no_kab");
no_kec= request.getParameter("no_kec");
no_kel= request.getParameter("no_kel");

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
System.out.println(230);
vDataKelurahan=getDataKelurahan(record.getNoProp().trim(),record.getNoKab().trim(),record.getNoKec().trim());
System.out.println(999);
if (vDataKelurahan==null)   vDataKelurahan = new Vector();
System.out.println(1000);
 String brchk="",perchk="",ulgchk="";

System.out.println(1001);
if (radiobutton!=null & !radiobutton.trim().equals(""))
{
System.out.println(1002);
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
System.out.println(1003);
    if ((update!=null) && (update.equals("ok")))
    {
        Vector vKK = new Vector();
       String param_kk = (request.getParameter("param_kk")==null?"":request.getParameter("param_kk"));
       StringTokenizer st = new StringTokenizer(param_kk, "*");
       String token = "";
System.out.println(1004);
     while (st.hasMoreTokens())
     {

         token = st.nextToken();
         System.out.println("#PARAM_KK per token="+token);
         vKK.addElement(token);
     }
System.out.println(444);
     ViewKK view = null;
     ViewKKHome home = (ViewKKHome)controller.lookup("ViewKKBean", ViewKKHome.class);
     view = home.create();
System.out.println(445);
///////////////////////
/*
       MonitorCetakUlangHome monHome = (MonitorCetakUlangHome) controller.lookup(
         "MonitorCetakUlang", MonitorCetakUlangHome.class);
       MonitorCetakUlang monitorBean = monHome.create();
*/
////////////////
System.out.println(446);
     int result[] = view.updatePrintStatus(vKK, stat_print, stat_change);
//////////////////
/*
      Login temp = (Login) session.getAttribute("remoteSupv");
      if (temp!=null) {
         String  authBy = temp.getUserInfo().getUserId();
         String  authTo = record.getUserId();
         java.util.Date authDate = (java.util.Date) session.getAttribute("authDate");
         monitorBean.addCetakUlangAction("KK_WNI", "NO_KK", vKK, authBy, authTo, authDate);
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
System.out.println(447);
if (spesifik_kk!=null && !spesifik_kk.trim().equals(""))
   {
  DaftarCetakKKHome home = (DaftarCetakKKHome)controller.lookup("DaftarCetakKK", DaftarCetakKKHome.class);
  daftarCetakKK = home.create();
  System.out.println("jika kk : "+spesifik_kk.trim());
  System.out.println("KK : "+spesifik_kk.trim());
   System.out.println("print : "+stat_print);
   System.out.println("stat : "+stat_change);
  vDaftarCetakKk=daftarCetakKK.getSpecifickkbanyak(""+spesifik_kk.trim()+"",stat_print,stat_change,record.getNoProp(),
   record.getNoKab(),record.getNoKec(),no_kel);
   //vDaftarCetakKk=daftarCetakKK.getSpecifickk(""+spesifik_kk.trim()+"",stat_print,stat_change,record.getNoProp(),
   //record.getNoKab(),record.getNoKec(),no_kel);
  if(vDaftarCetakKk.size()==0 ) {
   System.out.println("Data spesifik kosong");
  }
  else {
  System.out.println("Data spesifik ada");
  }

  finish=true;
   }

//End Specific NIK

else
 {
//Begin For all Records
System.out.println(448);
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
System.out.println(449);
 if (tot_rec==0) access=false;

  start=end+1;
  end=end+5;

 vDaftarCetakKk=daftarCetakKK.getAllData(record.getNoProp(),record.getNoKab(),record.getNoKec(),
 no_kel,String.valueOf(start),String.valueOf(end),stat_print,stat_change,access);
try{
 if (!access)  tot_rec=Long.parseLong(daftarCetakKK.getTotalRecord());
}catch(Exception e6){}

  if (end>=tot_rec)
  {
end=tot_rec;
finish=true;
  }
System.out.println(450);
 if (start>=tot_rec) start=tot_rec;
//end for all records

tot_page=(long)(Math.ceil((double)tot_rec/5));

if (page_no>=tot_page)
page_no=tot_page;
else
page_no=page_no+1;
}
}
%>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
<form method="post" name="formDaftarKK">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">

    <input type="hidden" name="start" value="<%=start%>">
    <input type="hidden" name="end" value="<%=end%>">
    <input type="hidden" name="tot_rec" value="<%=tot_rec%>">
    <input type="hidden" name="tot_page" value="<%=tot_page%>">
    <input type="hidden" name="page_no" value="<%=page_no%>">
    <input type="hidden" name="nama_pej" value="<%=record.getKecNamaPej()%>">
    <input type="hidden" name="nip_pej" value="<%=record.getKecNipPej()%>">
    <input type="hidden" name="jabatan" value="<%=record.getKecJabata()%>">
    <input type="hidden" name="jab_lur" value="<%=(request.getParameter("jab_lur")==null?"":request.getParameter("jab_lur"))%>">
    <input type="hidden" name="nama_lur" value="<%=(request.getParameter("nama_lur")==null?"":request.getParameter("nama_lur"))%>">
    <input type="hidden" name="nip_lur" value="<%=(request.getParameter("nip_lur")==null?"":request.getParameter("nip_lur"))%>">
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
                                                <input type="hidden" name="selidx" value="<%=selidx%>">
                                                <input type="hidden" name="namakel" value="<%=(request.getParameter("namakel")==null?"":request.getParameter("namakel"))%>">
                                                <SCRIPT language="javascript">
                                                   function resetPage(obj) {
                                                      document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;document.all['nkel'].value=obj.options[obj.selectedIndex].text;document.all['selidx'].value=obj.selectedIndex;document.all['start'].value=0;document.all['end'].value=0;document.all['tot_rec'].value=0;document.all['page_no'].value=0;document.all['tot_page'].value=0;
                                                      return true;
                                                   }
                                                </SCRIPT>
                                             <td>
<%
    String jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&selidx="+ selidx;
%>
                          <jsp:include page="<%=jsp%>"/>
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
						  <input type="hidden" name="jpkendali" value="TDK">
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
<font color="#2A00AA">Tampilan Semua Data</font></a></b></div>

                            </td>
                            <td width="11">
                              <div align="center"></div>
                            </td>
                            <td width="242">
                              <div align="center"><b>
<a href="#" onClick="showDialogBox()"><font color="#2A00AA">Tampilan
                                Berdasarkan Nomor KK
</font>
</a></b></div>
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
System.out.println(509);
if( radiobutton!=null && no_prop!=null && no_kab!=null && no_kec!=null && no_kel!=null )
{

try
{
   if (vDaftarCetakKk!=null)
    { System.out.println(1121);
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
      { System.out.println(1111); %>
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
      { System.out.println(112);
          %>
                          <tr>
                            <td class="C-Field" width="10%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%="*"+kkObject.getNomorKK()+"*"+kkObject.getNamaKep()+"*"+kkObject.getAlamat()+"*"+kkObject.getNo_rt()+"*"+kkObject.getNo_rw()+"*"+kkObject.getKode_pos()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="16%">
                              <div align="center"><%=kkObject.getNomorKK()%> </div>
                            </td>
                            <td class="C-Field" width="35%">
                              <div align="center"> <%=kkObject.getNamaKep()%></div>
                            </td>
                            <td class="C-Field" width="39%"><%=kkObject.getAlamat()%>&nbsp;</td>
                          </tr>
      <%}
      else
      {
          for(int i=0;i<vDaftarCetakKk.size();i++)
          {
             DaftarKKObject obj = (DaftarKKObject)vDaftarCetakKk.elementAt(i);
             System.out.println(113);
%>
                          <tr>
                            <td class="C-Field" width="10%">
                              <div align="center">
                               <%
				try {
				if (obj.getNo_rt()!=null) {
                                 suno_rt=obj.getNo_rt();
				}
				}
				catch (Exception delr) {
				suno_rt="";
				}
				try {
				if (obj.getNo_rw()!=null) {
                                suno_rw=obj.getNo_rw();
				} }
				catch (Exception delr) {
				suno_rw="";
				}
				try {
				if (obj.getKode_pos()!=null) {
                                suno_pos=obj.getKode_pos();
				} }
				catch (Exception delr) {
				suno_pos="";
				}
				%>
                                <input type=checkbox name="cb" value="<%="*"+obj.getNomorKK()+"*"+obj.getNamaKep()+"*"+obj.getAlamat()+"*"+suno_rt+"*"+suno_rw+"*"+suno_pos%>">
                              </div>
                            </td>
                            <td class="C-Field" width="16%">
                              <div align="center"><%=obj.getNomorKK()%> </div>
                            </td>
                            <td class="C-Field" width="35%">
                              <div align="center"> <%=obj.getNamaKep()%></div>
                            </td>
                            <td class="C-Field" width="39%"><%=obj.getAlamat()%>&nbsp;</td>
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
<%}%>
              <tr>
                <td>
                  <table width="500" border="0" cellspacing="3" cellpadding="3" align="center">
                    <tr>
<%
System.out.println(634);
if( radiobutton!=null && no_prop!=null && no_kab!=null)
{
%>
                      <td width="104">
                        <div align="center"><b>
                          <input class=boxstandard type=button value=   TAMPILKAN    name="tampilkan" onClick="if(document.formDaftarKK.cb.length==undefined){viewKKPage(1);}else{viewKKPage(document.formDaftarKK.cb.length);}" <%if( (vDaftarCetakKk.size()==0 && kkObject==null) || (kkObject!=null && kkObject.getFound()==false) ){%>disabled<%}%>>
                          </b></div>
                      </td>
                      <td width="101">
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNI_Menu.jsp'">
                          </b></div>
                      </td>
<%
}
else
{
%>
<td>&nbsp;</td>
<td width="101">
<div align="center"><b>
<input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNI_Menu.jsp'">
</b></div>
</td>
<%
}
System.out.println(661);
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
System.out.println(722);
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
    <td><input type=hidden name="nkel" value="<%=nkel%>">

<%System.out.println(747);
  if ((selidx!=null) && (!selidx.equals("")))
     {
      if (Integer.parseInt(selidx)>0)
        {
%>
<script language="javascript">
document.all['nama_kel'].options[<%=selidx%>].selected=true;
</script>
<%
       }
   }
%>
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
<%
System.out.println(775);
}
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
