<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script language="JavaScript" src="../Js/Func.js"></script>
 <script language="JavaScript" src="../Js/prototype.js"></script>
 <script language="JavaScript" src="../Js/jquery-1.7.2.js"></script>
 <link rel="stylesheet" href="../Css/Admin.css" type="text/css" />
 <script language="javascript">
	window.onload=tableFix;
	function Check(){
		if($("#username").val()==""){
				alert("请输入用户名！");
				$("#username").focus();
				return false;
		}
		if($("#email").val()==""){
			alert("请输入邮箱！");
			$("#email").focus();
			return false;
		}
		if($("#phone").val()==""){
			$("#phone").focus();
			alert("请输入联系方式！");
			return false;
		}
		if(!/^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/.test($("#email").val())){
			alert("邮箱不合法，请重新输入！");
			$("#email").focus();
			return false;
		}
		if(!/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/.test($("#phone").val())){
			alert("联系方式不合法，请重新输入！");
			$("#email").focus();
			return false;
		}
		return CheckPassword('pwd','confirmPwd',6);
	}
</script>
</head>
<body>
  <div class=nav><a href=admin_main.jsp>桌面</a>»管理员添加
<hr>
</div> 
<div id="admin_surveyAdd_main">
<form name="from1" action="<%=basePath%>admin/adminAdd.do" method="post" onSubmit="return Check();">

<table width="585" border="0" cellspacing="0" cellpadding="0" class="table">
  <tr>
    <th>管理员添加</th>
    <th>&nbsp;</th>
    <th width="374"><span class="R">*</span> 为必填项目 </th>
  </tr>
  <tr>
    <td>用户名</td>
    <td><input name="userName" id="username" type="text" size="50"></td>
    <td width="374"><span class="R">*</span> 用户名不能为空</td>
  </tr>
  <tr>
    <td>邮箱</td>
    <td><input name="email" id="email" type="text" size="50"></td>
    <td width="374"><span class="R">*</span> 邮箱不能为空</td>
  </tr>
   <tr>
    <td>联系方式</td>
    <td><input name="phone" id="phone" type="text" size="50"></td>
    <td width="374"><span class="R">*</span> 联系方式不能为空</td>
  </tr>
  <tr>
    <td>密码</td>
    <td><input name="userPw" id="pwd" type="password" size="50"></td>
    <td width="374"><span class="R">*</span> 至少6位</td>
  </tr>
  <tr>
    <td>密码确认</td>
    <td><input type=password name="confirmPwd" id="confirmPwd" size="50"></td>
    <td> &nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td width="179">&nbsp;</td>
    <td>
	<div id="button">
	<input type="submit" name="submit" value="完成">
	<input type="button" onclick="javascript:history.back();" value="取消">
	</div>	</td>
    <td>&nbsp;</td>
  </tr>
</table>  
</form>
</div>
<div id="admin_surveyAdd_bottom">
</div>
</body>
</html>