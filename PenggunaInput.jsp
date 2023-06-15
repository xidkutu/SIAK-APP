<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.ServiceController"%>

<%!
    String [] data = {"nama_lgkp","nip_pguna","tmpt_lhr","no_akta_lh_dd",
                     "no_akta_lh_mm","no_akta_lh_yy","jenis_klmin","pgt",
                     "gol_pguna","jabatan","nama_ktr","alamat_ktr","tlp_ktr"
                     };

    Vector v = null;
    ServiceController factory=null;
    UserInfo1 record = null;
    Login remote;
    LoginHome home=null;
    String sim,kel,userId;
    boolean b = false;
%>

<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{

     factory=ServiceController.getInstance();
     v = new Vector();

    userId = record.getUserId();

     sim = new String("DAFTAR");
     kel = new String("KELUAR");
%>

<%
try
{
     if(request.getParameter("sim") != null)
     {
      if(request.getParameter("sim").equals(sim))
      {
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

        v.addElement((Object)userId);

         try
         {
           home = (LoginHome)factory.lookup("Login",LoginHome.class);

           if(home != null)
           {
             remote = home.create();
             b = remote.insertUserReg(v);
           }
           if(b == true)
           {%>
               <jsp:forward page="ShowReg.jsp"/>
           <%}
           else
           {
              response.sendRedirect("User_Reg_Error.jsp");
           }
         }
         catch(Exception reg)
         {
           System.out.print("Exception in User_Reg insertion = " + reg);
         }

      }
     }
    else if(request.getParameter("kel") != null)
    {
      if(request.getParameter("kel").equals(kel))
      {%>
         <jsp:forward page="index.jsp"/>
<%    }
    }
}
catch(Exception gen)
{
  out.println("Exception = " + gen);
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
<!--Mark1-->
