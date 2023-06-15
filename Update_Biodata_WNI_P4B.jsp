<%@page import="javax.naming.*,javax.rmi.*,java.util.*,com.P4B.*,java.math.BigDecimal,com.db.connection.*"%>
<%@include file="CommonFile.jsp"%>


<%!
String [] data = {"txtnokk","txtnamakep","txtalamat","txtnort","txtnorw","txtdusun","txtkodepos","txttelpon",
"nik","nama_lgkp","no_ktp","tmpt_sbl","no_paspor","dd_paspor","mm_paspor","yy_paspor","jenis_klmin","tmpt_lhr","no_akta_lhr_dd",
"no_akta_lhr_mm","no_akta_lhr_yy","akta_lhr","no_akta_lhr","gol_drh","aga_ma","agama","stat_kwn","akta_kwn",
"no_akta_kwn","tgl_kwn_dd","tgl_kwn_mm","tgl_kwn_yy","akta_crai","no_akta_crai","tgl_crai_dd","tgl_crai_mm","tgl_crai_yy",
"stat_hbkel","klain_fsk","pnydng_cct","pddk_akh","jenis_pkrjn","nik_ibu","nama_lgkp_ibu","nik_ayh","nama_lgkp_ayh",
"nama_ket_rt","nama_ket_rw","nama_pet_reg","nip_pet_reg","nama_pet_entri","nip_pet_entri","today","no_prop","no_kab","no_kec","no_kel"};

ServiceController wniUpdate;
P4BBioObject form=null,result=null;
P4bBioDataHome home = null;
P4bBioData remoteP4b;
%>

<%
 try
   {

if (session.getAttribute("remoteRef")!=null)
{
 form=new P4BBioObject(request.getParameter("txtnokk"),
 request.getParameter("txtnamakep"),
request.getParameter("txtalamat"),
request.getParameter("txtnort"),
request.getParameter("txtnorw"),
request.getParameter("txtdusun"),
request.getParameter("txtkodepos"),
request.getParameter("txttelpon"),
request.getParameter("nik"),
request.getParameter("nama_lgkp"),
request.getParameter("no_ktp"),
request.getParameter("tmpt_sbl"),
request.getParameter("no_paspor"),
request.getParameter("dd_paspor"),
request.getParameter("mm_paspor"),
request.getParameter("yy_paspor"),
session.getAttribute("jenis_kl").toString(),
request.getParameter("jenis_klmin"),
request.getParameter("tmpt_lhr"),
session.getAttribute("tgl_lhr").toString(),
request.getParameter("no_akta_lhr_dd"),
request.getParameter("no_akta_lhr_mm"),
request.getParameter("no_akta_lhr_yy"),
request.getParameter("akta_lhr"),
request.getParameter("no_akta_lhr"),
request.getParameter("gol_drh"),
request.getParameter("aga_ma"),
request.getParameter("agama"),
request.getParameter("stat_kwn"),
request.getParameter("akta_kwn"),
request.getParameter("no_akta_kwn"),
request.getParameter("tgl_kwn_dd"),
request.getParameter("tgl_kwn_mm"),
request.getParameter("tgl_kwn_yy"),
request.getParameter("akta_crai"),
request.getParameter("no_akta_crai"),
request.getParameter("tgl_crai_dd"),
request.getParameter("tgl_crai_mm"),
request.getParameter("tgl_crai_yy"),
request.getParameter("stat_hbkel"),
request.getParameter("klain_fsk"),
request.getParameter("pnydng_cct"),
request.getParameter("pddk_akh"),
request.getParameter("jenis_pkrjn"),
request.getParameter("nik_ibu"),
request.getParameter("nama_lgkp_ibu"),
request.getParameter("nik_ayh"),
request.getParameter("nama_lgkp_ayh"),
request.getParameter("nama_ket_rt"),
request.getParameter("nama_ket_rw"),
request.getParameter("nama_pet_reg"),
request.getParameter("nip_pet_reg"),
request.getParameter("nama_pet_entri"),
request.getParameter("nip_pet_entri"),
request.getParameter("today"),
request.getParameter("no_prop"),
request.getParameter("no_kab"),
request.getParameter("no_kec"),
request.getParameter("no_kel"));

     wniUpdate = ServiceController.getInstance();
     home = (P4bBioDataHome)wniUpdate.lookup("P4BBioData",P4bBioDataHome.class);

     boolean flag=false;

      if(home != null)
      {
        remoteP4b=home.create();
        result=remoteP4b.insertP4b(form);
        session.removeAttribute("jenis_kl");
        session.removeAttribute("tgl_lhr");
      }

   if(result!=null)
         {%>
           <jsp:forward page="hasilp4b.jsp">
           <jsp:param name="no_kk" value="<%=result.getNoKk()%>"/>
            <jsp:param name="nik" value="<%=result.getNik()%>"/>
            <jsp:param name="nama" value="<%=result.getNamaLgkp()%>"/>
            <jsp:param name="jenis" value="<%=getClKelamin(result.getJenisKlmin())%>"/>
            <jsp:param name="tmpt" value="<%=result.getTmptLhr()%>"/>
            <jsp:param name="tgl" value="<%=result.getTglLahirform()%>"/>
            <jsp:param name="shdk" value="<%=getStatHubungan(result.getStatHbkel())%>"/>
            <jsp:param name="nik_ibu" value="<%=result.getNikIbu()%>"/>
            <jsp:param name="nama_ibu" value="<%=result.getNamaLgkpIbu()%>"/>
           </jsp:forward>
      <%
          }
          %>
      <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp?destination=Pendaftaran_Biodata_WNI_Edit_P4B.jsp">
       <jsp:param name="n" value="5"/>
       </jsp:forward>
    <%
       }
       else  response.sendRedirect("index.jsp");
 }
catch (Exception ne)
    {
ne.printStackTrace();
      response.sendRedirect("WNI_Menu.jsp");
    }
%>