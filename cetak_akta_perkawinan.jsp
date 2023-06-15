<%@page import="com.db.connection.ServiceController,daftar.akta.kawin.*,java.util.*,kartukeluarga.*,pendaftaran.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*"%>
<%@ include file="Global.jsp"%>
<%!
    UserInfo1 record = null;
%>
<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");
   }
  catch(Exception e){}

if(record != null)
    {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=javascript src="Templates/j.js">
</SCRIPT>
<SCRIPT language=javascript src="Templates/pop.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/popup.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>

<SCRIPT language="javascript">
function showDialogBox()
{
       var warganegara = document.formcetakakta.kewarganegaraan;
       var wnValue = "";
        for (i=0;i<warganegara.length;i++)
        {
            if (warganegara[i].checked)
            {
               wnValue= warganegara[i].value;
               break;
            }
        }

    if(wnValue=="")
    {
        alert("Belum Pilih Jenis Kewarganegaraan!");
        return;
    }

    while(true)
    {
    var no_akta = prompt("Masukkan Nomor Akta Perkawinan yang ingin dicari: ", "");

    if(no_akta==null
       || no_akta=="" )
    {
       alert("Silakan Isi Nomor Akta Perkawinan yang dikehendaki.");
       return false;
    }
    //else if(no_akta.length!=16)
    //{
       //alert("Nomor Akta Kawin Tidak boleh lebih/kurang dari 16 digit.");
    //}
    else
    {
      document.formcetakakta.spesifik_akta.value = no_akta;
      document.formcetakakta.action="cetak_akta_perkawinan.jsp?flag=0&spesifik_akta="+document.formcetakakta.spesifik_akta.value+"&kewarganegaraan="+wnValue;
      document.formcetakakta.submit();
      break;
    }
    }
}
function viewCetakAktaPage(v)
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
        if(document.formcetakakta.cb[i].checked)
        {
           niks=document.formcetakakta.cb[i].value;
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
        niks = document.formcetakakta.cb.value;
        if(!document.formcetakakta.cb.checked)
        {
         window.alert('Belum Pilih Nomor Akta');
        return;
        }
    }

     if(chk)
     {
         var radio = document.formcetakakta.radiobutton;
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
             param = param + "^" +arr[i];
         }

         param = param.substring(1);

         if(onemember)
         {
             param = niks;
         }
         if(document.all["selectdoctype"].value==2)
         {
             window.open("kutipan_akta_perkawinan.jsp?radiobutton="+radioValue+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&cb="+param+"&jabatan="+document.all["jabatan"].value+"&nama_pej="+document.all["nama_pej"].value+"&nip_pej="+document.all["nip_pej"].value, '','fullscreen=yes,scrollbars=yes,menubar=no,toolbar=no');
         }
         else if(document.all["selectdoctype"].value==1)
         {
            window.open("akta_perkawinan.jsp?radiobutton="+radioValue+"&no_akta_kawin="+param+"&jabatan="+document.all["jabatan"].value+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&nama_pej="+document.all["nama_pej"].value+"&nip_pej="+document.all["nip_pej"].value, '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no' );
         }
         else
         {
            alert("Belum Pilih Jenis Dokumen!");
         }
     }
     else
     {
         window.alert('Belum Pilih Nomor Akta');
     }
}

function checkComboBox(no_kel_value)
{
    document.formcetakakta.no_kel.value=no_kel_value;
}

function checkRadioButton(flag)
{
   var vchecked;
   var radio = document.formcetakakta.radiobutton;
   var wn = document.formcetakakta.kewarganegaraan;
   var wnchecked;

   for (i=0;i<radio.length;i++)
   {
     if (radio[i].checked)
     {
        vchecked = true;
        break;
    }
   }

   for (i=0;i<wn.length;i++)
   {
     if (wn[i].checked)
     {
        wnchecked = true;
        break;
    }
   }

   if(!wnchecked)
   {
     alert("Belum Pilih Jenis Kewarganegaraan!");
   }
   else if (!vchecked)
   {
     alert("Belum Pilih Jenis Cetak Akta Perkawinan!");
   }
   else if(document.all['selectdoctype'].selectedIndex==0)
   {
        alert("Belum Pilih Jenis Dokumen!");
   }
   else
   {
      document.formcetakakta.action="cetak_akta_perkawinan.jsp?flag=" + flag;
      document.formcetakakta.submit();
   }
}
</SCRIPT>
</HEAD>
<%
AktaKawinObject aktaKawinObject = null;

String valueStr="";
String radiobutton="";
String kewarganegaraan ="";
String jenis_dok="";
int next=0;
int page_no=0;
String stat_print=null,stat_change=null;

Vector vCetakAktaKawin = new Vector();

CetakAktaKawin cetakAktaKawin = null;
String no_prop="",no_kab="", nama_prop="", nama_kab="";

if (request.getParameter("radiobutton")!=null)
radiobutton = request.getParameter("radiobutton");

kewarganegaraan = request.getParameter("kewarganegaraan");

no_prop= request.getParameter("no_prop");
no_kab= request.getParameter("no_kab");
nama_prop= request.getParameter("nama_prop");
nama_kab= request.getParameter("nama_kab");

jenis_dok=request.getParameter("selectdoctype");

String spesifik_akta = request.getParameter("spesifik_akta");


String select = request.getParameter("selectdoctype");


if (radiobutton!=null & !radiobutton.trim().equals(""))
{
       if( radiobutton.trim().equalsIgnoreCase("BARU") )
       {
          stat_print="N";
          stat_change="N";
       }
       else if( radiobutton.trim().equalsIgnoreCase("ULANG") )
       {
          stat_print="Y";
          stat_change="N";
       }
}

String pageno=null;

   if(request.getParameter("pageno")!=null)
   {
      pageno=request.getParameter("pageno");
         try{
      page_no=Integer.parseInt(pageno);
         }catch(Exception e1){}
   }

DataWilayah dataWilayah = null;

String nextStr="";
String flag="";
if(request.getParameter("flag")!=null)
{
   flag=request.getParameter("flag");
}
   if(request.getParameter("nextpage")!=null)
   {
      nextStr = request.getParameter("nextpage");
       try{
      next = Integer.parseInt(nextStr);
       }catch(Exception e2){}
   }

String update = request.getParameter("update");

String param_akta = "";

//added for updating
if(update!=null)
{
    Vector vAkta = new Vector();

    param_akta = request.getParameter("param_akta");


    StringTokenizer st = new StringTokenizer(param_akta, "|");
    String token = "";
     while (st.hasMoreTokens())
     {
         token = st.nextToken();
         vAkta.addElement(token);
     }
     String tgl_ctk = "";
     Vector vTglCetak = new Vector();
     tgl_ctk = request.getParameter("tgl_ctk");
     st = new StringTokenizer(tgl_ctk, "|");
     while(st.hasMoreTokens())
     {
         token = st.nextToken();
         vTglCetak.addElement(token);
     }
//added 4 july
    if(session.getAttribute("CetakAktaKawinBean")!=null)
    {
          cetakAktaKawin = (CetakAktaKawin)session.getAttribute("CetakAktaKawinBean");
          session.removeAttribute("CetakAktaKawinBean");

    }
   else
   {
//end added 4 july
      try
      {
         ServiceController statelessController = ServiceController.getInstance();
         CetakAktaKawinHome home = (CetakAktaKawinHome)statelessController.lookup("CetakAktaKawinBean", CetakAktaKawinHome.class);

         cetakAktaKawin = home.create();

      }
      catch(Exception ex){ex.printStackTrace();}
   }
///////////////////////
/*
       ServiceController factory = ServiceController.getInstance();
       MonitorCetakUlangHome monHome = (MonitorCetakUlangHome) factory.lookup(
         "MonitorCetakUlang", MonitorCetakUlangHome.class);
       MonitorCetakUlang monitorBean = monHome.create();
*/
////////////////

          int result[] = cetakAktaKawin.updatePrintStatus(vAkta, stat_print, stat_change, vTglCetak);
//////////////////
/*
      Login temp = (Login) session.getAttribute("remoteSupv");
      if (temp!=null) {
         String  authBy = temp.getUserInfo().getUserId();
         String  authTo = record.getUserId();
         java.util.Date authDate = (java.util.Date) session.getAttribute("authDate");
         if (update.equalsIgnoreCase("okkutipan"))
            monitorBean.addCetakUlangAction("kutipan_akta_perkawinan", "NO_AKTA_KWN", vAkta, authBy, authTo, authDate);
         else
            monitorBean.addCetakUlangAction("register_akta_perkawinan", "NO_AKTA_KWN", vAkta, authBy, authTo, authDate);
         monitorBean.remove();
      }
*/
///////////////////////////
}
//end added for updating
///////////////////////
//removeCetakUlangAttribute(session);
//////////////////////////

try
{
   //if( radiobutton!=null && no_prop!=null && no_kab!=null && no_kec!=null && no_kel!=null)
   if( radiobutton!=null )
   {
      cetakAktaKawin=(CetakAktaKawin)session.getAttribute("CetakAktaKawinBean");

       if(flag.trim().equals("0"))
           {
            if (cetakAktaKawin!=null)
                    {
                       cetakAktaKawin.remove();
                       cetakAktaKawin=null;
                       session.removeAttribute("CetakAktaKawinBean");
                    }
            }

    if (cetakAktaKawin==null)
     {
       if(  radiobutton.trim().equalsIgnoreCase("BARU"))
       {
          stat_print="N";
          stat_change="N";
       }
       else if( radiobutton.trim().equalsIgnoreCase("ULANG"))
       {
          stat_print="Y";
          stat_change="N";
       }

       ServiceController statelessController = ServiceController.getInstance();
       CetakAktaKawinHome home = (CetakAktaKawinHome)statelessController.lookup("CetakAktaKawinBean", CetakAktaKawinHome.class);
       cetakAktaKawin = home.create();

       if(no_prop!=null && no_kab!=null && nama_prop!=null && nama_kab!=null)
       {
            cetakAktaKawin.retrieveData(no_prop, no_kab, nama_prop,nama_kab,
                           stat_print, stat_change, radiobutton, kewarganegaraan,jenis_dok);
       }
       else
       {
            cetakAktaKawin.retrieveData(record.getNoProp(), record.getNoKab(), record.getNamaProp()
                                ,record.getNamaKab(), stat_print, stat_change, radiobutton, kewarganegaraan,jenis_dok);
       }
       session.removeAttribute("CetakAktaKawinBean");
       session.setAttribute("CetakAktaKawinBean",cetakAktaKawin);
       next=0;
       page_no=0;

     }

   dataWilayah = cetakAktaKawin.getDataWilayah();

   if(spesifik_akta!=null && !spesifik_akta.trim().equalsIgnoreCase(""))
   {
       aktaKawinObject = cetakAktaKawin.getSpecificAkta( spesifik_akta, stat_print, stat_change,
                         kewarganegaraan, no_prop, no_kab,jenis_dok );
   }
   else
   {
      vCetakAktaKawin = cetakAktaKawin.getAllDataMember(next, next+10, page_no);
   }

   page_no=cetakAktaKawin.getPageNo();
   }
}
catch(Exception e)
{
e.printStackTrace();
}
%>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
<form method="post" name="formcetakakta">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<jsp:include page="topcapil.html"/>
<input type="hidden" name="pageno" value="<%=page_no%>">
<input type="hidden" name="nama_pej" value="<%=record.getKabNamaPej()%>">
<input type="hidden" name="nip_pej" value="<%=record.getKabNipPej()%>">
<input type="hidden" name="jabatan" value="<%=record.getKabJabatan()%>">

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
                                Cetak Akta Perkawinan</span><br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                        <td height="131">
                          <table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Provinsi</td>
                            <td>:</td>
                            <td width="5">
                              <input
                                class=boxdefault size=4 name=no_prop value="<%=record.getNoProp()%>" onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="33">
                              <input
                                class=boxdefault size=22 name=nama_prop value="<%=record.getNamaProp()%>" onFocus="this.blur()" maxlength="60">
                            </td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td>:</td>
                            <td width="8">
                              <input
                                class=boxdefault size=4 name=no_kab value="<%=record.getNoKab()%>" onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="22">
                              <input
                                class=boxdefault size=22 name=nama_kab value="<%=record.getNamaKab()%>" onFocus="this.blur()" maxlength="60">
                            </td>
                          </tr>
                          <tr>
                            <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                            <td>&nbsp;</td>
                            <td width="5">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td width="8">&nbsp;</td>
                            <td width="22">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top" height="35">
                        <table width="315" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                                    <div align="center"><b>Daftar Cetak</b> </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="C-Field" width="35%">
                                    <div align="right">Jenis Dokumen<span class="asterish"></span></div>
                                  </td>
                                  <td class="C-Field" width="4%">
                                    <div align="center">:</div>
                                  </td>
                                  <td class="C-Field" width="61%">
                                    <select name="selectdoctype" class="boxdefault">
                                      <option selected value="0">-- Pilih Jenis Dokumen
                                      --</option>
                                      <option value="1">1 - Register Akta</option>
                                      <option value="2">2 - Kutipan Akta</option>
                                    </select>
                                   <script language="javascript">
                                   document.all['selectdoctype'].selectedIndex="<%=jenis_dok%>"
                                   </script>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="C-Field" width="35%">
                                    <div align="right">Kewarganegaraan</div>
                                  </td>
                                  <td class="C-Field" width="4%">
                                    <div align="center">: </div>
                                  </td>
                                  <td class="C-Field" width="61%">
                                    <div align="left">
                                      <table width="80" border="0" cellspacing="1" cellpadding="1">
                                        <tr>
                                          <td width="30">
                                            <div align="center">
                                              <input type="radio" name="kewarganegaraan" value="WNI" <%if(dataWilayah!=null && dataWilayah.getKewarganegaraan()!=null && dataWilayah.getKewarganegaraan().equalsIgnoreCase("WNI")){%>checked<%}%>>
                                            </div>
                                          </td>
                                          <td width="88">WNI</td>
                                        </tr>
                                        <tr>
                                          <td width="30">
                                            <div align="center">
                                              <input type="radio" name="kewarganegaraan" value="WNA" <%if(dataWilayah!=null && dataWilayah.getKewarganegaraan()!=null && dataWilayah.getKewarganegaraan().equalsIgnoreCase("WNA")){%>checked<%}%>>
                                            </div>
                                          </td>
                                          <td width="88">WNA</td>
                                        </tr>
                                      </table>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="C-Field" width="35%">
                                    <div align="right">Jenis Cetakan</div>
                                  </td>
                                  <td class="C-Field" width="4%">
                                    <div align="center">: </div>
                                  </td>
                                  <td class="C-Field" width="61%">
                                    <div align="left">
                                      <table width="80" border="0" cellspacing="1" cellpadding="1">
                                        <tr>
                                          <td width="30">
                                            <div align="center">
                                              <input type="radio" name="radiobutton" value="BARU" <%if(dataWilayah!=null && dataWilayah.getStatus().equalsIgnoreCase("BARU")){%>checked<%}%>>
                                            </div>
                                          </td>
                                          <td width="88">BARU</td>
                                        </tr>
                                        <tr>
                                          <td width="30">
                                            <div align="center">
                                              <input type="radio" name="radiobutton" value="ULANG" <%if(dataWilayah!=null && dataWilayah.getStatus().equalsIgnoreCase("ULANG")){%>checked<%}%>>
                                            </div>
                                          </td>
                                          <td width="88">ULANG</td>
                                        </tr>
                                      </table>
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
                        </table>
                        <br>
                        <table width="425" border="0" cellspacing="2" cellpadding="0" align="center">
                          <tr>
                            <td width="170">
                              <div align="center"></div>
                            </td>
                            <td width="12">
                              <div align="center"></div>
                            </td>
                            <td width="235">
                              <div align="center"></div>
                            </td>
                          </tr>
                          <tr>
                            <td width="170">
                              <div align="left"><b><a href="#" onClick="checkRadioButton('0')"><font color="#2A00AA">Tampilan
                                Semua Data</font></a></b></div>
                            </td>
                            <td width="12">
                              <div align="center"></div>
                            </td>
                            <td width="235">
                              <div align="center"><b><a href="#" onClick="showDialogBox()"><font color="#2A00AA">Tampilan
                                Berdasarkan Nomor Akta</font></a></b></div>
                            </td>
                          </tr>
                          <tr>
                            <td width="170">&nbsp;</td>
                            <td width="12">&nbsp;</td>
                            <td width="235">&nbsp;</td>
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
if( radiobutton!=null && no_prop!=null && no_kab!=null )
{
try
{
   if (vCetakAktaKawin!=null)
    {
%>
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="800">
                    <tr>
                      <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="1" height="1"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="800">
                          <tr>
                            <td class="C-Fonts" width="4%">
                              <div align="center"> Pilih</div>
                            </td>
                            <td class="C-Fonts" width="18%">
                              <div align="center">Nomor Akta</div>
                            </td>
                            <td class="C-Fonts" width="18%">
                              <div align="center">NIK Suami</div>
                            </td>
                            <td class="C-Fonts" width="20%">
                              <div align="center">Nama Suami</div>
                            </td>
                            <td class="C-Fonts" width="20%">
                              <div align="center">NIK Istri</div>
                            </td>
                            <td class="C-Fonts" width="20%">
                              <div align="center">Nama Istri</div>
                            </td>
                          </tr>
<%
       if(vCetakAktaKawin.size()==0 && aktaKawinObject==null)
      {%>
                                <tr>
                                  <td class="C-Field" colspan="6">
                                    <div align="center"><b>
                                    Belum ada data!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(aktaKawinObject!=null && aktaKawinObject.getFound()==false)
      {%>
                                <tr>
                                  <td class="C-Field" colspan="6">
                                    <div align="center"><b>
                                    Data dengan No Akta <%=spesifik_akta%> tidak ditemukan!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(aktaKawinObject!=null && aktaKawinObject.getFound()==true)
      {%>
                          <tr>
                            <td class="C-Field" width="4%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=aktaKawinObject.getNo_akta_kwn()+"|"+aktaKawinObject.getNama_suami()+"|"+aktaKawinObject.getNama_istri()+"|"+aktaKawinObject.getNama_negara()+"|"+aktaKawinObject.getNik_istri()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="18%"><%=aktaKawinObject.getNo_akta_kwn()%></td>
                            <td class="C-Field" width="18%">
                              <div align="center"><%=aktaKawinObject.getNik_suami()%></div>
                            </td>
                            <td class="C-Field" width="20%">
                              <div align="left"><%=aktaKawinObject.getNama_suami()%></div>
                            </td>
                            <td class="C-Field" width="20%"><%=aktaKawinObject.getNik_istri()%></td>
                            <td class="C-Field" width="20%"><%=aktaKawinObject.getNama_istri()%></td>
                          </tr>
      <%}
      else
      {
          for(int i=0;i<vCetakAktaKawin.size();i++)
          {
             AktaKawinObject obj = (AktaKawinObject)vCetakAktaKawin.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="4%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=obj.getNo_akta_kwn()+"|"+obj.getNama_suami()+"|"+obj.getNama_istri()+"|"+obj.getNama_negara()+"|"+obj.getNik_istri()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="18%"><%=obj.getNo_akta_kwn()%></td>
                            <td class="C-Field" width="18%">
                              <div align="center"><%=obj.getNik_suami()%></div>
                            </td>
                            <td class="C-Field" width="20%">
                              <div align="left"><%=obj.getNama_suami()%></div>
                            </td>
                            <td class="C-Field" width="20%"><%=obj.getNik_istri()%></td>
                            <td class="C-Field" width="20%"><%=obj.getNama_istri()%></td>
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
                            <input class=boxstandard type=button value=   TAMPILKAN    name="tampilkan" onClick="if(document.formcetakakta.cb.length==undefined){viewCetakAktaPage(1);}else{viewCetakAktaPage(document.formcetakakta.cb.length);}" <%if( (vCetakAktaKawin.size()==0 && aktaKawinObject==null)|| (aktaKawinObject!=null && aktaKawinObject.getFound()==false) ){%>disabled<%}%>>
                            </b></div>
                        </td>
                        <td width="101">
                          <div align="center"><b>
                            <input class=boxstandard type=button value=KELUAR name="exit" onclick="document.location='Menu_Capil_KabKota.jsp'">
                            </b></div>
                        </td>
                        <%}
else
{%>
                        <td width="104">
                          <div align="center"></div>
                        </td>
                        <td width="101">
                          <div align="center"><b>
                            <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='Menu_Capil_KabKota.jsp'">
                            </b></div>
                        </td>
                        <%}
if( radiobutton!=null && no_prop!=null && no_kab!=null)
{
%>
                        <td width="265">
                          <div align="center" style="position:absolute" id="vis">
                            <b>&lt;&lt;
                            <script language="javascript">
 if (parseInt(document.all["pageno"].value)==1)
  {
      document.all["vis"].style.visibility="hidden";
  }
</script>
                            <a name="previous" href="#1" onclick="javascript:history.back();">
                            <font color="#FFFFFF">Sebelumnya</font></a> </b> </div>
                          <%
                          if(cetakAktaKawin.getLinkEnabled()&& next<cetakAktaKawin.getTotalRecords())
                          {
                          %>
                          <div align="right"> <b> . . . <a name="next" href="#2" onclick="checkRadioButton('1')" <%next=next+10;%>>
                            <font color="#FFFFFF">Berikutnya</font></a> &gt;&gt;
                            <%}%>
                            </b> </div>
                          <input type="hidden" name="nextpage" value="<%=next%>">
                        </td>
                      </tr>
                      <tr>
                        <td colspan="5">
                          <%if ( (vCetakAktaKawin.size()!=0) && (radiobutton!=null) && (!radiobutton.trim().equals("")))
                           {

                         %>
                          <center>
                            <b><font color="#FFFFFF">
                            <div align="right">Halaman &nbsp;<%=page_no%>&nbsp;
                              dari &nbsp;<%=(long)(Math.ceil((double)cetakAktaKawin.getTotalRecords()/10))%></div>
                            </font> </b>
                          </center>
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
                  <div align="center"> </div>
                </td>
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
    <td><input type="hidden" name="spesifik_akta">&nbsp;</td>
  </tr>
</table>
</form>
</BODY>
</HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
%>
