<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
<%!
String tmp_no_prop=null,tmp_no_kab=null,tmp_no_kec=null,tmp_no_kel=null;

String no_prop_ibu="";
String no_kab_ibu="";
String no_kec_ibu="";
String no_kel_ibu="";

String no_prop_ayh="";
String no_kab_ayh="";
String no_kec_ayh="";
String no_kel_ayh="";

public String getTrimData(String datatrim)
{
if (datatrim!=null)  return datatrim.trim();
return "";
}
public String getFullDate(String dd,String mm,String yy)
{
   if (((dd!=null) && (!(dd.trim().equals("")))) && ((mm!=null) && (!(mm.trim().equals("")))) && ((yy!=null) && (!(yy.trim().equals("")))))
    return(dd.trim() + "-" + mm.trim() +  "-" + yy.trim());
return("");
}

public String getLocaleDay(String strdt)
{
 String daynow="";
try{
      SimpleDateFormat fmt1,fmt2;
        Date dt;
        fmt1=new SimpleDateFormat("dd-MM-yyyy");
        dt=fmt1.parse(strdt);
   switch(dt.getDay())
    {
       case 0:
         daynow="Minggu";
          break;
      case 1:
         daynow="Senin";
          break;
      case 2:
         daynow="Selasa";
          break;
      case 3:
         daynow="Rabu";
          break;
      case 4:
         daynow="Kamis";
          break;
      case 5:
         daynow="Jumat";
          break;
      case 6:
         daynow="Sabtu";
          break;
  }
}catch(Exception expDay)
{
daynow="";
}
 return (daynow);
}

public String getDD(String tanggal)
{
System.out.println("DD tanggal IBU" + tanggal);
if(tanggal!=null && !tanggal.trim().equals(""))
{
return(tanggal.substring(0,2));
}
return "";
}

public String getMM(String tanggal)
{
System.out.println("MM tanggal IBU" + tanggal);
if(tanggal!=null && !tanggal.trim().equals(""))
{

return(tanggal.substring(3,5));
}
return "";
}

public String getYY(String tanggal)
{
System.out.println("YY tanggal IBU" + tanggal);
if(tanggal!=null && !tanggal.trim().equals(""))
{

return(tanggal.substring(6));
}
return "";
}

public String setPropSel(String start_prop,String end_prop)
{


 if (start_prop!=null && end_prop!=null && Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()) )  return("selected");
return("");
}

public String setPropSel(String start_prop,String end_prop,String nama_prop)
{
String coder_htm="";
 if (start_prop!=null && end_prop!=null && Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))
{
coder_htm="<option value=" + start_prop.trim() + " selected> '" +  nama_prop.trim() + "' </option> </select>";
return coder_htm;
}
return("");
}

public String setPropNo(String start_prop,String end_prop)
{

if ( start_prop!=null && end_prop!=null && Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))
{
System.out.println("Equal PROP: " + start_prop);
return(start_prop);
}
return(null);
}


public String setKabSel(String start_prop,String end_prop,String start_kab,String end_kab)
{
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim())))
     {
return("selected");
     }
return("");
}




public String setKabSel(String start_prop,String end_prop,String start_kab,String end_kab,String nama_kab, String fieldname)
{
String coder_htm="";
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim())))
     {
coder_htm="<select class='boxdefault' name='nama_kab_"+fieldname+"' onChange='no_kab_"+fieldname+".value=this.value;pilih_kec(this.form)' disabled> <option>-- Pilih Kabupaten/Kota --</option> <option value=" + start_kab.trim() + " selected> " +  nama_kab.trim() + " </option> </select>";
return(coder_htm);
     }
return("");
}


public String setKabNo(String start_prop,String end_prop,String start_kab,String end_kab)
{
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim())))
     {
System.out.println("Equal KAB: " + start_kab);
return(start_kab);
     }
return(null);
}


public String setKecSel(String start_prop,String end_prop,String start_kab,String end_kab,String start_kec,String end_kec)
{
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim()))  &&
  (Integer.parseInt(start_kec.trim())==Integer.parseInt(end_kec.trim())) )
     {
return("selected");
     }
return("");
}

public String setKecSel(String start_prop,String end_prop,String start_kab,String end_kab,String start_kec,String end_kec,String kec_nama, String fieldname)
{
String coder_htm="";
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim()))  &&
  (Integer.parseInt(start_kec.trim())==Integer.parseInt(end_kec.trim())) )
     {
coder_htm=coder_htm="<select class='boxdefault'  name='nama_kec_"+fieldname+"'  onChange='no_kec_"+fieldname+".value=this.value;pilih_kel(this.form)' disabled> <option>-- Pilih Kecamatan --</option> <option value=" + start_kec.trim() + " selected> " +  kec_nama.trim() + " </option> </select>";
return(coder_htm);
     }
return("");
}

public String setKecNo(String start_prop,String end_prop,String start_kab,String end_kab,String start_kec,String end_kec)
{
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim()))  &&
  (Integer.parseInt(start_kec.trim())==Integer.parseInt(end_kec.trim())) )
     {
System.out.println("Equal kec: " + start_kec);
return(start_kec);
     }
return(null);
}


public String setKelSel(String start_prop,String end_prop,String start_kab,String end_kab,String start_kec,String end_kec,String start_kel,String end_kel)
{
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim()))  &&
  (Integer.parseInt(start_kec.trim())==Integer.parseInt(end_kec.trim()))  &&
(Integer.parseInt(start_kel.trim())==Integer.parseInt(end_kel.trim())))
     {
return("selected");
     }
return("");
}

public String setKelSel(String start_prop,String end_prop,String start_kab,String end_kab,String start_kec,String end_kec,String start_kel,String end_kel,String nama_kel, String fieldname)
{
String coder_htm="";
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim()))  &&
  (Integer.parseInt(start_kec.trim())==Integer.parseInt(end_kec.trim()))  &&
(Integer.parseInt(start_kel.trim())==Integer.parseInt(end_kel.trim())))
     {
coder_htm=" <select class='boxdefault'  name='nkel"+fieldname+"' disabled> <option>-- Pilih Kelurahan --</option> <option value=" + start_kel.trim() + " selected> " +  nama_kel.trim() + " </option> </select>";
return(coder_htm);
     }
return("");
}

public String setKelno(String start_prop,String end_prop,String start_kab,String end_kab,String start_kec,String end_kec,String start_kel,String end_kel)
{
 if ((Integer.parseInt(start_prop.trim())==Integer.parseInt(end_prop.trim()))  &&
    (Integer.parseInt(start_kab.trim())==Integer.parseInt(end_kab.trim()))  &&
  (Integer.parseInt(start_kec.trim())==Integer.parseInt(end_kec.trim()))  &&
(Integer.parseInt(start_kel.trim())==Integer.parseInt(end_kel.trim())))
     {
System.out.println("Equal Kel=" + end_kel);
return(end_kel);
     }
return(null);
}

public String nullFinder(String obj)
{
//  if (obj==null) System.out.println("Its Null now");
//  return((obj==null)?"":obj);
if ((obj!=null) && (!obj.trim().equals("null")) && (!obj.trim().equals(""))) return obj.trim();
return "";
}

public void liner()
{
for(int i=0;i<=10000;i++) System.out.print("*");
}

public String zeroFinder(Object obj)
{
     if (obj!=null)
   {
  return((obj.toString().trim().equals("0") )?"":obj.toString());
   }
return ("");
}

public String getClKelamin(String kelamin)
{
String strkelamin="";
    if (kelamin!=null)
         {
           kelamin=kelamin.trim();
     if (kelamin.trim().equals("1"))
     strkelamin="Laki-laki";
    else if (kelamin.equals("2"))
     strkelamin="Perempuan";
         }
return strkelamin;
}

public String getClAktaLhr(String lahir)
{
String aktlhr="";
        if (lahir!=null)
           {
      lahir=lahir.trim();
   if (lahir.equals("1"))      aktlhr="Ada";
   else if (lahir.equals("2"))      aktlhr="Tidak Ada";
           }
return aktlhr;
}
public String     getClAktaStatusKawin(String kawin)
{
      String aktkawin="";
         if (kawin!=null)
               {
              kawin=kawin.trim();
    if (kawin.equals("1"))     aktkawin="Belum Kawin";
    else if  (kawin.equals("2"))     aktkawin="Kawin";
      else if  (kawin.equals("3"))     aktkawin="Cerai Hidup";
 else if  (kawin.equals("4"))     aktkawin="Cerai Mati";
               }
return aktkawin;
}

public String getClAktaKawin(String status)
{
String kstat="";
          if (status!=null)
                {
                 status=status.trim();
    if (status.equals("1"))  kstat="Ada";
   else if (status.equals("1"))  kstat="Tidak Ada";
                }
return kstat;
}

public String getClAktaCerai(String cerai)
{
String statcerai="";
        if (cerai!=null)
              {
             cerai=cerai.trim();
   if (cerai.equals("1"))   statcerai="Ada";
  else if (cerai.equals("1")) statcerai="Tidak Ada";
              }
return statcerai;
}

public String getStatHubungan(String hubun)
{
  String hubunkel="";
        if (hubun!=null)
              {
            hubun=hubun.trim();

     if (hubun.equals("1")) hubunkel="Kepala Keluarga";
    else if (hubun.equals("2")) hubunkel="Suami";
    else if (hubun.equals("3")) hubunkel="Istri";
 else if (hubun.equals("4")) hubunkel="Anak";
 else if (hubun.equals("5")) hubunkel="Menantu";
 else if (hubun.equals("6")) hubunkel="Cucu";
 else if (hubun.equals("7")) hubunkel="OrangTua";
 else if (hubun.equals("8")) hubunkel="Mertua";
 else if (hubun.equals("9")) hubunkel="Famili Lain";
 else if (hubun.equals("10")) hubunkel="Pembantu";
 else if (hubun.equals("11")) hubunkel="Lainnya";
              }
return hubunkel;
}

public String getStatHubunIdxWni(String hubun)
{
 String hubunkel="";
        if (hubun!=null)
              {
 hubun=hubun.trim().toUpperCase();
 if (hubun.equals("KEPALA KELUARGA")) hubunkel="1";
 else if (hubun.equals("SUAMI")) hubunkel="2";
 else if (hubun.equals("ISTRI")) hubunkel="3";
 else if (hubun.equals("ANAK")) hubunkel="4";
 else if (hubun.equals("MENANTU")) hubunkel="5";
 else if (hubun.equals("CUCU")) hubunkel="6";
 else if (hubun.equals("ORANGTUA")) hubunkel="7";
 else if (hubun.equals("MERTUA")) hubunkel="8";
 else if (hubun.equals("FAMILI LAIN")) hubunkel="9";
 else if (hubun.equals("PEMBANTU")) hubunkel="10";
 else if (hubun.equals("LAINNYA")) hubunkel="11";
              }
return hubunkel;
}


public String getStatHubunIdxWna(String hubun)
{
 String hubunkel="";
if (hubun!=null)
              {
   hubun=hubun.trim().toUpperCase();
 if (hubun.equals("KEPALA KELUARGA/HEAD OF FAMILY")) hubunkel="1";
 else if (hubun.equals("SUAMI/HUSBAND")) hubunkel="2";
 else if (hubun.equals("ISTRI/WIFE")) hubunkel="3";
 else if (hubun.equals("ANAK/CHILD")) hubunkel="4";
 else if (hubun.equals("MENANTU/CHILD IN LAW")) hubunkel="5";
 else if (hubun.equals("CUCU/GRAND CHILD")) hubunkel="6";
 else if (hubun.equals("ORANGTUA/PARENT")) hubunkel="7";
 else if (hubun.equals("MERTUA/PARENT IN LAW")) hubunkel="8";
 else if (hubun.equals("FAMILI LAIN/RELATIVE")) hubunkel="9";
 else if (hubun.equals("PEMBANTU/HOUSEMADE")) hubunkel="10";
 else if (hubun.equals("LAIN/OTHERS")) hubunkel="11";
             }
return hubunkel;
}




public String getStatHubunganWna(String hubun)
{
 String hubunkel="";
if (hubun!=null)
              {
   hubun=hubun.trim();
 if (hubun.equals("1")) hubunkel="Kepala Keluarga/Head of Family";
 else if (hubun.equals("2")) hubunkel="Suami/Husband";
 else if (hubun.equals("3")) hubunkel="Istri/Wife";
 else if (hubun.equals("4")) hubunkel="Anak/Child";
 else if (hubun.equals("5")) hubunkel="Menantu/Child in Law";
 else if (hubun.equals("6")) hubunkel="Cucu/Grand Child";
 else if (hubun.equals("7")) hubunkel="OrangTua/Parent";
 else if (hubun.equals("8")) hubunkel="Mertua/Parent in Law";
 else if (hubun.equals("9")) hubunkel="Famili Lain/Relative";
 else if (hubun.equals("10")) hubunkel="Pembantu/Housemade";
 else if (hubun.equals("11")) hubunkel="Lain/Others";
             }
return hubunkel;
}




public String getFisik(String fisik)
{
String fisikstat="";
          if (fisik!=null)
             {
               fisik=fisik.trim();
   if (fisik.equals("1")) fisikstat="Ada";
  else if (fisik.equals("2")) fisikstat="Tidak Ada";
             }
  return fisikstat;
}

public String getCacatFisik(String cacat)
{
String cacatfisik="";
          if (cacat!=null)
            {
              cacat=cacat.trim();
           if (cacat.equals("1"))  cacatfisik="Cacat Fisik";
else if (cacat.equals("2"))  cacatfisik="Cacat Netra/Buta";
else if (cacat.equals("3"))  cacatfisik="Cacat Rungu/Wicara";
else if (cacat.equals("4"))  cacatfisik="Cacat Mental/Jiwa";
else if (cacat.equals("5"))  cacatfisik="Cacat Fisik dan Mental";
else if (cacat.equals("6"))  cacatfisik="Cacat Lainnya";
            }
return cacatfisik;
}

public String getPendidikan(String penddk)
{
String pddkhr="";
            if (penddk!=null)
             {
                  penddk=penddk.trim();
   if (penddk.equals("1"))  pddkhr="Tidak/Belum Sekolah";
   else if (penddk.equals("2"))  pddkhr="Tidak Tamat SD/Sederajat";
   else if (penddk.equals("3"))  pddkhr="Tamat SD/Sederajat";
   else if (penddk.equals("4"))  pddkhr="SLTP/Sederajat";
   else if (penddk.equals("5"))  pddkhr="SLTA/Sederajat";
   else if (penddk.equals("6"))  pddkhr="Diploma I/II";
   else if (penddk.equals("7"))  pddkhr="Akademi/Diploma III/S. Muda";
   else if (penddk.equals("8"))  pddkhr="Diploma IV/Strata I";
   else if (penddk.equals("9"))  pddkhr="Strata II";
   else if (penddk.equals("10"))  pddkhr="Strata III";
             }
return pddkhr;
}

public String getPekerjaan(String peker)
{
String jaan="";
        if ((peker!=null) && (!(peker.equals("0"))))
             {
         peker=peker.trim();
      if (peker.equals("1")) jaan="Pelajar/Mahasiswa";
    else if (peker.equals("2")) jaan="Mengurus Rumah Tangga";
    else if (peker.equals("3")) jaan="Pensiunan";
    else if (peker.equals("4")) jaan="Belum/Tidak Bekerja";
    else if (peker.equals("5")) jaan="Petani/Pekebun";
    else if (peker.equals("6")) jaan="Peternak";
    else if (peker.equals("7")) jaan="Nelayan/Perikanan";
    else if (peker.equals("8")) jaan="Industri";
    else if (peker.equals("9")) jaan="Konstruksi";
    else if (peker.equals("10")) jaan="Perdagangan";
    else if (peker.equals("11")) jaan="Transportasi";
    else if (peker.equals("12")) jaan="Pegawai Negeri Sipil";
    else if (peker.equals("13")) jaan="Tentara Nasional Indonesia";
    else if (peker.equals("14")) jaan="Kepolisian R.I.";
    else if (peker.equals("15")) jaan="Jasa Lainnya";
    else if (peker.equals("16")) jaan="Lainnya";
             }
return jaan;
}

public int getAgamaIndex(String agama)
{
int out_val=6;
     if (agama.equals("Islam")) out_val=1;
      if (agama.equals("Kristen")) out_val=2;
     if (agama.equals("Katholik")) out_val=3;
     if (agama.equals("Hindu")) out_val=4;
     if (agama.equals("Budha")) out_val=5;
return out_val;
}

public String getPendidikanWna(String penddk)
{
String pddkhr="";
            if (penddk!=null)
             {
                  penddk=penddk.trim();
   if (penddk.equals("1"))  pddkhr="Elementary";
   else if (penddk.equals("2"))  pddkhr="Junior High School";
   else if (penddk.equals("3"))  pddkhr="Senior High School";
   else if (penddk.equals("4"))  pddkhr="Diploma";
   else if (penddk.equals("5"))  pddkhr="Bachelor";
   else if (penddk.equals("6"))  pddkhr="Master";
   else if (penddk.equals("7"))  pddkhr="Philosophy of Doctor";
   else if (penddk.equals("8"))  pddkhr="Others";
             }
return pddkhr;
}

public String getPekerjaanWna(String peker)
{
String jaan="";
        if ((peker!=null) && (!(peker.equals("0"))))
             {
         peker=peker.trim();
      if (peker.equals("1")) jaan="Trading and Industry";
    else if (peker.equals("2")) jaan="Forestry";
    else if (peker.equals("3")) jaan="Mining and Energy";
    else if (peker.equals("4")) jaan="Public Work";
    else if (peker.equals("5")) jaan="Farming";
    else if (peker.equals("6")) jaan="Religion";
    else if (peker.equals("7")) jaan="Bank and Financial";
    else if (peker.equals("8")) jaan="Health and Society";
    else if (peker.equals("9")) jaan="Tourism";
    else if (peker.equals("10")) jaan="Transportation and Communication";
    else if (peker.equals("11")) jaan="Culture and Education";
    else if (peker.equals("12")) jaan="Others";
            }
return jaan;
}

public int getAgamaIndexWna(String agama)
{
int out_val=6;
     if (agama.equals("Islam")) out_val=1;
      if (agama.equals("Kristen/Christian")) out_val=2;
     if (agama.equals("Katholik/Catholic")) out_val=3;
     if (agama.equals("Hindu")) out_val=4;
     if (agama.equals("Budha/Buddhism")) out_val=5;
return out_val;
}

public String    getClAktaStatusKawinWna(String kawin)
{
      String aktkawin="";
         if (kawin!=null)
               {
              kawin=kawin.trim();
    if (kawin.equals("1"))     aktkawin="Married";
    else if  (kawin.equals("2"))     aktkawin="Single";
      else if  (kawin.equals("3"))     aktkawin="Divorce";
 else if  (kawin.equals("4"))     aktkawin="Other";
               }
return aktkawin;
}

 public java.util.Vector getListHubugan()    //Function Moved from Bean Keluarga_WNA
      {
  java.util.Vector vt=new java.util.Vector();
    vt.addElement("Kepala Keluarga/Head of Family");
    vt.addElement("Suami/Husband");
    vt.addElement("Istri/Wife");
    vt.addElement("Anak/Child");
    vt.addElement("Menantu/Child in Law");
    vt.addElement("Cucu/Grand Child");
    vt.addElement("OrangTua/Parent");
    vt.addElement("Mertua/Parent in Law");
    vt.addElement("Famili Lain/Relative");
    vt.addElement("Pembantu/Housemade");
    vt.addElement("Lain/Others");
   return(vt);
    }

 public java.util.Vector getListHubuganWni()
      {
  java.util.Vector vt=new java.util.Vector();
    vt.addElement("Kepala Keluarga");
    vt.addElement("Suami");
    vt.addElement("Istri");
    vt.addElement("Anak");
    vt.addElement("Menantu");
    vt.addElement("Cucu");
    vt.addElement("OrangTua");
    vt.addElement("Mertua");
    vt.addElement("Famili Lain");
    vt.addElement("Pembantu");
    vt.addElement("Lainnya");
   return(vt);
    }

public String getStatHubunganP4B(int hubun, int sex)
{
  String hubunkel="";
  switch (hubun) {
     case  1 : hubunkel="Kepala Keluarga"; break;
     case  2 : if (sex==1) {hubunkel="Suami";} else if (sex==2){hubunkel="Istri";}; break;
     case  3 : hubunkel="Anak"; break;
     case  4 : hubunkel="Menantu"; break;
     case  5 : hubunkel="Cucu"; break;
     case  6 : hubunkel="OrangTua"; break;
     case  7 : hubunkel="Mertua"; break;
     case  8 : hubunkel="Famili Lain"; break;
     case  9 : hubunkel="Pembantu"; break;
     case  10 : hubunkel="Lainnya"; break;
  }
return hubunkel;
}
public Vector getParseData(String params,String delimit)
{
      StringTokenizer st1 = new StringTokenizer(params, delimit);
      String token = "";
      Vector vNik = new Vector();
  while (st1.hasMoreTokens())
      {
         token = st1.nextToken();
         vNik.addElement(token);
      }
return vNik;
}
%>

