<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.DAOFactory"%>
<%@ page import="com.iWen.survey.dto.Link" %>
<%@ page import="com.iWen.survey.dao.LinkDAO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	LinkDAO dao=DAOFactory.getLinkDAO();
	List<Link> lList=dao.listAllLink();
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
	function DelLink(lid){
		if(confirm("确定要删除这个链接吗？")==true)
		window.location="<%=basePath%>link/DelLink.do?lid="+lid;
	}
	</script>
  </head>
  <body>
    <div class=nav><a href=admin_main.jsp>桌面</a>»友情链接列表
<hr>
</div>   
 <table class=table cellspacing="0" cellpadding="0" align="center">
<tbody><tr>
<th width=7%>编号</th>
<th width=20%>网址</th>
<th>名称</th>
<th width=25%>描述 </th>
<th>操作 <br></th></tr>
<%
	for(Link link:lList){
 %>
<tr>
<td><%=link.getLId() %></td>
<td><a href=<%=link.getLUrl() %>><%=link.getLUrl() %></a></td>
<td><%=link.getLName() %></td>
<td><%=link.getLInfo() %></td>
<td><a href=LinkModifg.jsp?lid=<%=link.getLId() %>>编辑</a>|<a href='javascript:DelLink(<%=link.getLId() %>)'>删除</a></td></tr>
 <%} %>

</tbody></table>
提示：由于版面有限，前台页面上仅显示前7个友情链接，请酌情调整。
</body>
</html>
