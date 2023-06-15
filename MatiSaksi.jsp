<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*" %>

<%!
    String [] data = {"nik_jnsah","nik_sksi1","jenis_pekerjaan_saksi1","jenis_pekerjaan_saksi1",
    "nik_sksi2","jenis_pekerjaan_saksi2","jenis_pekerjaan_saksi2","jenis_dft_mt","dsrhk_cttmt",
     "nama_kep_des","nip_lrh","nama_pet_reg","nip_pet_reg"};

    String [] datains = {"nik_jnsah","ktrunan_jnsah","anak_ke_mt","tgl_mati_dd","tgl_mati_mm",
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

    UserInfo1 record = null;
    Vector vectorUpdate = null,vectorInsert=null,result=null;
    ServiceController factory;
    ServiceController wniController;
    WNIBiodataHome home = null;
    WNIBiodata remote1;
    Login remote;
    String nik_ibu=null,nik_ayah=null,nik_pelapor=null,nik_jnsah=null,nik_saksi1=null,nik_saksi2=null;
    String [] selected;
    int flag=0;

void readVectorUpdate(HttpServletRequest req)
{
        for(int i=0; i< data.length;i++)
        {
          vectorUpdate.addElement( (req.getParameter(data[i])==null)?"":req.getParameter(data[i]));
        }
        selected=req.getParameterValues("doc_per");

        for(int j=0; j < selected.length;j++)
        {
           vectorUpdate.addElement((Object)selected[j]);
        }
           vectorUpdate.addElement(record.getToday());
}

void readVectorInsert(HttpServletRequest req)
{

  for(int i=0; i < datains.length;i++)
        {
     if ((req.getParameter(datains[i]) != null) &&  (!req.getParameter(datains[i]).trim().equals("")) && (!req.getParameter(datains[i]).trim().equals("0")))
          {
             vectorInsert.addElement((Object)req.getParameter(datains[i]));
          }
          else
          {
             vectorInsert.addElement((Object)"");
          }
        }
         vectorInsert.addElement(req.getParameter("no_prop"));
         vectorInsert.addElement(req.getParameter("no_kab"));
         vectorInsert.addElement(req.getParameter("no_kec"));
         vectorInsert.addElement(req.getParameter("today"));
}
%>

<%
     vectorUpdate = new Vector();
     vectorInsert = new Vector();
 try
     {
     record = (UserInfo1)session.getAttribute("remoteRef");
if(record != null)
    {
     factory=ServiceController.getInstance();
     nik_jnsah=(request.getParameter("nik_jnsah") == null)?"0":request.getParameter("nik_jnsah");
     nik_ibu=(request.getParameter("nik_ibu")==null)?"0":request.getParameter("nik_ibu");
     nik_ayah=(request.getParameter("nik_ayh")==null)?"0":request.getParameter("nik_ayh");
     nik_pelapor=(request.getParameter("nik_plpor")==null)?"0":request.getParameter("nik_plpor");
     nik_saksi1=(request.getParameter("nik_sksi1")==null)?"0":request.getParameter("nik_sksi1");
     nik_saksi2=(request.getParameter("nik_sksi2")==null)?"0":request.getParameter("nik_sksi2");
try
     {
           wniController = ServiceController.getInstance();
           home = (WNIBiodataHome)wniController.lookup("WNIBiodata",WNIBiodataHome.class);

 if(home != null)
           {
             remote1 = home.create();
             try{
//flag=1 Doesnt exists
//flag=2 Exists and No_Akta_Mati is null
//flag=3 Exists and No_Akta_Mati is not null
              flag=remote1.IsJenasahExists(nik_jnsah);
                    if (flag==1)
                      {
                         System.out.println("Insert and Update");
                          readVectorInsert(request);
                          readVectorUpdate(request);
                          result=remote1.matiInsertKabupaten(vectorInsert,vectorUpdate);
                      }
                     if (flag==2)
                      {
                         System.out.println("Update Only");
                         readVectorUpdate(request);
                         result=remote1.updateMati(vectorUpdate);
                      }
               }catch(Exception err)
                  {

                  }
           }

       if(flag==0 || flag==3)
           {%>
              <jsp:forward page="Insert_Mati_Error.jsp"/>
<%         }
           else
           {%>
               <jsp:forward page="Show_Saksi_Mati.jsp">
               <jsp:param name="nikjnsah" value="<%=nik_jnsah%>"/>
               <jsp:param name="noaktamati" value="<%=result.elementAt(0).toString()%>"/>
               <jsp:param name="namaibu" value="<%=result.elementAt(1).toString()%>"/>
               </jsp:forward>
          <%}
          }
         catch(Exception lahir)
         {
               System.out.print("Exception in Mati updation = " + lahir);
         }
}
else
{
response.sendRedirect("index.jsp");
}
     }
catch(Exception e)
{
e.printStackTrace();
}

%>
