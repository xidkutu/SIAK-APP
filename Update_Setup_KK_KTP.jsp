<%@ page import="javax.ejb.*,javax.rmi.*,pendaftaran.*,com.db.connection.*,com.penan.*,siaktools.logwriter.*"%>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory, org.apache.commons.io.FilenameUtils, java.util.*"%>
<%@ page import=" java.io.File,java.lang.Exception"%>
<%!
 SetupPenan remotePenan = null;
 SetupPenanHome homePenan = null;
 ServiceController controller;

 String no_kel,no_kec,no_kab,no_prop;
 String jabatan=null,namapej=null,nippej=null,status=null,jabakel=null,namapejkel=null,niplur=null;
 boolean flag,flag_1;
 StringBuffer buffer=null;
 String filename="";
 String img_file;

 private String padding(String msg, char pad, int length) {
        int diff = length - msg.length();
        for (int i=0; i<diff; i++) {
           msg = pad + msg;
        }
        return msg;
 }
 private String getPropertyValue(String attribute)
 {
   String path=null;
    try{
       ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
       path = res.getString(attribute);
     }catch(Exception err)
     {

     }
     return path;
 }
%>
<%
if (session.getAttribute("remoteRef")!=null)
{
if (ServletFileUpload.isMultipartContent(request)){
  FileItem fileItem = null;
  Enumeration enumer=request.getAttributeNames();
  DiskFileUpload upload= new DiskFileUpload();
    try{
          List fileItemsList = upload.parseRequest(request);
          Iterator it = fileItemsList.iterator();

          while (it.hasNext()){
            FileItem fileItemTemp = (FileItem)it.next();

            if (fileItemTemp.isFormField())
            {
              if  (fileItemTemp.getFieldName().equals("jab_kec"))  jabatan=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("nama_pejbt_kec2"))       namapej=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("nip_pejbt_cmt"))             nippej=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("jab_kel"))              jabakel=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("nama_pejbt_kel"))                   namapejkel=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("nip_lrh"))                        niplur=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("no_kel"))                        no_kel=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("no_kec"))                        no_kec=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("no_kab"))                        no_kab=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("no_prop"))                        no_prop=fileItemTemp.getString();
              if  (fileItemTemp.getFieldName().equals("radiobutton"))                             status = fileItemTemp.getString();
          }
            else
            {
              filename=FilenameUtils.getName(fileItemTemp.getName());
              buffer=new StringBuffer();
                //Commented lines for Kelurahan support applicable only for DKI

//              if (no_kel!="")
//              {
//                img_file="PJ"+no_prop+no_kab+no_kec+no_kel+filename.substring(filename.lastIndexOf("."));
//                buffer.append(getPropertyValue("LOG_PATH")).append(img_file);
//              }
//              else
//                {
                  img_file="PJ"+no_prop+no_kab+no_kec+filename.substring(filename.lastIndexOf("."));
                  buffer.append(getPropertyValue("LOG_PATH")).append(img_file);
//                }
                File saveTo=new File(buffer.toString());
                fileItemTemp.write(saveTo);
                if (buffer!=null) filename=buffer.toString();
              }
            }
          controller = ServiceController.getInstance();
          homePenan = (SetupPenanHome)controller.lookup("SetupPenan",SetupPenanHome.class);

          if(homePenan != null)
          {
            remotePenan = homePenan.create();
          }

          if(jabatan != null && namapej != null && nippej != null)
          {
            if ((status==null) || (status.trim().equals("null")))
            {
              status="";
            }
            flag = remotePenan.setupKec2(no_kec,no_kab,no_prop,jabatan,namapej,status,nippej,img_file);
          }
          if(jabakel != null && namapejkel != null && niplur != null)
          {
            flag_1 = remotePenan.setup_kel2(no_kel,no_kec,no_kab,no_prop,jabakel,namapejkel,niplur,img_file);
          }

          if(flag == true || flag_1 == true)
          {

            XmlReader remote1=null;
            XmlReaderHome home1=null;

            home1=(XmlReaderHome)controller.lookup("XmlReader",XmlReaderHome.class);
            remote1=home1.create();
            remote1.writeWilayah();
            %>

            <jsp:forward page="setup_KTP_KK_Bio_WNI.jsp">
              <jsp:param name="n" value="1"/>
              <jsp:param name="pj" value="<%=img_file%>"/>
            </jsp:forward>
            <%
          }
          else
          {
            %>
            <jsp:forward page="setup_KTP_KK_Bio_WNI.jsp">
              <jsp:param name="n" value="0"/>
              <jsp:param name="pj" value="<%=img_file%>"/>
            </jsp:forward>
            <%
          }
          }
          catch (Exception exception)
          {
            System.out.println("problem:"+ exception);
          }
        }
        else
        {
          response.sendRedirect("index.jsp");
        }
      }
  %>

