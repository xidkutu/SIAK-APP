<%@page import="com.db.connection.ServiceController,java.util.Vector,daftar.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,manage.UserRepository"%>
<%!
    UserInfo1 record=null;
%>

<%
     record = (UserInfo1)session.getAttribute("remoteRef");
if(record != null)
{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<script language="javascript">
document.oncontextmenu=new Function("return false");
function printPengguna(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Daftar Administrasi Pengguna ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              //document.all['divZoom'].style.zoom="50%";
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=9&security_option=yes";
              window.close();
          }
    }
}

function changeStatus(stat,user_id)
{
var userstatus="";
if(stat=='Y')
{
userstatus = "Non-Aktif-kan";
}
else
{
userstatus ="Aktif-kan";
}
          if (confirm("Apakah benar Pengguna yang bernama "+user_id+" akan di "+userstatus+" ?"))
          {
      document.daftaradm.activation.value=userstatus;
      document.daftaradm.action="daftar_adm_pengguna_listing.jsp?status="+stat+"&user_id="+user_id+"&nprop="+document.all['nprop'].value+"&nkab="+document.all['nkab'].value+"&nkec="+document.all['nkec'].value+"&sysdate="+document.all['sysdate'].value+"&naprop="+document.all['naprop'].value+"&nakab="+document.all['nakab'].value+"&nakec="+document.all['nakec'].value;
      document.daftaradm.submit();
          }
}
function delUser(user_id)
{
          if (confirm("Apakah benar Pengguna yang bernama "+user_id+" akan dihapus ?"))
          {
      document.daftaradm.action="daftar_adm_pengguna_listing.jsp?user_id="+user_id+"&hapus=ok&nprop="+document.all['nprop'].value+"&nkab="+document.all['nkab'].value+"&nkec="+document.all['nkec'].value+"&sysdate="+document.all['sysdate'].value+"&naprop="+document.all['naprop'].value+"&nakab="+document.all['nakab'].value+"&nakec="+document.all['nakec'].value;
      document.daftaradm.submit();
          }
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<form name=daftaradm method="post" action="">
<table align="center">
<tr align="center"><td align="center" >
                                  <div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printPengguna(this)">
                                    </b></div>
                                </td>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
                                    </b></div>
                                </td>
</tr>
</table>
<p>&nbsp;</p>
<%
   String naprop = request.getParameter("naprop");
   if(naprop==null || naprop.trim().startsWith("--"))
   {
      naprop = "";
   }

   String nakab = request.getParameter("nakab");
   if(nakab==null || nakab.trim().startsWith("--"))
   {
      nakab = "";
   }

   String nakec = request.getParameter("nakec");
   if(nakec==null || nakec.trim().startsWith("--"))
   {
      nakec = "";
   }
   String nprop = request.getParameter("nprop");
   String nkab = request.getParameter("nkab");
   String nkec = request.getParameter("nkec");
   String sysdate = record.getToday(); //request.getParameter("sysdate");

%>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="100%">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="152">
            <table width="100%" border="0" cellspacing="3" cellpadding="0" align="center">
              <tr>
                <td height="1">
                  <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                </td>
              </tr>
<input type="hidden" name="nprop" value="<%=nprop%>">
<input type="hidden" name="nkab" value="<%=nkab%>">
<input type="hidden" name="nkec" value="<%=nkec%>">
<input type="hidden" name="sysdate" value="<%=sysdate%>">
<input type="hidden" name="naprop" value="<%=naprop%>">
<input type="hidden" name="nakab" value="<%=nakab%>">
<input type="hidden" name="nakec" value="<%=nakec%>">
              <tr>
                <td height="25">
                  <div align="center" class="subtitle">DAFTAR ADMINISTRASI PENGGUNA/USER</div>
                </td>
              </tr>
              <tr>
                <td height="1">
                  <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                </td>
              </tr>
              <tr>
                <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
              </tr>
              <tr>
                <td>
                  <table width="444" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td width="167">Provinsi</td>
                      <td width="14"> :</td>
                      <td><%=naprop%></td>
                    </tr>
                    <tr>
                      <td width="167">Kabupaten/Kota </td>
                      <td width="14"> :</td>
                      <td><%=nakab%></td>
                    </tr>
                    <tr>
                      <td width="167">Kecamatan </td>
                      <td width="14"> :</td>
                      <td><%=nakec%></td>
                    </tr>
                    <tr>
                      <td width="167">
                        <div align="right">Edisi Tanggal</div>
                      </td>
                      <td width="14">:</td>
                      <td><%=sysdate%></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
              </tr>
              <tr valign="bottom">
                <td height="45" valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="100%">
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
                            <td class="C-Fonts" width="25">
                              <div align="center">No.&nbsp;</div>
                            </td>
                            <td class="C-Fonts" width="41">
                              <div align="center">Status</div>
                            </td>
                            <td class="C-Fonts" width="105">
                              <div align="center" nowrap>Nama Pengguna</div>
                            </td>
                            <td class="C-Fonts" width="64">
                              <div align="center" nowrap>Nama Lengkap</div>
                            </td>
                            <td class="C-Fonts" width="23">
                              <div align="center" nowrap><span lang="EN-GB">NIP</span></div>
                            </td>
                            <td class="C-Fonts" width="61">
                              <div align="center" nowrap>Tempat/ Tanggal Lahir</div>
                            </td>
                            <td class="C-Fonts" width="52">
                              <div align="center" nowrap>Jenis Kelamin</div>
                            </td>
                            <td class="C-Fonts" width="65">
                              <div align="center" nowrap><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Pangkat/
                                Golongan </span><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt"></span></div>
                            </td>
                            <td class="C-Fonts" width="52">
                              <div align="center" nowrap>Jabatan</div>
                            </td>
                            <td class="C-Fonts" width="52">
                              <div align="center" nowrap>Nama Kantor</div>
                            </td>
                            <td class="C-Fonts" width="137" nowrap>Alamat Kantor<br>
                              - Telepon</td>
                            <td class="C-Fonts" colspan="3">
                              <div align="center">Action</div>
                            </td>
                          </tr>
<%
Pengguna view = null;
Vector vData = new Vector();

String status = request.getParameter("status");
String user_id = request.getParameter("user_id");
String hapus = request.getParameter("hapus");
boolean isUpdated = false;

try
{
         ServiceController statelessController = ServiceController.getInstance();
         PenggunaHome home = (PenggunaHome)statelessController.lookup("PenggunaBean", PenggunaHome.class);

         view = home.create();

         if( (status!=null&&!status.trim().equals("")) && (user_id!=null&&!user_id.trim().equals("")) )
         {
            isUpdated = view.changeStatus(user_id, status);
             System.out.println("hasil rubah status: "+isUpdated);
         }
         if( (user_id!=null&&!user_id.trim().equals("")) && (hapus!=null&&hapus.trim().equals("ok")) )
         {
              isUpdated = view.deleteDataAdministrasiPengguna(user_id);
              System.out.println("hasil hapus user: "+isUpdated);
         }

if(request.getParameter("reset_parm")!=null)
         {
           String reset_parm = request.getParameter("reset_parm");
         }
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
if(request.getParameter("reset_parm")!=null)
{
           try{
           UserRepository.destroyUser(user_id,false);
           }catch(Exception err){
              err.printStackTrace();
               }
}
   vData = view.getDataAdministrasiPengguna(nprop, nkab, nkec);
   view.remove();
}

int numbering = 1;

for(int i=0;i<vData.size();i++)
{
PenggunaObject obj = (PenggunaObject)vData.elementAt(i);
%>

                          <tr>
                            <td class="C-Field" width="25">
                              <div align="right"><%=numbering%>.</div>
                            </td>
                            <td class="C-Field" width="41">
                              <div align="center">
                              <img src="<%if(obj.getStatus()!=null && obj.getStatus().trim().equalsIgnoreCase("Y")){%>images/green20.gif<%}else{%>images/red20.gif<%}%>" width="15" height="15">
                              <!--img src="images/green20.gif" width="15" height="15"-->
                              </div>
                            </td>
                            <td class="C-Field" width="105">
                              <div align="left" nowrap><%=obj.getNama_pengguna()%></div>
                            </td>
                            <td class="C-Field" width="64" nowrap><%=obj.getNama_lengkap()%>&nbsp;</td>
                            <td class="C-Field" width="23" nowrap><%=obj.getNip()%>&nbsp;</td>
                            <td class="C-Field" width="61" nowrap><%=obj.getTmpt_tgl()%>&nbsp;</td>
                            <td class="C-Field" width="52" nowrap><%=obj.getJenis_klmin()%>&nbsp;</td>
                            <td class="C-Field" width="65">
                              <div align="center" nowrap><%=obj.getGolongan()%></div>
                            </td>
                            <td class="C-Field" width="52" nowrap><%=obj.getJabatan()%>&nbsp;</td>
                            <td class="C-Field" width="52" nowrap><%=obj.getNama_kantor()%>&nbsp;</td>
                            <td class="C-Field" width="137" nowrap><%=obj.getAlamat_telp()%>&nbsp; </td>
                            <%if (record.getLevelId().equals("1"))
                                  {
                           %>
                            <td class="C-Field" width="49">
                              <div align="center" nowrap> <b>
                                <input class=boxstandard type=button <%if(obj.getStatus()!=null && obj.getStatus().trim().equals("Y")){%>value=Aktif<%}else{%>value=Non-Aktif<%}%> onclick="changeStatus('<%=obj.getStatus()%>','<%=obj.getNama_pengguna()%>')" name="activation">
                                </b></div>
                            </td>
                                  <%}%>
                              <td class="C-Field" width="77">
                              <div align="center" nowrap> <b>
                                <input class=boxstandard type=button value=Reset onclick="document.location='daftar_adm_pengguna_listing.jsp?reset_parm=resetok&user_id=<%=obj.getNama_pengguna()%>&nprop=<%=nprop%>&nkab=<%=nkab%>&nkec=<%=nkec%>&sysdate=<%=sysdate%>&naprop=<%=naprop%>&nakab=<%=nakab%>&nakec=<%=nakec%>'" name="reset" <%if( UserRepository.getUserStatus(obj.getNama_pengguna()).equals("0") ){%>disabled<%}%>>
                                </b></div>
                            </td>
                                <%if (record.getLevelId().equals("1"))
                                  {
                           %>
                            <td class="C-Field" width="88">
                              <div align="center" nowrap><b>
                                <input class=boxstandard type=button value=Hapus  onclick="delUser('<%=obj.getNama_pengguna()%>')"  name="hapus">
                                </b>
                              </div>
                            </td>
                                <%}%>
                          </tr>
<%numbering++;
}%>
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
                </td>
              </tr>
            </table>

          </td>
        </tr>
        <tr>
          <td valign="top">&nbsp; </td>
        </tr>
      </table>

    </td>
  </tr>
</table>
</form>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
%>
