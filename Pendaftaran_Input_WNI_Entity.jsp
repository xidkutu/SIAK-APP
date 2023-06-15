<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,java.math.BigDecimal,com.db.connection.*,siaktools.logwriter.*"%>
<%!
    String [] data = {"no_ktp","no_paspor2","no_akta_lh_dd","no_akta_lh_mon","no_akta_lh_yy","nama_lgkp","jenis_klmin","tmpt_lhr","no_akta_lhr_dd","no_akta_lhr_mm","no_akta_lhr_yy","akta_lhr","no_akta_lhr","gol_drh","aga_ma","stat_kwn","akwn","no_akta_kwn","tgl_kwn_dd","tgl_kwn_mm","tgl_kwn_yy","acri","no_akta_crai","tgl_crai_dd","tgl_crai_mm","tgl_crai_yy","stat_hbkel","klain_fisik","pnydng_cct","pddk_akh","jenis_pkrjn","nik_ibu","nama_lgkp_ibu","nik_ayh","nama_lgkp_ayh","nama_ket_rt","nama_ket_rw","nama_pet_reg","nip_pet_reg","no_akta_lhr45","no_akta_lhr225","no_akta_lhr325","no_kk","no_prop","no_kab","no_kec","no_kel","tmpt_sbl","agama","today","nama_pet_entri","nip_pet_entri"};
    String state1,SIM,BAT,namakel;
    String s1,s2,s3,nama_kep,alamat,dusun,telp,no_rt,no_rw,kodepos,newkk;
    String no_prop,no_kab,no_kec,no_kel,nokk,kkno=null,newnik;
    String ins_value;
    String today="";
    ServiceController wniController;
    WNIBiodataHome home = null;
    WNIBiodata remote;
    Vector v = null,v1 = null;

%>

<%-- Get the parameter from client --%>

<%
 try

   {
   v = new Vector();
   v1 = new Vector();
   SIM = new String("SIMPAN");
   BAT = new String("KELUAR");

   kkno = request.getParameter("no_kk");
   namakel = request.getParameter("nama_kel");

   no_prop = request.getParameter("no_prop");
   v1.addElement((Object)no_prop);
   no_kab = request.getParameter("no_kab");
   v1.addElement((Object)no_kab);
   no_kec = request.getParameter("no_kec");
   v1.addElement((Object)no_kec);
   no_kel = request.getParameter("no_kel");
   v1.addElement((Object)no_kel);
   nama_kep = request.getParameter("nama_kep");
   v1.addElement((Object)nama_kep);
   alamat = request.getParameter("alamat");
   v1.addElement((Object)alamat);
   no_rt = request.getParameter("no_rt");
   v1.addElement((Object)no_rt);
   no_rw = request.getParameter("no_rw");
   v1.addElement((Object)no_rw);
   dusun = request.getParameter("dusun");
   v1.addElement((Object)dusun);
   kodepos = request.getParameter("kodepos");
   v1.addElement((Object)kodepos);
   telp = request.getParameter("telp");
   v1.addElement((Object)telp);

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
      wniController = ServiceController.getInstance();
      home = (WNIBiodataHome)wniController.lookup("WNIBiodata",WNIBiodataHome.class);

      if(home != null)
      {
          remote = home.create();
      }

      if(request.getParameter("b").equals(SIM))
      {
         if(kkno != null)
         {
             newnik = remote.insert(v,kkno);
             nokk = kkno;
         }
         else
         {
             ins_value = remote.kepalaKaluarga(v1,v);    //Argument 1 of type Vector contains DataKeluarga Data
             nokk=ins_value.substring(0,16);   //Resultant Nomor KK
             newnik=ins_value.substring(16);    //Resultant Nomor NIK
         }

 if(newnik != null)
         {
%>
<jsp:forward page="ShowKk.jsp">
<jsp:param name="n" value="1"/>
<jsp:param name="no_kk" value="<%=nokk%>"/>
<jsp:param name="nik" value="<%=newnik%>"/>
<jsp:param name="namakel" value="<%=namakel%>"/>
<jsp:param name="no_rt" value="<%=no_rt%>"/>
<jsp:param name="no_rw" value="<%=no_rw%>"/>
<jsp:param name="dusun" value="<%=dusun%>"/>
<jsp:param name="kodepos" value="<%=kodepos%>"/>
<jsp:param name="telp" value="<%=telp%>"/>
</jsp:forward>
<%
        }
//Load Testing
//Begin

//response.sendRedirect("Logout.jsp");
//End
       }
       else if(request.getParameter("bat").equals(BAT))
       {
           response.sendRedirect("WNI_Menu.jsp");
       }
 }
   catch (Exception ne)
    {
ne.printStackTrace();
	response.sendRedirect("Popup_Wni1.jsp");
       //SiakWriter wr = new SiakWriter("/usr/local/bea/logs/siaklog/error.txt");
        //wr.writeFile(ne, "Pendaftaran_Input_WNI_Entity.jsp");
    }
%>