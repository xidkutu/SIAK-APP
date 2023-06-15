<%-- Declaration of variables --%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,java.math.BigDecimal,com.db.connection.*,manage.KendaliProses" %>
<%!
//String [] data = {"nik","nama_lgkp","no_ktp","tmpt_sbl","no_paspor","no_akta_lh_dd","no_akta_lh_mon","no_akta_lh_yy","tmpt_lhr","akta_lhr","no_akta_lhr","gol_drh","aga_ma","stat_kwn","akwn","no_akta_kwn","tgl_kwn_dd","tgl_kwn_mm","tgl_kwn_yy","acri","no_akta_crai","tgl_crai_dd","tgl_crai_mm","tgl_crai_yy","stat_hbkel","klain_fisik","pnydng_cct","pddk_akh","jenis_pkrjn","nik_ibu","nama_lgkp_ibu","nik_ayh","nama_lgkp_ayh","nama_ket_rt","nama_ket_rw","nama_pet_reg","nip_pet_reg","nama_pet_entri","nip_pet_entri","today","no_akta_lhr_dd","no_akta_lhr_mm","no_akta_lhr_yy","jenis_klmin","nik_flag"};
    String state1,SIM,BAT,namakel;
    ServiceController wniUpdate;
    WNIBiodataHome home = null;
    WNIBiodata remoteWNIBiodata;
    KendaliProses KendaliOke  = null;
    Vector v = null,v1 = null;
    boolean b = false;
    BioSiak obj=null;
	String [] data = {"no_srt_dep","tglsatu_dd","tglsatu_mm","tglsatu_yyyy","no_srt_asl","tgldua_dd","tgldua_mm","tgldua_yyyy"};
	String [] data1 = {"ckktp","aktp","bktp","pktp","ckkk","akk","bkk","pkk","ckkal","akal","bkal","pkal","ckkam","akam","bkam","pkam"};
	String [] data2 = {"ckkac","akac","bkac","pkac","ckkaw","akaw","bkaw","pkaw","ckkap","akap","bkap","pkap"};
	String [] data3 = {"nama_pet_reg","nip_pet_reg","jbt_pet_reg","nama_pet_entri","nip_pet_entri","today","prop","kab"};
%>
<%
if (session.getAttribute("remoteRef")!=null)
{
   String inp_elm="";
   v = new Vector();
System.out.println("=================================");
System.out.println("========insert kendali========");
System.out.println("=================================");
System.out.println("===========  1 - 10  ============");

for(int i=0; i < data.length;i++)
   {
   if ((request.getParameter(data[i]) != null) && (!(request.getParameter(data[i]).trim().equals(""))) && (!(request.getParameter(data[i]).trim().equals("0"))))
      {
	  inp_elm=request.getParameter(data[i]).trim();
      //System.out.println("Ambil nilai" + data[i] + "-->" + inp_elm);
      v.addElement(inp_elm);
	  }
	else {
	  System.out.println("Ambil nilai" + data[i] + "--> Kosong");
	  v.addElement("");
	  }
   }

for(int i=0; i < data1.length;i++)
   {
   if ((request.getParameter(data1[i]) != null) && (!(request.getParameter(data1[i]).trim().equals(""))) && (!(request.getParameter(data1[i]).trim().equals("0"))))
      {
	  inp_elm=request.getParameter(data1[i]).trim();
      //System.out.println("Ambil nilai" + data1[i] + "-->" + inp_elm);
      v.addElement(inp_elm);
	  }
	else {
	  System.out.println("Ambil nilai" + data1[i] + "--> Kosong");
 	  v.addElement("");
	  }
   }

System.out.println("===========  11 - 20 ============");

for(int i=0; i < data2.length;i++)
   {
   if ((request.getParameter(data2[i]) != null) && (!(request.getParameter(data2[i]).trim().equals(""))) && (!(request.getParameter(data2[i]).trim().equals("0"))))
      {
	  inp_elm=request.getParameter(data2[i]).trim();
      //System.out.println("Ambil nilai" + data2[i] + "-->" + inp_elm);
      v.addElement(inp_elm);
	  }
	else {
	  //System.out.println("Ambil nilai" + data2[i] + "--> Kosong");
          v.addElement("");
	  }
   }

System.out.println("===========   21 <   ============");

for(int i=0; i < data3.length;i++)
   {
   if ((request.getParameter(data3[i]) != null) && (!(request.getParameter(data3[i]).trim().equals(""))) && (!(request.getParameter(data3[i]).trim().equals("0"))))
      {
	  inp_elm=request.getParameter(data3[i]).trim();
      //System.out.println("Ambil nilai" + data3[i] + "-->" + inp_elm);
      v.addElement(inp_elm);
	  }
	else {
	  //System.out.println("Ambil nilai" + data3[i] + "--> Kosong");
	  v.addElement("");
	  }
   }

KendaliOke = new KendaliProses();

try
   {
      //wniUpdate = ServiceController.getInstance();
       //home = (WNIBiodataHome)wniUpdate.lookup("WNIBiodata",WNIBiodataHome.class);
     KendaliOke.InsertKendali(v);

  /* if(home != null)
      {
           remoteWNIBiodata = home.create();
	   remoteWNIBiodata.insert_pdkn(v);
	   b = true;
           // b = remoteWNIBiodata.updateWni(v);
            v.removeAllElements();
            v=null;
      }
if(b == true)
    { */
%>
           <jsp:forward page="success_nk.jsp">
           </jsp:forward>

<%
// }
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