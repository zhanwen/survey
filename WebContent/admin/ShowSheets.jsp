<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.DAOFactory"%>
<%@ page import="com.iWen.survey.dto.Answersheet" %>
<%@ page import="com.iWen.survey.dao.AnswersheetDAO" %>
<%@ page import="com.iWen.survey.pager.*" %>
<jsp:useBean id="pageConfig" class="com.iWen.survey.pager.PageConfig"></jsp:useBean>
<jsp:setProperty property="request" name="pageConfig" value="<%=request %>"/>
<%
	AnswersheetDAO dao=DAOFactory.getAnswersheetDAO();
	PageControl pc=new PageControl(dao,pageConfig,"ShowSheets.jsp?rand=1");
	pc.setSizePage(20);
	List<Answersheet> aList=pc.getRecord();
 %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
function DelSheet(asid,sid){
	if(confirm("确定要删除这个答卷吗？")==true)
	window.location="<%=basePath%>statisManage/delSheet.do?op=DelSheet&asid="+asid+"&sid="+sid;
}
</script>
  </head>
  <body>
 <div class=nav style="text-align:left"><a href=admin_main.jsp>桌面</a>»<a href=SurveyStatis.jsp>问卷列表</a>»答卷列表
 <hr>
 </div>   
 <table class=table cellspacing="0" cellpadding="0" align="center">
<tbody><tr>
<th width=7%>编号</th>
<th width=20%>提交日期</th>
<th width=15%>用户IP<br></th>
<th>操作 <br></th></tr>
<%
for(Answersheet answersheet:aList){
 %>
<tr>
<td><%=answersheet.getAsId() %></td>
<td><%=answersheet.getAsPostdate() %></td>
<td><%=answersheet.getAsUserIp() %></td>
<td><a href=ShowSheet.jsp?asid=<%=answersheet.getAsId() %>&sid=<%=answersheet.getSurvey() %>>查看</a>|<a href="javascript:DelSheet(<%=answersheet.getAsId() %>,<%=answersheet.getSurvey() %>)">删除</a></td>
</tr>
 <%} %>
<tr> <td colspan=7 align="right"><%=pc.getCurrentPageHTML() %><%=pc.getCountPageHTML() %>|<%=pc.getFirstPageHTML() %>|<%=pc.getPageUpHTML() %>|<%=pc.getPageDownHTML() %>|<%=pc.getLastPageHTML() %></td></tr>
</tbody></table></body>
</html>
