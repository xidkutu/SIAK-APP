<%@page import="com.db.connection.ServiceController,cetak.lahir.*,java.util.*,kutipan.lahir.*,pendaftaran.*"%>
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
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=kutipan_akta_kelahiran_WNI.jsp";
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
<title>Kutipan Akta Kelahiran WNI</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
<link rel="stylesheet" href="Templates/cetak.css" type="text/css">
</head>
<script language="javascript">
  //document.oncontextmenu=new Function("return false")
function printKutipan(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Kutipan Akta Kelahiran ini akan dicetak ?"))
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
            window.opener.location="cetak_akta_kelahiran_WNI.jsp?update=okkutipan&radiobutton=Ulang&param_akta="+document.all["param_akta"].value+"&tgl_ctk="+document.all["tgl_ctk"].value;
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

       String radiobutton = request.getParameter("radiobutton");
       String cb = request.getParameter("cb");

      String param_akta = "";

      StringTokenizer st1 = new StringTokenizer(cb, "^");
      String token = "", token2="";
      Vector vAkta = new Vector();

      CetakLahirObject cetakLahirObj = null;
      String no_akta_lahir = "", nama_ibu="", nama_ayah="", nama="", nama_negara="", tmpt_lhr="";
      String daylhr="",monthlhr="",yearlhr="", nik="", anak_ke_lahir="", jenis_klmin="";

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
                  no_akta_lahir = token2;
                  System.out.println("*no_akta_lahir= "+no_akta_lahir);
             }
             else if(ct==1)
             {
                  nik = token2;
             }
             else if(ct==2)
             {
                  nama = token2;
             }
             else if(ct==3)
             {
                  tmpt_lhr = token2;
             }
             else if(ct==4)
             {
                  nama_ibu = token2;
             }
             else if(ct==5)
             {
                  nama_ayah = token2;
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
                  nama_negara = token2;
             }
             else if(ct==10)
             {
                  anak_ke_lahir = token2;
             }
             else if(ct==11)
             {
                  jenis_klmin = token2;
             }

             ct++;
         }
             cetakLahirObj = new CetakLahirObject( no_akta_lahir,  nik,  nama,anak_ke_lahir,
                           nama_ibu,  nama_ayah, tmpt_lhr,
                           daylhr, monthlhr,
                           yearlhr, jenis_klmin,  nama_negara );

             vAkta.addElement(cetakLahirObj);
         param_akta = param_akta +"|" +no_akta_lahir;
      }

      String nama_prop = request.getParameter("nama_prop");
      String nama_kab = request.getParameter("nama_kab");
      String jabatan = request.getParameter("jabatan");

      System.out.println("JSP kutipan akta->nama_prop= "+nama_prop);
      System.out.println("JSP kutipan akta->nama_kab= "+nama_kab);
      System.out.println("JSP kutipan akta->jabatan= "+jabatan);
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
KutipanAktaLahirWNI view = null;
String tgl_ctk = "";
try
{

          ServiceController statefulController = ServiceController.getInstance();
          KutipanAktaLahirWNIHome home = (KutipanAktaLahirWNIHome)statefulController.lookup("KutipanAktaLahirWNIBean", KutipanAktaLahirWNIHome.class);
          view = home.create();
          Vector vData=null;
          vData=view.retrieveData(vAkta, nama_prop, nama_kab);

System.out.println("vData.size()->" + vData.size());

for(int i =0;i<vData.size();i++)
{
    int yearLhrLen = ((CetakLahirObject)vAkta.elementAt(i)).getYearlhr().length();
    System.out.println("**yearLhrLen= "+yearLhrLen);
    tgl_ctk = tgl_ctk + "|"+ ((KutipanLahirObject)vData.elementAt(i)).getTgl_ctk_ktakta();
%>

<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%;left:125px<%}else{%>zoom:50%;left:300px<%}%>;position:relative;width:736px;" onClick="zoom(this.id)">
    <table width="732" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/dot.gif" width="1" height="14"></td>
      </tr>
      <tr>
        <td>
          <table width="735" cellspacing="0" cellpadding="0" border="0" height="1072">
            <tr>
              <td background="images/K_A_Kelahiran_kcl.gif" valign="top">
                <table width="732%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="images/dot.gif" width="1" height="93"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="0" width="253"><img src="images/dot.gif" width="253" height="8"></td>
                          <td width="136" class="cetak"><span class="font_kutip_akta"><%=((CetakLahirObject)vAkta.elementAt(i)).getNik()%></span></td>
                          <td width="185"><img src="images/dot.gif" width="185" height="10"></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="font_kutip_akta"><img src="images/dot.gif" width="1" height="210"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="360"><img src="images/dot.gif" width="366" height="20"></td>
                          <td class="font_kutip_akta" valign="bottom" width="372"><b class="_font_kutipan_INDO"><%=((CetakLahirObject)vAkta.elementAt(i)).getNama_negara()%></b></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="cetak"><img src="images/dot.gif" width="1" height="135"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="319"><img src="images/dot.gif" width="322" height="10"></td>
                          <td class="font_kutip_akta" width="328"><%=((CetakLahirObject)vAkta.elementAt(i)).getNo_akta_lahir().trim()%></td>
                          <td class="font_kutip_akta" width="85"><img src="images/dot.gif" width="85" height="13"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td><img src="images/dot.gif" width="1" height="13"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="255"><img src="images/dot.gif" width="255" height="10"></td>
                          <td class="font_kutip_akta" width="393"><%=((KutipanLahirObject)vData.elementAt(i)).getDsrhk_cttlhr().trim()%></td>
                          <td class="font_kutip_akta" width="84"><img src="images/dot.gif" width="85" height="13"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="155"><img src="images/dot.gif" width="155" height="30"></td>
                          <td valign="bottom" width="210" class="font_kutip_akta"><%=initCap(tmpt_lhr)%></td>
                          <td valign="bottom" width="100"><img src="images/dot.gif" width="110" height="30"></td>
                          <td valign="bottom" class="font_kutip_akta"><%=((CetakLahirObject)vAkta.elementAt(i)).getDaylhr()%></td>
                          <td valign="bottom" class="cetak" width="85"><img src="images/dot.gif" width="85" height="30"></td>
                        </tr>
                      </table>

                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0" height="32">
                        <tr>
                          <td width="82"><img src="images/dot.gif" width="88" height="27"></td>
                          <td valign="bottom" width="86" class="font_kutip_akta"><%=((CetakLahirObject)vAkta.elementAt(i)).getMonthlhr()%></td>

                          <td valign="bottom" width="70"><img src="images/dot.gif" width="70" height="27"></td>
                          <td valign="bottom" class="font_kutip_akta" width="494"><%=((CetakLahirObject)vAkta.elementAt(i)).getYearlhr()%></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="90"><img src="images/dot.gif" width="90" height="29"></td>
                          <td valign="bottom" width="100%" class="cetak">
                            <div align="center" class="font_kutip_akta"><b><%=((CetakLahirObject)vAkta.elementAt(i)).getNama_lgkp().trim().toUpperCase()%></b></div>
                          </td>
                          <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="30"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="140"><img src="images/dot.gif" width="140" height="30"></td>
                          <td valign="bottom" width="100%" class="font_kutip_akta"><%=((CetakLahirObject)vAkta.elementAt(i)).getAnak_ke_lahir()%>,
<%=((CetakLahirObject)vAkta.elementAt(i)).getJenis_klmin()%> dari <%=((KutipanLahirObject)vData.elementAt(i)).getNamaIbu().toUpperCase()%>
<%nama_ayah=((((KutipanLahirObject)vData.elementAt(i)).getNamaAyah().toUpperCase().equals("-"))?"":" dan "+((KutipanLahirObject)vData.elementAt(i)).getNamaAyah().toUpperCase());%>
<%=nama_ayah%>
</td>
                          <td valign="bottom" width="85"><img src="images/dot.gif" width="85" height="30"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="cetak"><img src="images/dot.gif" width="1" height="90"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="513"><img src="images/dot.gif" width="515" height="28"></td>
                          <td valign="bottom" width="159" class="font_kutip_akta">di
                            <%=initCap(nama_kab)%></td>
                          <td valign="bottom" width="60"><img src="images/dot.gif" width="85" height="27"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="444"><img src="images/dot.gif" width="440" height="30"></td>
                          <td valign="bottom" width="228" class="font_kutip_akta"><%=((KutipanLahirObject)vData.elementAt(i)).getDay_ctk()%></td>
                          <td valign="bottom" width="60"><img src="images/dot.gif" width="85" height="30"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="354"><img src="images/dot.gif" width="353" height="30"></td>
                          <td valign="bottom" width="292" class="font_kutip_akta"><%=((KutipanLahirObject)vData.elementAt(i)).getMonth_ctk()%>&nbsp;<%=((KutipanLahirObject)vData.elementAt(i)).getYear_ctk()%></td>
                          <td valign="bottom" width="86"><img src="images/dot.gif" width="85" height="27"></td>
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
                    <td valign="top">
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="410"><img src="images/dot.gif" width="408" height="28"></td>
                          <td valign="bottom" width="100%" class="font_kutip_akta"><%=stkn.nextToken()%></td>
                          <td valign="bottom" width="80"><img src="images/dot.gif" width="85" height="27"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="732" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="352"><img src="images/dot.gif" width="353" height="31"></td>
                          <td valign="bottom" width="294" class="font_kutip_akta">
                            <%
							try
							{
							out.println(stkn.nextToken());
							}catch(Exception err)
							{
							}
							%>
                          </td>
                         <td valign="bottom" width="86"><img src="images/dot.gif" width="85" height="30"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                <table width="732" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="357"><img src="images/dot.gif" width="353" height="31"></td>
                    <td valign="bottom" width="289" class="cetak">&nbsp;</td>
                    <td valign="bottom" width="86"><img src="images/dot.gif" width="85" height="30"></td>
                  </tr>
                </table>
                <table width="732" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="357"><img src="images/dot.gif" width="353" height="31"></td>
                    <td valign="bottom" width="289" class="cetak">&nbsp;</td>
                    <td valign="bottom" width="86"><img src="images/dot.gif" width="85" height="30"></td>
                  </tr>
                </table>
                <table width="732" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="351"><img src="images/dot.gif" width="353" height="31"></td>
                    <td valign="bottom" width="295" class="cetak"><u><span class="font_kutip_akta"><%=nama_pej%></span></u><span class="font_kutip_akta"><br>
                      NIP. <%=nip_pej%></span></td>
                    <td valign="bottom" width="86"><img src="images/dot.gif" width="85" height="30"></td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
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
