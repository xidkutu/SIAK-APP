<%@ page import="com.penan.ViewTtd"%>
<%! String[] myData = new String[3];
String jkProp=null;
ViewTtd obj_ttd=null;
//---
%>
<html>
<head>
<title>
DkkProses Data All ON2OFF
</title>
</head>
<body bgcolor="#99CCFF">
<%
double i=0;
obj_ttd = new ViewTtd();
String dedata = obj_ttd.getFileTandaTangan("11","74","03","1001");
%>
</body>
</html>
