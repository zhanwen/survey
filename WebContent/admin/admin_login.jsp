<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.*" %>
<%@ page import="com.iWen.survey.dto.*" %>
<%
String username=request.getParameter("username");
if(username!=null&&!"".equals(username)){
String pwd=request.getParameter("pwd");
AdminDAO dao=DAOFactory.getAdminDAO();
boolean ret=dao.checkPwd(username,pwd);
if(ret==true){
	Admin admin=dao.findAdmin(username);
	session.setAttribute("username",username.toLowerCase());
	
	session.setAttribute("aid",admin.getA_id());
	out.print("<script>alert('登录成功！');window.location='admin/admin_index.jsp';</script>");
}else
	out.print("<script>alert('登录失败,请检查用户名和密码是否错误！');window.location='login.jsp';</script>");

	
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="images/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="Js/jquery-1.7.2.js"></script>
 <script type="text/javascript">
 $(function(){
		$('.captcha').focus(function(){
			$('.yzm-box').show();
			});
			
		$('.captcha').focusout(function(){
			$('.yzm-box').hide();
			});
})
	function sub(){
		debugger
				var email = jQuery("#username").val();
				jQuery("#message-box").html("");
				if(email == ""){//非空检查
				 	alert("用户名不能为空");
			    	return false;
			    }
		    	if(jQuery("#password").val()==""){
		    		  alert("密码不能为空");
		    		  return false;
			   }
		    	jQuery("#ctl00").submit(); 
			}
 </script>
</head>
<body>
<div id="message-box"> 用户名或密码错误！ </div>
<div id="wrap">
	<div id="header"> </div>
    <div id="content-wrap">
    	<div class="space"> </div>
   	  <form name="from1" action="login.jsp" method="post" >
   	  <div class="content">
        <div class="field"><label>账　户：</label><input class="username" name="username" value="" type="text" id="username"/></div>
		<div class="field"><label>密　码：</label><input class="pwd" name="pwd" value="" type="password" id="password"/><br /></div>
        <div class="field"><label><br />
        <div class="yzm-box"> </div>
        </div>
        <div class="btn"><input name="submit" type="submit" class="login-btn" value="" onclick="return sub();" /></div>
      </div>
      </form>
    </div>
    <div id="footer"> </div>
</div>
</body>
</html>
