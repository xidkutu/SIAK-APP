<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
    String no_kel,nama_kel,select,id1=null;

  String [] data = {
  "nik_suami",
"wn_suami",
"pddk_akh_suami",
"jenis_pkrjn_suami",
"ktrunan_suami",
"stat_kwn_sblm_nkh_suami",
"crai_ke_suami",
"kwn_ke_suami",
"istri_ke",
"nik_istri",
"wn_istri",
"pddk_akh_istri",
"jenis_pkrjn_istri",
"ktrunan_istri",
"stat_kwn_sblm_nkh_istri",
"kwn_ke_istri",
"jml_ank",
"yg_btgung_pmel_ank",
"yg_aju_crai",
"no_akta_kwn",
"tgl_akta_kwn",
"tmpt_ctt_kwn",
"no_srt_ket_pn",
"tgl_srt_ket_pn_dd",
"tgl_srt_ket_pn_mm",
"tgl_srt_ket_pn_yy",
"no_kep_pngadil",
"tgl_srt_kep_pngadil_dd",
"tgl_srt_kep_pngadil_mm",
"tgl_srt_kep_pngadil_yy",
"lbg_pngadil_kel_kep",
"tmpt_lbg_pngadil",
"sbab_crai",
"tgl_daft_crai_drln_dd",
"tgl_daft_crai_drln_mm",
"tgl_daft_crai_drln_yy",
"dsrhk_cttcrai",
"nama_pet_reg",
"nip_pet_reg",
"today",
"no_prop",
"no_kab",
"nik_plpor",
"wn_pelapor",
"jenis_pkrjn_plpor",
"dd_mlpor",
"mm_mlpor",
"yy_mlpor"
};

   Login remote;
    Vector v = null;
    ServiceController factory;
    WNIBiodataHome homeKlr = null;
    WNIBiodata remoteKlr = null;
    String nik_suami,nik_istri,kon,sim,bat,kel,noaktacri;
%>

<%
//System.out.println(124);

 try
       {
//System.out.println(128);
 if(session.getAttribute("remoteRef") != null)
  {
//System.out.println(133);
     factory=ServiceController.getInstance();
     v = new Vector();

     sim = new String("SIMPAN");


//System.out.println(143);
        for(int i=0; i < data.length;i++)
        {
//System.out.println("request.getParameter(data[i])="+request.getParameter(data[i]));
             v.addElement((request.getParameter(data[i])==null)?"":request.getParameter(data[i]));
        }
         homeKlr = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);

           if(homeKlr != null)
           {
             remoteKlr = homeKlr.create();
             try {
//System.out.println(151);
                noaktacri = remoteKlr.insertCerai(v);
             } catch (pendaftaran.CapilException ex) {
ex.printStackTrace();
//System.out.println(154);
%>
<jsp:forward page="Insert_Cerai_Error.jsp?status='<%=ex.getMessage()%>'"/>
           <%}
           }
           if(noaktacri == null)
           {
//System.out.println(161);%>
               <jsp:forward page="Insert_Cerai_Error.jsp?status='Nomor Akta Cerai tidak ditemukan'"/>

           <%}
           else
           {
//System.out.println(167);%>
               <jsp:forward page="Show_Cerai.jsp">
               <jsp:param name="noaktacri" value="<%=noaktacri%>"/>
               </jsp:forward>
           <%}
}
else
{
//System.out.println(177);
response.sendRedirect("index.jsp");
}
}
catch(Exception cerai)
{
    cerai.printStackTrace();
    System.out.print("Exception in Cerai insertion = " + cerai);
}
%>
