<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.iWen.survey.dao.*" %>
<%@ page import="com.iWen.survey.dto.*" %>
<%@ page import="com.iWen.survey.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
ConfigDAO cdao=DAOFactory.getConfigDAO();
Config cfg=cdao.findConfig();
SurveyDAO sdao=DAOFactory.getSurveyDAO();
Long sid=Long.valueOf(request.getParameter("sid"));
Survey survey=sdao.findSurvey(sid);
if(survey==null){
	out.println("对不起，没有这个编号的问卷！");
	return;
}
//问卷开放性校验
if(survey.getSIsAudited()==false){
	out.println("该问卷未通过审核！");
	return;
}
//问卷过期时间校验
if(new java.util.Date().after(survey.getSExpireDate())){
	out.println("该问卷已经因过期而失效！");
	return;
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content=""/>
<meta http-equiv="description" content=""/>
<title>iWen问卷调查系统</title>
<link rel="stylesheet" href="Css/Style.css" type="text/css" />
<script type="text/javascript" src="Js/prototype.js"></script>
<script type="text/javascript">
function jump(obj,to){
var request_url = "ajax_SurveyShow.jsp";       // 需要获取内容的url 
if(to==null)
	to=0;
var request_pars = "to="+to+"&sid="+<%=request.getParameter("sid") %>;//请求参数 
var myAjax = new Ajax.Updater(obj, request_url,{ // 将request_url返回内容绑定到id为result的HTML TAG中 
method     : 'post', //HTTP请求的方法,get or post 
parameters : request_pars, //请求参数 
onFailure  : reportError, //失败的时候调用 reportError 函数 
//onLoading  : loading, //正在获得内容的时候 
onComplete : done //内容获取完毕的时候 
}); 
}
 
function loading() 
{ 
$('loading').innerHTML="<img src='images/indicator.gif'>"; 
} 
function done()
{
var loading=document.getElementById("loading");
loading.innerHTML = ""; 
} 
function reportError(request) 
{ 
alert('Sorry. There was an error.'); 
}
function showNext(obj,qid){
	$(obj).innerHTML="";
	jump(obj,qid);
}

function EndSurvey(qid){
$('qbox'+qid).innerHTML="";
var ret=window.confirm("选择此项意味着问卷终止，确定提交问卷吗？");
if(ret==true)
	$("form_survey").submit();

}
function ChkForm(){
	
	var DIVs=document.getElementsByTagName("div");
	var IDs=new Array();
	var j=0;
	for(i=0;i<DIVs.length;i++){
			var id=DIVs[i].getAttribute("id");
			if(id!=null&&id.indexOf("qbox")!=-1){
				IDs[j++]=DIVs[i].getAttribute("id").substring(4);
			}
	}
	for(i=0;i<IDs.length;i++){
			var answer=document.getElementsByName("answer"+IDs[i]);
			if(answer[0].getAttribute("type")=="textarea"){
				if(answer[0].value==""){
				alert("尚有未填写的题目！");
				return false;
				}
				if(answer[0].value.indexOf('&@@&')!=-1){
					alert("答案不能包含系统保留字符串‘&@@&’！");
					return false;
				}
			}
			else if(answer[0].getAttribute("type")=="radio"||answer[0].getAttribute("type")=="checkbox"){
				 var flag=false;
				 for(j=0;j<answer.length;j++){
				 	if(answer[j].checked==true){
				 		flag=true;
				 		break;
				 	}
				 }
				 if(flag==false){
					 alert("尚有未填写的题目！");
					 return false;
				 }
			} 
			var txtanswer=document.getElementsByName("txtanswer"+IDs[i]);
			for(var k=0;k<txtanswer.length;k=k+1){
				if(txtanswer[i]!=null && txtanswer[i].value.indexOf('&@@&')!=-1){
					alert("答案不能包含系统保留字符串‘&@@&’！");
					return false;
	
				}
			}
	}
	 
	if(confirm('确定要提交问卷吗？')==false)
		return false;
}

</script>
</head>
<body>
<div id="head">
 <img src="images/head.jpg;" style="width:770px;height:140px" />
</div>
<%
//密码校验
if(!"".equals(survey.getSPassword())&&survey.getSPassword()!=null){
	String pwd=request.getParameter("pwd");
	
	if(pwd==null||(pwd.hashCode()!=survey.getSPassword().hashCode())){
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		out.println("<form name=form1 method=post action=SurveyShow.jsp?sid="+request.getParameter("sid")+">");
		out.println("请输入密码：<input type=password name=pwd><input type=submit value=\"提交\">");
		out.println("</form>");
		return;
	}else{
		out.println();
	}
} 

%>
<div id="surveyBox" >
<div class="center" >
<form id="form_survey" name="form1" action="<%=basePath%>showSurvey/showSurvey.do?sid=<%=request.getParameter("sid") %>" method="post" onsubmit="return ChkForm()">
<div class="name"><b><%=survey.getSName() %></b><br/>
<%
QuestionDAO qdao=DAOFactory.getQuestionDAO();
List<Question> qlist=qdao.listAllQuestion(Long.valueOf(request.getParameter("sid")));
out.print("<font size=2>本问卷题目数量上限为："+qlist.size()+" 题</font><br/>");
%>

<%if (!"".equals(survey.getSImg())&&survey.getSImg()!=null){ %>
<img src=UploadImg/<%=survey.getSImg() %> height="250" width="300"/>
<%} %>
</div>
<div class="desc"><%=survey.getSDesc() %></div>
<div class="Question_list">
 
<ol>
<div id=parentbox></div>

</ol><div id="loading"></div>


</div>

<div class="button">
<input type="submit" value="提交问卷" name="submit1"><input type="reset" value="重新填写" name="reset1">
</div>
<div class="backindex">
<a href="index.jsp" target="_self">&nbsp;返回首页</a>
</div>
</form>
</div>
</div>
<script>
jump("parentbox");
</script>
<div id="bottom">
<%=cfg.getCSiteName() %><br/>
<%=cfg.getCopyright() %> 
</div><!--bottom end-->
</body>
</html>
