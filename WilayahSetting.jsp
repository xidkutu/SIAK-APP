<%@ page import="javax.xml.parsers.*,org.w3c.dom.*"%>
<%@ page import="org.xml.sax.helpers.*,org.xml.sax.*"%>
<html>
<head>
<title>
WilayahSetting
</title>
</head>
<body bgcolor="#ffffff" onload="window.history.forward(1)">
<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("c:/wilayah_setting.xml");
NodeList nl = doc.getElementsByTagName("propinsi");

out.println("nl.item(0).getNodeName()=  "+nl.item(0).getNodeName());
%>
<br>
<%
out.println("nl.item(0).getAttributes().getNamedItem(value).getNodeValue()=  "+nl.item(0).getAttributes().getNamedItem("value").getNodeValue());
%>
<br>
<%
out.println("nl.item(0).getFirstChild().getNodeValue()= "+nl.item(0).getFirstChild().getNodeValue());
%>
<br>
<%
out.println("nl.getLength()=  "+nl.getLength());

for(int i=0;i<nl.getLength();i++)
{
   out.print("NODE NAME: "+nl.item(i).getNodeName());
%>
<br>
<%
   out.print("NODE VALUE: "+nl.item(i).getFirstChild().getNodeValue());
%>
<br>
<%
System.out.println("nl.item(i).getChildNodes().item(i).getNodeName()= "+nl.item(i).getChildNodes().item(i).getNodeName().toUpperCase());
for(int j=0;j<nl.item(i).getChildNodes().getLength();j++)
{
   out.print("\tCHILD NODE NAME: "+nl.item(i).getChildNodes().item(j).getNodeName());
%>
<br>
<%
}

}
SAXParserFactory spf = SAXParserFactory.newInstance();
SAXParser sp = spf.newSAXParser();
%>
</body>
</html>
