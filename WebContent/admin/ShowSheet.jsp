<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@ page import="com.iWen.survey.dao.*" %>
<%@ page import="com.iWen.survey.dto.*" %>

<%
String sid=request.getParameter("sid");
String asid=request.getParameter("asid");

ConfigDAO cdao=DAOFactory.getConfigDAO();
Config cfg=cdao.findConfig();

SurveyDAO sdao=DAOFactory.getSurveyDAO();
Survey survey=sdao.findSurvey(Long.valueOf(sid));


AnswersheetDAO adao=DAOFactory.getAnswersheetDAO();
Answersheet sheet=adao.findAnswersheet(Long.valueOf(asid));

QuestionDAO qdao=DAOFactory.getQuestionDAO();


String results=sheet.getAsResult();
String []result=results.split("&@@&");
List<Long> qidlist=new ArrayList<Long>();
for(String s:result){
	//System.out.println("s:"+s);
	qidlist.add(Long.valueOf(s.substring(0,s.indexOf(":"))));
}


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=cfg.getCSiteName() %>---答卷查看---<%=survey.getSName() %></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script language="JavaScript" src="../Js/Func.js"></script>
<script language="javascript1.2">window.onload=tableFix;</script>
 

<link rel="stylesheet" href="../Css/Admin.css" type="text/css" />
<link rel="stylesheet" href="../Css/Style.css" type="text/css" />
  </head>

 <body>
<br> 
<div class=nav style="text-align:left"><a href=admin_main.jsp>桌面</a>»<a href=SurveyStatis.jsp>问卷列表</a>»<a href=ShowSheets.jsp?sid=<%=request.getParameter("sid") %>>答卷列表</a>»查看答卷
<hr>
</div>  
<!--startprint-->
<div id="surveyBox">
<div class="center">
 
<div class="name"><%=survey.getSName() %></div>
<div class="desc"><%=survey.getSDesc() %></div>
<div class="Question_list">
 
<ul type="1">
<div id=parentbox>

 



<%
qlist: 
for(Long qid:qidlist){
  	 Question q=qdao.findQuestion(qid);
  	
	out.println("<li> "+q.getQHead() +" </li>");
	out.println("<ul type='1'>");
 	 String [] body=q.getQBody().split("&\\$\\$&");
 	 
 	switch(q.getQType().intValue()){
 	case 1:
		 		for(int i=0;i<body.length;i++){
		 			
		 				out.println("<li><input type='radio' name='answer"+q.getQId()+"' value='"+i+"' >"+body[i]+"</li>");
		 			}
		 	 
		 			out.println("</ul><br/>");
					out.println("<div id=qbox"+q.getQId()+"></div>");
			break;
			 
	case 2: 
		 	for(int i=0;i<body.length;i++){
		 		out.println("<li><input type='checkbox' name='answer"+q.getQId()+"' value='"+i+"'>"+body[i]+"</li>");
		 	}
		 	out.println("</ul><br/>");
					out.println("<div id=qbox"+q.getQId()+"></div>");
			break;
	
	}

 } %>
</div>
</ul><div id="loading"></div>


</div>

<!--endprint-->
<div id="button" align="center"><input name="button1" type="button" value="打印答卷" onClick="preview();"></div>

<div class="back">
<a href="javascript:history.back();" >&nbsp;返回</a>
</div>
 
</div>
</div>


 
</body>
</html>

<script type="text/javascript">
<!--

<%

for(String s:result){
	String qid=null;
	String text=null;
	String[] as=null;
	qid=s.substring(0,s.indexOf(":"));
	text=s.indexOf("text=")==-1?null:s.substring(s.indexOf("text=")+5).replace("\'","\\'");
	as=s.indexOf("as=")==-1?null:(s.substring(s.indexOf("as=")+3,s.indexOf(";"))).split(",");
	
	if(as==null){
		out.println("answers=document.getElementsByName('answer"+qid+"');") ;
		out.println("answers[0].value='"+text+"'");
	}else
	for(String st:as){
		out.println("answers=document.getElementsByName('answer"+qid+"');") ;
		out.println("answers["+st+"].checked=true;");
		if(text!=null){
			out.println("if("+st+"==answers.length-1)");
			out.println("{ var txt=document.getElementsByName('txtanswer"+qid+"');txt[0].value='"+text+"'    }");
		}
	}
	 
}
%>

//-->
</script>
