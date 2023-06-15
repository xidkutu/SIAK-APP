<%@page import="com.db.connection.ServiceController,cetak.cerai.*,java.util.*,kartukeluarga.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*" session="true"%>
<%@ include file="Global.jsp"%>
<%!
    UserInfo1 record = null;
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
    var no_akta = prompt("Masukkan Nomor Akta Cerai yang ingin dicari: ", "");

    if(no_akta==null
       || no_akta=="" )
    {
       alert("Silakan Isi Nomor Akta Cerai yang dikehendaki.");
       return false;
    }

    //else if(no_akta.length!=16)
    //{
       //alert("Nomor Akta Cerai Tidak boleh lebih/kurang dari 16 digit.");
    //}

    else
    {
      document.formcetakakta.spesifik_akta.value = no_akta;
      document.formcetakakta.action="cetak_akta_perceraian.jsp?flag=0&spesifik_akta="+document.formcetakakta.spesifik_akta.value+"&kewarganegaraan="+wnValue;
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
             window.open("kutipan_akta_perceraian.jsp?radiobutton="+radioValue+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&cb="+param+"&jabatan="+document.all["jabatan"].value+"&nama_pej="+document.all["nama_pej"].value+"&nip_pej="+document.all["nip_pej"].value, '','fullscreen=yes,scrollbars=yes,menubar=no,toolbar=no' );
         }
         else if(document.all["selectdoctype"].value==1)
         {
          window.open("akta_perceraian.jsp?radiobutton="+radioValue+"&nama_kab="+document.all["nama_kab"].value+"&no_akta_cerai="+param+"&jabatan="+document.all["jabatan"].value+"&nama_pej="+document.all["nama_pej"].value+"&nip_pej="+document.all["nip_pej"].value, '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no' );
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
     alert("Belum Pilih Jenis Cetak Akta Perceraian!");
   }
   else
   {
      document.formcetakakta.action="cetak_akta_perceraian.jsp?flag=" + flag;
      document.formcetakakta.submit();
   }
}
</SCRIPT>
</HEAD>
<%
CetakCeraiObject cetakCeraiObject = null;

String valueStr="";
String radiobutton="";
String kewarganegaraan ="";

int next=0;
int page_no=0;
String stat_print=null,stat_change=null;

Vector vCetakAktaCerai = new Vector();

CetakCerai cetakAktaCerai = null;
String no_prop="",no_kab="", nama_prop="", nama_kab="";

if (request.getParameter("radiobutton")!=null)
radiobutton =request.getParameter("radiobutton");

kewarganegaraan = request.getParameter("kewarganegaraan");



no_prop= request.getParameter("no_prop");
no_kab= request.getParameter("no_kab");
nama_prop= request.getParameter("nama_prop");
nama_kab= request.getParameter("nama_kab");

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
    if(session.getAttribute("CetakCeraiBean")!=null)
    {
          cetakAktaCerai = (CetakCerai)session.getAttribute("CetakCeraiBean");
          session.removeAttribute("CetakCeraiBean");

    }
   else
   {
//end added 4 july

      try
      {
         ServiceController statelessController = ServiceController.getInstance();
         CetakCeraiHome home = (CetakCeraiHome)statelessController.lookup("CetakCeraiBean", CetakCeraiHome.class);

         cetakAktaCerai = home.create();


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

          int result[] = cetakAktaCerai.updatePrintStatus(vAkta, stat_print, stat_change, vTglCetak);
//////////////////
/*
      Login temp = (Login) session.getAttribute("remoteSupv");
      if (temp!=null) {
         String  authBy = temp.getUserInfo().getUserId();
         String  authTo = record.getUserId();
         java.util.Date authDate = (java.util.Date) session.getAttribute("authDate");
         if (update.equalsIgnoreCase("okkutipan")) {
            monitorBean.addCetakUlangAction("kutipan_akta_perceraian", "NO_AKTA_CRAI", vAkta, authBy, authTo, authDate);
         }
         else {
            monitorBean.addCetakUlangAction("register_akta_perceraian", "NO_AKTA_CRAI", vAkta, authBy, authTo, authDate);
         }
         monitorBean.remove();
      }
*/
///////////////////////////
          cetakAktaCerai.remove();
          cetakAktaCerai = null;

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
      cetakAktaCerai=(CetakCerai)session.getAttribute("CetakCeraiBean");

       if(flag.trim().equals("0"))
           {
            if (cetakAktaCerai!=null)
                    {
                       cetakAktaCerai.remove();
                       cetakAktaCerai=null;
                       session.removeAttribute("CetakCeraiBean");
                    }
            }

    if (cetakAktaCerai==null)
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
       CetakCeraiHome home = (CetakCeraiHome)statelessController.lookup("CetakCeraiBean", CetakCeraiHome.class);
       cetakAktaCerai = home.create();

      if(no_prop!=null && no_kab!=null && nama_prop!=null && nama_kab!=null)
      {
       cetakAktaCerai.retrieveData(no_prop, no_kab, nama_prop,nama_kab, stat_print, stat_change, radiobutton, kewarganegaraan);
      }
      else
      {
       cetakAktaCerai.retrieveData(record.getNoProp(), record.getNoKab(), record.getNamaProp(),record.getNamaKab(), stat_print, stat_change, radiobutton, kewarganegaraan);
      }

       if(session.getAttribute("CetakCeraiBean")!=null)
       {
         session.removeAttribute("CetakCeraiBean");
       }


       session.setAttribute("CetakCeraiBean",cetakAktaCerai);


       next=0;
       page_no=0;
  }

   dataWilayah = cetakAktaCerai.getDataWilayah();

   if(spesifik_akta!=null && !spesifik_akta.trim().equalsIgnoreCase(""))
   {
       cetakCeraiObject = cetakAktaCerai.getSpecificAkta( spesifik_akta, stat_print, stat_change,
                   kewarganegaraan, no_prop, no_kab );
   }
   else
   {

      vCetakAktaCerai = cetakAktaCerai.getAllDataMember(next, next+10, page_no);

   }

   page_no=cetakAktaCerai.getPageNo();  //dual kali

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
    <td background="images/v_bg_header.gif">
    <input type="hidden" name="pageno" value="<%=page_no%>">
        <input type="hidden" name="nama_pej" value="<%=record.getKabNamaPej()%>">
        <input type="hidden" name="nip_pej" value="<%=record.getKabNipPej()%>">
        <input type="hidden" name="jabatan" value="<%=record.getKabJabatan()%>">
		<jsp:include page="topcapil.html"/>
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
                                Cetak Akta Perceraian</span><br>
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
                                      <option selected>-- Pilih Jenis Dokumen
                                      --</option>
                                      <option value="1">1 - Register Akta</option>
                                      <option value="2">2 - Kutipan Akta</option>
                                    </select>
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

   if (vCetakAktaCerai!=null)
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
       if(vCetakAktaCerai.size()==0 && cetakCeraiObject==null)
      {

%>
                                <tr>
                                  <td class="C-Field" colspan="6">
                                    <div align="center"><b>
                                    Belum ada data!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(cetakCeraiObject!=null && cetakCeraiObject.getFound()==false )
      {

%>
                                <tr>
                                  <td class="C-Field" colspan="6">
                                    <div align="center"><b>
                                    Data dengan No Akta <%=spesifik_akta%> tidak ditemukan!
                                      </b></div>
                                  </td>
                                </tr>
      <%}
      else if(cetakCeraiObject!=null && cetakCeraiObject.getFound()==true )
      {

%>
                          <tr>
                            <td class="C-Field" width="4%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=cetakCeraiObject.getNo_akta_crai()+"|"+cetakCeraiObject.getNama_suami()+"|"+cetakCeraiObject.getNama_istri()+"|"+cetakCeraiObject.getNama_negara()+"|"+cetakCeraiObject.getNik_istri()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="18%"><%=cetakCeraiObject.getNo_akta_crai()%></td>
                            <td class="C-Field" width="18%">
                              <div align="center"><%=cetakCeraiObject.getNik_suami()%></div>
                            </td>
                            <td class="C-Field" width="20%">
                              <div align="left"><%=cetakCeraiObject.getNama_suami()%></div>
                            </td>
                            <td class="C-Field" width="20%"><%=cetakCeraiObject.getNik_istri()%></td>
                            <td class="C-Field" width="20%"><%=cetakCeraiObject.getNama_istri()%></td>
                          </tr>
      <%}
      else
      {

          for(int i=0;i<vCetakAktaCerai.size();i++)
          {
             CetakCeraiObject obj = (CetakCeraiObject)vCetakAktaCerai.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="4%">
                              <div align="center">
                                <input type=checkbox name="cb" value="<%=obj.getNo_akta_crai()+"|"+obj.getNama_suami()+"|"+obj.getNama_istri()+"|"+obj.getNama_negara()+"|"+obj.getNik_istri()%>">
                              </div>
                            </td>
                            <td class="C-Field" width="18%"><%=obj.getNo_akta_crai()%></td>
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
                            <input class=boxstandard type=button value=   TAMPILKAN    name="tampilkan" onClick="if(document.formcetakakta.cb.length==undefined){viewCetakAktaPage(1);}else{viewCetakAktaPage(document.formcetakakta.cb.length);}" <%if( (vCetakAktaCerai.size()==0 && cetakCeraiObject==null)|| (cetakCeraiObject!=null && cetakCeraiObject.getFound()==false ) ){%>disabled<%}%>>
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
                          if(cetakAktaCerai.getLinkEnabled()&& next<cetakAktaCerai.getTotalRecords())
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
<%if ( (vCetakAktaCerai.size()!=0) && (radiobutton!=null) && (!radiobutton.trim().equals("")))
     {

                         %>
                          <center>
                            <b><font color="#FFFFFF">
                            <div align="right">Halaman &nbsp;<%=page_no%>&nbsp;
                              dari &nbsp;<%=(long)(Math.ceil((double)cetakAktaCerai.getTotalRecords()/10))%></div>
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
  }
   catch(Exception e){}
%>
