<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
String no_kel,nama_kel,select,id1=null;
String [] data = {"nik_suami","kw_suami","ktrunan_suami","kwn_ke_suami","istri_ke",
"pddk_akh_suami","jenis_pkrjn_suami","nik_ayh_dr_suami","kw_suami_ayh","nama_ayh_suami",
"tgl_lhr_ayh_suami_dd","tgl_lhr_ayh_suami_mm","tgl_lhr_ayh_suami_yy",
"jenis_pkrjn_ayh_suami","alamat_ayh_suami","rt_ayh_suami","rw_ayh_suami","dusun_ayh_suami","kpos_ayh_suami",
"tlp_ayh_suami","nama_prop_ayh_suami","nama_kab_ayh_suami","nama_kec_ayh_suami","nama_kel_ayh_suami",
"nik_ibu_dr_suami","kw_suami_ibu","nama_ibu_suami","tgl_lhr_ibu_suami_dd",
"tgl_lhr_ibu_suami_mm","tgl_lhr_ibu_suami_yy","jenis_pkrjn_ibu_suami","alamat_ibu_suami",
"rt_ibu_suami","rw_ibu_suami","dusun_ibu_suami","kpos_ibu_suami","tlp_ibu_suami",
"nama_prop_ibu_suami","nama_kab_ibu_suami","nama_kec_ibu_suami","nama_kel_ibu_suami",
"nik_istri","kw_istri","ktrunan_istri","kwn_ke_istri","pddk_akh_istri","jenis_pkrjn_istri",
"nik_ayh_dr_istri","kw_istri_ayh","nama_ayh_istri","tgl_lhr_ayh_istri_dd",
"tgl_lhr_ayh_istri_mm","tgl_lhr_ayh_istri_yy","jenis_pkrjn_ayh_istri","alamat_ayh_istri",
"rt_ayh_istri","rw_ayh_istri","dusun_ayh_istri","kpos_ayh_istri","tlp_ayh_istri",
"nama_prop_ayh_istri","nama_kab_ayh_istri","nama_kec_ayh_istri","nama_kel_ayh_istri",
"nik_ibu_dr_istri","kw_istri_ibu","nama_ibu_istri","tgl_lhr_ibu_istri_dd",
"tgl_lhr_ibu_istri_mm","tgl_lhr_ibu_istri_yy","jenis_pkrjn_ibu_istri","alamat_ibu_istri",
"rt_ibu_istri","rw_ibu_istri","dusun_ibu_istri","kpos_ibu_istri","tlp_ibu_istri",
"nama_prop_ibu_istri","nama_kab_ibu_istri","nama_kec_ibu_istri","nama_kel_ibu_istri",
"nik_sksi1","kw_saksi1","jenis_pkrjn_s1","nik_sksi2","kw_saksi2","jenis_pkrjn_s2",
"tgl_pembktan_kwn_dd","tgl_pembktan_kwn_mm","tgl_pembktan_kwn_yy","pukul_lhr1",
"pukul_lhr2","wkt_pkl_lhr","tgl_mlapor_dd","tgl_mlapor_mm","tgl_mlapor_yy",
"tduk_agama",  "nama_tmpt_pnesah","ket_nama_tmpt_pnesah","nama_pmka_agama",
"alamat_pmka_agama","rt_pmka_agama","rw_pmka_agama","dusun_pmka_agama",
"kpos_pmka_agama","tlp_pmka_agama","nama_prop_pmka_agama","nama_kab_pmka_agama",
"nama_kec_pmka_agama","nama_kel_pmka_agama","tgl_dft_kwn_ln_dd","tgl_dft_kwn_ln_mm",
"tgl_dft_kwn_ln_yy","ijn_dut_kwn_wna","dsrhk_cttkwn","today","nama_kep_des","nip_lrh",
"nama_pet_reg","nip_pet_reg","nama_plpor","no_prop","no_kab","stat_sebel_suami","stat_sebel_istri"};

    Vector v = null;
    ServiceController factory;
    WNIBiodataHome homeKlr = null;
    WNIBiodata remoteKlr = null;
    String kon,sim,bat,kel,selected[],noaktakwn;
    String nama_suami="",nama_istri="";
%>

<%
     factory=ServiceController.getInstance();
     v = new Vector();
     nama_suami = request.getParameter("nama_suami");
     nama_istri = request.getParameter("nama_istri");

 try
     {

      for(int i=0; i < data.length;i++)
        {
             v.addElement((Object)((request.getParameter(data[i])==null)?"":request.getParameter(data[i])));
        }

       String daftarAnak =request.getParameter("daftarAnak");
       v.addElement(daftarAnak);
       selected=request.getParameterValues("doc_per");

for(int j=0; j < selected.length;j++)
        {
           v.addElement((Object)selected[j]);
        }

try
         {
           homeKlr = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);

           if(homeKlr != null)
           {
             remoteKlr = homeKlr.create();
             noaktakwn = remoteKlr.insertKawin(v);
           }
           if(noaktakwn == null)
           {%>
               <jsp:forward page="Insert_Kawin_Error.jsp?noaktakwn='tidak ditemukan'"/>

           <%}
           else
           {%>
               <jsp:forward page="Show_Kawin.jsp">
               <jsp:param name="noaktakwn" value="<%=noaktakwn%>"/>
               <jsp:param name="nama_suami" value="<%=nama_suami%>"/>
               <jsp:param name="nama_istri" value="<%=nama_istri%>"/>
               </jsp:forward>
           <%}

         }
         catch(Exception kawin)
         {
               System.out.print("Exception in Kawin insertion = " + kawin);
         }
}
catch(Exception e)
{
e.printStackTrace();
}
%>
