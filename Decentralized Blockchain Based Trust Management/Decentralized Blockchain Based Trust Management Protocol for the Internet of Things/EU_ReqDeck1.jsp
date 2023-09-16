<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%> 
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

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
.style7 {
	font-size: 18px;
	font-weight: bold;
}
.style22 {color: #402C16}
.style23 {color: #FF0000}
.style24 {
	font-size: 18px;
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
          <h2 class="style25">Request Decrypt Key  </h2>
            <h2 class="style25"></h2>
            <h2 class="style25"><span class="style7">
              <%
	try
	{	  
		  String dname=request.getParameter("t142");
		  String fname=request.getParameter("t14");
		  String user=(String)application.getAttribute("uname");
		  
		  SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		  
		  String query="Select * from request where user='"+user+"' and owner='"+dname+"' and fname='"+fname+"' and decryptkey='Requested'";
	      Statement st=connection.createStatement();
          ResultSet rs=st.executeQuery(query);
		  if (rs.next())
		  {
				%>
Decrypt Key Request Already Sent To Cloud !! </span> </h2>
            <p class="style25">&nbsp;</p>
            <p class="style25"><a href="EU_Main.jsp">Back</a></p>
            <h2 class="style25"><span class="style7">
            <%
		  }
		  else
		  {
		  	 String query1="Select * from fognode where fname='"+fname+"' and ownername='"+dname+"'";	  
			 Statement st1=connection.createStatement();
			 ResultSet rs1=st1.executeQuery(query1);
			 if (rs1.next())
			 {
			 	String str="";
			if (str.equalsIgnoreCase(""))
			{
			  	 String query2="Select * from request where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";	  
				 Statement st2=connection.createStatement();
				 ResultSet rs2=st2.executeQuery(query2);
				 if (rs2.next())
				 {
					  String query3="update request set decryptkey='Requested' where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  
				
				%>
            Decrypt Key Request  Sent Sucessfully To Fog Node !! </span>            </h2>
            <p class="style25">&nbsp;</p>
            <p class="style25"><a href="EU_Main.jsp">Back</a> </p>
            <h2 class="style25"><span class="style7">
            <%
				 }
				 else
				 {
				 
					String query3="insert into request(user,owner,fname,secretkey,decryptkey) values('"+user+"','"+dname+"','"+fname+"','No','Requested')";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  
				
				%>
            Decrypt Key Request  Sent Sucessfully To Cloud  !! </span>            </h2>
            <p class="style25">&nbsp;</p>
            <p class="style25"><a href="EU_Main.jsp">Back</a> </p>
            <h2><span class="style24">
            <%
				 }
				}
		else
		{
			%>
            </p>
            </span>
              <h2 class="style23 style31"><strong><span class="style7">Please Wait For Cloud To Verify File ! </span></strong></h2>
              <p class="style25"><span class="style7"><a href="EU_SecretKey.jsp" class="style3">Back</a></span></p>
              <p class="style23">
                  <span class="style7">
                  <%
		}  
			  }
			  else
			  {
				
				%>
              File Not Found !! </span>                        </h2>
            <p class="style22">&nbsp;</p>
            <p class="style22"><a href="EU_Main.jsp">Back</a></p>
            <%
			  }
		 }
		connection.close();
	}
	catch (Exception e)
	{
		out.print(e);
	}
		  %>
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
            <li><a href="EU_ViewFiles.jsp">View Files</a></li>
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
