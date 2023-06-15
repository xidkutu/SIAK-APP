<%@page import="com.db.connection.ServiceController,daftar.akta.kawin.*,java.util.*,kutipan.akta.kawin.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>
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
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=kutipan_akta_perkawinan.jsp";
              } else {
                self.close();
              }

         </script>
   <%
   } else {

   %>
--%>
<html>
<head>
<title>Kutipan Akta Perkawinan</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
<link rel="stylesheet" href="Templates/cetak.css" type="text/css">
</head>
<script language="javascript">
//  document.oncontextmenu=new Function("return false")
function printKutipan(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Kutipan Akta Perkawinan ini akan dicetak ?"))
          {
             //obj.style.visibility='hidden';
//             document.form1.close.style.visibility='hidden';
             document.all['divtop'].style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
	       document.all['divZoom'+i].style.left="1px";
               //document.all['divZoomi'+i].style.zoom="100%";
	       //document.all['divZoomi'+i].style.left="1px";

            }
            window.print();

            window.opener.location="cetak_akta_perkawinan.jsp?update=okkutipan&radiobutton=Ulang&param_akta="+document.all["param_akta"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
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
<%
       String nama_pej = request.getParameter("nama_pej");
       String nip_pej = request.getParameter("nip_pej");
       System.out.println("nama_pej= "+nama_pej);
       System.out.println("nip_pej= "+nip_pej);

       String radiobutton = request.getParameter("radiobutton");
      KutipanAktaKawinObject aktaKawinObj=null;

       String cb = request.getParameter("cb");

      String param_akta = "";

      StringTokenizer st1 = new StringTokenizer(cb, "^");
      String token = "", token2="";
      Vector vAkta = new Vector();
      String no_akta_kwn="",nama_istri="",nama_suami="", nama_negara="";
      int ct = 0;
      String nik_istri="";
      while (st1.hasMoreTokens())
      {
         token = st1.nextToken();
         StringTokenizer st2 = new StringTokenizer(token, "|");
       while(st2.hasMoreTokens())
         {
            token2 = st2.nextToken();
            if(ct==0)
            {
               no_akta_kwn = token2;
               System.out.println("no_akta_kwn= "+no_akta_kwn+" & ct= "+ct);
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
               nik_istri=token2;
System.out.println("nik_istri"+ nik_istri);
            }
            ct++;
         }

         aktaKawinObj = new KutipanAktaKawinObject(no_akta_kwn,nama_suami,nama_istri, nama_negara,nik_istri);
         vAkta.addElement(aktaKawinObj);
         param_akta = param_akta +"|" +no_akta_kwn;
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
      </div>
   </td>
</tr>
</table>
</div>
<%
KutipanAktaKawin view = null;
String tgl_ctk = "";
try
{

          ServiceController statelessController = ServiceController.getInstance();
          KutipanAktaKawinHome home = (KutipanAktaKawinHome)statelessController.lookup("KutipanAktaKawinBean", KutipanAktaKawinHome.class);
          view = home.create();
          Vector vData=null;
          vData=view.retrieveData(vAkta, nama_prop, nama_kab);

for(int i =0;i<vData.size();i++)
{
    tgl_ctk = tgl_ctk+"|"+ ((KutipanAktaKawinObject)vData.elementAt(i)).getTgl_ctk();
%>
<!--Begin Akta for Suami-->
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%;left:125px<%}else{%>zoom:50%;left:300px<%}%>; position:relative; top:0px; left:125px;" onClick="zoom(this.id)">
    <table width="732" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/dot.gif" width="1" height="14"></td>
      </tr>
      <tr>
        <td>
          <table width="735" cellspacing="0" cellpadding="0" border="0" height="1072">
            <tr>
              <td background="images/K_A_Perkawinan_kcl.gif" valign="top">
                <table width="732%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="images/dot.gif" width="1" height="118"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
						  <td height="0" width="88">
                          <td height="0" width="59" class="font_kutip_akta">Suami</td>
                          <td class="font_kutip_akta" width="585">:&nbsp;<%=((KutipanAktaKawinObject)vData.elementAt(i)).getNik().trim()%></td>
                        </tr>
						      <tr>
						  <td height="0" width="88">
                          <td height="0" width="59" class="font_kutip_akta">Istri</td>
                          <td class="font_kutip_akta" width="585">:&nbsp;<%=((KutipanAktaKawinObject)vAkta.elementAt(i)).getNikIstri().trim()%></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td><img src="images/dot.gif" width="1" height="142"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
<td width="370"><img src="images/dot.gif" width="370" height="20"></td>
<td  valign="bottom" width="362">
<font face="Book Antiqua" size="3px">
<b>
<%=((KutipanAktaKawinObject)vAkta.elementAt(i)).getNama_negara()%>
</b>
</font>
</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="cetak"><img src="images/dot.gif" width="1" height="76"></td>
                  </tr>
                  <tr>
                    <td valign="bottom">
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="325"><img src="images/dot.gif" width="340" height="10"></td>
                          <td class="cetak">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKawinObject)vAkta.elementAt(i)).getNo_akta_kwn()%></div>
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
                          <td width="190"><img src="images/dot.gif" width="250" height="10"></td>
                          <td class="cetak">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKawinObject)vData.elementAt(i)).getDsrhk_cttlhr()%></div>
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
                          <td width="150" height="28"><img src="images/dot.gif" width="150" height="31"></td>
                          <td valign="bottom" class="cetak" width="151" height="28">
                            <div align="left" class="font_kutip_akta"><%=initCap(nama_kab)%></div>
                          </td>
                          <td valign="bottom" width="94" height="28" class="font_kutip_akta">&nbsp;</td>
                          <td valign="bottom" class="cetak" width="252" height="28">
                            <div align="left" class="font_kutip_akta">&nbsp;&nbsp;<%=((KutipanAktaKawinObject)vData.elementAt(i)).getTgl_entry_date()%>&nbsp;<%=((KutipanAktaKawinObject)vData.elementAt(i)).getTgl_entry_month()%></div>
                          </td>
                          <td valign="bottom" class="cetak" width="85" height="28"><img src="images/dot.gif" width="85" height="10"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td valign="bottom">
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="84"><img src="images/dot.gif" width="87" height="28"></td>
                          <td valign="bottom" width="49" class="cetak">&nbsp;

                            </td>
                          <td valign="bottom" width="288" class="cetak">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKawinObject)vData.elementAt(i)).getTgl_entry_year()%> </div>
                          </td>
                          <td valign="bottom" width="311"><img src="images/dot.gif" width="310" height="30"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td valign="bottom">
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="90"><img src="images/dot.gif" width="87" height="30"></td>
                          <td valign="bottom" width="100%" class="cetak">
                            <div align="center" class="font_kutip_akta"><b><%=((KutipanAktaKawinObject)vAkta.elementAt(i)).getNama_suami().toUpperCase()%></b></div>
                          </td>
                          <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td valign="bottom">
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="90"><img src="images/dot.gif" width="87" height="52"></td>
                          <td valign="bottom" width="100%" class="cetak">
                            <div align="center" class="font_kutip_akta"><b><%=((KutipanAktaKawinObject)vAkta.elementAt(i)).getNama_istri().toUpperCase()%></b>
                            </div>
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
                          <td width="90"><img src="images/dot.gif" width="427" height="33"></td>
                          <td valign="bottom" width="100%" class="cetak">
                            <div align="left" class="font_kutip_akta">&nbsp;<%=((KutipanAktaKawinObject)vData.elementAt(i)).getTduk_agama()%></div>
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
                          <td width="90"><img src="images/dot.gif" width="182" height="30"></td>
                          <td valign="bottom" width="100%" class="cetak">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKawinObject)vData.elementAt(i)).getNama_pmka_agama()%></div>
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
                          <td width="90"><img src="images/dot.gif" width="180" height="30"></td>
                          <td valign="bottom" width="100%" class="cetak">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKawinObject)vData.elementAt(i)).getDaykwn()%>&nbsp;<%=((KutipanAktaKawinObject)vData.elementAt(i)).getMonthkwn()%></div>
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
                          <td width="90"><img src="images/dot.gif" width="137" height="30"></td>
                          <td valign="bottom" width="100%" class="cetak">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKawinObject)vData.elementAt(i)).getYearkwn()%> </div>
                          </td>
                          <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td valign="top"><img src="images/dot.gif" width="1" height="63">
                    </td>
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
                            <div align="left" class="font_kutip_akta">&nbsp;<%=((KutipanAktaKawinObject)vData.elementAt(i)).getDay_ctk()%>&nbsp;<%=((KutipanAktaKawinObject)vData.elementAt(i)).getMonth_ctk()%></div>
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
                          <td width="352"><img src="images/dot.gif" width="351" height="28"></td>
                          <td valign="bottom" width="295" class="cetak">
                            <div align="left" class="font_kutip_akta"><%=((KutipanAktaKawinObject)vData.elementAt(i)).getYear_ctk()%> </div>
                          </td>
                          <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
				 <%
              String jab_new="";
              int wc=0;
              if (jabatan!=null && jabatan.startsWith("Kepala"))
                 jab_new=jabatan.trim().substring(0,6);
              else
                 jab_new=jabatan;
String tk1="",tk2="",tk3="";
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
                                                          tk1=stkn.nextToken();
							%>
   							<%=tk1%>
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
<td width="90"><img src="images/dot.gif" width="352" height="30"></td>
<td valign="bottom" width="100%" class="cetak">
<div align="left" class="font_kutip_akta">
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
                    <td width="90"><img src="images/dot.gif" width="352" height="28"></td>
                    <td valign="bottom" width="100%" class="cetak">
                      <div align="left"></div>
                    </td>
                    <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                  </tr>
                </table>
                <table width="732" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="90"><img src="images/dot.gif" width="352" height="28"></td>
                    <td valign="bottom" width="100%" class="cetak">
                      <div align="left"></div>
                    </td>
                    <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                  </tr>
                </table>
                <table width="732" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="90"><img src="images/dot.gif" width="352" height="28"></td>
                    <td valign="bottom" width="100%" class="cetak">
                      <div align="left"><span class="font_kutip_akta"><u><%=nama_pej%></u></span><br>
                        <span class="font_kutip_akta">NIP. <%=nip_pej%></span></div>
                    </td>
                    <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="10"></td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
<!--End Akta for Suami-->
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
else
{
response.sendRedirect("index.jsp");
}
  }catch(Exception err)
{
}
%>
