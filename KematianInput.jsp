<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
    String no_kel,nama_kel,select,id1=null;

    String [] data = {"nik_jnsah","ktrunan_jnsah","anak_ke_mt","tgl_mati_dd","tgl_mati_mm",
    "tgl_mati_yy","pukul_mt1","pukul_mt2","wkt_pkl_mt","sbab_mati","tmpt_mati",
    "yg_mnerang","pnetap_pn","no_pnetap","tgl_pnetap","bln_pnetap",
    "thn_pnetap","radiobutton1","nik_ibu","nama_ibu","no_akta_lhr_dd",
    "no_akta_lhr_mm","no_akta_lhr_yy","jenis_pkrjn_ibu","jenis_pkrjn_ibu",
    "alamat_ibu","no_rt_ibu","no_rw_ibu","dusun_ibu","kodepos_ibu","telp_ibu",
    "nama_prop_ibu","nama_kab_ibu","nama_kec_ibu","nkelibu",
    "radiobutton4","nik_ayh","nama_ayh","no_akta_lhr_dd1",
    "no_akta_lhr_mm1","no_akta_lhr_yy1","jenis_pkrjn_ayh","jenis_pkrjn_ayh",
    "alamat_ayh","no_rt_ayh","no_rw_ayh","dusun_ayh","kodepos_ayh","telp_ayh",
    "nama_prop_ayh","nama_kab_ayh","nama_kec_ayh","nkelayh","nik_plpor",
    "jenis_pkrjn_plpor","jenis_pkrjn_plpor","no_akta_lhr_dd2",
     "no_akta_lhr_mm2","no_akta_lhr_yy2"};

    Vector vectorMati = null,lahir=null;
    ServiceController factory,factory1;
    ServiceController wniController;
    WNIBiodataHome home = null;
    WNIBiodata remote1;
    boolean result = false;
    String nik_jnsah=null,nik_ibu=null,nik_ayah=null,nik_pelapor=null;
%>

<%
try
         {

     factory=ServiceController.getInstance();
     vectorMati = new Vector();

     nik_jnsah=(request.getParameter("nik_jnsah") == null)?"0":request.getParameter("nik_jnsah");
     nik_ibu=(request.getParameter("nik_ibu")==null)?"0":request.getParameter("nik_ibu");
     nik_ayah=(request.getParameter("nik_ayh")==null)?"0":request.getParameter("nik_ayh");
     nik_pelapor=(request.getParameter("nik_plpor")==null)?"0":request.getParameter("nik_plpor");


   if(request.getParameter("sim") != null)
     {

    for(int i=0; i < data.length;i++)
        {
     if ((request.getParameter(data[i]) != null) &&  (!request.getParameter(data[i]).trim().equals("")) && (!request.getParameter(data[i]).trim().equals("0")))
          {
             vectorMati.addElement((Object)request.getParameter(data[i]));
          }
          else
          {
             vectorMati.addElement((Object)"");
          }
        }
         vectorMati.addElement(request.getParameter("no_prop"));
         vectorMati.addElement(request.getParameter("no_kab"));
         vectorMati.addElement(request.getParameter("no_kec"));
         vectorMati.addElement(request.getParameter("today"));

         wniController = ServiceController.getInstance();
         home = (WNIBiodataHome)wniController.lookup("WNIBiodata",WNIBiodataHome.class);

         if(home != null)
          {
             remote1 = home.create();
             result = remote1.insertMati(vectorMati);
          }
           if(result == false)
           {
            %>
               <jsp:forward page="Insert_Mati_Error.jsp"/>

           <%}
           else
           {%>
               <jsp:forward page="Show_Mati.jsp">
               <jsp:param name="nikjnsah" value="<%=nik_jnsah%>"/>
               </jsp:forward>
           <%}

     }

         }
         catch(Exception mati)
         {
               System.out.print("Exception in Mati insertion in JSP= " + mati);
               mati.printStackTrace();
         }

%>
