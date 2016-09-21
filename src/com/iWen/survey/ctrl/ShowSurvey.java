package com.iWen.survey.ctrl;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iWen.survey.dao.AnswersheetDAO;
import com.iWen.survey.dao.DAOFactory;
import com.iWen.survey.dao.QuestionDAO;
import com.iWen.survey.dao.SurveyDAO;
import com.iWen.survey.dto.Answersheet;
import com.iWen.survey.dto.Question;
import com.iWen.survey.dto.Survey;


public class ShowSurvey extends HttpServlet {

	private static final long serialVersionUID = 5900463445573456509L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid=request.getParameter("sid");
		SurveyDAO sdao1=DAOFactory.getSurveyDAO();
		Survey s=sdao1.findSurvey(Long.valueOf(sid));
		AnswersheetDAO adao1=DAOFactory.getAnswersheetDAO();
		QuestionDAO dao=DAOFactory.getQuestionDAO();
		
		Enumeration params=request.getParameterNames();
		Set<Long> qidSet=new TreeSet<Long>();
		while(params.hasMoreElements()){
			String para=(String)params.nextElement();
			if(para.startsWith("answer")){
				Long qid=Long.valueOf(para.substring(6));
				qidSet.add(qid);
			}
		}
	 
		boolean success=true;
		String answersheet="";
		synchronized(this){
		for(Long qid:qidSet){
			Question q=dao.findQuestion(qid);
			String result=q.getQResult();
			String [] results=result.split(",");
			if(q.getQType()==1){
				int answer=Integer.parseInt(request.getParameter("answer"+qid));
				results[answer]=String.valueOf(Integer.parseInt(results[answer])+1);
				answersheet=answersheet+"&@@&"+qid+":as="+answer+";";
			}else if(q.getQType()==2){
				String [] answers=request.getParameterValues("answer"+qid);
				String as="";
				for(int i=0;i<answers.length;i++){
					results[Integer.parseInt(answers[i])]=String.valueOf(Integer.parseInt(results[Integer.parseInt(answers[i])])+1);
					as=as+","+answers[i];
				}
				as=as.substring(1,as.length());
				answersheet=answersheet+"&@@&"+qid+":as="+as+";";
				
			}
			
			String newresult="";
			for(int i=0;i<results.length;i++){
				if(i==0)
					newresult=results[i];
				else
					newresult=newresult+","+results[i];
			}
			q.setQResult(newresult);
			boolean ret=dao.updateQuestion(q);
			if(ret==false)
				success=false;
		}
		AnswersheetDAO adao=DAOFactory.getAnswersheetDAO();
		Answersheet sheet=new Answersheet();
		sheet.setSurvey(Long.valueOf(sid));
		
		answersheet=answersheet.substring(4);
		sheet.setAsResult(answersheet);
		sheet.setAsPostdate(new java.util.Date());
		sheet.setAsUserIp(request.getRemoteAddr());
		boolean ret=adao.addAnswersheet(sheet);
		if(ret==false)
			success=false;
		if(success==true) {
			SurveyDAO sdao=DAOFactory.getSurveyDAO();
			Survey survey=sdao.findSurvey(Long.valueOf(sid));
			synchronized(this){
			survey.setSUsehits(survey.getSUsehits()+1);
			sdao.updateSurvey(survey);
			}
			response.sendRedirect("../OpResult.jsp?ret=true&op=ShowSurvey");}
		 
		else
			response.sendRedirect("../OpResult.jsp?ret=false&op=ShowSurvey");
	}
	}

}
