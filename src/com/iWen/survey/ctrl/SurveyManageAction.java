package com.iWen.survey.ctrl;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.iWen.survey.dao.AnswersheetDAO;
import com.iWen.survey.dao.DAOFactory;
import com.iWen.survey.dao.QuestionDAO;
import com.iWen.survey.dao.SurveyDAO;
import com.iWen.survey.dto.Survey;
import com.iWen.survey.util.StringUtil;


public class SurveyManageAction extends BaseAction {
	public String AddSurvey() {
		SurveyDAO surveydao = DAOFactory.getSurveyDAO();
		Survey survey = new Survey();
		survey.setSName(StringUtil.encodeString(request
				.getParameter("Survey_name")));
		survey.setSAuthor(StringUtil.encodeString(request
				.getParameter("Survey_author")));
		survey.setSDesc(StringUtil.encodeString(request
				.getParameter("Survey_description")));
		survey.setSCreateDate(new Date());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			survey.setSExpireDate(sdf.parse(request
					.getParameter("Survey_ExpireDate")));
		} catch (ParseException e) {
			// out.println("wrong DATE format.please check it!");
		}
		survey.setSIsOpen(Boolean.valueOf(request.getParameter("Survey_isOpen")));
		if (request.getParameter("Survey_isImg") != null)
			survey.setSImg(request.getParameter("imgfilepath"));
		if (request.getParameter("Survey_isPassword") != null)
			survey.setSPassword(request.getParameter("Survey_Password1"));

		survey.setSIsAudited(false);
		survey.setSUsehits(0L);
		boolean ret = surveydao.addSurvey(survey);
		if (ret == true) {
			//response.sendRedirect("../admin/OpResult.jsp?op=SurveyAdd&ret=true");
			return "success";
		} else {
			//response.sendRedirect("../admin/OpResult.jsp?op=SurveyAdd&ret=false");
			return "fail";
		}
		
	}
	public String SurveyAudi(){
		Boolean audit=Boolean.valueOf(request.getParameter("audit"));
		SurveyDAO surveydao=DAOFactory.getSurveyDAO();
		Survey  survey=surveydao.findSurvey(Long.valueOf(request.getParameter("sid")));
		if(audit==true)
			survey.setSIsAudited(true);
		else
			survey.setSIsAudited(false);
		boolean ret=surveydao.updateSurvey(survey);
		if(ret==true){
			//response.sendRedirect("../admin/SurveyAudi.jsp");
			return "success";
		}else{
			//response.sendRedirect("../admin/OpResult.jsp?op=SurveyAudi&ret=false");
			return "fail";
		}
	}
	public String EditSurvey(){
		SurveyDAO surveydao=DAOFactory.getSurveyDAO(); 
		String sid=request.getParameter("Survey_id");
		Survey survey=surveydao.findSurvey(Long.valueOf(request.getParameter("Survey_id")));
		survey.setSName(StringUtil.encodeString(request.getParameter("Survey_name")));
		survey.setSAuthor(StringUtil.encodeString(request.getParameter("Survey_author")));
		survey.setSDesc(StringUtil.encodeString(request.getParameter("Survey_description")));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try {
			survey.setSExpireDate(sdf.parse(request.getParameter("Survey_ExpireDate")));
		} catch (ParseException e) {
			// out.println("wrong DATE format.please check it!");
		}
		survey.setSIsOpen(Boolean.valueOf(request.getParameter("Survey_isOpen")));
		if(request.getParameter("Survey_isImg")!=null){
			if(request.getParameter("imgfilepath")!=null)
			survey.setSImg(request.getParameter("imgfilepath"));
		}else
			survey.setSImg(null);
		
		if(request.getParameter("Survey_isPassword")!=null){
			survey.setSPassword(request.getParameter("Survey_isPassword"));
		}else
			survey.setSPassword(null);
		
		boolean ret=surveydao.updateSurvey(survey);
		if(ret==true){
			//response.sendRedirect("../admin/SurveyAdmin.jsp");
			return "success";
		}else{
			//response.sendRedirect("../admin/OpResult.jsp?op=SurveyEdit&ret=false");
			return "fail";
		}
	}
	public String DelSurvey(){
		Long surveyId=Long.valueOf(request.getParameter("sid"));
		SurveyDAO surveydao=DAOFactory.getSurveyDAO(); 
		boolean ret1=surveydao.delSurvey(surveyId);
		QuestionDAO questiondao=DAOFactory.getQuestionDAO();
		
		if(ret1==true)
			ret1=questiondao.delQuestions(surveyId);
	
		if(ret1==true){
			AnswersheetDAO adao=DAOFactory.getAnswersheetDAO();
			ret1=adao.delAnswersheets(surveyId);
		}
		if(ret1==true){
		//	response.sendRedirect("../admin/SurveyAdmin.jsp");
			return "success";
		}else{
			//response.sendRedirect("../admin/OpResult.jsp?op=SurveyDel&ret=false");
			return "fail";
		}
	}
	
}
