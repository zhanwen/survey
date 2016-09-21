<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.iWen.survey.dto.User" %>
<div id="banner">
<div class="text" >
<% 
User user=(User)session.getAttribute("user");
if(user==null){ %>
<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[<a href="userLogin.jsp">登录</a>]
&nbsp;&nbsp;[<a href="userReg.jsp">注册</a>]
<%}else{ %>
&nbsp;&nbsp;
欢迎您登录  <%=user.getNickname()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%}%>
	<a href="Survey_list.jsp">问卷列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="Survey_Code.jsp" target="_self">访问私有问卷</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="logout.jsp">安全退出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="login.jsp">管理员登陆</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</div>

