       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Service Provider </title>
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
            <li class="active"><a href="DO_Main.jsp">Service Provider </a></li>
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
       <h2 class="star" align="left"><span><span class="style6">Uploaded  Datasets Status !!! </span><span class="style6"></span> </span></h2>
          <p class="star" align="center">&nbsp;</p>
		  
		   <%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
 
 
    <%@ page import ="java.io.FileNotFoundException" %>  
    <%@ page import ="java.io.IOException" %>  
    <%@ page import ="java.util.Iterator" %>  
    <%@ page import ="java.util.ArrayList" %> 
    <%@ page import="org.apache.poi.xssf.usermodel.*" %>
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFCell" %>  
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFRow" %>  
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFSheet" %>  
    <%@ page import ="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>  
    <%@ page import ="org.apache.poi.poifs.filesystem.POIFSFileSystem" %>
    <%@ page import="org.apache.poi.ss.usermodel.Cell" %>
    <%@ page import ="org.apache.poi.ss.usermodel.Row"%>
    <%@ page import="org.apache.poi.ss.usermodel.Sheet" %>
    <%@ page import="org.apache.poi.ss.usermodel.Workbook" %>
    <%@ page import ="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>

	
	
	
 
	
    <%
    try{
	
   	    String fname=request.getParameter("fname");
	
        long stime=System.currentTimeMillis();
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
		Date now = new Date();				
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt=strDate+" "+strTime;
						
		String ownername=(String) application.getAttribute("doname");
		
		String sql="delete from fognode where ownername='"+ownername+"' ";
		Statement stmt = connection.createStatement();
		stmt.executeUpdate(sql);
		
		String sql1="delete from fognode_backup where ownername='"+ownername+"' ";
		Statement stmt1 = connection.createStatement();
		stmt.executeUpdate(sql1);
		
		
		
		
		String sql22="delete from results where ownername='"+ownername+"' ";
		Statement stmt22 = connection.createStatement();
		stmt22.executeUpdate(sql22);
		
		
	   String Fid,Ct;
       connection.setAutoCommit(false);
       PreparedStatement pstm = null ;
       FileInputStream input = new FileInputStream(getServletContext().getRealPath("/")+"//"+fname);
	  
	  
       POIFSFileSystem fs = new POIFSFileSystem(input); //creating a new poi reference to the given excel file
       HSSFWorkbook wb = new HSSFWorkbook(fs);
       HSSFSheet sheet = wb.getSheetAt(0);
       Row row;
       Statement st=connection.createStatement();
       for(int i=1; i<=sheet.getLastRowNum(); i++){  //points to the starting of excel i.e excel first row
           row = (Row) sheet.getRow(i);  //sheet number
 
                  if( row.getCell(0)==null) { Fid = "0";}  //suppose excel cell is empty then its set to 0 the variable
                  else Fid = row.getCell(0).toString();   //else copies cell data to name variable
				  
				  if( row.getCell(1)==null) { Ct = "0";}
				  else Ct = row.getCell(1).toString();
				  
				  
				KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
				Cipher encoder = Cipher.getInstance("RSA");
				KeyPair kp = kg.generateKeyPair();

				Key pubKey = kp.getPublic();

				byte[] pub = pubKey.getEncoded();
//				System.out.println("PUBLIC KEY" + pub);
		
				String pk = String.valueOf(pub);
				String rank="0";
				  
				   String filename1="filename.txt";
      				PrintStream p1 = new PrintStream(new FileOutputStream(filename1));
					p1.print(new String(ownername));
			
					MessageDigest md1 = MessageDigest.getInstance("SHA1");
					FileInputStream fis111 = new FileInputStream(filename1);
					DigestInputStream dis11 = new DigestInputStream(fis111, md1);
					BufferedInputStream bis11 = new BufferedInputStream(dis11);
					//Read the bis so SHA1 is auto calculated at dis
					while (true) {
						int b11 = bis11.read();
						if (b11 == -1)
							break;
					}
 
					BigInteger bi11 = new BigInteger(md1.digest());
					String spl11 = bi11.toString();
					String h2 = bi11.toString(16);
				  
				  
				    String filename="filename.txt";
      				PrintStream p = new PrintStream(new FileOutputStream(filename));
					p.print(new String(Ct));
			
					MessageDigest md = MessageDigest.getInstance("SHA1");
					FileInputStream fis11 = new FileInputStream(filename);
					DigestInputStream dis1 = new DigestInputStream(fis11, md);
					BufferedInputStream bis1 = new BufferedInputStream(dis1);
					//Read the bis so SHA1 is auto calculated at dis
					while (true) {
						int b1 = bis1.read();
						if (b1 == -1)
							break;
					}
 
					BigInteger bi1 = new BigInteger(md.digest());
					String spl1 = bi1.toString();
					String h1 = bi1.toString(16);
					
					String keys = "ef50a0ef2c3e3a5f";
			    byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue,"AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE,key);
				String keyy = String.valueOf(keyValue);
				
      	        String cont = new String(Base64.encode(Ct.getBytes()));
								
		   	    out.print(cont);
				
			Statement stss=connection.createStatement();
			stss.executeUpdate("insert into  fognode(fname,ct,Hashcode,sk,rank,dt,ownername,hcode) values ('"+Fid+"','"+cont+"','"+h1+"','"+pk+"','"+rank+"','"+dt+"','"+ownername+"','"+h2+"')"); 
			
			Statement stss1=connection.createStatement();
			stss1.executeUpdate("insert into  fognode_backup(fname,ct,Hashcode,sk,rank,dt,ownername,hcode) values ('"+Fid+"','"+cont+"','"+h1+"','"+pk+"','"+rank+"','"+dt+"','"+ownername+"','"+h2+"')"); 
			

					long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont.length())*ttime)/1024;
					
					Statement st1111=connection.createStatement();
				st1111.executeUpdate("insert into  results values ('"+Fid+"','"+ttime+"','"+tpt+"','"+ownername+"')"); 
			
			
           
       }
       connection.commit();
       pstm.close();
       connection.close();
       input.close();
 
   }catch(Exception e){
       
   }
 
 
%>
		 <h2>Datasets Uploaded Successfully !!!</h2>
		<a href="DO_Main.jsp">Back</a>  
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
