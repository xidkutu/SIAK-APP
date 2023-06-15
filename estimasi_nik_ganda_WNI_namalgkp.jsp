<%@ page import="java.util.*,java.rmi.*,java.sql.*,pendaftaran.*,estimasi.*,com.db.connection.*"%>
<%@ include file="Global.jsp"%>
<%
UserInfo1 record = null;
String date="";
Vector vParentData =null;
ServiceController factory=null;
NikGandaHome home=null;
NikGanda remote=null;
int numbering=1;
String nama_lgkp="",tmpt_lhr="",tgl_lhr="",nama_ibu="",nama_ayh="";
String hapus="";
%>
<%
try
 {
date=request.getParameter("date");
record=(UserInfo1)session.getAttribute("remoteRef");

  if (record!=null)
   {
 if (request.getParameter("hapus")!=null)
   {
     hapus=request.getParameter("hapus");
     if (NikGandaDeligate.deleteNik(record.getLevelId(),hapus))
           {
%>
      <script language="javascript">
       alert("<%=hapus%> sudah hapus!");
      </script>
<%
}
   }
  if (record.getLevelId().equals("1"))
  {
      Vector vData = new Vector();
      Connection conn=null;
      ConnectorDB connectorDb = new ConnectorDB();
      ResultSet rs = null;
      String query="";
      String tgl_qry="";
      String nik="", no_kk="", alamat="", no_prop="", no_kab="", no_kec="", no_kel="", nama_prop="",
                  nama_kab="", nama_kec="", nama_kel="", nama_pet_entri="", nip_pet_entri="",
                  tgl_entri="", gen_date="";
	 query=" SELECT to_char(nik) nik,to_char(a.no_kk) no_kk,getAlamat(a.no_kk) alamat ,nama_lgkp,tmpt_lhr,";
	 query=query+" tgl_lhr,nama_lgkp_ibu nama_ibu,nama_lgkp_ayah nama_ayh,no_prop,no_kab,no_kec,no_kel,";
	 query=query+" getnamaprop (a.no_prop) nama_prop, getnamakab (a.no_kab, a.no_prop) nama_kab,";
	 query=query+" getnamakec (a.no_kec, a.no_kab, a.no_prop) nama_kec,";
	 query=query+" getnamakel (a.no_kel, a.no_kec, a.no_kab, a.no_prop) nama_kel,";
	 query=query+" a.nama_pet_entri, a.nip_pet_entri, a.tgl_entri, SYSDATE gen_date";
	 query=query+" FROM biodata_wni a";
	 query=query+" where 3 is not null";
	 query=query+" and nik=any(";
	 query=query+" SELECT nik FROM biodata_wni a";
	 query=query+" where rowid <>ANY(SELECT ROWID FROM biodata_wni b";
	 query=query+" WHERE ";
	 query=query+" ( ";
	 query=query+" upper(a.nama_lgkp)=upper(b.nama_lgkp)";
	 query=query+" and upper(a.tmpt_lhr) = upper(b.tmpt_lhr)";
	 query=query+" and a.tgl_lhr=b.tgl_lhr";
         query=query+" and a.jenis_klmin = b.jenis_klmin";
         query=query+" and upper(a.nama_lgkp_ibu) = upper(b.nama_lgkp_ibu)";
	 query=query+" )";
	 query=query+" )";
	 query=query+" )";
	 query=query+ "order by nama_lgkp,tmpt_lhr,TGL_LHR,no_kk";
	 try
      {
        conn = connectorDb.getConnection();
        rs=conn.prepareStatement(query).executeQuery();
		 while(rs.next())
	        {
	          nik=rs.getString("nik");
	          no_kk=rs.getString("no_kk");
	          alamat=rs.getString("alamat");
	          nama_lgkp=rs.getString("nama_lgkp");
	          tmpt_lhr=rs.getString("tmpt_lhr");
	          tgl_lhr=rs.getString("tgl_lhr");
	          nama_ibu=rs.getString("nama_ibu");
	          nama_ayh=rs.getString("nama_ayh");
	          no_prop=rs.getString("no_prop");
	          no_kab=rs.getString("no_kab");
	          no_kec=rs.getString("no_kec");
	          no_kel=rs.getString("no_kel");
	          nama_prop=rs.getString("nama_prop");
	          nama_kab=rs.getString("nama_kab");
	          nama_kec=rs.getString("nama_kec");
	          nama_kel=rs.getString("nama_kel");
	          nama_pet_entri=rs.getString("nama_pet_entri");
	          nip_pet_entri=rs.getString("nip_pet_entri");
	          tgl_entri=rs.getString("tgl_entri");
	          gen_date=rs.getString("gen_date");
				NikGandaObject obj = new NikGandaObject(nik, no_kk, alamat, nama_lgkp, tmpt_lhr, tgl_lhr, nama_ibu,
				nama_ayh, no_prop, no_kab, no_kec, no_kel, nama_prop,
				nama_kab, nama_kec, nama_kel, nama_pet_entri, nip_pet_entri,
				tgl_entri, gen_date);
				vData.addElement(obj);
	         }
        rs.close();
        conn.close();
        rs = null;
        conn = null;
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
	System.out.println("Level 1");
	//String no_prop = "9999"; String no_kab = "9999";
	System.out.println(no_prop + " " + no_kab);
	vParentData=vData;//NikGandaDeligate.getDataWNI(no_prop,no_kab,date);
	System.out.println("Size Vector:"+vParentData.size());
  }
 else if (record.getLevelId().equals("3"))
  {
vParentData=NikGandaDeligate.getDataWNI(record.getNoProp(),record.getNoKab(),date);
  }
  else if (record.getLevelId().equals("4"))
{
vParentData=NikGandaDeligate.getDataWNI(record.getNoProp(),record.getNoKab(),record.getNoKec(),date);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<script language="javascript" src="scripts/trim.js">
</script>

<script language="javascript">
document.oncontextmenu=new Function("return false");
function printNikGanda(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar daftar Nik Ganda ini akan dicetak ?"))
          {
             window.print();
          }
    }
}

function setDates()
{
var dt="";
if (!isNaN(document.all['dd'].value)
   &&
   !isNaN(document.all['mm'].value)
   &&
   !isNaN(document.all['yy'].value)
   &&
   trim(document.all['dd'].value)!=""
   &&
   trim(document.all['mm'].value)!=""
    &&
   trim(document.all['yy'].value)!=""
)
{
dt=(document.all['dd'].value+"-"+document.all['mm'].value+"-"+document.all['yy'].value);
}
document.location="estimasi_nik_ganda_WNI_namalgkp.jsp?date="+dt
}

function hapus(nik)
{
var dt="";
if (confirm('Apakah akan hapus nik ' + nik + ' ini ?'))
 {
document.location="estimasi_nik_ganda_WNI_namalgkp.jsp?date="+dt+"&hapus=" + nik
 }
}
</script>


<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<table align="center">
  <tr align="center">
    <td align="center" >
      <div align="center"><b>
        <input class=boxstandard type=button  name="Cet" value="CETAK" onClick="printNikGanda(this)">
        </b></div>
    </td>
    <td>
      <div align="center"><b>
        <input class=boxstandard type=button value=KELUAR onClick="document.location='<%=record.getModRefFile()%>'" name="KEL">
        </b></div>
    </td>
  </tr>
</table>
<table width="500" border="0" cellspacing="3" cellpadding="2" align="center" height="135">
  <tr>
    <td colspan="4" height="1">
      <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
    </td>
  </tr>
  <tr>
    <td colspan="4" height="25">
      <div align="center" class="judul_utama">DAFTAR ESTIMASI NIK GANDA</div>
    </td>
  </tr>
  <tr>
    <td colspan="4" height="1">
      <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
    </td>
  </tr>
  <tr>
    <td  colspan="4">
      <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
        <tr>
          <td width="52%">
            <div align="right">Edisi Tanggal</div>
          </td>
          <td width="2%">:</td>
          <td width="46%">
            <input class=boxdefault size=2 name=dd maxlength="2">
            /
            <input class=boxdefault size=2 name=mm maxlength="2">
            /
            <input class=boxdefault size=4 name=yy maxlength="4">
          </td>
        </tr>
        <tr>
          <td colspan="3">
            <div align="center"><br>
              <input type="hidden" name="date" value="">
              <input class=boxstandard  type=button value=TAMPILKAN  onClick="setDates()" name="button">
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

   <%if (vParentData.size()>0)
        {
      %>

<table width="88%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>&nbsp; </td>
  </tr>
  <tr>
    <td valign="top">
      <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="100%">
        <tr>
          <td height="4"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
          <td height="4"><img src="images/dot.gif" width="1" height="1"></td>
          <td height="4"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td valign="middle" align="center">
            <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
              <tr>
                <td class="C-Fonts"  height="18" width="28">
                  <div align="center">No.&nbsp;</div>
                </td>
                <td class="C-Fonts"  height="18" width="95" nowrap>
                  <div align="center">NIK</div>
                </td>
                <td class="C-Fonts"  height="18" width="95" nowrap>
                  <div align="center">No.KK</div>
                </td>
                <td class="C-Fonts"  height="18" width="107" nowrap>
                  <div align="center">Nama Lengkap</div>
                </td>

                <td class="C-Fonts"  height="18" width="95" nowrap>
                  <div align="left">Alamat</div>
                </td>
		<td class="C-Fonts"  height="18" width="95" nowrap>
                  <div align="left">Nama Ibu</div>
                </td>
		<td class="C-Fonts"  height="18" width="95" nowrap>
                  <div align="left">Petugas Entry</div>
                </td>
                <td class="C-Fonts"  height="18" width="95" nowrap>
                  <div align="left">Tindakan</div>
                </td>
              </tr>
              <%
for(int i=0;i<vParentData.size();i++)
{
NikGandaObject obj = (NikGandaObject)vParentData.elementAt(i);
if (!nama_lgkp.trim().equals(obj.getNamaLgkp().trim()))
{
%>
              <%numbering++;
}%>
              <tr>
                 <td class="C-Field" height="36" width="28">
                  <div align="right"><%=numbering%></div>
                </td>
                <td class="C-Field" height="36" width="28">
                  <div align="right"><%=obj.getNik()%></div>
                </td>
                <td class="C-Field" height="36" width="28">
                  <div align="right"><%=obj.getNokk()%></div>
                </td>
                <td class="C-Field" height="36" width="28">
                  <div align="right"><%=obj.getNamaLgkp()%></div>
                </td>


                <td class="C-Field" colspan="1" height="36" align="left">
                  <%=obj.getAlamat()%><br>
                  <%="Nama Prop:"+obj.getNamaProp()%>,<%="Nama Kab:"+obj.getNamaKab()%>,<%="Nama Kec:"+obj.getNamaKec()%>,<%="Nama Kel:"+obj.getNamaKel()%>
                </td>
                <td class="C-Field" height="36" align="left"><b><%=obj.getNamaIbu()%></b></td>
                <td class="C-Field" height="36" align="left"><b><%=obj.getNamaPetEntri()+"/"+obj.getNipPetEntri()+","+DayFormatter.formatDate(obj.getTglEntri())%></b></td>
                <td class="C-Field" width="6" align="center">
                  <input class=boxstandard  type=button value=HAPUS name="<%=obj.getNik()%>" onClick="hapus(this.name)">
                </td>
              </tr>
              <%
nama_lgkp = obj.getNamaLgkp();
tmpt_lhr=obj.getTmptLhr();
tgl_lhr=obj.getTglLhr();
nama_ibu=obj.getNamaIbu();
nama_ayh=obj.getNamaAyah();
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
</BODY></HTML>
<%
   }
 else
  {
%>
           <%=printError("Data belum ada")%>
<%
  }
   }
else
  {
response.sendRedirect("index.jsp");
  }
}
   catch(Exception e){}

%>
