package com.iWen.survey.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.RowSet;

import com.iWen.survey.dao.QuestionDAO;
import com.iWen.survey.dto.Question;
import com.iWen.survey.pager.PageConfig;
import com.iWen.survey.sql.ConnectionFactory;
import com.iWen.survey.sql.SQLCommand;


public class QuestionDAOimpl implements QuestionDAO{

	private List<Question> list_question=null;
	
	public boolean addQuestion(Question question) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt=null ;
		String sql = "INSERT INTO question(s_id, q_type,"
			+"q_head, q_body, q_result, q_img, q_jdtz, q_order) "
			+"VALUES(?, ?, ?,?, ?,?,?,?)";
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setLong(1, question.getSurvey());
			pstmt.setLong(2, question.getQType());
			pstmt.setString(3, question.getQHead());
			pstmt.setString(4, question.getQBody());
			pstmt.setString(5, question.getQResult());
			pstmt.setString(6, question.getQImg());
			pstmt.setString(7, question.getQJdtz());
			pstmt.setLong(8, question.getQOrder());

			return pstmt.executeUpdate()==1?true:false;

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}finally{
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);
		}
	}

	
	public boolean delQuestion(Long questionId) {
		SQLCommand cmd = new SQLCommand();
		return -1 != cmd.executeSQL("delete from question where q_id="
				+ questionId);
	}

	
	public Question findQuestion(Long questionId) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from question where q_id="
				+ questionId);
		
		Question question=new Question();
		try {
			if (rs.next()) {
				//System.out.println("rs has next");
				//System.out.println("rs has q_id:"+rs.getLong("q_id"));
				question.setSurvey(rs.getLong("s_id"));
				question.setQId(rs.getLong("q_id"));
				question.setQType(rs.getLong("q_type"));
				question.setQHead(rs.getString("q_head"));
				question.setQBody(rs.getString("q_body"));
				question.setQResult(rs.getString("q_result"));
				question.setQImg(rs.getString("q_img"));
				question.setQJdtz(rs.getString("q_jdtz"));
				question.setQOrder(rs.getLong("q_order"));
				
			}
			return question;
 

		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}
		
	}

	
	public List<Question> listAllQuestion(Long surveyId) {
		return this.listAllQuestion(surveyId, "asc");
	}

	
	public boolean updateQuestion(Question question) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt=null;
		String sql = "UPDATE question SET s_id=?, "
			+"q_type=?, q_head=?, q_body=?, q_result=?, "
			+"q_img=?, q_jdtz=?, q_order=?"
			+" WHERE q_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			//System.out.println(question.getSurvey());
			pstmt.setLong(1, question.getSurvey());
			pstmt.setLong(2, question.getQType());
			pstmt.setString(3, question.getQHead());
			pstmt.setString(4, question.getQBody());
			pstmt.setString(5, question.getQResult());
			pstmt.setString(6, question.getQImg());
			pstmt.setString(7, question.getQJdtz());
			pstmt.setLong(8, question.getQOrder());
			pstmt.setLong(9, question.getQId());

			return pstmt.executeUpdate()==1?true:false;

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}finally{
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);
		}
	}

	
	public List<?> doSelect(int recordStart, int sizePage, PageConfig pageConfig) {
		List<Question> newlist = new ArrayList<Question>();
		HttpServletRequest request=pageConfig.getRequest();
		Long surveyId=Long.valueOf(request.getParameter("sid"));
		if (this.list_question == null)
			list_question = this.listAllQuestion(surveyId,"desc");
		for (int i = recordStart; i < recordStart+sizePage; i++){
			if(i<list_question.size())
				newlist.add(list_question.get(i));
			else
				break;
		}
		return newlist;
	}

	
	public int getCount(PageConfig pageConfig) {
		HttpServletRequest request=pageConfig.getRequest();
		Long surveyId=Long.valueOf(request.getParameter("sid"));
		if (this.list_question == null)
			list_question = this.listAllQuestion(surveyId);

		return list_question.size();
	}

	
	public boolean delQuestions(Long surveyId) {
		SQLCommand cmd = new SQLCommand();
	 
		return -1 != cmd.executeSQL("delete from question where s_id="
				+ surveyId);
		 
	}

	
	public List<Question> listAllQuestion(Long surveyId, String ascORdesc) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from question where s_id="
				+ surveyId+" order by q_id "+ascORdesc);
		Question question;
		List<Question> list = new ArrayList<Question>();
		try {
			while (rs.next()) {
				question=new Question();
				question.setQId(rs.getLong("q_id"));
				question.setSurvey(rs.getLong("s_id"));
				question.setQType(rs.getLong("q_type"));
				question.setQHead(rs.getString("q_head"));
				question.setQBody(rs.getString("q_body"));
				question.setQResult(rs.getString("q_result"));
				question.setQImg(rs.getString("q_img"));
				question.setQJdtz(rs.getString("q_jdtz"));
				question.setQOrder(rs.getLong("q_order"));
				list.add(question);
			}

			return list;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args){
		Question q=new Question();
		q.setQId(28L);
		QuestionDAOimpl dao=new QuestionDAOimpl();
		dao.updateQuestion(q);
	}


	public List<Question> listQuestions(String WhereClause) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from question where "+WhereClause);
		Question question;
		List<Question> list = new ArrayList<Question>();
		try {
			while (rs.next()) {
				question=new Question();
				question.setQId(rs.getLong("q_id"));
				question.setSurvey(rs.getLong("s_id"));
				question.setQType(rs.getLong("q_type"));
				question.setQHead(rs.getString("q_head"));
				question.setQBody(rs.getString("q_body"));
				question.setQResult(rs.getString("q_result"));
				question.setQImg(rs.getString("q_img"));
				question.setQJdtz(rs.getString("q_jdtz"));
				question.setQOrder(rs.getLong("q_order"));
				list.add(question);
			}

			return list;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}
}
