<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.*" %>
<%@ page import="com.iWen.survey.dto.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	ConfigDAO cdao=DAOFactory.getConfigDAO();
	Config cfg=cdao.findConfig();
	SurveyDAO sdao=DAOFactory.getSurveyDAO();
	List<Survey> slist=sdao.listVisitableSurvey();
	List<Survey> shlist=sdao.listVisitableSurvey(OrderConst.UsehitsDesc);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content=""/>
<meta http-equiv="description" content=""/>
<link rel="stylesheet" href="Css/Style.css" type="text/css" />
 <link rel="stylesheet" href="Css/Admin.css" type="text/css" />
 <link rel="stylesheet" href="Css/login.css" type="text/css" />
 <title><%=cfg.getCSiteName() %>---首页</title>
 <script type="text/javascript" src="Js/jquery-1.7.2.js"></script>

<script type="text/javascript">
		function sub(){
			var num =$("#password").val().length;
			var email = $("#txtEmail").val();
			if(email==""){//非空检查
			    $("#email\\.info").html("邮箱不能为空");
		    	return false;
		    }
			var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
			if(!reg.test(email))
	    	{
		         $("#email\\.info").html("邮箱地址不合法");
		        return false;
	   		 }
	    	if($("#txtNickName").val()==""){
	    		  $("#nickname\\.info").html("昵称不能为空");
	    		  return false;
		    }
	    	if($("#password").val()==""){
	    		  $("#password\\.info").html("密码不能为空");
	    		  return false;
		    }
	    	if(num<6){
	    		  $("#password\\.info").html("密码至少是6位");
	    		  return false;
		    }
	    	if($("#password1").val()==""){
	    		  $("#password1\\.info").html("确认密码不能为空");
	    		  return false;
		    }
	    	if($("#password1").val()!=$("#password").val()){
	    		  $("#password1\\.info").html("两次输入密码不一致!");
	    		  return false;
		    }
	    	$("#form").submit();
		 }
	</script>
</head>
<body>
<div class="login_step">
		注册步骤:
		<span class="red_bold">1.填写信息</span> > 2.注册成功
	</div>
	<div class="fill_message">
		<form name="form" method="post"  action="<%=basePath%>user/addUser.do?op=addUser" id="form">
			<h2>
				以下均为必填项	<input name="reg" type="hidden" id="reg" class="text_input" value="1"/>
			</h2>
		<table class="tab_login" >
			<tr>
				<td valign="top" class="w1">
					请填写您的Email地址：
				</td>
				<td>
					<input name="email" type="text" id="txtEmail" class="text_input"/>
				<div class="text_left" id="emailValidMsg">
						<p>
							请填写有效的Email地址。
						</p>
							<span id="email.info" style="color:red">
							</span>
					</div>
				</td>
			</tr>
			<tr>
				<td valign="top" class="w1">
					设置您在网的昵称：
				</td>
				<td>
					<input name="nickname" type="text" id="txtNickName" class="text_input" />
					<div class="text_left" id="nickNameValidMsg">
						<p>
							您的昵称可以由小写英文字母、中文、数字组成，
						</p>
						<p>
							长度4－20个字符，一个汉字为两个字符。
						</p>
						<span id="nickname.info" style="color:red"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td valign="top" class="w1">
					设置密码：
				</td>
				<td>
					<input name="password" type="password" id="password"
						class="text_input" />
					<div class="text_left" id="passwordValidMsg">
						<p>
							您的密码可以由大小写英文字母、数字组成，长度6－20位。
						</p>
						<span id="password.info" style="color:red"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td valign="top" class="w1">
					再次输入您设置的密码：
				</td>
				<td>
					<input name="password1" type="password" id="password1"
						class="text_input"/>
					<div class="text_left" id="repeatPassValidMsg">
					<span id="password1.info" style="color:red"></span>
					</div>
				</td>
			</tr>
		</table>
		<div class="login_in">
			<input id="btnClientRegister" class="button_1" name="submit"  type="submit" value="注 册" onclick="return sub();"/>
		</div>
	</form>
	</div>
</body>
</html>