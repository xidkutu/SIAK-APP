<html>
<head>
<title>Piramida Penduduk</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<style type="text/css">
<!--
.bdra {  border: 1px #0000FF outset; background-color: "#3399FF"; filter: Shadow(Color=#000000, Direction=10)}
.bdrb {  border: 1px #0000FF outset; background-color: "#330099"; filter: Shadow(Color=#000000, Direction=10)}
-->
</style>

<body bgcolor="#FFFFFF" text="#000000" onload="window.history.forward(1)">
<div align="left"><font size="3" face="Verdana, Arial, Helvetica, sans-serif" color="#330099">
<b><center>Piramida Penduduk</center></b></font><br>
<br>
</div>
<table border="0" cellspacing="1" cellpadding="0" align="center">
<tr>
<td nowrap>
<table width='<%=request.getParameter("la15")%>' border="0" cellspacing="1" cellpadding="0" align="right" class=".bdra">
  <tr>
<%
if(request.getParameter("la15")!=null && !request.getParameter("la15").trim().equals("0"))
 {
%>
          <td>&nbsp;</td>
<%
 }
%>
        </tr>
      </table><%if(!request.getParameter("la15").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la15")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">75
        +</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa15")%>' border="0" cellspacing="1" cellpadding="0" align="left" class=".bdrb">
        <tr>
<%if(request.getParameter("pa15")!=null && !request.getParameter("pa15").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa15").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa15")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la14")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la14")!=null && !request.getParameter("la14").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la14").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la14")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">70-74</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa14")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa14")!=null && !request.getParameter("pa14").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa14").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa14")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la13")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la13")!=null && !request.getParameter("la13").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la13").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la13")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">65-69</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa13")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa13")!=null && !request.getParameter("pa13").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa13").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa13")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la12")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la12")!=null && !request.getParameter("la12").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la12").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la12")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">60-64</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa12")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa12")!=null && !request.getParameter("pa12").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa12").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa12")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la11")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la11")!=null && !request.getParameter("la11").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la11").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la11")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">55-59</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa11")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa11")!=null && !request.getParameter("pa11").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa11").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa11")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la10")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la10")!=null && !request.getParameter("la10").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la10").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la10")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">50-54</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa10")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa10")!=null && !request.getParameter("pa10").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa10").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa10")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la9")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la9")!=null && !request.getParameter("la9").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la9").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la9")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">45-49</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa9")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa9")!=null && !request.getParameter("pa9").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa9").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa9")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la8")%>'border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la8")!=null && !request.getParameter("la8").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la8").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la8")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">40-44</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa8")%>'border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa8")!=null && !request.getParameter("pa8").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa8").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa8")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la7")%>' border="0" cellspacing="1" cellpadding="0" bgcolor="#3399FF" align="right">
        <tr>
<%if(request.getParameter("la7")!=null && !request.getParameter("la7").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la7").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la7")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">35-39</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa7")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa7")!=null && !request.getParameter("pa7").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa7").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa7")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la6")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la6")!=null && !request.getParameter("la6").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la6").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la6")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">30-34</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa6")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa6")!=null && !request.getParameter("pa6").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa6").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa6")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la5")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la5")!=null && !request.getParameter("la5").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la5").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la5")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">25-29</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa5")%>' border="0" cellspacing="1" cellpadding="0"align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa5")!=null && !request.getParameter("pa5").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa5").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa5")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la4")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la4")!=null && !request.getParameter("la4").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la4").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la4")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">20-24</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa4")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa4")!=null && !request.getParameter("pa4").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa4").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa4")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la3")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la3")!=null && !request.getParameter("la3").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la3").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la3")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">15-19</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa3")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa3")!=null && !request.getParameter("pa3").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa3").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa3")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la2")%>' border="0" cellspacing="1" cellpadding="0" bgcolor="#3399FF" align="right">
        <tr>
<%if(request.getParameter("la2")!=null && !request.getParameter("la2").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la2").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la2")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">10-14</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa2")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa2")!=null && !request.getParameter("pa2").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa2").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa2")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la1")%>' border="0" cellspacing="1" cellpadding="0" bgcolor="#3399FF" align="right">
        <tr>
<%if(request.getParameter("la1")!=null && !request.getParameter("la1").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la1").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la1")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">5-9</font></b></div>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa1")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa1")!=null && !request.getParameter("pa1").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa1").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa1")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <table width='<%=request.getParameter("la0")%>' border="0" cellspacing="1" cellpadding="0" align="right" bgcolor="#3399FF">
        <tr>
<%if(request.getParameter("la0")!=null && !request.getParameter("la0").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("la0").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("la0")%><%}%></font>
    </td>
    <td nowrap bgcolor="#66CC99">
      <center>
        <b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">0-4 </font></b>
      </center>
    </td>
    <td nowrap>
      <table width='<%=request.getParameter("pa0")%>' border="0" cellspacing="1" cellpadding="0" align="left" bgcolor="#330099">
        <tr>
<%if(request.getParameter("pa0")!=null && !request.getParameter("pa0").trim().equals("0"))
{
%>
          <td>&nbsp;</td>
<%}%>
        </tr>
      </table><%if(!request.getParameter("pa0").trim().equals("0")){%><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("pa0")%><%}%></font>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#330099">Laki-Laki</font></b></font></div>
    </td>
    <td nowrap bgcolor="#FFFFFF">
      <div align="center"><font color="#330099"><b><font size="1"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></font></b></font></div>
    </td>
    <td nowrap>
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#330099">Perempuan</font></b></font></div>
    </td>
  </tr>
</table>
</body>
</html>
