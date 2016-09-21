<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ page import="com.iWen.survey.util.StringUtil" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP '' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
	<link rel="stylesheet" type="text/css" href="../Css/Admin.css">
	 
  </head>
  <%
  String operation=request.getParameter("op");
  String result=request.getParameter("ret");
  if("SurveyAdd".equals(operation)){
  		if("true".equals(result)){
  			out.print("<script>alert('添加问卷操作已成功！')</script>");
  			out.print("<script>window.location='SurveyAdmin.jsp'</script>");
  		}
  		else
  			out.print("添加问卷操作失败，请联系管理员！");
  
  }else if("SurveyEdit".equals(operation)){
  		if("true".equals(result))
  			out.print("编辑问卷操作已成功！");
  		else
  			out.print("编辑问卷操作失败，请联系管理员！");
  
  }else if("SurveyDel".equals(operation)){
  		if("true".equals(result))
  			out.print("删除问卷操作已成功！");
  		else
  			out.print("删除问卷操作失败，请联系管理员！");
  
  }  else if("SysConfig".equals(operation)){
  		if("true".equals(result))
  			out.print("配置操作已成功！");
  		else
  			out.print("配置操作失败，请联系管理员！");
  
  }else if("SurveyAudi".equals(operation)){
  		if("true".equals(result))
  			out.print("操作已成功！");
  		else
  			out.print("操作失败，请联系管理员！");
  }else if("Question".equals(operation)){
  		if("true".equals(result)){
  			
  			out.print("<script>alert('操作已成功！');window.location='../admin/QuestionAdmin.jsp?sid="+request.getParameter("sid")+"';</script>");
  			 
  			}
  		else
  			out.print("处理“问题”操作失败，请联系管理员！");
  }else if("ShowSurvey".equals(operation)){
  		if("true".equals(result)){
  			
  			out.print("<script>alert('操作已成功！');window.location='../index.jsp';</script>");
  			 
  			}
  		else
  			out.print("问卷处理操作失败，请联系管理员！");
  }else if("DelSheet".equals(operation)){
  		if("true".equals(result)){
  			
  			out.print("<script>alert('操作已成功！');window.location='../index.jsp';</script>");
  			 
  			}
  		else
  			out.print("答卷处理操作失败，请联系管理员！");
  }else if("default".equals(operation)){
	  if("true".equals(result))
		  out.print(StringUtil.encodeString(request.getParameter("words")));
	  else
		  out.print(StringUtil.encodeString(request.getParameter("words")));
  }
  
   %>
  <body>&nbsp;<br>
  </body>
</html>
