<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style17 {font-size: 14; }
.style21 {font-size: 14; color: #FF0000; font-weight: bold; }
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
          <h2><span><marquee behavior="alternate">Request Secret Key </marquee> </span></h2>
          <p>&nbsp;</p>
          <form action="EU_ReqSk1.jsp" method="post" id="leavereply">
              <div align="center">
                <table width="523" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <th height="48" bgcolor="#FFFF00" scope="row"><span class="style21">Enter Owner Name :&nbsp;</span></th>
                    <td><span class="style17">
                      <input name="t142" type="text" size="30" />
                    </span></td>
                  </tr>
                  <tr>
                    <th height="35" bgcolor="#FFFF00" scope="row"><span class="style21"> Enter File Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></th>
                    <td><span class="style17">
                      <input name="t14" type="text" size="30" />
                    </span></td>
                  </tr>
                </table>
                <p align="left" class="style17">&nbsp;</p>
                <p align="center" class="style17">
                  <input name="Submit" type="submit" class="style21" value="Request Secret Key" />
                </p>
                <p align="right" class="style17"><a href="EU_Main.jsp">Back</a></p>
              </div>
              <label for="name"></label>
          </form>
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
