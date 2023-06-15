<%@ page import="javax.xml.transform.TransformerFactory"%>
<%@ page import="javax.xml.transform.Transformer"%>
<%@ page import="javax.xml.transform.stream.StreamSource"%>
<%@ page import="javax.xml.transform.stream.StreamResult"%>
<%@ page import="javax.xml.transform.TransformerException"%>
<%@ page import="javax.xml.transform.TransformerConfigurationException"%>
<%
String no_prop,no_kab,no_kec,no_kel;
String XML_SOURCE=null;
String XSL_SOURCE=null;
String path=null,sep_path=null;
try{
ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",Locale.getDefault());
path = res.getString("BEAN_PATH");
sep_path=res.getString("SEP_PATH");
path=path.substring(0,path.lastIndexOf(sep_path));
path=path+sep_path;
no_prop = (request.getParameter("nprop")==null?"0":request.getParameter("nprop"));
no_kab = (request.getParameter("nkab")==null?"0":request.getParameter("nkab"));
no_kec= (request.getParameter("nkec")==null?"0":request.getParameter("nkec"));
no_kel= (request.getParameter("nkel")==null?"0":request.getParameter("nkel"));
XML_SOURCE="rtangga".trim()+no_prop.trim()+no_kab.trim()+no_kec.trim()+no_kel.trim()+".xml".trim();
XSL_SOURCE=request.getParameter("xsl_source");

TransformerFactory tFactory=TransformerFactory.newInstance();
StreamSource xslStreamSource=new StreamSource(path+XSL_SOURCE);
StreamSource xmlStreamSource=new StreamSource(path+XML_SOURCE);
Transformer transformer=tFactory.newTransformer(xslStreamSource);
StreamResult result=new StreamResult(out);
transformer.transform(xmlStreamSource,result);
}catch(Exception err)
{
err.printStackTrace();
}
%>
