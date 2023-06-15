<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>
<%@include file="Global.jsp"%>
<%
    String select,id1=null;
    String [] data = {"nik_bayi","nik_sksi1","jenis_pekerjaan_saksi1","jenis_pekerjaan_saksi1",
    "nik_sksi2","jenis_pekerjaan_saksi2","jenis_pekerjaan_saksi2","jenis_dft_lhr","dsrhk_cttlhr",
     "nama_kep_des","nip_lrh","nama_pet_reg","nip_pet_reg"};

    Vector v = null,lahir=null;
    ServiceController factory;
    WNIBiodataHome home = null;
    WNIBiodata remote1;
    String kon,sim,bat;
    String nik_bayi=null,nik_ibu = null, nik_ayah = null, nik_pelapor = null, nik_saksi1=null,nik_saksi2=null,nama_bayi=null;
    String []selected;
%>

<%
         try
         {
if(session.getAttribute("remoteRef")!= null)
{
     factory=ServiceController.getInstance();
     v = new Vector();
     lahir = new Vector();

     kon = new String("KONFIRMASI");
     sim = new String("SIMPAN");
     bat = new String("BATAL");

     nik_bayi=(request.getParameter("nik_bayi") == null)?"0":request.getParameter("nik_bayi");
System.out.println("nik_bayi= "+nik_bayi);

     nik_saksi1=(request.getParameter("nik_sksi1")==null)?"0":request.getParameter("nik_sksi1");
System.out.println("nik_saksi1= "+nik_saksi1);

     nik_saksi2=(request.getParameter("nik_sksi2")==null)?"0":request.getParameter("nik_sksi2");
System.out.println("nik_saksi2= "+nik_saksi2);

nama_bayi = (request.getParameter("nama_bayi")==null)?"":request.getParameter("nama_bayi");
System.out.println("nama_bayi= "+nama_bayi);
%>

<%
System.out.println("request.getParameter(sim) = "+request.getParameter("sim") );
System.out.println( "request.getParameter(kon)= "+ request.getParameter("kon") );
System.out.println( "request.getParameter(kecInput)= "+ request.getParameter("kecInput") );
System.out.println( "?request.getParameter(kecInput)= "+ (request.getParameter("kecInput")!=null && request.getParameter("kecInput").equalsIgnoreCase("true")?true:false));

     if(request.getParameter("sim") != null && request.getParameter("sim").equals(sim))
     {
        if ((request.getParameter("kecInput")!=null && request.getParameter("kecInput").equalsIgnoreCase("true")?true:false)) {
System.out.println(55);
          String [] data2 = {"nik_bayi","tmpt_dilhr","pukul_lhr1","pukul_lhr2",
    "wkt_pkl_lhr","jenis_klahir","anak_ke_lhr","pnlng_klahir","brt_bayi","radiobutton1",
    "nik_ibu","nama_ibu","no_akta_lhr_dd","no_akta_lhr_mm","no_akta_lhr_yy",
    "jenis_pkrjn_ibu","jenis_pkrjn_ibu","alamat_ibu","no_rt_ibu","no_rw_ibu","dusun_ibu",
    "kodepos_ibu","telp_ibu","nama_prop_ibu","nama_kab_ibu","nama_kec_ibu","nkelibu",
    "ketrunan_ibu","bangsa_ibu","tgl_ctt_kwn_ibu_dd","tgl_ctt_kwn_ibu_mm",
    "tgl_ctt_kwn_ibu_yy","radiobutton4","nik_ayh","nama_ayh","no_akta_lhr_dd1",
    "no_akta_lhr_mm1","no_akta_lhr_yy1","jenis_pkrjn_ayh","jenis_pkrjn_ayh",
    "alamat_ayh","no_rt_ayh","no_rw_ayh","dusun_ayh","kodepos_ayh","telp_ayh",
    "nama_prop_ayh","nama_kab_ayh","nama_kec_ayh","nkelayh","ketrunan_ayh",
     "bangsa_ayh","tgl_ctt_kwn_ayh_dd","tgl_ctt_kwn_ayh_mm","tgl_ctt_kwn_ayh_yy",
     "nik_plpor","jenis_pkrjn_plpor","jenis_pkrjn_plpor","no_akta_lhr_dd2",
     "no_akta_lhr_mm2","no_akta_lhr_yy2"};

nik_bayi=(request.getParameter("nik_bayi") == null)?"":request.getParameter("nik_bayi");
     session.setAttribute("nik_bayi",nik_bayi);

     nik_ibu=(request.getParameter("nik_ibu")==null)?"":request.getParameter("nik_ibu");
     session.setAttribute("nik_ibu",nik_ibu);

     nik_ayah=(request.getParameter("nik_ayh")==null)?"":request.getParameter("nik_ayh");
     session.setAttribute("nik_ayah",nik_ayah);

     nik_pelapor=(request.getParameter("nik_plpor")==null)?"":request.getParameter("nik_plpor");
     session.setAttribute("nik_pelapor",nik_pelapor);
System.out.println(81);
        Vector v2 = new Vector();
        for(int i=0; i < data2.length;i++)
        {
           System.out.println(data2[i]+"="+request.getParameter(data2[i]));
            v2.addElement((request.getParameter(data2[i])==null)?"":request.getParameter(data2[i]));
        }
System.out.println(86);
         v2.addElement((Object)request.getParameter("no_prop"));
         v2.addElement((Object)request.getParameter("no_kab"));
         v2.addElement((Object)request.getParameter("no_kec"));
         v2.addElement((Object)request.getParameter("today"));

         factory = ServiceController.getInstance();
System.out.println(96);
         home = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);
System.out.println(98);
Vector lahir0 = null;
           if(home != null)
           {
             remote1 = home.create();
System.out.println(102);
System.out.println("v2="+v2);
             lahir0 = remote1.insertLahir(v2);
System.out.println("lahir0="+lahir0);
System.out.println(104);
           }

           if(lahir0 == null)
           {
System.out.println(113);
//             out.println(printError("Records Not Inserted !"));
//             return;
           }

        }


System.out.println("STEP 1");
        for(int i=0; i < data.length;i++)
        {
           System.out.println(data[i]+"="+request.getParameter(data[i]));
           v.addElement((request.getParameter(data[i])==null)?"":request.getParameter(data[i]));
        }
System.out.println("STEP 2");
        selected=request.getParameterValues("doc_per");

System.out.println("STEP 3, selected= "+selected);
System.out.println("selected[0] = "+selected[0]);

        for(int j=0; j < selected.length;j++)
        {
           v.addElement(selected[j]);
        }
v.addElement(request.getParameter("today"));

System.out.println("BEFORE LOOKUP HOME WNIBIODATA");
           if(home == null)
           home = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);
System.out.println("BEFORE SAKSI INPUT home, home= "+home);
           if(home != null)
           {
             remote1 = home.create();
             lahir = remote1.updateLahir(v);
System.out.println("AFTER SAKSI INPUT lahir= "+lahir);
           }
           if(lahir == null)
           {
             out.println(printError("Records Not Inserted !"));
           }
           else
           {%>
               <jsp:forward page="Show_Saksi.jsp">
               <jsp:param name="noaktalahir" value="<%=lahir.elementAt(0).toString()%>"/>
               <jsp:param name="namaibu" value="<%=lahir.elementAt(1).toString()%>"/>
               <jsp:param name="nik_bayi" value="<%=nik_bayi%>"/>
               <jsp:param name="nama_bayi" value="<%=nama_bayi%>"/>
               <jsp:param name="nik_saksi1" value="<%=nik_saksi1%>"/>
               <jsp:param name="nik_saksi2" value="<%=nik_saksi2%>"/>
               </jsp:forward>
           <%}


     }
     else if(request.getParameter("kon") != null)
     {
       if(request.getParameter("kon").equals(kon))
       {%>

         <jsp:forward page="Pencatatan_Kabupaten_Edit.jsp"/>
     <%}
    }
}
else
{
response.sendRedirect("index.jsp");
}
         }
         catch(Exception ex)
         {
               System.out.print("Exception in Lahir updation = " + lahir);
               ex.printStackTrace();
         }
%>
