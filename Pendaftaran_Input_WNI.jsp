<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*" %>

<%!
    String [] data = {"no_ktp","no_paspor2","no_akta_lh_dd","no_akta_lh_mon","no_akta_lh_yy","nama_lgkp","jenis_klmin","tmpt_lhr","no_akta_lhr_dd","no_akta_lhr_mm","no_akta_lhr_yy","akta_lhr","no_akta_lhr","gol_drh","aga_ma","stat_kwn","akta_kwn","no_akta_kwn","tgl_kwn_dd","tgl_kwn_mm","tgl_kwn_yy","akta_crai","no_akta_crai","tgl_crai_dd","tgl_crai_mm","tgl_crai_yy","stat_hbkel","klain_fisik","pnydng_cct","pddk_akh","jenis_pkrjn","nik_ibu","nama_lgkp_ibu","nik_ayh","nama_lgkp_ayh","nama_ket_rt","nama_ket_rw","nama_pet_reg","nip_pet_reg","no_akta_lhr45","no_akta_lhr225","no_akta_lhr325","no_kk","no_prop","no_kab","no_kec","no_kel"};
    String state1,SIM,BAT,namakel;
    String s1,s2,s3,message = null;
    WNIBiodataHome home = null;
    WNIBiodata remote;
    Vector v = null;
  ServiceController factory=null;
%>
<%

if (session.getAttribute("remoteRef")!=null)
{

   v = new Vector();
   SIM = new String("SIMPAN");
   BAT = new String("BATAL");

   state1 = request.getParameter("state");
   namakel = request.getParameter("nama_kel");

   for(int i=0; i < data.length;i++)
   {
     if(request.getParameter(data[i]) != null)
     {
       v.addElement((Object)request.getParameter(data[i]));
     }
     else
     {
       v.addElement((Object)"0");
     }
   }
   try
   {
       factory=ServiceController.getInstance();
       home= (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);
       remote = home.create();

      if(request.getParameter("b").equals(SIM))
      {
         message = remote.insert(v,state1);

         if(message != null)
         {%>
<jsp:forward page="Pendaftaran_Biodata_WNI1.jsp">
<jsp:param name="n" value="1"/>
<jsp:param name="namakel" value="<%=namakel%>"/>

</jsp:forward>
<%
         }
       }
       else if(request.getParameter("bat").equals(BAT))
       {
           response.sendRedirect("WNI_Menu.jsp");
       }
    }
    catch (Exception ne)
    {
      response.sendRedirect("WNI_Menu.jsp");
    }
}
else
{
response.sendRedirect("index.jsp");
}

%>