<%@page import="com.db.connection.ServiceController,cetak.mati.*,java.util.*,kutipan.akta.mati.*,pendaftaran.*"%>
<%@include file="Global.jsp"%>
<%
try
{
   if (session.getAttribute("remoteRef")!=null)
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
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=kutipan_akta_kematian.jsp";
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
<title>Akta Kematian</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/cetak.css"  type="text/css">
<link rel="stylesheet" href="Templates/s.css"  type="text/css">
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printKutipan(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Kutipan Akta Kematian ini akan dicetak ?"))
          {
             //obj.style.visibility='hidden';
             //document.form1.close.style.visibility='hidden';
           document.all['divtop'].style.visibility='hidden';
            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
			   document.all['divZoom'+i].style.left="1px";
            }
            window.print();
            window.opener.location="cetak_akta_kematian.jsp?update=ok&radiobutton=Ulang&param_akta="+document.all["param_akta"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
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
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>
<%
       String nama_pej = request.getParameter("nama_pej");
       String nip_pej = request.getParameter("nip_pej");
       String kewarganegaraan = request.getParameter("kewarganegaraan");
       String radiobutton = request.getParameter("radiobutton");
       String cb = request.getParameter("cb");
       String param_akta = "";

      StringTokenizer st1 = new StringTokenizer(cb, "^");
      String token = "",token2="";
      Vector vAkta = new Vector();
      String no_akta_mati="",nik_jnsah="",nama="", nama_pelapor="", nama_negara="";
      String tmpt_lhr="", daylhr="", monthlhr="", yearlhr="", jenis_klmin="";

      while (st1.hasMoreTokens())
      {
         token = st1.nextToken();
         StringTokenizer st2 = new StringTokenizer(token, "|");
         int ct = 0;

         while(st2.hasMoreTokens())
         {
             token2 = st2.nextToken();
             if(ct==0)
             {
                  no_akta_mati = token2;
             }
             else if(ct==1)
             {
                  nik_jnsah = token2;
             }
             else if(ct==2)
             {
                  nama = token2;
             }
             else if(ct==3)
             {
                  nama_pelapor = token2;
             }
             else if(ct==4)
             {
                  nama_negara = token2;
             }
             else if(ct==5)
             {
                  tmpt_lhr = token2;
             }
             else if(ct==6)
             {
                  daylhr = token2;
             }
             else if(ct==7)
             {
                  monthlhr = token2;
             }
             else if(ct==8)
             {
                 yearlhr = token2;
             }
             else if(ct==9)
             {
                 jenis_klmin = token2;
             }
             ct++;
         }
         CetakMatiObject cetakMatiObj = new CetakMatiObject( no_akta_mati, nik_jnsah, nama,
                          nama_negara,
                          tmpt_lhr,  daylhr,  monthlhr,  yearlhr,  jenis_klmin,
                          nama_pelapor);

         vAkta.addElement(cetakMatiObj);
         param_akta = param_akta +"|" +no_akta_mati;
      }

      String nama_prop = request.getParameter("nama_prop");
      String nama_kab = request.getParameter("nama_kab");
      String jabatan = request.getParameter("jabatan");
%>
<body bgcolor="#FFFFFF" text="#000000" onload="window.history.forward(1)">
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
</div></td>
</tr>
</table>
</div>

<%
KutipanAktaKematian view = null;
String tgl_ctk = "";

try
{
          ServiceController statelessController = ServiceController.getInstance();
          KutipanAktaKematianHome home = (KutipanAktaKematianHome)statelessController.lookup("KutipanAktaKematianBean", KutipanAktaKematianHome.class);
          view = home.create();
          Vector vData=null;
          vData=view.retrieveData(vAkta, nama_prop, nama_kab);
for(int i =0;i<vData.size();i++)
{
    tgl_ctk = tgl_ctk + "|"+ ((KutipanAktaKematianObject)vData.elementAt(i)).getTgl_ctk_ktakta();
%>

<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%;left:125px<%}else{%>zoom:50%;left:300px<%}%>;position:relative;left:125px;width:751px;" onClick="zoom(this.id)">
    <table width="732" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/dot.gif" width="1" height="14"></td>
  </tr>
  <tr>
    <td>
      <table width="735" cellspacing="0" cellpadding="0" border="0" height="1072">
        <tr>
          <td background="images/K_A_Kematian_kcl.gif" valign="top">
            <table width="732%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/dot.gif" width="1" height="85"></td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="0" width="253"><img src="images/dot.gif" width="253" height="6"></td>
                      <td width="136" class="cetak"><span class="font_kutipan_akta_NIK"><%=((CetakMatiObject)vAkta.elementAt(i)).getNik_jnsah()%></span></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td><img src="images/dot.gif" width="55" height="200"></td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="360"><img src="images/dot.gif" width="360" height="20"></td>
                      <td class="font_kutip_akta" valign="bottom" width="372"><b class="_font_kutipan_INDO">&nbsp;&nbsp;<%=((CetakMatiObject)vAkta.elementAt(i)).getNama_negara().toUpperCase()%></b></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td class="cetak"><img src="images/dot.gif" width="55" height="77"></td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="325"><img src="images/dot.gif" width="335" height="10"></td>
                      <td class="cetak">
                        <div align="left" class="font_kutip_akta">
                        <%=((CetakMatiObject)vAkta.elementAt(i)).getNo_akta_mati()%></div>
                      </td>
                      <td class="cetak" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom"><img src="images/dot.gif" width="1" height="15"></td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="190"><img src="images/dot.gif" width="251" height="10"></td>
                      <td class="cetak">
                        <div align="left" class="font_kutip_akta"><%=((KutipanAktaKematianObject)vData.elementAt(i)).getDsrhk_cttlhr()%></div>
                      </td>
                      <td class="cetak" width="80"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="87"><img src="images/dot.gif" width="87" height="33"></td>
                          <td valign="bottom" class="cetak" width="235">
 <div align="left" class="font_kutip_akta"><!--initCap(nama_kab)-->
<%=initCap(((KutipanAktaKematianObject)vData.elementAt(i)).getTmptMati())%></div>
  </td>
                          <td valign="bottom" width="119"><img src="images/dot.gif" width="110" height="30"></td>
                          <td valign="bottom" class="cetak" width="206">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKematianObject)vData.elementAt(i)).getDaymati()%>
                        </div>
                      </td>
                      <td valign="bottom" class="cetak" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0" height="30">
                    <tr>
                      <td width="86" height="22"><img src="images/dot.gif" width="86" height="21"></td>
                      <td valign="bottom" width="93" class="font_kutip_akta" height="22"><%=((KutipanAktaKematianObject)vData.elementAt(i)).getMonthmati()%></td>
                          <td valign="bottom" height="22" width="56" class="font_kutip_akta">&nbsp;</td>
                      <td valign="bottom" class="font_kutip_akta" width="400" height="22"><%=((KutipanAktaKematianObject)vData.elementAt(i)).getYearmati()%></td>
                      <td valign="bottom" class="font_kutip_akta" height="22" width="85"><img src="images/dot.gif" width="85" height="21"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="87" height="23"></td>
                      <td valign="bottom" class="cetak" width="580" height="23">
                        <div align="center"></div>
                        </td>
                      <td valign="bottom" class="cetak" width="85" height="23"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="bottom">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90"><img src="images/dot.gif" width="87" height="36"></td>
                      <td valign="bottom" width="100%" class="cetak">
                        <div align="center" class="font_kutip_akta"><b><%=((CetakMatiObject)vAkta.elementAt(i)).getNama()%></b></div>
                      </td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td class="cetak">
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="137"><img src="images/dot.gif" width="138" height="25"></td>
                          <td valign="bottom" class="cetak" width="200">
                            <div align="left" class="font_kutip_akta"><%=initCap(((CetakMatiObject)vAkta.elementAt(i)).getTmpt_lhr())%></div>
                      </td>
                          <td valign="bottom" width="99"><img src="images/dot.gif" width="110" height="30"></td>
                          <td valign="bottom" class="cetak" width="211">
                            <div align="left" class="font_kutip_akta"><%=((CetakMatiObject)vAkta.elementAt(i)).getDaylhr()%></div>
                      </td>
                      <td valign="bottom" class="cetak" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="86" height="32"><img src="images/dot.gif" width="86" height="30"></td>
                          <td valign="bottom" width="245" class="font_kutip_akta" height="32"><%=((CetakMatiObject)vAkta.elementAt(i)).getMonthlhr()%></td>
                          <td valign="bottom" width="50" class="font_kutip_akta" height="32"><img src="images/dot.gif" width="50" height="30"></td>
					  <%
					  StringTokenizer tk=new StringTokenizer(getSplitString(((CetakMatiObject)vAkta.elementAt(i)).getYearlhr()),"|");
					  %>
                          <td valign="bottom" width="266" class="font_kutip_akta" height="32">&nbsp;&nbsp;&nbsp;
                            <%=tk.nextToken()%> </td>
                      <td valign="bottom" width="85" height="32"><img src="images/dot.gif" width="85" height="30"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="80"><img src="images/dot.gif" width="86" height="30"></td>
                      <td valign="bottom" class="font_kutip_akta">
					  <%
					  try
					  {
					  out.println(tk.nextToken());
					  }catch(Exception err)
					  {

					  }
					  %>
					  </td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="30"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td> <img src="images/dot.gif" width="90" height="83"></td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90"><img src="images/dot.gif" width="510" height="28"></td>
                      <td valign="bottom" width="100%" class="cetak">
                        <div align="left" class="font_kutip_akta">&nbsp;&nbsp;di <%=initCap(nama_kab)%></div>
                      </td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90"><img src="images/dot.gif" width="440" height="28"></td>
                      <td valign="bottom" width="100%" class="cetak">
                        <div align="left" class="font_kutip_akta"><%=((KutipanAktaKematianObject)vData.elementAt(i)).getDay_ctk()%>
                        </div>
                      </td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="90" height="30"><img src="images/dot.gif" width="356" height="28"></td>
                      <td valign="bottom" width="100%" class="cetak" height="30">
                        <div align="left" class="font_kutip_akta"><%=((KutipanAktaKematianObject)vData.elementAt(i)).getMonth_ctk()%>&nbsp;<%=((KutipanAktaKematianObject)vData.elementAt(i)).getYear_ctk()%>
						</div>
                      </td>
                      <td valign="bottom" width="85" height="30"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
			  <%
              String jab_new="";
              String str1="";
              String str2="";
              int wc=0;
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
                      <td width="90"><img src="images/dot.gif" width="403" height="28"></td>
                      <td valign="bottom" width="100%" class="cetak">
                        <div align="left" class="font_kutip_akta">
						<%
						try
						 {
						%>
						<%=stkn.nextToken()%>
						<%
						}catch(Exception ertkn)
						{
						}
						%>
						</div>
                      </td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="732" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                          <td width="354"><img src="images/dot.gif" width="356" height="30"></td>
                          <td valign="bottom" width="293" class="cetak">
                            <div align="left" class="font_kutip_akta">
					 <%
					  try
					  {
					  out.println(stkn.nextToken());
					  }catch(Exception err)
					  {

					  }
					  %>
							</div>
                      </td>
                      <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table width="732" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="357">&nbsp;</td>
                <td valign="bottom" class="font_kutip_akta" width="292">&nbsp;</td>
                <td class="cetak" width="85">&nbsp;</td>
              </tr>
              <tr>
                <td width="357"><img src="images/dot.gif" width="357" height="30"></td>
                <td valign="bottom" class="font_kutip_akta" width="292">&nbsp;</td>
                <td class="cetak" width="83"><img src="images/dot.gif" width="85" height="20"></td>
              </tr>
            </table>
            <table width="732" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="200"><img src="images/dot.gif" width="356" height="30"></td>
                <td valign="bottom" class="font_kutip_akta"><u class="font_kutip_akta"><%=nama_pej%> </u><br>
                  NIP. <%=nip_pej%></td>
                <td class="cetak" width="81"><img src="images/dot.gif" width="85" height="20"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</div>
<%
}
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
  }catch(Exception err)
{
}
%>
