<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.*" %>
<%@ page import="com.iWen.survey.dto.*" %>
<%
	ConfigDAO cdao=DAOFactory.getConfigDAO();
	Config cfg=cdao.findConfig();
	SurveyDAO sdao=DAOFactory.getSurveyDAO();
	List<Survey> slist=sdao.listVisitableSurvey();
	List<Survey> shlist=sdao.listVisitableSurvey(OrderConst.UsehitsDesc);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content=""/>
<meta http-equiv="description" content=""/>
<link rel="stylesheet" href="Css/Style.css" type="text/css" />
 <link rel="stylesheet" href="Css/Admin.css" type="text/css" />
<title><%=cfg.getCSiteName() %>---首页</title>
<style type="text/css">

</style>
</head>
<body>
<div id="head">
	<div>
		<img src="images/head.jpg;" style="width:770px;height:180px">
		<span>
			<h1><a href="index.jsp">iWen</a></h1>
			<p>问卷调查系统</p>
		</span>
	</div>
</div>
<%@ include file="banner.jsp"%>
<div id="main" class="middle">
<div id="main_1">
<div class="title">最新问卷</div>
<div class="head_new_flash">

<%boolean result = cfg.getCIsOpen();
	if(!result) {
		response.sendRedirect("OpResult.jsp?cfg=" + (result == true ? 1 : 0));
	}else {
	}
		
%>

<script type='text/javascript'>

	var imgUrl = new Array();
	var imgtext = new Array();
	var imgLink = new Array();
	<%
	int k=0;
	for(Survey s:slist){
		if(s.getSImg()!=null && (!"".equals(s.getSImg()))&&s.getSImg().endsWith(".jpg")){
			out.println("imgUrl["+k+"]='UploadImg/"+s.getSImg()+"';");
			out.println("imgtext["+k+"]='"+s.getSName()+"';");
			out.println("imgLink["+k+"]='SurveyShow.jsp?sid="+s.getSId()+"';");
			k++;
		}
	}
	%>
	var pics=imgUrl[0];
	var links=imgLink[0];
	var texts=imgtext[0];
	for(var i=1;i<imgUrl.length;i++){
		pics+='|'+imgUrl[i];
		links+='|'+imgLink[i];
		texts+='|'+imgtext[i];
	}
	var focus_width=250;
	var focus_height=188;
	var text_height=22;
	var swf_height = focus_height+text_height;
</script>
</div>
<div class="head_new_list">
<ol>
<% 
int i=0;
for(Survey s:slist){
	if(i>7)
		break;
	if(s.getSIsAudited()==false||s.getSIsOpen()==false)
		continue;
%>
<li class=li><a href="SurveyShow.jsp?sid=<%=s.getSId() %>" target="_blank"><%=s.getSName().length()>12?s.getSName().substring(0,11)+"...":s.getSName() %></a>&nbsp;&nbsp;&nbsp;&nbsp;<i><font color=grey><%=s.getSCreateDate() %></font></i></li>
 <%
i++;
}
 %>
</ol>
</div>
</div>
<div id="main_2">
<div class="title">热门排行榜</div>
<div class="paihang_content">

<ol class="list-item" >
<%
for(Survey s:shlist){
	if(i>10)
		break;
	if(s.getSIsAudited()==false||s.getSIsOpen()==false)
		continue;
%>
<li ><a href="SurveyShow.jsp?sid=<%=s.getSId() %>" target="_blank"><%=s.getSName().length()>12?s.getSName().substring(0,11)+"...":s.getSName()%></a></li>
<%
}
%>
</ol>
</div>
</div><!--main_2 end-->
</div><!--main end-->

<%
LinkDAO ldao=DAOFactory.getLinkDAO();
List<Link> llist=ldao.listAllLink();
%>
<div id="indexFriend" class="middle">
<div class="title">友情链接</div>
<div class="main" >
 <ul >
 
<%
int j=0;
for(Link link:llist){
	if(j>6)
		break;
	j++;
%>
<li class=friendBox><a href=<%=link.getLUrl() %> target="_blank"><%=link.getLName()%> </a></li>

<%} %>
</ul>
 
</div>
</div>


<div id="bottom">
	<%=cfg.getCSiteName() %><br/>
	<%=cfg.getCopyright() %> 
</div><!--bottom end-->
</body>
</html>