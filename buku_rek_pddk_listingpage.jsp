<%@page import="com.db.connection.ServiceController,java.util.Vector,buku.rekapitulasi.pddk.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>

<%!
ServiceController factory;
String Sys_Date;
UserInfo1 record = null;
BukuRekPddkHome home=null;
BukuRekPddk view = null;
%>
<%
try
   {
      record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
Sys_Date=record.getToday(); //request.getParameter("sysdate");

    String no_prop = (request.getParameter("nprop")==null?"0":request.getParameter("nprop"));
    String no_kab = (request.getParameter("nkab")==null?"0":request.getParameter("nkab"));
    String no_kec = (request.getParameter("nkec")==null?"0":request.getParameter("nkec"));
    String nama_prop = (request.getParameter("naprop")==null?"-":request.getParameter("naprop"));
    String nama_kab = (request.getParameter("nakab")==null?"-":request.getParameter("nakab"));
    String nama_kec = (request.getParameter("nakec")==null?"-":request.getParameter("nakec"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printPage(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Buku Induk Penduduk ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              zoomall();
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=18";
              window.close();
          }
    }
}
function zoom(id)
{
    if(document.all[id].style.zoom=="50%")
    {
       document.all[id].style.zoom="100%";
    }
    else
    {
       document.all[id].style.zoom="50%";
    }
}
</script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
  <table align="center">
           <tr align="center">

           <td align="center" >
                   <div align="center"><b>
             <input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printPage(this)">
                 </b></div>
           </td>
            <td>
                <div align="center"><b>
            <input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
              </b></div>
           </td>
           </tr>
  </table>

<table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">

      <div align="center"><span class="subtitle">Buku Rekapitulasi Penduduk</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4">

      <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
        <tr>
          <td width="40%">PROVINSI</td>
          <td width="2%">:</td>
          <td><%=nama_prop%></td>
        </tr>
        <tr>
          <td>KABUPTEN/KOTA</td>
          <td>:</td>
          <td><%=nama_kab%></td>
        </tr>
        <tr>
          <td>KECAMATAN</td>
          <td>:</td>
          <td><%=nama_kec%></td>
        </tr>
        <tr>
          <td>
            <div align="right">TANGGAL </div>
          </td>
          <td>:</td>
          <td><%=Sys_Date%></td>
        </tr>
      </table>
                            </td>
                          </tr>
    </table>

  <%
  Vector results=new Vector();
  int jmllaki=0, jmlperempuan=0, total=0;
  int tot_rec,sno,tot_page,start,end;
  int index=0;

  factory=ServiceController.getInstance();
  home = (BukuRekPddkHome)factory.lookup("BukuRekPddkBean", BukuRekPddkHome.class);
  view = home.create();
  results = view.getDataBukuPerkembanganPenduduk(no_prop,no_kab,no_kec);
System.out.println("results.size()" + results.size());
if(results.isEmpty())
  {
%>
<%=printError("Data Belum Ada")%>
<%
  }
 else
  {
   tot_rec=results.size();
   sno=1;
   start=0;
   end=24;
   tot_page=(int)Math.ceil((double)tot_rec/24);

   if (end>tot_rec) end=tot_rec;

%>
<input type="hidden" name="total_page" value="<%=tot_page%>">
<%
      for(int cntr=1;cntr<=tot_page;cntr++)
 	   	 {
%>
<div id="divZoom<%=cntr%>" style="<%if(tot_page==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative; top:1px; left:1px; page-break-after:always" onClick="zoom(this.id)">
<table border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="1000">
                    <tr>
                      <td height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
                          <tr>
                            <td class="C-Fonts" rowspan="5">
                              <div align="center">NO.&nbsp;</div>
                            </td>
                            <td class="C-Fonts" rowspan="5">
                              <div align="center"><span lang="EN-GB">Nama Desa</span></div>
                            </td>
                            <td class="C-Fonts" colspan="5">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Penduduk
                                Awal Pencatatan</span></div>
                            </td>
                            <td class="C-Fonts" colspan="8">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Pertambahan
                                Penduduk</span></div>
                            </td>
                            <td class="C-Fonts" colspan="8">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Pengurangan
                                Penduduk </span></div>
                            </td>
                            <td class="C-Fonts" colspan="5">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Penduduk
                                Sekarang</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" colspan="2" height="2">
                              <div align="center">WNI</div>
                            </td>
                            <td class="C-Fonts" colspan="2" height="2">
                              <div align="center">WNA</div>
                            </td>
                            <td class="C-Fonts" rowspan="4">
                              <div align="center">Jumlah</div>
                            </td>
                            <td class="C-Fonts" colspan="4" height="2">
                              <div align="center">Lahir</div>
                            </td>
                            <td class="C-Fonts" colspan="4" height="2">
                              <div align="center">Datang</div>
                            </td>
                            <td class="C-Fonts" colspan="4" height="2">
                              <div align="center">Mati</div>
                            </td>
                            <td class="C-Fonts" colspan="4" height="2">
                              <div align="center">Pindah</div>
                            </td>
                            <td class="C-Fonts" colspan="2" height="2">
                              <div align="center">WNI</div>
                            </td>
                            <td class="C-Fonts" colspan="2" height="2">
                              <div align="center">WNA</div>
                            </td>
                            <td class="C-Fonts" rowspan="4">
                              <div align="center">Jumlah</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNI</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNA</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNI</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNA</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNI</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNA</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNI</div>
                            </td>
                            <td class="C-Fonts" colspan="2" rowspan="2">
                              <div align="center">WNA</div>
                            </td>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" rowspan="3">
                              <div align="center">P</div>
                            </td>
                          </tr>
                          <tr> </tr>
                          <tr>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">L</div>
                            </td>
                            <td class="C-Fonts" height="2">
                              <div align="center">P</div>
                            </td>
                          </tr>
<%
int jmlpddksekarang = 0;
int wniawallaki=0,wniawalperempuan=0, wnaawallaki=0, wnaawalperempuan=0, jmlawalpencatatan=0;

     for(index=start; index<end; index++)
				{
BukuRekapPddkObject obj = (BukuRekapPddkObject)results.elementAt(index);

wniawallaki = Integer.parseInt(obj.getLakiwni().trim()) + Integer.parseInt(obj.getMatilakiwni().trim())
   + Integer.parseInt(obj.getPindahlakiwni().trim()) - Integer.parseInt(obj.getLahirlakiwni().trim()) - Integer.parseInt(obj.getDatanglakiwni());

      wniawalperempuan = Integer.parseInt(obj.getPeremwni().trim()) + Integer.parseInt(obj.getMatiperemwni().trim())
   + Integer.parseInt(obj.getPindahperemwni().trim()) - Integer.parseInt(obj.getLahirperemwni().trim()) - Integer.parseInt(obj.getDatangperemwni());


   wnaawallaki = Integer.parseInt(obj.getLakiwna().trim()) + Integer.parseInt(obj.getMatilakiwna().trim())
   + Integer.parseInt(obj.getPindahlakiwna().trim()) - Integer.parseInt(obj.getLahirlakiwna().trim()) - Integer.parseInt(obj.getDatanglakiwna());

   wnaawalperempuan = Integer.parseInt(obj.getPeremwna().trim()) + Integer.parseInt(obj.getMatiperemwna().trim())
   + Integer.parseInt(obj.getPindahperemwna().trim()) - Integer.parseInt(obj.getLahirperemwna().trim()) - Integer.parseInt(obj.getDatangperemwna());

   jmlawalpencatatan = wniawallaki+wniawalperempuan+wnaawallaki+wnaawalperempuan;

  %>

                          <tr>

                  <td class="C-Field"><div align="left"><%=sno%>.</div>
                  </td>
                            <td class="C-Field"><div align="left"><%=obj.getNama_kel()%>
                    </div>
                  </td>

                  <td class="C-Field">
                    <div align="left">
                    <%=wniawallaki%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=wniawalperempuan%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=wnaawallaki%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=wnaawalperempuan%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=jmlawalpencatatan%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getLahirlakiwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getLahirperemwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getLahirlakiwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getLahirperemwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getDatanglakiwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getDatangperemwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getDatanglakiwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getDatangperemwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getMatilakiwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getMatiperemwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getMatilakiwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getMatiperemwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getPindahlakiwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getPindahperemwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getPindahlakiwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getPindahperemwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getLakiwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getPeremwni()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getLakiwna()%></div></td>

                  <td class="C-Field">
                    <div align="left">
                    <%=obj.getPeremwna()%></div></td>
		<%
			jmlpddksekarang = Integer.parseInt(obj.getLakiwni().trim()) + Integer.parseInt(obj.getPeremwni().trim()) + Integer.parseInt(obj.getLakiwna().trim()) + Integer.parseInt(obj.getPeremwna().trim());
		%>
                  <td class="C-Field">
                    <div align="left">
                    <%=jmlpddksekarang%></div></td>
                          </tr>
<%
sno++;
	}
                                start=index;
                                if (start>=tot_rec) start=tot_rec;
                                end=end+24;
                                if (end>tot_rec) end=tot_rec;
%>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                <tr>
<td>
 <div align="center">
 <font  face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=cntr%></font>
 </div>
</td>
</tr>
</table>
</div>
     <%
       if (cntr<tot_page)
         {
       %>
     <p style="page-break-before:auto">&nbsp; </p>
     <%
         }
         %>
<%
 	   	 }
   }
    }
    else
   {
     response.sendRedirect("index.jsp");
   }
  }catch(Exception e)
   { e.printStackTrace();
     response.sendRedirect("index.jsp");
   }
  %>
<script language="javascript">
function zoomall()
{
    for (i=1;i<=document.all["total_page"].value;i++)
    {
      document.all['divZoom'+i].style.zoom="100%";
    }
  }
  </script>
</BODY>
</HTML>
