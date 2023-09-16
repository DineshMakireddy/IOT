<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>IOT Device</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style18 {color: #FF0000}
.style19 {font-weight: bold; font-size: 24;}
.style20 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="EU_Login.jsp">IOT Device</a></li>
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
          <h2 class="style20">Search File </h2>
            <table width="524" border="1.5" cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td width="74" height="29" bgcolor="#FFFF00"><div align="center" class="style18"><span class="style19">File ID </span></div></td>
                <td width="144" bgcolor="#FFFF00"><div align="center" class="style18"><span class="style19">File Name </span></div></td>
                <td width="124" bgcolor="#FFFF00"><div align="center" class="style18"><span class="style19">Trust Value </span></div></td>
               
              </tr>
              <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
    String user=(String)application.getAttribute("uname");
try 
  {
            String keyword = request.getParameter("t14");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue, "AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
      		String search = new String(Base64.encode(keyword.getBytes()));
		
			
			String found="NO";
			String query4="select * from fognode"; 
			Statement st4=connection.createStatement();
			ResultSet rs=st4.executeQuery(query4);
			while ( rs.next() )
			{
				
						i=rs.getInt(1);
						s2=rs.getString(2);
						s3=rs.getString(3);
						s4=rs.getString(6);
						
						c.init(Cipher.DECRYPT_MODE,key);
						String decryptedValue = new String(Base64.decode(s3.getBytes()));
						
						
						if((decryptedValue.contains(keyword))||(s2.contains(keyword)))
						{
								int updaterank = Integer.parseInt(s4)+1;
								String strQuery2 = "update fognode set rank='"+updaterank+"' where fname='"+s2+"'";
								connection.createStatement().executeUpdate(strQuery2);
								
								found="YES";
								%>
              <tr>
                <td height="28"><div align="center"><strong><%=i%></strong></div></td>
                <td><div align="center"><strong><%=s2%></strong></div></td>
                <td><div align="center"><strong><%=s4%></strong></div></td>
                
              </tr>
              <%
							
						}
					
			}	
			if(found.equals("NO"))
				{ 
					%>
              <h2>No File Found !!!</h2>
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
            <p align="right"><a href="EU_Main.jsp">Back</a></p>
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
			<li><a href="EU_Main.jsp">Home</a></li>
            <li><a href="EU_ViewFiles.jsp">View Files</a> </li>
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
