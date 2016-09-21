package com.iWen.survey.ctrl;

import com.iWen.survey.dao.AnswersheetDAO;
import com.iWen.survey.dao.DAOFactory;

public class StatisManageAction extends BaseAction {
	private String sid;

	public String DelSheet() {
	 sid=request.getParameter("sid");
		String op=request.getParameter("op");
			Long asid=Long.valueOf(request.getParameter("asid"));
			AnswersheetDAO adao=DAOFactory.getAnswersheetDAO();
			boolean ret=adao.delAnswersheet(asid);
			if(ret==true){
				//response.sendRedirect("../admin/ShowSheets.jsp?sid="+sid);
				return "success";
			}else{
				//response.sendRedirect("../admin/OpResult.jsp?op=DelSheet&ret=false");
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
