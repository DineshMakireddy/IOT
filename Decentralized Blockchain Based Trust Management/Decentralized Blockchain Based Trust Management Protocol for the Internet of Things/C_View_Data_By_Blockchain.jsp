<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style9 {font-size: 16px;
	font-weight: bold;
}
.style20 {color: #FF0000}
.style21 {color: #FF0000; font-weight: bold; }
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="EU_Main.jsp">IOT Device</a></li>
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
          <div class="entry">
            <p align="center" class="style9">

           <h2><span class="style5">View Fog Data By Blockchain...</span></h2>
           <%@ include file="connect.jsp" %>
		    <%@ page import="java.io.*"%>
		    <%@ page import="java.util.*" %>
		    <%@ page import="java.util.Date" %>
		    <%@ page import="com.oreilly.servlet.*"%>
		    <%@ page import ="java.text.SimpleDateFormat" %>
		    <%@ page import ="javax.crypto.Cipher" %>
		    <%@ page import ="javax.crypto.spec.SecretKeySpec" %>
		    <%@ page import ="java.security.KeyPairGenerator,java.security.KeyPair,java.security.Key" %>
		    <%@ page import ="org.bouncycastle.util.encoders.Base64" %>
		    <%@ page import ="javax.crypto.spec.SecretKeySpec" %>
		    <%@ page import="java.sql.*,java.util.Random,java.security.KeyPair,java.security.KeyPairGenerator,java.security.NoSuchAlgorithmException,java.security.PublicKey,javax.crypto.Cipher,javax.crypto.NoSuchPaddingException" %>  




          <h2 class="style3">&nbsp;</h2>
         
          <div class="clr"></div>
           <%
					  
						// Creation Of Blockchain 
						
						String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10,s11="",s12,s13,hsign;
						int i=0,j=1,k=0,rank=0;
												
						try 
						{
						String str1 = " select distinct(hcode) from fognode_backup ";
						Statement st1 = connection.createStatement();
						ResultSet rs1 = st1.executeQuery(str1);
						while(rs1.next())
						{
						    hsign = rs1.getString(1);
						   	String query="select * from fognode  where hcode = '"+hsign+"' "; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
							int count=1;
					   		while ( rs.next() )
					   		{
							if(count==1)
							{
							count=count+1;
							s11=rs.getString(8);
							
							
							%>
         <style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
         </style>
				 
		
		   <table width="589" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
		   <tr>
               
                <td width="115" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>File Name </strong></div></td>
                <td width="284" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>Content </strong></div></td>
                <td width="127" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>Content Hash Code </strong></div></td>
				<td width="127" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>Secret Key </strong></div></td>
				 <td width="127" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>Rank </strong></div></td>
				  <td width="127" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>Date and Time </strong></div></td>
				   <td width="127" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>Owner Name </strong></div></td>
				    <td width="127" bgcolor="#FFFF00"><div align="center" class="style20 style24"><strong>Ownername Hash Code </strong></div></td>
             </tr>
		   
		 
         <h3 align="center">
<p align="center" class="style1"><span class="style1">Dataset Owner Chain--->::</span> <%=s11%><br>
			    <span class="style1">Dataset Owner Hash Code --->::</span><%=hsign%></p>
	     </h3>
			<div align="center">
			  <%
							
							}
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
	      </div> <tr>
               
                <td><div align="center" class="style20 style25"><strong><%=s2%></strong></div></td>
                <td><div align="center" class="style20 style25"><strong>
                <textarea cols="25" rows="6"><%=s3%></textarea>
                </strong></div></td>
				 <td><div align="center" class="style20 style25"><strong>
			     <textarea cols="25"><%=s4%></textarea>
				 </strong></div></td>
				  <td><div align="center" class="style20 style25"><strong><%=s5%></strong></div></td>
				   <td><div align="center" class="style20 style25"><strong><%=s6%></strong></div></td>
				    <td><div align="center" class="style20 style25"><strong><%=s7%></strong></div></td>
					 <td><div align="center" class="style20 style25"><strong><%=s8%></strong></div></td>
					  <td><div align="center" class="style25">
					    <span class="style21">
					    <textarea cols="25"><%=s9%></div>
					    </textarea>
				        </span></td>
               
              </tr>
 	
	    <%
					 
			   }
			   
			    }
					 
%>
</table>
<p>&nbsp;</p>
<%
			 
			j=1;}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>  
		  
		  
	  <p align="right"><a href="C_Main.jsp">Back</a></p>

    <div class="gadget">
          <ul class="ex_menu"><li></li>
          </ul>
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
