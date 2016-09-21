<%@ page language="java" import="java.io.*,java.util.*,org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'upload.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="../Css/Admin.css">
    <style type="text/css">
		body {margin-top:0px ; margin-left:0px}
	</style>
  </head>
  <body>
<% 
if(ServletFileUpload.isMultipartContent(request)){
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List items = upload.parseRequest(request);
	Iterator iter = items.iterator();

	while (iter.hasNext()) {
   		 FileItem item = (FileItem) iter.next();
   		if (!item.isFormField()) {
	     String contentType = item.getContentType();
	     	System.out.print(contentType);
	     long sizeInBytes = item.getSize();
	     	System.out.print(sizeInBytes);
 	 if((contentType.equals("image/gif")||contentType.equals("image/jpeg"))&&sizeInBytes<=1024*1024){
	 	String appendix;
	 	if("image/gif".equals(contentType))
	 		appendix=".gif";
	 	else
	 		appendix=".jpg";
	 	String path=pageContext.getServletContext().getRealPath("/UploadImg")+"/";
	 	String newfilename=new Date().getTime()+Math.round(Math.random()*100)+appendix;
	    File uploadedFile = new File(path+newfilename);
	    item.write(uploadedFile);
	    out.println("<script>window.parent.document.getElementById('imgfilepath').value='"+newfilename+"';</script>");
	    out.println("<font size=2>上传成功！ <a href=# onclick='history.back()'>重新上传</a></font>");
 	 	return;
 	 }else{
 		out.println("<script>alert('文件格式仅允许GIF或JPG，大小限制在1M内!');history.back();</script>");
 		return;
 	 }
	}
	}
	} 
%>

<form method="post" action="upload.jsp" enctype="multipart/form-data">
	<font size="2">&nbsp;选择文件：</font> 
	 <input type="file" name="text1">
	 &nbsp;<input type="submit" name="button1" value="上传"> 
	 </form>
</body>
</html>
