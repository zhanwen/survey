<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
       <s:if test="message!=null">
             <script type="text/javascript">
               alert("<s:property value='message'/>");
               </script>
           </s:if>
           
           <s:if test="path!=null">
           <script type="text/javascript">
               document.location.href="<%=path%>/<s:property value='path'/>";
             </script>
           </s:if>
  </body>
</html>
