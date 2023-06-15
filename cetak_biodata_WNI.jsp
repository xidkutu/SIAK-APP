<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="biodata.BiodataWNIObject"%>
<%@ page import="java.util.*,pendaftaran.*"%>
<%@ page import="com.valueList.*"%>
<%@ include file="Global.jsp"%>
<%@ include file="CommonFile.jsp"%>
<%
UserInfo1 record = null;
BiodataWNIObject wniObject = null;
String radiobutton="";
String stat_print=null,stat_change=null;
String selidx="";
String spesifik_nik=null;
String brchk="",ulgchk="",action="";
ListDelegate delgobj=null;
Parameter prm=null;
String cursor="next";
int MAXROW=6;
List clientlist=null;
String allniks="";
int counter=0;
String nama_start="";
String nik_spec="";
Vector vt_niks=null;
long total_pages=0;
%>
<%
try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
  {
      if (request.getParameter("exit")!=null
               && request.getParameter("exit").trim().equals("true"))
         {
         System.out.println(1);
            try{
              if (session.getAttribute("biodelg")!=null)
                 {
                  delgobj=(ListDelegate)session.getAttribute("biodelg");
                  delgobj.releaseMem();
                  delgobj=null;
                  session.removeAttribute("biodelg");
                 }
            }catch(Exception rlmem)
            {
            }
        %>
       <jsp:forward page="<%=record.getModRefFile()%>">
       </jsp:forward>
    <%
      }
     else
      {
if (request.getParameter("max_row")!=null)
MAXROW=Integer.parseInt(request.getParameter("max_row"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/trim.js">
</SCRIPT>
<script language="javascript" src="scripts/chromeless_35.js">
</script>
<script language="javascript" src="scripts/util.js">
</script>
<SCRIPT language="javascript">
function openIT(u,W,H,X,Y,n,b,x,m,r) {
	var cU  ='images/close.gif'   //gif for close on normal state.
	var cO  ='images/close.gif'  //gif for close on mouseover.
	var cL  ='images/clock.gif'      //gif for loading indicator.
	var mU  ='images/minimize.gif'     //gif for minimize to taskbar on normal state.
	var mO  ='images/minimize.gif'    //gif for minimize to taskbar on mouseover.
	var xU  ='images/max.gif'     //gif for maximize normal state.
	var xO  ='images/max.gif'    //gif for maximize on mouseover.
	var rU  ='images/restore.gif'     //gif for minimize on normal state.
	var rO  ='images/restore.gif'    //gif for minimize on mouseover.
	var tH  ='<font face=verdana size=2>adminduk SIAK online</font>'   //title for the title bar in html format.
	var tW  ='adminduk SIAK online'   //title for the task bar of Windows.
	var wB  ='#6699CC'   //Border color.
	var wBs ='#D5D5FF'   //Border color on window drag.
	var wBG ='#33CCCC'   //Background of the title bar.
	var wBGs='#66CCFF'   //Background of the title bar on window drag.
	var wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0'  //Html parameters for Netscape.
	var fSO ='scrolling=auto noresize'   //Html parameters for main content frame.
	var brd =b||5;   //Extra border size.
	var max =x||false;   //Maxzimize option (true|false).
	var min =m||false;   //Minimize to taskbar option (true|false).
	var res =r||false;   //Resizable window (true|false).
	var tsz =20;   //Height of title bar.
	return chromeless(u,n,W,H,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,max,min,res,tsz)
}
function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
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
        if(document.formbiodata.cb[i].checked)
        {
           niks=document.formbiodata.cb[i].value;
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
        niks = document.formbiodata.cb.value;
        if(!document.formbiodata.cb.checked)
        {
         window.alert('Belum Pilih NIK');
        return;
        }

    }

     if(chk)
     {
         var radio = document.formbiodata.radiobutton;
         var radioValue ="";
        for (i=0;i<radio.length;i++)
        {
            if (radio[i].checked)
            {
               radioValue= radio[i].value;
               break;
            }
        }

      if ((trim(document.all['allniks'].value).length)>0)     //Additional coding for view all pages
          {
                param=document.all['allniks'].value;
          }
       else
        {
         for(i=0;i<x;i++)
         {
             param = param + "|" +arr[i];
         }
         param = trim(param);

         if(onemember)
         {
             param = niks;
         }
        }
 window.open("view_cetak_biodata_WNI.jsp?radiobutton="+ radioValue + "&cb="+param+"&nama_pej="+document.formbiodata.nama_pej.value+"&nip_pej="+document.formbiodata.nip_pej.value+"&jabatan="+document.formbiodata.jabatan.value+ "&nama_kec="+ document.formbiodata.nama_kec.value + "&no_kel=" + document.formbiodata.no_kel.value + "&selidx=" + document.all['selidx'].value, '',' fullscreen=yes,scrollbars=yes,menubar=no,toolbar=no');
         }
     else
     {
         window.alert('Belum Pilih NIK');
     }
}

function checkComboBox(no_kel_value)
{
    document.formbiodata.no_kel.value=no_kel_value;
}

function checkRadioButton(action,cursor)
{
    if(formbiodata.no_kel.value=="")
    {
        alert("Nama Kelurahan belum Diisi !!");
        formbiodata.nama_kel.focus();
        return false;
    }

   var vchecked;
   var radio = document.formbiodata.radiobutton;

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
      return false;
   }
   else
   {
     if (document.all['idnxt'])
      {
          document.all['idnxt'].removeNode(true);
          document.all['idprv'].removeNode(true);
          document.all['prog'].style.visibility="visible";
      }
   document.formbiodata.action="cetak_biodata_WNI.jsp?nama_kel=" + document.all["nkel"].value+"&no_kel="+document.all["no_kel"].value+"&action="+action+"&cursor=" + cursor + "&max_row=6";
   document.formbiodata.submit();
   }
}
function releaseMem()
{
document.formbiodata.action="cetak_biodata_WNI.jsp?exit=true";
document.formbiodata.submit();
}

function openSearchWin()
{
 if(formbiodata.no_kel.value=="")
    {
        alert("Nama Kelurahan belum Diisi !!");
        formbiodata.nama_kel.focus();
        return false;
    }
   var vchecked;
   var radio = document.formbiodata.radiobutton;
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
      return false;
   }
window2=openIT('adv_list.jsp?r=v',310,172,580,475,'window2',5,false,false,false);
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<%
if (request.getParameter("counter")!=null)
counter=Integer.parseInt(request.getParameter("counter"));

selidx=(request.getParameter("selidx")==null?"0":request.getParameter("selidx"));
no_prop= record.getNoProp();
no_kab= record.getNoKab();
no_kec= record.getNoKec();
no_kel= request.getParameter("no_kel");
if (request.getParameter("action") !=null) action=request.getParameter("action");
System.out.println(2);

if (request.getParameter("radiobutton")!=null)
{
 radiobutton = request.getParameter("radiobutton");
 if (radiobutton.trim().equals("Baru")) brchk="checked";
 if (radiobutton.trim().equals("Ulang")) ulgchk="checked";
}
if (request.getParameter("nik")!=null)
nik_spec=request.getParameter("nik");

if (request.getParameter("nama_start")!=null)
nama_start=request.getParameter("nama_start");

if (request.getParameter("update")!=null)
{
  try{
   String param_niks=request.getParameter("param_nik");
   vt_niks=getParseData(param_niks,"|");
   delgobj=(ListDelegate)session.getAttribute("biodelg");
   delgobj.updatePrintStatus(vt_niks);
  }catch(Exception upderr)
{

}
}

if (action.equals("EXEC"))
   {
         try{
            if (session.getAttribute("biodelg")!=null)
                 {
                  delgobj=(ListDelegate)session.getAttribute("biodelg");
                  delgobj.releaseMem();
                  delgobj=null;
                  session.removeAttribute("biodelg");
                 }
            }catch(Exception rlmem)
            {
            }
              prm=new Parameter();
              prm.NOPROP=no_prop;
              prm.NOKAB=no_kab;
              prm.NOKEC=no_kec;
              prm.NOKEL=no_kel;
              prm.ACT_CODE="BIOWNI";
              prm.ROWS=MAXROW;
              if (!nik_spec.trim().equals(""))  prm.NIK=nik_spec;
              if (!nama_start.trim().equals("")) prm.NAMALGKP=nama_start;
              if (brchk.trim().equals("checked"))
              prm.PFLAG="N";
              if (ulgchk.trim().equals("checked"))
              prm.PFLAG="Y";
              delgobj=new ListDelegate(action,prm);
              session.setAttribute("biodelg",delgobj);
              counter=0;
  }
  else if (session.getAttribute("biodelg")!=null)
            {
            delgobj=(ListDelegate)session.getAttribute("biodelg");
            }

System.out.println(4);

   if (request.getParameter("cursor")!=null
         && !request.getParameter("cursor").trim().equals("none"))
         {
     cursor=request.getParameter("cursor");
     if (cursor.trim().equals("prev"))  clientlist=delgobj.getListPreviousElements(delgobj.prm_tmp.ROWS);
     if (cursor.trim().equals("next"))
         {
     clientlist=delgobj.getListNextElements(delgobj.prm_tmp.ROWS);
         }
         System.out.println(5);
     }
     else if (delgobj!=null)
         {
         System.out.println(6);
            clientlist=delgobj.getListNextElements(delgobj.prm_tmp.ROWS);
         System.out.println(7);
          }
         System.out.println(8);

if (request.getParameter("allniks")!=null)   //To View All the niks selected in subsequent pages
allniks=request.getParameter("allniks");
%>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form method="post" name="formbiodata">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td background="images/v_bg_header.gif">
        <input type="hidden" name="nama_pej" value="<%=record.getKecNamaPej()%>">
        <input type="hidden" name="nip_pej" value="<%=record.getKecNipPej()%>">
        <input type="hidden" name="jabatan" value="<%=record.getKecJabata()%>">
        <input type="hidden" name="nkel" value="">
        <!--Hidden item to store all the niks from subsequent pages-->
        <input type="hidden" name="allniks" value="<%=allniks%>">
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
                                  Cetak Biodata WNI</span> <br>
                                </div>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <input type="hidden" name="selidx" value="<%=selidx%>">
                          <input type="hidden" name="namakel" value='<%=(request.getParameter("namakel")==null?"0":request.getParameter("namakel"))%>'>
                          <script language="javascript">
                                                   function resetPage(obj) {
                                                      document.all['no_kel'].value=obj.value;
                                                       document.all['namakel'].value=obj.options[obj.selectedIndex].text;
                                                       document.all['nkel'].value=obj.options[obj.selectedIndex].text;
                                                       document.all['selidx'].value=obj.selectedIndex;
                                                      return true;
                                                   }
                                                </script>
                          <% String jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
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
                                    <td class="C-Field" colspan="2">
                                      <div align="center"><b>Cetak Biodata WNI
                                        </b></div>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field" width="27%">
                                      <div align="center">
                                        <input type="radio" name="radiobutton" value="Baru" <%=brchk%>>
                                        Baru</div>
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
                          <table  border="0" cellspacing="2" cellpadding="0" align="center">
                            <tr>
                              <td width="214" height="19">
                                <div align="center"></div>
                              </td>
                              <td width="11" height="19">
                                <div align="center"></div>
                              </td>
                            </tr>
                            <tr>
                              <td width="214" nowrap> <a href="#"  onClick="checkRadioButton('EXEC','none')">
                                <font color="#2A00AA"><b>Tampilan Semua Data</b></font>
                                </a> </td>
                              <td  nowrap> <a href="#" onClick="openSearchWin()"><font color="#2A00AA"><b>Pencarian Canggih</b></font></a> </td>
                            </tr>
                            <tr>
                              <td colspan="2">&nbsp; </td>
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
if( radiobutton!=null && no_prop!=null && no_kab!=null && no_kec!=null && no_kel!=null)
{
         System.out.println(9);
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
                                <div align="center"> Pilih
                                  <input type=checkbox name="cb2"  onClick="selectAll(this,cb)">
                                </div>
                              </td>
                              <td class="C-Fonts" width="15%" nowrap>
                                <div align="center">Nomor KK</div>
                              </td>
                              <td class="C-Fonts" width="13%" nowrap>
                                <div align="center">NIK</div>
                              </td>
                              <td class="C-Fonts" width="18%" nowrap>
                                <div align="center">Nama Lengkap</div>
                              </td>
                              <td class="C-Fonts" width="17%" nowrap>
                                <div align="center">Jenis Kelamin</div>
                              </td>
                              <td class="C-Fonts" width="32%" nowrap>
                                <div align="center">Alamat</div>
                              </td>
                            </tr>
                            <%
       if(clientlist==null)
      {
counter=0;
%>
                            <tr>
                              <td class="C-Field" colspan="9">
                                <div align="center"><b> <%=printError("Data belum ada!")%>
                                  </b></div>
                              </td>
                            </tr>
                            <%}
     else
      {
for(int i=0;i<clientlist.size();i++)
          {
        BiodataWNIObject obj = (BiodataWNIObject)clientlist.get(i);
%>
                            <tr>
                              <td class="C-Field" width="5%">
                                <div align="center">
                                  <input type=checkbox name="cb" value="<%=obj.getNik()%>">
                                </div>
                              </td>
                              <td class="C-Field" width="15%">
                                <div align="center"><%=obj.getNo_kk()%></div>
                              </td>
                              <td class="C-Field" width="13%">
                                <div align="center"><%=obj.getNik()%></div>
                              </td>
                              <td class="C-Field" width="18%"><%=obj.getNama_lgkp()%>&nbsp;</td>
                              <td class="C-Field" width="17%"><%=getClKelamin(obj.getJenis_klmin())%>&nbsp;</td>
                              <td class="C-Field" width="32%"><%=obj.getAlamat()%>&nbsp;</td>
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
                </tr>
                <tr>
                  <td>
                    <table width="500" border="0" cellspacing="3" cellpadding="3" align="center">
                      <tr>
                        <td width="104">
                          <div align="center"><b>
                            <input class=boxstandard type=button value=TAMPILKAN name="tampilkan" onClick="if(document.formbiodata.cb.length==undefined){viewBiodataIndividu(1);}else{viewBiodataIndividu(document.formbiodata.cb.length);}" <%if(clientlist==null){%>disabled<%}%>>
                            </b></div>
                        </td>
                        <td width="101">
                          <div align="center"><b>
                            <input class=boxstandard type=button value=KELUAR name="keluar" onClick="releaseMem()">
                            </b></div>
                        </td>
                        <td width="230" align="right">
                          <div id="prog" style="visibility:hidden"> <font face="Geneva, Arial, Helvetica, san-serif" size="3" color="#FFFFFF">
                            <i><b>Processing....</b></i> </font> </div>
                          <table width="400" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td>

<%
if (!nik_spec.trim().equals(""))
     counter=0;
   else
      {
if (clientlist!=null)
{
%>
                                <div align="right" id="idprv"> <a name="previous" href="#1" onClick="checkRadioButton('none','prev')">
                                  <img src="images/left-bevelb.gif" border="0" alt="Sebelumnya" width="18" height="18"><b>&lt;&ltSebelumnya</b>
                                  </a> </div>
                       </td>
                              <td>

                                <div align="right" id="idnxt"> <a name="next" href="#2" onClick="checkRadioButton('none','next');">
                                  <img src="images/right-bevelb.gif" border="0" alt="Berikutnya" width="18" height="18">
                                  <b>Berikutnya&gt;&gt</b> </a></div>
<%
    if (cursor.equals("next") && clientlist!=null)
      {
    if (Long.parseLong(delgobj.TOTAL_CNT)>1)
      counter=counter+1;
      }

   if (cursor.equals("prev") && clientlist!=null)
      {
      counter=counter-1;
          if (counter<1) counter=1;
      }
 if (clientlist!=null && clientlist.size()==0) counter=0; //Reinitialize  page counter
%>
                         </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td width="104">&nbsp;</td>
                        <td width="101">&nbsp;</td>
                        <td width="265" align="right">
  <font face="Geneva, Arial, Helvetica, san-serif" size="2" color="#FFFFFF">
<%
total_pages=((Long.parseLong(delgobj.TOTAL_CNT)==0)?1:((Long.parseLong(delgobj.TOTAL_CNT)/MAXROW)==0)?1:(Long.parseLong(delgobj.TOTAL_CNT)/MAXROW));
%>
 <i><b><%="Halaman " + String.valueOf((counter==0)?1:counter) + " dari " + String.valueOf(total_pages)%></b></i>
 </font>
<input type="hidden" name="counter" value="<%=counter%>">
<%
}
      }
%>
<input type="hidden" name="max_row" value="<%=MAXROW%>">
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
              <div align="center"> <b>
                <script language="javascript">
window.scroll(0,1024);
</script>
                <input class=boxstandard type=button value=KELUAR name="keluar" onClick="releaseMem()">
                </b> </div>
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
        <input type="hidden" name="nkel" value="">
      </td>
      <td>
        <input type="hidden" name="spesifik_nik">
        &nbsp;
        <%
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
</HTML>
<%
}
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
}
%>
