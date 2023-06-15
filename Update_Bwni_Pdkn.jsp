<%-- Declaration of variables --%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,java.math.BigDecimal,com.db.connection.*" %>
<%!
//String [] data = {"nik","nama_lgkp","no_ktp","tmpt_sbl","no_paspor","no_akta_lh_dd","no_akta_lh_mon","no_akta_lh_yy","tmpt_lhr","akta_lhr","no_akta_lhr","gol_drh","aga_ma","stat_kwn","akwn","no_akta_kwn","tgl_kwn_dd","tgl_kwn_mm","tgl_kwn_yy","acri","no_akta_crai","tgl_crai_dd","tgl_crai_mm","tgl_crai_yy","stat_hbkel","klain_fisik","pnydng_cct","pddk_akh","jenis_pkrjn","nik_ibu","nama_lgkp_ibu","nik_ayh","nama_lgkp_ayh","nama_ket_rt","nama_ket_rw","nama_pet_reg","nip_pet_reg","nama_pet_entri","nip_pet_entri","today","no_akta_lhr_dd","no_akta_lhr_mm","no_akta_lhr_yy","jenis_klmin","nik_flag"};
String [] data = {"nik","pddk_akh","pddk_akh_lama","gelar_dpm","gelar_blk","tmpgelar","ijazah_No","ijazah_dd","ijazah_mm","ijazah_yyyy","Ijazah_ins","Ijazah_ttd","nama_pet_reg","nip_pet_reg"};
    String state1,SIM,BAT,namakel;
    ServiceController wniUpdate;
    WNIBiodataHome home = null;
    WNIBiodata remoteWNIBiodata;
    Vector v = null,v1 = null;
    boolean b = false;
    BioSiak obj=null;
%>
<%
if (session.getAttribute("remoteRef")!=null)
{
   v = new Vector();
   String inp_elm="";
System.out.println("=================================");
System.out.println("========insert pendidikan========");
System.out.println("=================================");
for(int i=0; i < data.length;i++)
   {
if ((request.getParameter(data[i]) != null) && (!(request.getParameter(data[i]).trim().equals(""))) && (!(request.getParameter(data[i]).trim().equals("0"))))
     {
    inp_elm=request.getParameter(data[i]).trim();
    System.out.println("Ambil nilai" + data[i] + "-->" + inp_elm);
     if (i==12)
             {
 if ((request.getParameter(data[i]).trim().equals("Lainnya")) && (request.getParameter("agama")!=null) && (!(request.getParameter("agama").trim().equals(""))))
             {
     inp_elm=request.getParameter("agama");
             }
             }
     v.addElement(inp_elm);
   }
     else
     {
	System.out.println("Ambil nilai kosong");
       v.addElement("");
     }
   }
try
   {
      wniUpdate = ServiceController.getInstance();
       home = (WNIBiodataHome)wniUpdate.lookup("WNIBiodata",WNIBiodataHome.class);

  if(home != null)
      {
           remoteWNIBiodata = home.create();
	   remoteWNIBiodata.insert_pdkn(v);
	   b = true;
           // b = remoteWNIBiodata.updateWni(v);
            v.removeAllElements();
            v=null;
      }
if(b == true)
    {
%>
           <jsp:forward page="success_ubah.jsp">
           </jsp:forward>

<%
}
}
    catch (Exception ne)
    {
      ne.printStackTrace();
    }
}
else
{
response.sendRedirect("index.jsp");
}
%>