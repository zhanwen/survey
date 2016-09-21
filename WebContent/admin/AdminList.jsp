<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.DAOFactory"%>
<%@ page import="com.iWen.survey.dto.Admin" %>
<%@ page import="com.iWen.survey.dao.AdminDAO" %>
<%@ page import="com.iWen.survey.pager.*" %>
<jsp:useBean id="pageConfig" class="com.iWen.survey.pager.PageConfig"></jsp:useBean>
<jsp:setProperty property="request" name="pageConfig" value="<%=request %>"/>

<%
    String username=(String)session.getAttribute("username");
	if (!"admin".equals(username)){
		out.println("您权限不足！");
		return;
	}
	AdminDAO dao=DAOFactory.getAdminDAO();
	List<Admin> aList=dao.listAllAdmin();
 %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     
    <title>My JSP 'SurveyAudi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
	<link rel="stylesheet" type="text/css" href="../Css/Admin.css">
	 <script language="JavaScript" src="../Js/Func.js"></script>
	<script language="javascript">window.onload=tableFix;</script>
	<script type="text/javascript">
		function DelAdmin(aid){
			if(confirm("确定要删除这个用户吗？")==true)
				window.location="adminDel.do?userId="+aid;
			}
	</script>
  </head>
  
  <body>
    <div class=nav><a href=admin_main.jsp>桌面</a>»管理员列表
<hr>
</div>   
 <table class=table cellspacing="0" cellpadding="0" align="center">
<tbody><tr>
<th width=7%>编号</th>
<th width=20%>用户名</th>
<th width=20%>联系方式</th>
<th width=20%>邮箱</th>
<th width=15%>密码 <br></th>
<th>操作 <br></th></tr>
<%
for(Admin admin:aList){
 %>
<tr>
<td><%=admin.getA_id() %></td>
<td><%=admin.getA_user() %></td>
<td><%=admin.getA_phone() %></td>
<td><%=admin.getA_email() %></td>
<td><%=admin.getA_pass() %></td>
<td><a href=AdminModify.jsp?aid=<%=admin.getA_id() %>>编辑用户</a>|<a href='javascript:DelAdmin(<%=admin.getA_id() %>)'>删除</a></td></tr>
 <%} %>

</tbody></table></body>
</html>
