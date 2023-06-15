<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%!
 String no_kel,no_kec,no_kab,no_prop;
 String flttd;
 String jabatan=null,namapej=null,nippej=null,status=null,jabakel=null,namapejkel=null,niplur=null;
 String jab_kec=null,nama_pejbt_kec2=null,nip_pejbt_cmt=null,jab_kel=null,nama_pejbt_kel=null,nip_lrh=null,radiobutton=null;
%>
<%
 if  (session.getAttribute("remoteRef")!=null)
{
   no_kel = request.getParameter("no_kel").trim();
   no_kec = request.getParameter("no_kec").trim();
   no_kab = request.getParameter("no_kab").trim();
   no_prop = request.getParameter("no_prop").trim();
   flttd = request.getParameter("dokumenfile").trim();
   
 if((request.getParameter("jab_kec") != null) && (request.getParameter("nama_pejbt_kec2") != null) && (request.getParameter("nip_pejbt_cmt") != null))
   {
     jabatan=request.getParameter("jab_kec");
     namapej=request.getParameter("nama_pejbt_kec2");
     nippej=request.getParameter("nip_pejbt_cmt");
   }
   if((request.getParameter("jab_kel") != null) && (request.getParameter("nama_pejbt_kel") != null) && (request.getParameter("nip_lrh") != null))
   {
     jabakel=request.getParameter("jab_kel");
     namapejkel=request.getParameter("nama_pejbt_kel");
     niplur=request.getParameter("nip_lrh");
   }
   if(request.getParameter("radiobutton") != null)
   {
      status = request.getParameter("radiobutton");
   }
%>
<%
    String err = "";
    String lastFileName = "";
 
    String contentType = request.getContentType();
    String boundary = "";
    final int BOUNDARY_WORD_SIZE = "boundary=".length();
    if(contentType == null || !contentType.startsWith("multipart/form-data")) {
      err = "Ilegal ENCTYPE : must be multipart/form-data\n";
      err += "ENCTYPE set = " + contentType;
    }else{
      boundary = contentType.substring(contentType.indexOf("boundary=") + BOUNDARY_WORD_SIZE);
      boundary = "--" + boundary;
      try {
        javax.servlet.ServletInputStream sis = request.getInputStream();
        byte[] b = new byte[1024];
        int x=0;
        int state=0;
        String name=null,fileName=null,contentType2=null;
        java.io.FileOutputStream buffer = null;
        while((x=sis.readLine(b,0,1024))>-1) {
          String s = new String(b,0,x);
          if(s.startsWith(boundary)) {
            state = 0;
            //out.println("name="+name+"<br>");
            //out.println(fileName+"<br>");
 
            name = null;
            contentType2 = null;
            fileName = null;
 
 
          }else if(s.startsWith("Content-Disposition") && state==0) {
            state = 1;
            if(s.indexOf("filename=") == -1)
              name = s.substring(s.indexOf("name=") + "name=".length(),s.length()-2);
            else {
              name = s.substring(s.indexOf("name=") + "name=".length(),s.lastIndexOf(";"));
              fileName = s.substring(s.indexOf("filename=") + "filename=".length(),s.length()-2);
              if(fileName.equals("\"\"")) {
                fileName = null;
              }else {
                String userAgent = request.getHeader("User-Agent");
                String userSeparator="/";  // default
                if (userAgent.indexOf("Windows")!=-1)
                  userSeparator="\\";
                if (userAgent.indexOf("Linux")!=-1)
                  userSeparator="/";
                fileName = fileName.substring(fileName.lastIndexOf(userSeparator)+1,fileName.length()-1);
                if(fileName.startsWith( "\""))
                  fileName = fileName.substring( 1);
              }
            }
            name = name.substring(1,name.length()-1);
            if (name.equals("dokumenfile")) {
              if (buffer!=null)
                buffer.close();
              lastFileName = fileName;
              buffer = new java.io.FileOutputStream("/bea/logs/ttd_pejabat/"+fileName);
            }
          }else if(s.startsWith("Content-Type") && state==1) {
            state = 2;
            contentType2 = s.substring(s.indexOf(":")+2,s.length()-2);
          }else if(s.equals("\r\n") && state != 3) {
            state = 3;
          }else {
            if (name.equals("dokumenfile"))
              buffer.write(b,0,x);
          }
        }
        sis.close();
        buffer.close();
		flttd = fileName;
		System.out.println(flttd);
      }catch(java.io.IOException e) {
        err = e.toString();
      }
    }
    boolean ok = err.equals("");
    if(!ok) {
      out.println(err);
    }else{
    %>
        <jsp:forward page="Update_Setup_KK_KTPADV.jsp">
			<jsp:param name="no_kel" value="<%no_kel%>"/>
			<jsp:param name="no_kec" value="<%no_kec%>"/>
			<jsp:param name="no_kab" value="<%no_kab%>"/>
			<jsp:param name="no_prop" value="<%no_prop%>"/>
			<jsp:param name="dokumenfile" value="<%flttd%>"/>
			<jsp:param name="jab_kec" value="<%jabatan%>"/>
			<jsp:param name="nama_pejbt_kec2" value="<%namapej%>"/>
			<jsp:param name="nip_pejbt_cmt" value="<%nippej%>"/>
			<jsp:param name="jab_kel" value="<%jabakel%>"/>
			<jsp:param name="nama_pejbt_kel" value="<%namapejkel%>"/>
			<jsp:param name="nip_lrh" value="<%niplur%>"/>
			<jsp:param name="radiobutton" value="<%status%>"/>
        </jsp:forward>
    <%
    }
    out.println("Upload should be succeeded.");
%>
<%
}
else
 {
%>
<jsp:forward page="index.jsp">
</jsp:forward>
<%
 }
%>
