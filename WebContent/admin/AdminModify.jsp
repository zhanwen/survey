<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.AdminDAO" %>
<%@ page import="com.iWen.survey.dao.DAOFactory" %>
<%@ page import="com.iWen.survey.dto.Admin" %>
<%
	String a_id=request.getParameter("aid");
	Long aid;
	if(a_id==null){
		aid=(Long)session.getAttribute("aid");
	}
	else
		aid=Long.valueOf(a_id);
	if(aid==null){
		out.println("对不起，您没有登录！");
		return;
	}
	AdminDAO dao=DAOFactory.getAdminDAO();
	Admin admin=dao.findAdmin(aid);
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script language="JavaScript" src="../Js/Func.js"></script>
<script language="JavaScript" src="../Js/prototype.js"></script>
 <script language="JavaScript" src="../Js/jquery-1.7.2.js"></script>
<script language="javascript">
window.onload=tableFix;
function Check(){
		if($("#email").val()==""){
			alert("请输入邮箱！");
			$("#email").focus();		
			return false;
		}
		if($("#phone").val()==""){
			alert("请输入联系方式！");
			$("#phone").focus();
			return false;
		}
		if(!/^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/.test($("#email").val())){
			alert("邮箱不合法，请重新输入！")
			$("#email").focus();
			return false;
		}
		if(!/^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/.test($("#phone").val())){
			alert("联系方式不合法，请重新输入！")
			$("#phone").focus();
			return false;
		}
		if($("#oldpwd").val()==""){
			alert("请输入原始密码！");
			$("#oldpwd").focus();
			return false;
		}
		
	return CheckPassword('pwd','confirmPwd',6);
}
</script>
 
<link rel="stylesheet" href="../Css/Admin.css" type="text/css" />
</head>
<body>
  <div class=nav><a href=admin_main.jsp>桌面</a>»修改密码
<hr>
</div> 
<div id="admin_surveyAdd_main">
<form name="from1" action="EditAdmin.do" method="post" onSubmit="return Check();">
<table width="585" border="0" cellspacing="0" cellpadding="0" class="table">
  <tr>
    <th>修改密码</th>
    <th>&nbsp;<input name="aid" type="hidden" value=<%=admin.getA_id() %>></th>
    <th width="374"><span class="R">*</span> 为必填项目 </th>
  </tr>
  <tr>
    <td>用户名</td>
    <td><input name="username" type="text" size="50" value=<%=admin.getA_user() %> readonly></td>
    <td width="374"><span class="R">*</span> 用户名不能改</td>
  </tr>
   <tr>
    <td>邮箱</td>
    <td><input name="email" id="email" type="text" size="50" value=<%=admin.getA_email() %> ></td>
    <td width="374"><span class="R">*</span> 邮件地址不能为空</td>
  </tr>
   <tr>
    <td>联系方式</td>
    <td><input name="phone" type="text" id="phone" size="50" value=<%=admin.getA_phone() %> ></td>
    <td width="374"><span class="R">*</span> 联系方式不能空</td>
  </tr>
 <tr>
    <td>旧密码</td>
    <td><input name="oldpwd" id="oldpwd" type="password" size="50"></td>
    <td width="374"><span class="R">*</span> 至少6位</td>
  </tr>
	
  <tr>
    <td>密码</td>
    <td><input name="pwd" id="pwd" type="password" size="50"></td>
    <td width="374"><span class="R">*</span> 至少6位</td>
  </tr>
  <tr>
    <td>密码确认</td>
    <td><input type="password" name="confirmPwd" id=confirmPwd size="50"  ></td>
    <td><span class="R">*</span> 至少6位</td></td>
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