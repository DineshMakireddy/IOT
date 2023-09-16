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
.style9 {font-size: 16px;
	font-weight: bold;
}
.style19 {
	color: #FF0000;
	font-weight: bold;
}
.style20 {color: #FF0000}
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
          <h2>Download File !!! </h2>
          <p>&nbsp;</p>
          <div class="entry">
            <p align="center" class="style9">
              <%
		  	
			try 
			{
		  		String file = request.getParameter("t14");
				String trapdoor=request.getParameter("t122");
				String dk="";
				String sk=request.getParameter("t1343");
				String user=(String)application.getAttribute("uname");
				
				
				String ct1="",dk1="",sk1="";
				String str="Attacked";
				
				
					String strQuery1 = "select * from fognode where fname='"+file+"' and sk='"+sk+"' and Hashcode='"+trapdoor+"' ";//and trapdoor='"+trapdoor+"'";
					ResultSet rs = connection.createStatement().executeQuery(strQuery1);
					if(rs.next()==true)
					{
					

											String ct=rs.getString(3);
						
											String rank=rs.getString(6);
											
											int updaterank = Integer.parseInt(rank)+1;
											String strQuer = "update fognode set rank='"+updaterank+"' where fname='"+file+"'";
											connection.createStatement().executeUpdate(strQuer);
											
											SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
											SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
											Date now = new Date();
						
											String strDate = sdfDate.format(now);
											String strTime = sdfTime.format(now);
											String dt = strDate + "   " + strTime;	
											
											String skey="Permitted";
											String deckey="Authorized";
											String strQuery2 = "select * from request where fname='"+file+"' and  user='"+user+"' and secretkey='"+skey+"' and decryptkey='"+	deckey+"' ";
							ResultSet rs2 = connection.createStatement().executeQuery(strQuery2);
							if(rs2.next()==true)
							{
											
											String keys1 = "ef50a0ef2c3e3a5f";
											byte[] keyValue11 = keys1.getBytes();
											Key key11 = new SecretKeySpec(keyValue11,"AES");
											Cipher c11 = Cipher.getInstance("AES");
											c11.init(Cipher.DECRYPT_MODE, key11);
											String decryptedValue = new String(Base64.decode(ct.getBytes()));
											%>
              File Contents</p>
            <label>
            <div align="center">
              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
              <br/>
              <br/>
              <td><button onclick="saveTextAsFile()">Download</button>
                  <p align="right"><a href="EU_Main.jsp">Back</a></p></td>
            </div>
            </label>
            <h3 class="style20">
              <%}
										}
										else
										{
											SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
											SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
											Date now = new Date();
											String strDate = sdfDate.format(now);
											String strTime = sdfTime.format(now);
											String dt = strDate + "   " + strTime;
											
											
										String strQuer1 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+sk+"','"+dt+"','Secret Key Attack')";
											connection.createStatement().executeUpdate(strQuer1);
										
											%>
            Secret Key Mismatch !!!            </h3>
            <p class="style20"><a href="EU_Main.jsp">Back</a></p>
            <h3 class="style20">
              <%
								 		}			
									
									
				
	  } 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
          </div>
          <div class="article"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
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
