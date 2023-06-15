<%@page import="pendaftaran.UserInfo1,jmlpddk.agama.InfoWilayah"%>
<%@page import="javax.xml.parsers.*"%>
<%@page import="javax.xml.parsers.*"%>
<%@page import="java.io.*"%>
<%@page import="org.xml.sax.*"%>
<%@page import="org.w3c.dom.*"%>
<%@page import="java.util.*"%>
<%@page import="jmlpddk.agama.*"%>
<%@page import="kartukeluarga.DataKelurahan"%>
<%@page import="com.pkrjn.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.io.*"%>

<%!
 final int TIDAKADA = 0;
    final int ADAEXIST = 1;
    final int ADANOTEXIST = 2;
public Vector vProp,vKab,vKec,vKel;
public String no_prop="",no_kab="",no_kec="",no_kel="";
public String nama_prop="",nama_kab="", nama_kec="", nama_kel="";
public String naprop="",nprop="",nkab="",nakab="",nkec="",nakec="",nkel="",nakel="";
public String prop_dis="",kab_dis="",kec_dis="",kel_dis="";
public String base=null;
//public String base="c:\\bea\\logs\\siaklog\\";
%>

<%
vProp=null;vKab=null;vKec=null;vKel=null;
no_prop="";no_kab="";no_kec="";no_kel="";
nama_prop="";nama_kab="";nama_kec=""; nama_kel="";
naprop="";nprop="";nkab="";nakab="";nkec="";nakec="";nkel="";nakel="";
prop_dis="";kab_dis="";kec_dis="";kel_dis="";
%>

<%!

public String getBase()
{
try{
ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
 return res.getString("LOG_PATH");
}catch(Exception err)
     {
return null;
     }
}


public String initCap(String str)
{
str=str.toLowerCase();
char ch=' ';
boolean start=false;
String newstr="";
for(int i=0;i<str.length();i++)
  {
    ch=str.charAt(i);

            if (start) {
              ch=Character.toUpperCase(ch);
            }
          newstr=newstr+String.valueOf(ch);
    if (ch==' ')     start=true;   else       start=false;

  }
return (newstr.substring(0,1).toUpperCase().trim()+newstr.substring(1).trim());
}

public String setLiner(int tot_width,int cur_len,int denom)
 {
int top_len=62;
int width=0;
width=100-(tot_width+cur_len);
if (width<top_len) width=width+(top_len-width);
if (cur_len<20) width=width+(20-cur_len)+11;
String lines="";
 for(int i=1;i<=(width+denom);i++) lines=lines+"-";
     return lines;
}

public String getKabupaten(String strkab)
{
String kab="";
if ((strkab!=null) && (!strkab.trim().equals("")))
  {
if (!strkab.trim().toUpperCase().startsWith("KOTA")) kab="Kabupaten " + strkab.trim();
else kab="Kota " + strkab.toUpperCase().substring(4,strkab.length());
 }
return kab;
}

public void setSecureWilayah(int user_level, UserInfo1 rec)
{
 switch(user_level)
 {
      case 2:
        nprop = rec.getNoProp();
        naprop = rec.getNamaProp();
        prop_dis="disabled";
        kab_dis="";
        kec_dis="";
        kel_dis="";
        break;
       case 3:
         nprop = rec.getNoProp();
         naprop = rec.getNamaProp();
         nkab=rec.getNoKab();
         nakab=rec.getNamaKab();
         prop_dis="disabled";
         kab_dis="disabled";
        break;
     case 4:
         nprop = rec.getNoProp();
         naprop = rec.getNamaProp();
         nkab=rec.getNoKab();
         nakab=rec.getNamaKab();
         nkec=rec.getNoKec();
         nakec=rec.getNamaKec();
         prop_dis="disabled";
         kab_dis="disabled";
         kec_dis="disabled";
         break;
  default:
         prop_dis="";
         kab_dis="";
         kec_dis="";
  }
}

private Vector getWilayahList(String path, String noProp, String noKab, String noKec, int classType) {
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    Vector list = new Vector();
    base=getBase();
   try {
      DocumentBuilder db = dbf.newDocumentBuilder();
      path = base + path;

   try {
        Document doc = db.parse(path);
        NodeList rows = doc.getElementsByTagName("row");

        int count = rows.getLength();
        for (int i=0; i<count; i++) {
          String no = rows.item(i).getChildNodes().item(1).getChildNodes().item(0).getNodeValue();
          String nama = rows.item(i).getChildNodes().item(3).getChildNodes().item(0).getNodeValue();
          Object obj = null;
          if (classType==1) {
             obj = new ListProp(no, nama, String.valueOf(count));
          } else if (classType==2) {
             obj = new ListKab(no, nama, noProp, String.valueOf(count));
          } else if (classType==3) {
             obj = new ListKec(no, nama, noKab, noProp, String.valueOf(count));
          } else if (classType==4) {
             obj = new ListKel(no, nama, noKec, noKab, noProp);
          }else if (classType==5) {

             String jabatan = rows.item(i).getChildNodes().item(11).getChildNodes().item(0).getNodeValue();
             String namaLur = rows.item(i).getChildNodes().item(13).getChildNodes().item(0).getNodeValue();
             String nipLur = rows.item(i).getChildNodes().item(15).getChildNodes().item(0).getNodeValue();
             obj = new DataKelurahan(no, nama, jabatan, namaLur, nipLur);
          }

          if (obj!=null)
            list.addElement(obj);
        }
      }
      catch (IOException ex) {
        ex.printStackTrace();
        return null;
      }
      catch (SAXException ex) {
        ex.printStackTrace();
        return null;
      }
    }
    catch (ParserConfigurationException ex) {
      ex.printStackTrace();
      return null;
    }

    return list;
  }

public Vector getPkrjn()
{
  return getPkrjnList("pkrjn.xml");
}

private Vector getPkrjnList(String path) {
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    Vector list = new Vector();
base=getBase();
   try {
      DocumentBuilder db = dbf.newDocumentBuilder();
      path = base + path;
      try {
        Document doc = db.parse(path);
        NodeList rows = doc.getElementsByTagName("row");
        int count = rows.getLength();

        for (int i=0; i<count; i++) {
          String no = rows.item(i).getChildNodes().item(1).getChildNodes().item(0).getNodeValue();
          String nama = rows.item(i).getChildNodes().item(3).getChildNodes().item(0).getNodeValue();
          Object obj = null;
                obj = new Pkrjn(no, nama);
          if (obj!=null)
            list.addElement(obj);
        }
      }
      catch (IOException ex) {
        ex.printStackTrace();
        return null;
      }
      catch (SAXException ex) {
        ex.printStackTrace();
        return null;
      }
    }
    catch (ParserConfigurationException ex) {
      ex.printStackTrace();
      return null;
    }
    return list;
 }

public Vector getPropinsiList() {
   String path = "setup_prop.xml";
   return getWilayahList(path, null, null, null, 1);
  }

  public Vector getKabupatenList(String noProp) {
   String path = "p"+noProp+".xml";
   return getWilayahList(path, noProp, null, null, 2);
  }

  public Vector getKecamatanList(String noProp, String noKab) {
   String path = "kb"+noProp+noKab+".xml";
   return getWilayahList(path, noProp, noKab, null, 3);
  }

public Vector getKelurahanList(String noProp, String noKab, String noKec) {
   String path = "kc"+noProp+noKab+noKec+".xml";
   return getWilayahList(path, noProp, noKab, noKec, 4);
  }

public Vector getDataKelurahan(String noProp, String noKab, String noKec) {
   String path = "kc"+noProp+noKab+noKec+".xml";
   return getWilayahList(path, noProp, noKab, noKec, 5);
  }

public String printError(String msg, String align)
{
String msgstr="<table border='0' cellspacing='0' cellpadding='0' align='"+align+"'>";
//System.out.println("msgstr="+msgstr);
msgstr=msgstr+"<tr>";
msgstr=msgstr+"<td width='13%'>";
msgstr=msgstr+"<div align='right'><img src='images/nondynamic_restart.gif' width='16' height='16'></div>";
msgstr=msgstr+"</td>";
msgstr=msgstr+"<td width='87%' nowrap><font face='Verdana, Arial, Helvetica, sans-serif' size='2' color='#FF0000'><b><font size='1'>";
msgstr=msgstr+"&nbsp;&nbsp;<font color='#FF0000'>&nbsp;" + msg;
msgstr=msgstr+"</font></font></b></font></td> </tr></table>";
return msgstr;
}

public String printError(String msg)
{
return printError(msg, "center");
}

public String printInfo(String msg)
{
String msgstr="<table border='0' cellspacing='0' cellpadding='0' align='center'>";
msgstr=msgstr+"<tr>";
msgstr=msgstr+"<td width='13%'>";
msgstr=msgstr+"<div align='right'><img src='images/info.gif'></div>";
msgstr=msgstr+"</td>";
msgstr=msgstr+"<td width='87%' nowrap><font face='Verdana, Arial, Helvetica, sans-serif' size='3' color='#FF0000'><b><font size='2'>";
msgstr=msgstr+"&nbsp;&nbsp;<font color='#FF0000'>&nbsp;" + msg;
msgstr=msgstr+"</font></font></b></font></td> </tr></table>";
return msgstr;
}

public String errMsg(String errcode,String addmsg)
{
String msg="";
 switch(Integer.parseInt(errcode))
   {
        case 1:
          msg="Nomor KK &nbsp;"+ addmsg + "&nbsp; Belum Ada Anggota/Belum terdaftar!";
         break;
         case 2:
          msg="Nama Pengguna/Kata Kunci salah!";
          break;
        case 3:
          msg="Pengguna Belum di Autorisasi!";
          break;
        case 4:
          msg="Pengguna sedang tidak Aktif!";
          break;
        case 5:
          msg="Pengguna sudah Login!";
         break;
        case 6:
          msg="Nomor KK Lama/Ditempati salah. Periksa kembali!";
         break;
        case 7:
          msg="Pin/Authorisation Key Anda Salah!";
         break;
        case 8:
          msg="Nomor KK " + addmsg + " Salah/Tidak Tersimpan.Silakan coba lagi!";
         break;
       case 9:
          msg="Nomor KK " + addmsg + " Belum terdaftar!";
         break;
       case 10:
  }
return msg;
}

 public void removeCetakUlangAttribute(HttpSession session) {
      session.removeAttribute("remoteSupv");
      session.removeAttribute("remoteOto");
      session.removeAttribute("authKey4CetakUlang");
      session.removeAttribute("pinAuthSupv");
      session.removeAttribute("authkeyAuthSupv");
      session.removeAttribute("file");
      System.out.println("remove "+session.getAttribute("authDate"));
      session.removeAttribute("authDate");
    }

public String getSplitString(String orignal)
{
String str1="";
String str2="";
int wc=0;

StringTokenizer tkn=new StringTokenizer(orignal+""," ");
while(tkn.hasMoreTokens())
{
if (wc<=2)
{
str1=str1+" "+ tkn.nextToken();
}
else
str2=str2+" "+tkn.nextToken();
wc++;
}
return (str1 + "|" + str2);
}

private String eventList(int number)
{
String str="";
switch(number)
{
case 1:
       str="onchange='checkpkrjn(pddk_akh.selectedIndex,jenis_pkrjn.selectedIndex);' onKeyDown='setKey(event,this)'";
break;
}
return str;
}

public String genComboPkrjn(String cb_name,int evt)
{
String str="";
str="<select name=" + cb_name + " class='boxdefault'>";
str=str+"<option value='0'>-- Pilih Jenis Pekerjaan --</option></select>";
return str;
}
//Added 25 mei 2004 Darmawi

public int convertAgamaStringToIndex(String agama) {
   int agamaIdx = 0;
   System.out.println("agama to convert= "+agama);
   if (agama!=null && !"0".equals(agama)) {
      if ("Islam".equalsIgnoreCase(agama)) {
         agamaIdx = 1;
      } else if ("Kristen".equalsIgnoreCase(agama)) {
         agamaIdx = 2;
      } else if ("Katholik".equalsIgnoreCase(agama)) {
         agamaIdx = 3;
      } else if ("Hindu".equalsIgnoreCase(agama)) {
         agamaIdx = 4;
      } else if ("Budha".equalsIgnoreCase(agama)) {
         agamaIdx = 5;
      } else  {
         agamaIdx = 6;
      }
   }
   return agamaIdx;
}


public int convertWaktuStringToIndex(String waktu) {
   int waktuIdx = 0;
   if (waktu!=null && !"0".equals(waktu)) {
      if ("WIB".equalsIgnoreCase(waktu)) {
         waktuIdx = 1;
      } else if ("WITA".equalsIgnoreCase(waktu)) {
         waktuIdx = 2;
      } else if ("WIT".equalsIgnoreCase(waktu)) {
         waktuIdx = 3;
      }
   }
   return waktuIdx;
}
public int convertTempatPengesahanPerkawinanStringToIndex(String tempat) {
   int tempatIdx = 0;
   if (tempat!=null && !"0".equals(tempat)) {
      if ("Mesjid".equalsIgnoreCase(tempat)) {
         tempatIdx = 1;
      } else if ("Gereja".equalsIgnoreCase(tempat)) {
         tempatIdx = 2;
      } else if ("Vihara".equalsIgnoreCase(tempat)) {
         tempatIdx = 3;
      } else if ("Parisada".equalsIgnoreCase(tempat)) {
         tempatIdx = 4;
      } else if ("Dirumah".equalsIgnoreCase(tempat)) {
         tempatIdx = 5;
      } else if ("Lainnya".equalsIgnoreCase(tempat)) {
         tempatIdx = 6;
      }
   }
   return tempatIdx;
}

public String convertAgamaIndexToString(int agamaIdx) {
   String agama = "";
   System.out.println("agama to convert= "+agamaIdx);
   switch (agamaIdx) {
      case 1 : agama = "Islam"; break;
      case 2 : agama = "Kristen"; break;
      case 3 : agama = "Katholik"; break;
      case 4 : agama = "Hindu"; break;
      case 5 : agama = "Budha"; break;
      case 6 : agama = "Lainnya"; break;
   }
   return agama;
}

public String convertStatusKawinIndexToString(int kawinIdx) {
   String stat_kawin = "";
   switch (kawinIdx) {
      case 1 : stat_kawin = "Belum Kawin"; break;
      case 2 : stat_kawin = "Kawin"; break;
      case 3 : stat_kawin = "Cerai Hidup"; break;
      case 4 : stat_kawin = "Cerai Mati"; break;
   }
   return stat_kawin;
}
%>


