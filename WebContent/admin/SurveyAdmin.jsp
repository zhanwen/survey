<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.DAOFactory"%>
<%@ page import="com.iWen.survey.dto.Survey" %>
<%@ page import="com.iWen.survey.dao.SurveyDAO" %>
<%@ page import="com.iWen.survey.pager.*" %>
<jsp:useBean id="pageConfig" class="com.iWen.survey.pager.PageConfig"></jsp:useBean>
<jsp:setProperty property="request" name="pageConfig" value="<%=request %>"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	SurveyDAO dao=DAOFactory.getSurveyDAO();
	PageControl pc=new PageControl(dao,pageConfig,"SurveyAdmin.jsp");
		pc.setSizePage(20);
	 
	List<Survey> sList=pc.getRecord();
	
	 

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
function DelSurvey(sid){
if(confirm("确定要删除这个问卷吗？")==true)
window.location="<%=basePath%>surveyManage/delSurvey.do?op=DelSurvey&sid="+sid;
}
</script>
</head>
<body>
<div class=nav><a href=admin_main.jsp>桌面</a>»问卷列表<hr></div>   
 <table class=table cellspacing="0" cellpadding="0" align="center">
<tbody><tr>
<th width=7%>编号</th>
<th width=20%>问卷名称</th>
<th width=15%>发起者 <br></th>
<th>创建时间 <br></th>
<th>结束日期<br></th>
<th width=7%>审核 <br></th>
<th>操作 <br></th></tr>
<%
for(Survey survey:sList){
 %>
<tr>
<td><%=survey.getSId() %></td>
<td><%=survey.getSName() %></td>
<td><%=survey.getSAuthor() %></td>
<td><%=survey.getSCreateDate() %></td>
<td><%=survey.getSExpireDate() %></td>
<td><%=survey.getSIsAudited()?"<img src='images/on.gif'>":"<img src='images/off.gif'>" %></td>
<td><a href=../SurveyShow.jsp?sid=<%=survey.getSId() %> target="_blank">预览</a>|<%=survey.getSIsAudited()?"<span title='为了保证数据完整和准确性，已经通过审核的问卷不能再被编辑！'><font color=grey>编辑问卷</font></span>|<span title='为了保证数据完整和准确性，已经通过审核的问卷不能再被编辑！'><font color=grey>管理题目</font></span>":"<a href=SurveyEdit.jsp?sid="+survey.getSId()+ ">编辑问卷</a>|<a href=QuestionAdmin.jsp?sid="+survey.getSId()+">管理题目</a>" %>|<a href='javascript:DelSurvey(<%=survey.getSId() %>)'>删除</a></td></tr>
 <%} %>
<tr> <td colspan=7 align="right"><%=pc.getCurrentPageHTML() %><%=pc.getCountPageHTML() %>|<%=pc.getFirstPageHTML() %>|<%=pc.getPageUpHTML() %>|<%=pc.getPageDownHTML() %>|<%=pc.getLastPageHTML() %></td></tr>
</tbody></table></body>
</html>
