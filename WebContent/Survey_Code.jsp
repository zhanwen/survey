<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.*" %>
<%@ page import="com.iWen.survey.dto.*" %>
 
 
<%
ConfigDAO cdao=DAOFactory.getConfigDAO();
Config cfg=cdao.findConfig();

 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content=""/>
<meta http-equiv="description" content=""/>
<link rel="stylesheet" href="Css/Style.css" type="text/css" />
<link rel="stylesheet" href="Css/Admin.css" type="text/css" />
<script language="JavaScript" src="Js/Func.js"></script>
<script language="javascript">window.onload=tableFix;</script>
<script>
function ChkCode(){
	var sid=document.getElementById("sid");
	if (sid.value=="" || sid.value==null){ 
		alert("请输入问卷编号！");
		return false;
	}
	if (isNaN(sid.value)){
		alert("编号应为数字！");	
		return false;
	}
}

</script>


<title><%=cfg.getCSiteName() %>---访问私有问卷</title>
</head>
<body>
<div id="head">
<img src="images/head.jpg;" style="width:770px;height:140px">
</div>
<%@ include file="banner.jsp"%>
<div id="box">
<div class="title">访问私有问卷</div>
<div class="boxContent">
<br/> 
<form action="SurveyShow.jsp" method=post name=form1 onsubmit="return ChkCode()">
请输入由问卷发起单位提供的问卷编号 <input type="text" id="sid" name=sid />  
<input type="submit" name="submit1" value="提交"  />
<br/>
<br/>
<br/>
</form>
</div>
</div><!--box end-->



<div id="bottom">
<%=cfg.getCSiteName() %><br/>
<%=cfg.getCopyright() %> 
</div><!--bottom end-->
</body>

</html>
