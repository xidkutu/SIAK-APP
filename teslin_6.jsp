<%@ page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,ktp.wni.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*,com.penan.ViewTtd"%>
<%@ page import="com.wilayah.*"%>
<%@ include file="Global.jsp"%>
<%
UserInfo1 record = null;
String valueStr="";
String radiobutton="";
KTPWniObject wniObject=null;
String stat_print=null;
Vector vDataKelurahan = new Vector();
CetakKTP cetakKTP = null;
String spesifik_nik=null,spesifik_nama=null;
String selidx="";
boolean nik_one=false,nama_one=false;
boolean access=true;
boolean finish=false;
ServiceController controller;
long start=0,end=0,tot_rec=0;
long tot_page=0,page_no=0;
String update=null;
String stat_change="";
String pjbpath="";
String clientparam="";
//File_TandaTangan deFile_TandaTangan =null;
ViewTtd obj_ttd=null;
String demana=null;
//ServiceController factory=null;
//SetupPenanHome homettd;
//SetupPenan remotettd;

%>


<%
Vector vKtp = new Vector();
try {
    record=(UserInfo1)session.getAttribute("remoteRef");
    
    if(record != null) {
%>
<HTML>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/trim.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/newwilayah2.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/teslin6new.js">
</SCRIPT>
<script language="javascript" src="scripts/chromeless_35.js">
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
function openSearchWin()
{
 if(document.all['no_kel'].value=="")
    {
        alert("Nama Kelurahan belum Diisi !!");
        document.all['nama_kel'].focus();
        return false;
    }
   var vchecked;
   var radio = document.all['radiobutton'];
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
      return false;
   }
window2=openIT('adv_list.jsp?r=h&type=4',310,140,580,475,'window2',5,false,false,false);
}
                       </SCRIPT>
<%
if (request.getParameter("radiobutton")!=null)
    radiobutton =request.getParameter("radiobutton") ;

if (request.getParameter("pjbpath")!=null)
    pjbpath=request.getParameter("pjbpath");

selidx=(request.getParameter("selidx")==null?"0":request.getParameter("selidx"));
no_prop= request.getParameter("no_prop");
no_kab= request.getParameter("no_kab");
no_kec= request.getParameter("no_kec");
no_kel= request.getParameter("no_kel");
update = request.getParameter("update");
clientparam=((request.getParameter("param")==null)?"":request.getParameter("param"));
try{
    if (request.getParameter("page_no")!=null) page_no=Long.parseLong(request.getParameter("page_no"));
}catch(Exception e1){}
try{
    if (request.getParameter("tot_page")!=null) tot_page=Long.parseLong(request.getParameter("tot_page"));
}catch(Exception e2){}

if (request.getParameter("spesifik_nik")!=null && (!request.getParameter("spesifik_nik").equals(""))) {
    spesifik_nik = request.getParameter("spesifik_nik");
    nik_one=true;
}

if (request.getParameter("spesifik_nama")!=null && (!request.getParameter("spesifik_nama").equals(""))) {
    spesifik_nama=request.getParameter("spesifik_nama");
    nama_one=true;
}

nama_kel = request.getParameter("nama_kel");

controller = ServiceController.getInstance();

/*
WilayahSettingModuleHome home_wilayah = (WilayahSettingModuleHome)controller.lookup("wilayahsetter", WilayahSettingModuleHome.class);
view_kel = home_wilayah.create();
vDataKelurahan= view_kel.getDataKelurahan(record.getNoProp().trim(),record.getNoKab().trim(),record.getNoKec().trim());
*/

vDataKelurahan= getDataKelurahan(record.getNoProp().trim(),record.getNoKab().trim(),record.getNoKec().trim());
String brchk="",perchk="",ulgchk="";

if (radiobutton!=null && !radiobutton.trim().equals("")) {
    if( radiobutton.trim().equalsIgnoreCase("Baru")) {
        stat_print="1";
        brchk="checked";
        clientparam="";
    } else if( radiobutton.trim().equalsIgnoreCase("Penggantian")) {
        stat_print="2";
        brchk="";
        perchk="checked";
        clientparam="";
    } else if( radiobutton.trim().equalsIgnoreCase("Perpanjangan")) {
        stat_print="3";
        brchk="";
        perchk="";
        ulgchk="checked";
        clientparam="";
    }
    
    if ((update!=null) && (update.trim().equals("ok"))) {
        Vector vNik = new Vector();
        if (session.getAttribute("ktpInfo")!=null) {
            vNik=(Vector)session.getAttribute("ktpInfo");
//System.out.println("Update ok entered!!!!");
            CetakKTPHome home = (CetakKTPHome)controller.lookup("CetakKTPBean", CetakKTPHome.class);
            cetakKTP=home.create();
///////////////////////
// ServiceController factory = ServiceController.getInstance();
/*       MonitorCetakUlangHome monHome = (MonitorCetakUlangHome) factory.lookup(
"MonitorCetakUlang", MonitorCetakUlangHome.class);
MonitorCetakUlang monitorBean = monHome.create();
            */
////////////////
            
            int result[] = cetakKTP.updatePrintStatus(vNik, stat_print, "");
//////////////////
/*    Login temp = (Login) session.getAttribute("remoteSupv");
if (temp!=null) {
String  authBy = temp.getUserInfo().getUserId();
String  authTo = record.getUserId();
java.util.Date authDate = (java.util.Date) session.getAttribute("authDate");
monitorBean.addCetakUlangAction("KTP_WNI", "NIK", vNik, authBy, authTo, authDate);
monitorBean.remove();
}
            */
///////////////////////////
            session.removeAttribute("ktpInfo");
        }
    }
///////////////////////
//removeCetakUlangAttribute(session);
//////////////////////////
    
    if (cetakKTP==null) {
        CetakKTPHome home = (CetakKTPHome)controller.lookup("CetakKTPBean", CetakKTPHome.class);
        cetakKTP=home.create();
        
    }
    
    if (nama_kel!=null && !nama_kel.trim().equals("")) {
        
//sukiman
        obj_ttd = new ViewTtd();
        demana =  obj_ttd.getFileTandaTangan(no_prop.trim(),no_kab.trim(),no_kec.trim(),no_kel.trim());
        System.out.println("Yang tandantangan :"+demana);
    }
    if (spesifik_nik!=null && !spesifik_nik.trim().equals("")) {
        vKtp=cetakKTP.getSpecificNik(spesifik_nik.trim(),record.getNoProp(),
                record.getNoKab(),record.getNoKec(),no_kel,stat_print);
        if(vKtp==null) vKtp=new Vector();
        finish=true;
    } else if (spesifik_nama!=null && !spesifik_nama.trim().equals("")) {
        vKtp=cetakKTP.getSpecificNama(spesifik_nama.trim(),record.getNoProp(),
                record.getNoKab(),record.getNoKec(),no_kel,stat_print);
        if(vKtp==null) vKtp=new Vector();
        finish=true;
    } else {
//Begin For all Records
//System.out.println("Entered Step4 ALL");
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
        end=end+8;
        vKtp=cetakKTP.getAllData(record.getNoProp(),record.getNoKab(),record.getNoKec(),
                no_kel,String.valueOf(start),String.valueOf(end),stat_print,access);
        if(vKtp==null) vKtp=new Vector();
        try{
            if (!access)  tot_rec=Long.parseLong(cetakKTP.getTotalRecord());
        }catch(Exception e6){}
        
        if (end>=tot_rec) {
            end=tot_rec;
            finish=true;
        }
        if (start>=tot_rec) start=tot_rec;
//end for all records
        tot_page=(long)(Math.ceil((double)tot_rec/8));
        
        if (page_no>=tot_page) page_no=tot_page;
        else page_no=page_no+1;
    }
}
%>
<BODY leftMargin=0  topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
<form method="post" name="formktpwni">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td background="images/v_bg_header.gif">
                <input type="hidden" name="param" value="<%=clientparam%>">
                <input type="hidden" name="start" value="<%=start%>">
                <input type="hidden" name="end" value="<%=end%>">
                <input type="hidden" name="tot_rec" value="<%=tot_rec%>">
                <input type="hidden" name="tot_page" value="<%=tot_page%>">
                <input type="hidden" name="page_no" value="<%=page_no%>">
                <input type="hidden" name="stat_print" value="<%=stat_print%>">
                <input type="hidden" name="nip_pej" value="<%=record.getKecNipPej()%>">
                <input type="hidden" name="nama_pej" value="<%=record.getKecNamaPej()%>">
                <input type="hidden" name="a_n" value="<%=record.getKecJabata()%>">
                <input type="hidden" name="stat_pndtng" value="<%=record.getStatpndtngkec()%>">
                <input type="hidden" name="tamflag">
                <jsp:include page="top.html"/>
            </td>
        </tr>
        <tr>
            <td>
                <div align="center"><span class="submenu">Daftar Cetak Kartu Tanda Penduduk (KTP)</span></div><br>
                <% String jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
                        "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
                        "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&selidx="+ selidx;
                %>
                <jsp:include page="<%=jsp%>"/>
                <table width="100%" border="0" cellspacing="5" cellpadding="5">
                    <tr>
                        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                    
                                    <td></td>
                                    <td><table width="100%" border="0" cellspacing="3" cellpadding="3">
                                            <tr>
                                                <td valign="top" height="35">
                                                    <input type="hidden" name="selidx" value="<%=selidx%>">
                                                    <input type="hidden" name="namakel" value="<%=(request.getParameter("namakel")==null?"":request.getParameter("namakel"))%>">
                                                    
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
                                                                            <div align="center"><b>Cetak Kartu Tanda Penduduk (KTP)</b></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="C-Field" width="27%">
                                                                            <div align="center">
                                                                            <input type="radio" name="radiobutton" value="Baru" <%=brchk%> onclick="initall()"> Baru</div>
                                                                        </td>
                                                                        <td class="C-Field" width="40%">
                                                                            <div align="center">
                                                                            <input type="radio" name="radiobutton" value="Penggantian" <%=perchk%> onclick="initall()"> Penggantian</div>
                                                                        </td>
                                                                        <td class="C-Field" width="33%">
                                                                            <div align="left">
                                                                            <input type="radio" name="radiobutton" value="Perpanjangan" <%=ulgchk%> onclick="initall()"> Perpanjangan</div>
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
                                                    <table width="300" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                                                        <input type="hidden" name="tampilkdl" value="TDK">
                                                    </table>
                                                    <br>
                                                    <table width="475" border="0" cellspacing="2" cellpadding="0" align="center">
                                                        <tr>
                                                            <td width="214">
                                                                <div align="center"><input type=hidden name="member" value=""></div>
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
                                                                    <b><a href="#"  onClick="page_no.value=0;tot_page.value=0;start.value=0;end.value=0;tot_rec.value=0;param.value='';checkRadioButton()">
                                                                            <font color="#2A00AA">Tampilan Semua Data</font>
                                                                    </a></b>
                                                                </div>
                                                            </td>
                                                            <td width="11">
                                                                <div align="center"></div>
                                                            </td>
                                                            <td width="242">
                                                                <div align="center"><b><a href="#" onClick="openSearchWin()">
                                                                <font color="#2A00AA">Pencarian Canggih</font></a></b></div>
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
                                    </table></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%
                                //System.out.println(720);
                                if( radiobutton!=null && no_prop!=null && no_kab!=null && no_kec!=null && no_kel!=null ) {
                    
                    try {
                        if (vKtp.size()>=0) {
                            //System.out.println(728);
                                %>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="hidden" name="pjbpath" value="<%=pjbpath%>">
                                        <input type="hidden" name="hidfilepath" value="<%=demana%>">
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
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
                                                                <div align="center">Nama Lengkap</div>
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
                                                                <div align="center">Masukkan<br>
                                                                    Tandatangan / <br>
                                                                Sidik Jari</div>
                                                            </td>
                                                            <td class="C-Fonts" width="15%"nowrap>
                                                                <div align="center">Tampilan<br>
                                                                    Tandatangan / <br>
                                                                Sidik Jari</div>
                                                            </td>
                                                        </tr>
                                                        <%if( vKtp.size()==0 && wniObject==null )
                                                        {
                                                        %>
                                                        <script language="javascript">
                                                   document.formktpwni.member.value="0";
                                                        </script>
                                                        <tr>
                                                            <td class="C-Field" colspan="9">
                                                                <div align="center"><b>Belum ada data!</b></div>
                                                            </td>
                                                        </tr>
                                                        <%} else if(wniObject!=null && wniObject.getFound()==false) {
                                                        %>
                                                        <script language="javascript">
                                                   document.formktpwni.member.value="0";
                                                        </script>
                                                        <tr>
                                                            <td class="C-Field" colspan="9">
                                                                <div align="center"><b>Data dengan NIK <%=spesifik_nik%>
                                                                tidak ditemukan!</b></div>
                                                            </td>
                                                        </tr>
                                                        <%} else if(wniObject!=null && wniObject.getFound()==true ) {
                                                        %>
                                                        <script language="javascript">
                                                   document.formktpwni.member.value="1";
                                                        </script>
                                                        <tr>
                                                            <td class="C-Field" width="3%">
                                                                <div align="center">
                                                                    <input type=checkbox name="cb" value="<%=wniObject.getNik()%>" onClick="unchecked(1);">
                                                                </div>
                                                            </td>
                                                            <td class="C-Field" width="15%">
                                                                <div align="center"><%=wniObject.getNik()%></div>
                                                            </td>
                                                            <td class="C-Field" width="15%"nowrap>
                                                                <div align="center"><%=wniObject.getNama_lgkp().toUpperCase()%></div>
                                                            </td>
                                                            <td class="C-Field" width="13%" nowrap>
                                                                <div align="center"><%=wniObject.getTgl_lhr()%></div>
                                                            </td>
                                                            <td class="C-Field" width="31%" >
                                                                <div align="left"><%=wniObject.getAlamat().toUpperCase()%></div>
                                                            </td>
                                                            <td class="C-Field" width="8%">
                                                                <div align="center">
                                                                    <input class=boxstandard type=file name="uploadfile" onChange="LimitAttach(this.form, this.form.uploadfile.value,this.form.imgfoto)" onKeyDown="this.blur()">
                                                                </div>
                                                            </td>
                                                            <td class="C-Field" width="15%">
                                                                <div align="center"><img name="imgfoto" width="52" height="65" style="visibility:hidden"></div>
                                                            </td>
                                                            <td class="C-Field" width="8%">
                                                                <div align="center">
                                                                    <input class=boxstandard type="file" name="personfile"  value="----------" onChange="LimitAttach(this.form, this.form.personfile.value,this.form.imgperson)" onKeyDown="this.blur()">
                                                                </div>
                                                            </td>
                                                            <td class="C-Field" width="15%">
                                                                <div align="center"><img name="imgperson" width="52" height="65" style="visibility:hidden"></div>
                                                            </td>
                                                        </tr>
                                                        <%} else { %>
                                                        <script language="javascript">
                                                   document.formktpwni.member.value="2";
                                                        </script>
                                                        <%
                                                        //System.out.println(834);
                                                        for(int i=0;i<vKtp.size();i++) {
                                                            //System.out.println(837);
                                                            KTPWniObject obj = (KTPWniObject)vKtp.elementAt(i);
                                                        %>
                                                        <tr>
                                                            <td class="C-Field" width="3%">
                                                                <div align="center">
                                                                    <input type=checkbox name="cb" value="<%=obj.getNik()%>" <%if(vKtp.size()==1){%>onclick="unchecked('0');"<%}else{%>onclick="unchecked('<%=i%>');"<%}%>>
                                                                </div>
                                                            </td>
                                                            <td class="C-Field" width="15%">
                                                                <div align="center"><%=obj.getNik()%></div>
                                                            </td>
                                                            <td class="C-Field" width="15%" >
                                                                <div align="center"><%=obj.getNama_lgkp().toUpperCase()%></div>
                                                            </td>
                                                            <td class="C-Field" width="13%" >
                                                                <div align="center"><%=obj.getTgl_lhr()%></div>
                                                            </td>
                                                            <td class="C-Field" width="31%" >
                                                                <div align="left"><%=obj.getAlamat().toUpperCase()%></div>
                                                            </td>
                                                            <td class="C-Field" width="8%">
                                                                <div align="center">
                                                                    <input class=boxstandard type=file name="uploadfile<%=i%>" onChange="LimitAttach(this.form, this.form.uploadfile<%=i%>.value,this.form.imgfoto<%=i%>)" onKeyDown="this.blur()">
                                                                </div>
                                                            </td>
                                                            <td class="C-Field" width="15%">
                                                                <div align="center"> <img name="imgfoto<%=i%>" width="40" height="51"  style="visibility:hidden">
                                                                </div>
                                                            </td>
                                                            <td class="C-Field" width="15%">
                                                                <div align="center">
                                                                    <input class=boxstandard type="file" name="personfile<%=i%>" onChange="LimitAttach(this.form, this.form.personfile<%=i%>.value,this.form.imgperson<%=i%>)" onKeyDown="this.blur()">
                                                                </div>
                                                            </td>
                                                            <td class="C-Field" width="15%">
                                                                <div align="center"> <img name="imgperson<%=i%>" width="40" height="51" style="visibility:hidden">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <% //System.out.println(870);
                                                        }
                                                        }
                                                        %>
                                                    </table>
                                                </td>
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
                                //System.out.println("#ServiceController Error= "+e.toString());
                                }
                                }
                                %>
                                
                                
                                
                                <tr>
                                    <td height="1" width="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                                    <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                    <td width="1" height="1"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                                </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td>
                            <table width="500" border="0" cellspacing="3" cellpadding="3" align="center">
                                <tr>
                                    <%
                                    //System.out.println(913);
                                    if( radiobutton!=null && no_prop!=null && no_kab!=null)
                                    {
                                    //System.out.println(916);
                                    %>
                                    
                                    <td width="104">
                                        <div align="center"><b><input class=boxstandard type=button value=   TAMPILKAN    name="tampilkan" onClick="if(document.formktpwni.cb.length==undefined){viewKTP_WNIPage(1);}else{viewKTP_WNIPage(document.formktpwni.cb.length);}" <%if( (vKtp.size()==0 && wniObject==null)|| (wniObject!=null && wniObject.getFound()==false) ){%>disabled<%}%>></b></div>
                                    </td>
                                    <td width="101">
                                        <div align="center"><b><input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNI_Menu.jsp'"></b></div>
                                    </td>
                                    <%}
                                    else
                                    {
                                    //System.out.println(928);
                                    %>
                                    <td>&nbsp;</td>
                                    <td width="101">
                                        <div align="center">
                                            <b><input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='WNI_Menu.jsp'"></b>
                                        </div>
                                    </td>
                                    
                                    <%}
                                    
                                    if( radiobutton!=null && no_prop!=null && no_kab!=null)
                                    {
                                    //System.out.println(941);
                                    %>
                                    <td width="265">
                                        <div align="center" style="position:absolute" id="vis">
                                            <%
                                            if ((start>8) &&  (vKtp.size()!=0))
                                            {
                                            //System.out.println(948);
                                            %>
                                            <b>&lt;&lt;<a name="previous" href="#1" onclick="javascript:history.back();"><font color="#FFFFFF">Sebelumnya</font></a></b>
                                            <%
                                            }
                                            %>
                                        </div>
                                        
                                        <%
                                        if (vKtp.size()>0 && !finish)
                                        {
                                        //System.out.println(959);
                                        %>
                                        <div align="right">
                                            <b>. . .<a name="next" href="#2" onclick="checkRadioButton()"><font color="#FFFFFF">Berikutnya</font></a>&gt;&gt;</b>
                                        </div>
                                        <%
                                        }
                                        %>
                                    </td>
                                    <%}%>
                                </tr>
                                <tr>
                                    <td width="104">&nbsp;</td>
                                    <td width="101">&nbsp;</td>
                                    <td width="265">
                                        <%if (!nama_one && !nik_one && (vKtp.size()!=0) && (radiobutton!=null) && (!radiobutton.trim().equals("")))
                                        {
                                        //System.out.println(976);
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
    <input type=hidden name="nkel" value="<%=nama_kel%>">
    &nbsp;
    </td>
    
    <script language="javascript">
            function bottom()
            {
               window.scroll(0,800);
            }
            bottom()
    </script>
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
catch(Exception e){
e.printStackTrace();
}
finally{
//System.out.println(1016);
if (cetakKTP!=null)
cetakKTP.remove();
finish=false;
start=0;
end=0;
tot_rec=0;
nik_one=false;
stat_print=null;
}
%>