package com.iWen.survey.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.RowSet;

import com.iWen.survey.dao.AnswersheetDAO;
import com.iWen.survey.dto.Answersheet;
import com.iWen.survey.pager.PageConfig;
import com.iWen.survey.sql.ConnectionFactory;
import com.iWen.survey.sql.SQLCommand;

public class AnswersheetDAOimpl implements AnswersheetDAO{
	private List list_answersheet=null;
	
	public boolean addAnswersheet(Answersheet answersheet) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt=null ;
		String sql = "INSERT INTO answersheet(s_id, as_result,"
			+"as_postdate,as_userIP) VALUES(?, ?, ?,?)";
		try {
			 pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, answersheet.getSurvey());
			pstmt.setString(2, answersheet.getAsResult());
			pstmt.setDate(3, new java.sql.Date(answersheet.getAsPostdate().getTime()));
			pstmt.setString(4, answersheet.getAsUserIp());
 

			return pstmt.executeUpdate()==1?true:false;

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}finally{
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);
		}
	}

	
	public boolean delAnswersheet(Long answersheetId) {
		SQLCommand cmd = new SQLCommand();
		return -1 != cmd.executeSQL("delete from answersheet where as_id="
				+ answersheetId);
	}

	
	public Answersheet findAnswersheet(Long answersheetId) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from answersheet where as_id="
				+ answersheetId);
		
		Answersheet answersheet=new Answersheet();
		try {
			if (rs.next()) {
			  answersheet.setAsId(rs.getLong("as_id"));
			  answersheet.setSurvey(rs.getLong("s_id"));
			  answersheet.setAsResult(rs.getString("as_result"));
			  answersheet.setAsPostdate(rs.getDate("as_postdate"));
			  answersheet.setAsUserIp(rs.getString("as_userip"));
			}
			return answersheet;
 

		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}
		
	}

	
	public List<Answersheet> listAllAnswersheet(Long surveyId) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from answersheet where s_id="+ surveyId+" order by as_postdate desc");
		Answersheet answersheet;
		List<Answersheet> list = new ArrayList<Answersheet>();
		try {
			while (rs.next()) {
				answersheet=new Answersheet();
				answersheet.setAsId(rs.getLong("as_id"));
				  answersheet.setSurvey(rs.getLong("s_id"));
				  answersheet.setAsResult(rs.getString("as_result"));
				  answersheet.setAsPostdate(rs.getDate("as_postdate"));
				  answersheet.setAsUserIp(rs.getString("as_userip"));
				list.add(answersheet);
			}

			return list;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	} 

 

	
	public List<?> doSelect(int recordStart, int sizePage, PageConfig pageConfig) {
		List<Answersheet> newlist=new ArrayList<Answersheet>();
		HttpServletRequest request=pageConfig.getRequest(); 
		List<Answersheet> list_answersheet=this.listAllAnswersheet(Long.valueOf(request.getParameter("sid")));
		for(int i=recordStart;i<recordStart+sizePage;i++){
		if(i<list_answersheet.size())
			newlist.add(list_answersheet.get(i));
		else
			break;
		 
		}
		return newlist;
	}

	
	public int getCount(PageConfig pageConfig) {
		if(this.list_answersheet==null){
			HttpServletRequest request=pageConfig.getRequest(); 
			list_answersheet=this.listAllAnswersheet(Long.valueOf(request.getParameter("sid")));
		}
		
		return list_answersheet.size();
	}

	
	public boolean delAnswersheets(Long sid) {
		SQLCommand cmd = new SQLCommand();
		return -1 != cmd.executeSQL("delete from answersheet where s_id="
				+ sid);
	}



}
