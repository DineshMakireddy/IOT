<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style21 {font-size: 14px}
.style23 {color: #FF0000}
.style24 {
	font-size: 14px;
	color: #FF0000;
	font-weight: bold;
}
.style25 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="DO_Main.jsp">Data Owner </a></li>
			<li><a href="DO_Login.jsp">Logout</a></li>
      </ul>
    </div>
    <div class="clr"></div>
  </div>
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1>Decentralized Blockchain Based Trust Management Protocol for the Internet of Things</h1>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2 class="style23">Grant Secret Key Permission !!!  </h2>
          <p>&nbsp;</p>
          <table width="618" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="66" height="30" bgcolor="#FFFF00"><div align="center" class="style21 style23"><strong> ID </strong></div></td>
              <td width="127" bgcolor="#FFFF00"><div align="center" class="style24">User Name </div></td>
              <td width="116" bgcolor="#FFFF00"><div align="center" class="style24">Owner Name </div></td>
              <td width="127" bgcolor="#FFFF00"><div align="center" class="style24">File Name </div></td>
              <td width="123" bgcolor="#FFFF00"><div align="center" class="style24">Secret Key </div></td>
            </tr>
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
		String s="null";
		String dname=(String)application.getAttribute("doname");
      		String query="select * from request where owner='"+dname+"'"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		

		
	
		
		%>
            <tr>
              <td height="28"><div align="center" class="style25"><%=i%></div></td>
              <td><div align="center" class="style25"><%=s2%></div></td>
              <td><div align="center" class="style25"><%=s3%></div></td>
              <td><div align="center" class="style25"><%=s4%></div></td>
              <%
			  if(s5.equalsIgnoreCase("No"))
			{
			
		%>
              <td><div class="style25">
                  <div align="center">Not Requested</div>
              </div></td>
              <%
		
			}
			else if(s5.equalsIgnoreCase("Requested"))
			{
			
		%>
              <td><div>
                  <div align="center"><a href="DO_SecPer1.jsp?usid=<%=i%>&amp;fname=<%=s4%>">Give Permission</a></div>
              </div></td>
              <%
		
			}else
			{
		%>
              <td width="17"><div>
                  <div align="center"><%=s5%></div>
              </div></td>
            </tr>
            <%
			  }
	  }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
          </table>
          <p>&nbsp;</p>
          <div class="article"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <input name="button_search" src="images/search_btn.gif" class="button_search" type="image" />
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search" type="text" />
            </span>
          </form>
          <div class="clr"></div>
        </div>
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
            <li><a href="DO_Main.jsp">Home</a></li>
            <li><a href="DO_Login.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
