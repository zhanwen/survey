<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.DAOFactory"%>
<%@ page import="com.iWen.survey.dto.Question" %>
<%@ page import="com.iWen.survey.dao.QuestionDAO" %>
<%@ page import="com.iWen.survey.pager.*" %>

<jsp:useBean id="pageConfig" class="com.iWen.survey.pager.PageConfig"></jsp:useBean>
<jsp:setProperty property="request" name="pageConfig" value="<%=request %>"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	QuestionDAO dao=DAOFactory.getQuestionDAO();
	PageControl pc=new PageControl(dao,pageConfig,"QuestionAdmin.jsp?rand=1");
	pc.setSizePage(5);
	List<Question> sList=pc.getRecord();
 %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'SurveyAudi.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="../Css/Admin.css">
	<script language="JavaScript" src="../Js/Func.js"></script>
	<script language="javascript">window.onload=tableFix;</script>
	<script language="JavaScript" src="../Js/QuestAdd.js"></script>
	<script type="text/javascript">
		function delQuestion(qid){
			if(confirm("确定要删除这个题目吗？")==true)
			window.location="<%=basePath%>question/delQuestion.do?&qid="+qid+"&sid=<%=request.getParameter("sid") %>";
		}
		function showType(typecode){ 
			//typecode: dx--单选 ;fx--复选;
			document.getElementById("qEditor").innerHTML=document.getElementById(typecode).innerHTML;
		}
		function editQuestion(qid){
			var sUrl=setQueryString("op","editQuestion","QuestionEdit.jsp");
			sUrl=setQueryString("sid","<%=request.getParameter("sid")%>",sUrl);
			window.location=setQueryString("qid",qid,sUrl);
		}
		function setJD(qid){
			var sUrl=setQueryString("op","setJD","QuestionJD.jsp");
			sUrl=setQueryString("sid","<%=request.getParameter("sid")%>",sUrl);
			window.location=setQueryString("qid",qid,sUrl);
		} 
		function setTZ(qid){
			var sUrl=setQueryString("op","setTZ","QuestionTZ.jsp");
			sUrl=setQueryString("sid","<%=request.getParameter("sid")%>",sUrl);
			window.location=setQueryString("qid",qid,sUrl);
		} 
</script>
</head>
  <body>
      <div class=nav><a href=admin_main.jsp>桌面</a>»<a href=SurveyAdmin.jsp>问卷列表</a>»题目管理
<hr>
</div>   
 <table class=table cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<th width=7%>编号</th>
<th >题目标题</th>
<th width=20%>操作 <br></th></tr>
<%
for(Question question:sList){
 %>
<tr>
<td><%=question.getQId() %></td>
<td><%=question.getQHead() %></td>
<td><a href="javascript:editQuestion(<%=question.getQId() %>)">查看问题</a>||<a href='javascript:delQuestion(<%=question.getQId() %>)'>删除</a></td></tr>
 <%} %>
<tr> <td colspan=3 align="right"><%=pc.getCurrentPageHTML() %><%=pc.getCountPageHTML() %>|<%=pc.getFirstPageHTML() %>|<%=pc.getPageUpHTML() %>|<%=pc.getPageDownHTML() %>|<%=pc.getLastPageHTML() %></td></tr>
 
</tbody></table>
<table class=table cellspacing="0" cellpadding="0">
<tr><th>添加新题目</th><th></th><th></th></tr>
<tr><td>选择题型：</td><td>
<input name="Question_type" id="qtype_dx" type="radio" value="1" onClick="showType('dx');">单选题 
<input name="Question_type" type="radio" value="2" onClick="showType('fx');">多选题  
</td><td></td></tr>
<tr><td></td><td></td><td></td></tr>
</table>
<div id=qEditor></div>
<div id=dx style="display:none">
<form name="form1" action="<%=basePath%>question/addQuestion.do?op=AddQuestion&type=1" method="post" onSubmit="return SubQuestion();">
	<input type="hidden" value=<%=request.getParameter("sid") %>  name="sid">
	<input type="hidden" value="" name="qBody" id="qBody">
	<input type="hidden" value="" name=qResult id="qResult">
	问题：<input name="qHead" type="text" size="40">
	<br/><br/>
	备选项：
	<ul type="1" id="ulAnswer">
	<li><input type="radio" ><input type="text" name="Answer"></li>
	<li><input type="radio" ><input type="text" name="Answer"></li>
	<li><input type="radio" ><input type="text" name="Answer"></li>
	<li><input type="radio" ><input type="text" name="Answer"></li>
	</ul>
	<div id="button">
	<input type="submit" value="添加题目">
	</div>
</form>
</div>
<div id=fx style="display: none">
<form name="form1" action="<%=basePath%>question/addQuestion.do?op=AddQuestion&type=2" method="post" onSubmit="return SubQuestion();">
	<input type="hidden" value=<%=request.getParameter("sid") %>  name="sid">
	<input type="hidden" value="" name="qBody" id="qBody">
	<input type="hidden" value="" name=qResult id="qResult">
	问题：<input name="qHead" type="text" size="40">
	<br/><br/>
	备选项：
	<ul type="1" id="ulAnswer">
		<li><input type="checkbox"><input type="text" name="Answer"></li>
		<li><input type="checkbox"><input type="text" name="Answer"></li>
		<li><input type="checkbox"><input type="text" name="Answer"></li>
		<li><input type="checkbox"><input type="text" name="Answer"></li>
	</ul>
<div id="button">
	<input type="submit" value="添加题目">
</div>
</form>
 </div>
<script type="text/javascript">
	document.getElementById("qtype_dx").click();
</script>
</body>
</html>
