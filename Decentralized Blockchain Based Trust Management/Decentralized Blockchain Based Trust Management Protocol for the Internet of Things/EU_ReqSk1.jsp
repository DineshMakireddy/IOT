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
<title>Client</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style28 {
	font-size: 16px;
	font-weight: bold;
	color: #FF0000;
}
.style3 {font-size: 12px}
.style31 {
	font-size: 18px;
	color: #FF0000;
	font-weight: bold;
}
.style32 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="EU_Login.jsp">Client</a></li>
			<li><a href="EU_Login.jsp">Logout</a></li>
        <li></li>
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
          <h2 class="style32">Request Secret Key  </h2>
          <p class="style32">&nbsp;</p>
          <p class="style32">
            <%
try
{
	
	String owner = request.getParameter("t142");
	String fname = request.getParameter("t14");
	String uname=(String)application.getAttribute("uname");
	String generate ="Requested",sk="";
	
	SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
	
	
		String query1="select * from fognode  where fname='"+fname+"' and ownername='"+owner+"' "; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
		if ( rs1.next())
		{
		
			String str="";
			if (str.equalsIgnoreCase(""))
			{
			String query="select * from request  where user='"+uname+"' and fname='"+fname+"' and owner='"+owner+"' "; 
			Statement st=connection.createStatement();
			ResultSet rs=st.executeQuery(query);
			if ( rs.next()==true)
			{
			
				sk=rs.getString(5);
				if(sk.equalsIgnoreCase("Requested"))
				{
					%>
</p>
          <h2 class="style31">Request Already Sent To Data Owner!</h2>
          <p class="style28"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <span class="style32">
          <%
				}
				else if(sk.equalsIgnoreCase("No"))
				{
					String query3="update request set secretkey='Requested' where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"'";
					connection.createStatement().executeUpdate(query3);
					
					%>
          </span>
          <h2 class="style31">Request Sent To Data Owner !</h2>
          <p class="style32"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <span class="style32">
          <%
				}
				else
				{
					%>
          </span>
          <h2 class="style31">Request Already Sent To Data Owner !</h2>
          <p class="style28"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <span class="style32">
          <%
				}		
			}
			else
			{
			
			
			
String query4="insert into request(user,owner,fname,secretkey,decryptkey) values('"+uname+"','"+owner+"','"+fname+"','Requested','No')";
				connection.createStatement().executeUpdate(query4); 
				%>
          </span>
          <h2 class="style31">Request Sent To Data Owner !</h2>
          <p class="style28"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <p class="style28">
            <%
					
			}
		}
		else
		{
			%>
          </p>
          <h2 class="style31">Please Wait For Fognode To Verify File ! </h2>
          <p class="style32"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <p class="style32">
            <%
		}	
			
		}
		else
		{
			%>
          </p>
          <h2 class="style31">File Doesn't Exist / File Is Not Verified By Fognode ! </h2>
          <p><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <p>
            <%
		}
		
	connection.close();
} 
catch(Exception e)
{
out.println(e.getMessage());
}
	%>
          </p>
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
			<li><a href="EU_Main.jsp">Home</a></li>
            <li><a href="EU_Login.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget"></div>
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
