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
<title>C_View_Datasets</title>
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
            <li class="active"><a href="C_Main.jsp">Fog Main</a></li>
			<li><a href="C_Login.jsp">Logout</a></li>
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
          <h2><strong>View Datasets !!!</strong></h2>
            <p><a href="DO_AuditFiles.jsp"></a></p>
            <table width="589" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
              <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
				%>
              <tr>
               
                <td width="115" bgcolor="#FFFF00"><div align="center" class="style24">File Name </div></td>
                <td width="284" bgcolor="#FFFF00"><div align="center" class="style24">Content </div></td>
                <td width="127" bgcolor="#FFFF00"><div align="center" class="style24">Content Hash Code </div></td>
				<td width="127" bgcolor="#FFFF00"><div align="center" class="style24">Secret Key </div></td>
				 <td width="127" bgcolor="#FFFF00"><div align="center" class="style24">Rank </div></td>
				  <td width="127" bgcolor="#FFFF00"><div align="center" class="style24">Date and Time </div></td>
				   <td width="127" bgcolor="#FFFF00"><div align="center" class="style24">Owner Name </div></td>
				    <td width="127" bgcolor="#FFFF00"><div align="center" class="style24">Ownername Hash Code </div></td>

              </tr>
              <%
				
								String dname=(String)application.getAttribute("doname");

				String query="Select * from fognode  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					s6=rs.getString(6);
					s7=rs.getString(7);
					s8=rs.getString(8);
					s9=rs.getString(9);
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt1 = new String(Base64.decode(s3.getBytes()));
					
					%>
              <tr>
               
                <td><div align="center" class="style25"><%=s2%></div></td>
                <td><div align="center" class="style25"><textarea cols="25" rows="6"><%=s3%></textarea></div></td>
				 <td><div align="center" class="style25"><textarea cols="25"><%=s4%></textarea></div></td>
				  <td><div align="center" class="style25"><%=s5%></div></td>
				   <td><div align="center" class="style25"><%=s6%></div></td>
				    <td><div align="center" class="style25"><%=s7%></div></td>
					 <td><div align="center" class="style25"><%=s8%></div></td>
					  <td><div align="center" class="style25"><textarea cols="25"><%=s9%></div></textarea></td>
               
              </tr>
           
              <%
			  
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
            <p align="center"><a href="C_Main.jsp">Back</a></p>
            <div class="article"></div>
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
