<%@ page language="java" import="java.util.* " pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.ConfigDAO" %>
<%@ page import="com.iWen.survey.dao.DAOFactory" %>
<%@ page import="com.iWen.survey.dto.Config"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	ConfigDAO configdao=DAOFactory.getConfigDAO();
	Config cfg=configdao.findConfig();
 %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'SysConfig.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../Css/Admin.css">
</head>
<body> 
 <div class=nav><a href=admin_main.jsp>桌面</a>»网站信息配置<br>
<form method="post" action="<%=basePath%>config/config.do" name="form1">
<table class=table>
<tbody>
	<tr>
		<th colspan="3" align="center" >系统配置项</th>
	</tr>
	<tr>
		<td>&nbsp;网站名称：</td>
		<td><input type="text" maxlength="50" size="30" name="siteName"></td>
		<td>&nbsp;<font color=red>* </font>给网站起个名字，将显示在浏览器标题栏上</td></tr>
	<tr>
	<td>&nbsp;网站URL：</td>
	<td><input type="text" maxlength="100" size="30" name="siteURL" ></td>
	<td>&nbsp;<font color=red>*</font> 指定网站的网址，如: www.***.com<br></td></tr>
	<tr>
	<td>&nbsp;网站开关：</td>
	<td><input type="radio" value="true" name="siteOpen"  <%=cfg.getCIsOpen()?"checked":"" %>>开启  
		<input type="radio" value="false" name="siteOpen" <%=cfg.getCIsOpen()?"":"checked" %>>关闭
	</td>
	<td>&nbsp;</td>
	</tr>
<tr>
<td>&nbsp;关闭原因：</td>
<td width=70px valign="middle"><textarea cols="30" rows="3" name="closeWord" ><%=cfg.getCCloseWord() %></textarea></td>
<td>&nbsp;&nbsp;&nbsp; 在网站关闭时用户看到的信息</td></tr>
<tr>
<td>&nbsp;版权信息：</td>
<td><input type="text" maxlength="50" size="30" name="copyright" ></td>
<td>
</td>
</tr>
<tr>
	<td valign="top"><br></td>
	<td valign="top"><br></td>
	<td valign="top"><br></td>
</tr>
<tr><td valign="top"><br></td>
	<td valign="top" align="center">
	<input type="submit" value="提交" name="button2">&nbsp;&nbsp;&nbsp;
	<input type="button" onclick="javascript:history.back();" value="取消">
	</td>
	<td valign="top"><br></td>
</tr>
<tr>
	<td valign="top"><br></td>
	<td valign="top"><br></td>
	<td valign="top"><br></td>
</tr>
</tbody>
</table>
</form>
</body>
<script type="text/javascript">
document.forms[0].siteName.value="<%=cfg.getCSiteName().replace("\"","\\\"") %>";
document.forms[0].siteURL.value="<%=cfg.getCSiteUrl().replace("\"","\\\"") %>";
document.forms[0].copyright.value="<%=cfg.getCopyright().replace("\"","\\\"") %>";
</script>
</html>

