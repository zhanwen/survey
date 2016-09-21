package com.iWen.survey.ctrl;

import com.iWen.survey.dao.DAOFactory;
import com.iWen.survey.dao.QuestionDAO;
import com.iWen.survey.dto.Question;
import com.iWen.survey.util.StringUtil;

public class QuestionAction extends BaseAction {
	private String sid;
public String AddQuestion(){
	sid=request.getParameter("sid");
	String type=request.getParameter("type");
	String qhead=StringUtil.encodeString(request.getParameter("qHead"));
	String qbody=StringUtil.encodeString(request.getParameter("qBody")); 
	String qresult=StringUtil.encodeString(request.getParameter("qResult"));
	String qimg=request.getParameter("qImg");
	Question question=new Question();
	question.setSurvey(Long.valueOf(sid));
	question.setQType(Long.valueOf(type));
	question.setQHead(qhead);
	question.setQBody(qbody);
	question.setQResult(qresult);
	question.setQImg(qimg);
	question.setQOrder(0L);
	if(qbody==null){
		qbody="";
	}
	String [] qbodys=qbody.split("&\\$\\$&");
	String spliter="";
	for(int i=1;i<qbodys.length;i++)
		if(i==qbodys.length-1)
			spliter=spliter+"null&null";
		else
			spliter=spliter+"null&";
	question.setQJdtz(spliter);
	QuestionDAO dao=DAOFactory.getQuestionDAO();
	boolean ret=dao.addQuestion(question);
	if(ret==true){
//		response.sendRedirect("../admin/OpResult.jsp?op=Question&ret=true&sid="+sid);
		return "success";
	}else{
//		response.sendRedirect("../admin/OpResult.jsp?op=Question&ret=false");
		return "fail";
	}
}
public String DelQuestion(){
	String sid=request.getParameter("sid");
	String qid=request.getParameter("qid");
	QuestionDAO dao=DAOFactory.getQuestionDAO();
	boolean ret=dao.delQuestion(Long.valueOf(qid));
	if(ret==true){
//		response.sendRedirect("../admin/QuestionAdmin.jsp?sid="+sid);
		return "success";
	}else{
//		response.sendRedirect("../admin/OpResult.jsp?op=Question&ret=false");
		return "fail";
	}
}
public String EditQuestion(){
	String qhead=StringUtil.encodeString(request.getParameter("qHead"));
	String qbody=StringUtil.encodeString(request.getParameter("qBody")); 
	String qresult=StringUtil.encodeString(request.getParameter("qResult"));
	String sid=request.getParameter("sid");
	String qid=request.getParameter("qid");
	String type=request.getParameter("type");
	String qimg=request.getParameter("qImg");
	QuestionDAO dao=DAOFactory.getQuestionDAO();
	Question question=dao.findQuestion(Long.valueOf(qid));
	
	question.setQType(Long.valueOf(type));
	question.setQHead(qhead);
	question.setQBody(qbody);
	question.setQImg(qimg);
	String [] qbodys=qbody.split("&\\$\\$&");
	String spliter="";
	for(int i=1;i<qbodys.length;i++)
		if(i==qbodys.length-1)
			spliter=spliter+"null&null";
		else
			spliter=spliter+"null&";
	question.setQJdtz(spliter);
	question.setQOrder(0L);
	boolean ret=dao.updateQuestion(question);
	if(ret==true){
		//response.sendRedirect("../admin/OpResult.jsp?op=Question&ret=true&sid="+sid);
		return "success";
	}else{
		//response.sendRedirect("../admin/OpResult.jsp?op=Question&ret=false");
		return "fail";
	}
}
public String getSid() {
	return sid;
}
public void setSid(String sid) {
	this.sid = sid;
}

}
