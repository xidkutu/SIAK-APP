<%@page import="com.db.connection.ServiceController,cetak.cerai.*,java.util.*,kutipan.akta.perceraian.*,pendaftaran.*"%>
<%@include file="Global.jsp"%>
<%!
    UserInfo1 record = null;
%>

<%
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
 {
%>
<%--
<%@include file="CommonOtorisasi.jsp"%>
<% String statusCetak = request.getParameter("radiobutton");
   System.out.println("statusCetak="+statusCetak);
   if ( (!authorized) && (statusCetak.equalsIgnoreCase("ULANG"))) {
         //otorisasi dialog?
         %>
         <script language="JavaScript">
            if (confirm("Anda belum diotorisasi untuk melakukan cetak ulang, Lakukan Otorisasi?")) {
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=kutipan_akta_perceraian.jsp";
              } else {
                self.close();
              }

         </script>
   <%
   } else {

   %>
--%>
<% {
  %>
<html>
<head>
<title>Kutipan Akta Peceraian</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
<link rel="stylesheet" href="Templates/cetak.css" type="text/css">
</head>
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printKutipan(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Kutipan Akta Perceraian ini akan dicetak ?"))
          {
             //obj.style.visibility='hidden';
             //document.form1.close.style.visibility='hidden';
                document.all['divtop'].style.visibility='hidden';
            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
	       document.all['divZoom'+i].style.left="0px";
               //document.all['divZoomi'+i].style.zoom="100%";
	       //document.all['divZoomi'+i].style.left="0px";
            }
            window.print();

            window.opener.location="cetak_akta_perceraian.jsp?update=okkutipan&radiobutton=Ulang&param_akta="+document.all["param_akta"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
            window.close();
        }
    }
}

function zoom(id)
{
    if(document.all[id].style.zoom=="50%")
    {
       document.all[id].style.zoom="100%";
       document.all[id].style.left="125px";
    }
    else
    {
       document.all[id].style.zoom="50%";
       document.all[id].style.left="300px";
    }
}
</script>
<body bgcolor="#FFFFFF" text="#000000" onload="window.history.forward(1)">
<%
       String nama_pej = request.getParameter("nama_pej");
       String nip_pej = request.getParameter("nip_pej");
       System.out.println("nama_pej= "+nama_pej);
       System.out.println("nip_pej= "+nip_pej);
       String nik_istri="";
      KutipanAktaCeraiObject aktaCeraiObj=null;

       String radiobutton = request.getParameter("radiobutton");
       String cb = request.getParameter("cb");

      String param_akta = "";

      StringTokenizer st1 = new StringTokenizer(cb, "^");
      String token = "", token2="";
      Vector vAkta = new Vector();
      String no_akta_cerai="",nama_istri="",nama_suami="", nama_negara="";

      int ct = 0;
      while (st1.hasMoreTokens())
      {
         token = st1.nextToken();
         StringTokenizer st2 = new StringTokenizer(token, "|");
         while(st2.hasMoreTokens())
         {
            token2 = st2.nextToken();
            if(ct==0)
            {
               no_akta_cerai = token2;
               System.out.println("no_akta_cerai= "+no_akta_cerai+" & ct= "+ct);
            }
            else if(ct==1)
            {
               nama_suami = token2;
               System.out.println("nama_suami= "+nama_suami+" & ct= "+ct);
            }
            else if(ct==2)
            {
               nama_istri = token2;
               System.out.println("nama_istri= "+nama_istri+" & ct= "+ct);
            }
            else if(ct==3)
            {
                nama_negara  = token2;
               System.out.println("nama_negara= "+nama_negara+" & ct= "+ct);
            }
            else if(ct==4)
            {
                nik_istri  = token2;
            }
            ct++;
         }
         aktaCeraiObj = new KutipanAktaCeraiObject(no_akta_cerai,nama_suami,nama_istri, nama_negara,nik_istri);
         vAkta.addElement(aktaCeraiObj);
         param_akta = param_akta +"|" +no_akta_cerai;
      }

      String nama_prop = request.getParameter("nama_prop");
      String nama_kab = request.getParameter("nama_kab");
      String jabatan = request.getParameter("jabatan");
%>
<form name="form1" method="post" action="">
<input type="hidden" name="param_akta" value="<%=param_akta%>">
<%
int totalPage = vAkta.size();
%>
<div id="divtop" style="position:absolute; width:203px; height:53px; z-index:1;top: 5px; visibility: visible">
<table width="100%" border="0" cellspacing="5" cellpadding="5">
<tr>
<td>
<div align="left">
<input class=boxstandard type="button" name="Print" value="Print" onclick="printKutipan(this);">
<input class=boxstandard type="button" name="close" value="Close" onclick="window.close();;">
<input type="hidden" name="totalpage" value=<%=totalPage%>>
</div></td></tr></table>
</div>
<%
KutipanAktaCerai view = null;
String tgl_ctk = "";
try
{
          ServiceController statelessController = ServiceController.getInstance();
          KutipanAktaCeraiHome home = (KutipanAktaCeraiHome)statelessController.lookup("KutipanAktaCeraiBean", KutipanAktaCeraiHome.class);
          view = home.create();
          Vector vData = view.retrieveData(vAkta);

for(int i =0;i<vData.size();i++)
{
    tgl_ctk = tgl_ctk+"|"+ ((KutipanAktaCeraiObject)vData.elementAt(i)).getTgl_ctk();
    KutipanAktaCeraiObject obj = (KutipanAktaCeraiObject)vData.elementAt(i);
%>
<!--Begin Kutipan Akta  Suami-->
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%;left:125px<%}else{%>zoom:50%;left:300px<%}%>; position:relative;left:125px;" onClick="zoom(this.id)">
<table width="732" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/dot.gif" width="1" height="14"></td>
  </tr>
  <tr>
    <td>
      <table width="735" cellspacing="0" cellpadding="0" border="0" height="1072">
        <tr>
          <td background="images/K_A_Perceraian_kcl.gif" valign="top">
            <table width="732%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/dot.gif" width="25" height="118"></td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td height="0" width="83">&nbsp;</td>
                          <td width="79" class="font_kutip_akta">Suami</td>
                          <td width="570"><span class="font_kutip_akta">:&nbsp;<%=obj.getNik().trim()%></span><img src="images/dot.gif" width="185" height="10"></td>
                    </tr>
					 <tr>
                          <td height="0" width="83">&nbsp;</td>
                          <td width="79" class="font_kutip_akta">Istri</td>
                          <td width="570"><span class="font_kutip_akta">:&nbsp;<%=((KutipanAktaCeraiObject)vAkta.elementAt(i)).getNikIstri().trim()%></span><img src="images/dot.gif" width="185" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td><img src="images/dot.gif" width="25" height="125"></td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="360"><img src="images/dot.gif" width="366" height="18"></td>
                      <td class="font_kutip_akta" valign="bottom" width="372"><b class="_font_kutipan_INDO"><%=obj.getNama_negara().toUpperCase()%></b></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td class="cetak"><img src="images/dot.gif" width="25" height="73"></td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="325"><img src="images/dot.gif" width="335" height="30"></td>
                      <td class="font_kutip_akta" valign="bottom"> <%=obj.getNo_akta_crai()%></td>
                      <td class="cetak" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="15"><img src="images/dot.gif" width="253" height="30"></td>
                      <td class="font_kutip_akta" valign="bottom"> <%=obj.getDasar_hkm_crai()%></td>
                      <td class="cetak" width="85"><img src="images/dot.gif" width="160" height="21"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="82"><img src="images/dot.gif" width="80" height="30"></td>
                          <td valign="bottom" class="font_kutip_akta" width="170"><%=initCap(nama_kab)%></td>
                      <td valign="bottom" class="font_kutip_akta" width="107"><img src="images/dot.gif" width="107" height="30"></td>
                          <td valign="bottom" class="font_kutip_akta" width="198"><%=obj.getTgl_entry_date()%>&nbsp;<%=obj.getTgl_entry_month()%></td>
                          <td valign="bottom" class="font_kutip_akta" width="87">&nbsp;</td>
                          <td valign="bottom" class="cetak" width="88"><img src="images/dot.gif" width="85" height="30"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="82"><img src="images/dot.gif" width="80" height="30"></td>
                          <td valign="bottom" class="font_kutip_akta" width="264"><%=obj.getTgl_entry_year()%></td>
                          <td valign="bottom" class="font_kutip_akta" width="170"><img src="images/dot.gif" width="175" height="30"></td>
                          <td valign="bottom" class="font_kutip_akta" width="121">&nbsp;&nbsp;&nbsp;&nbsp;<%=obj.getLbg_pngadil_kel_kep()%></td>
                          <td valign="bottom" class="cetak" width="92"><img src="images/dot.gif" width="85" height="30"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="80"><img src="images/dot.gif" width="80" height="29"></td>
                          <td valign="bottom" class="font_kutip_akta" width="240">
                            <%=initCap(nama_kab)%></td>
                          <td valign="bottom" width="53"><img src="images/dot.gif" width="54" height="19"></td>
                          <td valign="bottom" class="font_kutip_akta" width="259">
                            <%=obj.getNo_kep_pngadil()%></td>
                          <td valign="bottom" class="cetak" width="100"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                      <table width="732" border="0" cellspacing="0" cellpadding="0" height="28">
                        <tr>
                          <td height="29" width="82"> <img src="images/dot.gif" width="80" height="29"></td>
						  <td valign="bottom" class="font_kutip_akta" width="258" nowrap>
                            <%=obj.getTgl_srt_date()%>&nbsp;<%=initCap(obj.getTgl_srt_month())%>
                          </td>
                          <td valign="bottom" class="font_kutip_akta" width="34" height="29">&nbsp;</td>
                          <td valign="bottom" class="font_kutip_akta" width="269" height="29"><%=obj.getTgl_srt_year()%></td>
                          <td valign="bottom" class="cetak" width="89" height="29"><img src="images/dot.gif" width="85" height="28"></td>
                        </tr>
                      </table>
                </td>
              </tr>
              <tr>
                <td class="cetak">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="502"><img src="images/dot.gif" width="502" height="33"></td>
                      <td valign="bottom" width="143" class="cetak">&nbsp; </td>
                      <td valign="bottom" width="87"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="87"><img src="images/dot.gif" width="87" height="30"></td>
                      <td valign="bottom" width="558" class="cetak">
                        <div align="center" class="font_kutip_akta"><b><%=obj.getNama_suami().toUpperCase()%></b></div>
                      </td>
                      <td valign="bottom" width="87"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="87"><img src="images/dot.gif" width="87" height="12"></td>
                      <td valign="bottom" width="233" class="cetak">&nbsp; </td>
                      <td valign="bottom" width="61" class="cetak"><img src="images/dot.gif" width="61" height="24"></td>
                      <td valign="bottom" class="cetak" width="264">&nbsp; </td>
                      <td valign="bottom" width="87"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="87"><img src="images/dot.gif" width="87" height="24"></td>
                      <td valign="bottom" width="558" class="cetak">
                        <div align="center" class="font_kutip_akta"><b><%=obj.getNama_istri().toUpperCase()%></b></div>
                      </td>
                      <td valign="bottom" width="87"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="316"><img src="images/dot.gif" width="316" height="32"></td>
                      <td valign="bottom" width="329" class="font_kutip_akta">
                        <%=obj.getTmpt_ctt_kwn()%></td>
                      <td valign="bottom" width="87"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="260" height="34"><img src="images/dot.gif" width="260" height="30"></td>
                      <td valign="bottom" class="font_kutip_akta" width="166" height="34"><%=obj.getNo_akta_kwn()%></td>
                          <td valign="bottom" class="font_kutip_akta" width="86" height="34"><b></b></td>
                      <td valign="bottom" class="font_kutip_akta" width="133" height="34"><%=obj.getDay_kwn()%></td>
                      <td valign="bottom" class="cetak" width="87" height="34"><img src="images/dot.gif" width="85" height="20"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="78" height="24"><img src="images/dot.gif" width="80" height="29"></td>
                          <td valign="bottom" class="font_kutip_akta" width="88" height="24">
                            <%=initCap(obj.getMonth_kwn())%></td>
                          <td valign="bottom" class="font_kutip_akta" width="56" height="24">&nbsp;</td>
                          <td valign="bottom" class="font_kutip_akta" width="422" height="24"><%=obj.getYear_kwn()%></td>
                          <td valign="bottom" class="cetak" width="88" height="24"><img src="images/dot.gif" width="85" height="20"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90"><img src="images/dot.gif" width="512" height="34"></td>
                      <td valign="bottom" width="100%" class="font_kutip_akta">
                        <%=initCap(nama_kab)%></td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90"><img src="images/dot.gif" width="443" height="28"></td>
                      <td valign="bottom" width="100%" class="font_kutip_akta">
                        <%=((KutipanAktaCeraiObject)vData.elementAt(i)).getDay_ctk()%>&nbsp;<%=((KutipanAktaCeraiObject)vData.elementAt(i)).getMonth_ctk()%></td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="346"><img src="images/dot.gif" width="350" height="35"></td>
                          <td valign="bottom" width="301" class="font_kutip_akta">
                            <%=((KutipanAktaCeraiObject)vData.elementAt(i)).getYear_ctk()%></td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
			  		 <%
              String jab_new="";
              String str1="";
              String str2="";
              int wc=0;
             String tk1="",tk2="",tk3="";
              if (jabatan!=null && jabatan.startsWith("Kepala"))
                 jab_new=jabatan.trim().substring(0,6);
              else
                 jab_new=jabatan;

		StringTokenizer stkn=new StringTokenizer(getSplitString(jab_new),"|");
              %>

              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="405"><img src="images/dot.gif" width="405" height="29"></td>
                      <td valign="bottom" width="244" class="font_kutip_akta">
                         <%tk1=stkn.nextToken();%>
                          <%=tk1%>
                        </td>
                      <td valign="bottom" width="83"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90"><img src="images/dot.gif" width="350" height="29"></td>
                      <td valign="bottom" width="100%" class="font_kutip_akta">
                                                       <%
							try
							{
                                                         tk2=stkn.nextToken();
                                                         out.println(tk2);
                                                        }catch(Exception err)
							{
                                                            tk2="";
							}
            					   try
							{
                                                        tk3=stkn.nextToken();
							out.println(tk3);
                                                        }catch(Exception err1)
                        				{
                                                            tk3="";
							}

							%></td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table width="732" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="355" height="20">&nbsp;</td>
                <td valign="bottom" class="font_kutip_akta" width="292" height="20">&nbsp;</td>
                <td class="cetak" width="85" height="20">&nbsp;</td>
              </tr>
              <tr>
                <td width="355"><img src="images/dot.gif" width="353" height="24"></td>
                <td valign="bottom" class="font_kutip_akta" width="292">&nbsp;</td>
                <td class="cetak" width="85"><img src="images/dot.gif" width="80" height="20"></td>
              </tr>
            </table>
            <table width="732" border="0" cellspacing="0" cellpadding="0">
              <tr>
                    <td width="350"><img src="images/dot.gif" width="350" height="24"></td>
                    <td valign="bottom" class="font_kutip_akta" width="297"><u><%=nama_pej%>
                      </u><br>
                  NIP. <%=nip_pej%></td>
                <td class="cetak" width="85"><img src="images/dot.gif" width="85" height="20"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</div>
<!--End Kutipan Akta  Suami-->

<!--Kutipan akta istri masih belul-->
<%   }
     tgl_ctk = tgl_ctk.substring(1);
}
catch(Exception e)
{
    e.printStackTrace();
}
finally
{
    if(view!=null)
    {
        view.remove();
    }
}
%>
<input type="hidden" name="tgl_ctk" value="<%=tgl_ctk%>">
</form>
</body>
</html>
<%
}
 }
else
{
response.sendRedirect("index.jsp");
}
%>

