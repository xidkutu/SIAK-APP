<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
    String no_kel,nama_kel,select,id1=null;

    String [] data = {"nik_bayi","tmpt_dilhr","pukul_lhr1","pukul_lhr2",
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

    Vector v = null,lahir=null;
    ServiceController factory,factory1;
    ServiceController wniController;
    WNIBiodataHome home = null;
    WNIBiodata remote1;
    String kon,sim,bat,kel;
    String nik_bayi=null,nik_ibu=null,nik_ayah=null,nik_pelapor=null;
String condition;
%>

<%
 try
 {
     factory=ServiceController.getInstance();
     v = new Vector();
     kon = new String("KONFIRMASI");
     sim = new String("SIMPAN");
     bat = new String("BATAL");
     kel = new String("KELUAR");
     condition = request.getParameter("condition");
     nik_bayi=(request.getParameter("nik_bayi") == null)?"":request.getParameter("nik_bayi");
     session.setAttribute("nik_bayi",nik_bayi);
     nik_ibu=(request.getParameter("nik_ibu")==null)?"":request.getParameter("nik_ibu");
     session.setAttribute("nik_ibu",nik_ibu);
     nik_ayah=(request.getParameter("nik_ayh")==null)?"":request.getParameter("nik_ayh");
     session.setAttribute("nik_ayah",nik_ayah);
     nik_pelapor=(request.getParameter("nik_plpor")==null)?"":request.getParameter("nik_plpor");
     session.setAttribute("nik_pelapor",nik_pelapor);

  if(request.getParameter("sim") != null && request.getParameter("sim").equals(sim))
     {

        for(int i=0; i < data.length;i++)
        {
             System.out.println(request.getParameter(data[i]));
            v.addElement((request.getParameter(data[i])==null)?"":request.getParameter(data[i]));
        }
         v.addElement((Object)request.getParameter("no_prop"));
         v.addElement((Object)request.getParameter("no_kab"));
         v.addElement((Object)request.getParameter("no_kec"));
         v.addElement((Object)request.getParameter("today"));

         wniController = ServiceController.getInstance();

         home = (WNIBiodataHome)wniController.lookup("WNIBiodata",WNIBiodataHome.class);

           if(home != null)
           {
             remote1 = home.create();
             lahir = remote1.insertLahir(v);
           }
           if(lahir == null)
           { System.out.println("lahir == null");%>
               <jsp:forward page="Insert_Lahir_Error.jsp"/>

           <%}
           else
           { System.out.println("lahir != null");%>
               <jsp:forward page="Show_Lahir.jsp">
               <jsp:param name="nikbayi" value="<%=nik_bayi%>"/>
               </jsp:forward>
           <%}
     }
     else if(request.getParameter("kon") != null)
     {
       if(request.getParameter("kon").equals(kon))
       { System.out.println("request.getParameter('kon').equals(kon)");%>

         <jsp:forward page="Pencatatan_Kelahiran_List.jsp"/>
     <%}
    }
   }
  catch(Exception lahir)
   {
               lahir.printStackTrace();
               System.out.print("Exception in Lahir insertion = " + lahir);
              response.sendRedirect("index.jsp");
   }
%>
