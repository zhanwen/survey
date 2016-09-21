<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>普通用户登录</title>
<link href="images/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="Js/jquery-1.7.2.js"></script>
<script type="text/javascript">
		function sub(){
	    	$("#from1").submit(); 
		}
</script>
</head>
<body>
<div id="wrap">
	<div id="header"> </div>
   		 <div id="content-wrap">
    	<div class="space"> </div>
		   	<form name="from1" action="<%=basePath%>user/userLogin.do?op=userLogin" method="post" id="from1" >
		   	  <div class="content">
		   	  <input name="reg" type="hidden" id="reg" class="text_input" value="1"/>
			        <div class="field"><label>账　户：</label><input class="username" name="nickname" value="" type="text" /></div>
					<div class="field"><label>密　码：</label><input class="password" name="password" value="" type="password" /><br /></div>
			        <div class="field"><br />
      		</div>
      <div class="btn"><input type="submit" class="login-btn" value=""onclick="return sub();"/></div>
      </div></form>
    </div>
    <div id="footer"> </div>
</div>
</body>
</html>


 