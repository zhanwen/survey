package com.iWen.survey.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.RowSet;

import com.iWen.survey.dao.SurveyDAO;
import com.iWen.survey.dto.Survey;
import com.iWen.survey.pager.PageConfig;
import com.iWen.survey.sql.ConnectionFactory;
import com.iWen.survey.sql.SQLCommand;

public class SurveyDAOimpl implements SurveyDAO {
	private List<Survey> list_survey = null;

	public boolean addSurvey(Survey survey) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO survey( s_name, s_desc, s_author,s_img,  s_createDate,"
				+ "s_password, s_isOpen, s_expireDate, s_isAudited,  s_usehits"
				+ ") VALUES( ?, ?, ?, ?, ?,?, ?,?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, survey.getSName());
			pstmt.setString(2, survey.getSDesc());
			pstmt.setString(3, survey.getSAuthor());
			pstmt.setString(4, survey.getSImg());
			pstmt.setDate(5, new java.sql.Date(survey.getSCreateDate()
					.getTime()));
			pstmt.setString(6, survey.getSPassword());
			pstmt.setBoolean(7, survey.getSIsOpen());
			pstmt.setDate(8, new java.sql.Date(survey.getSExpireDate()
					.getTime()));
			pstmt.setBoolean(9, survey.getSIsAudited());
			pstmt.setLong(10, survey.getSUsehits());

			return pstmt.executeUpdate() == 1 ? true : false;

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		} finally {
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);

		}

	}

	public boolean delSurvey(Long surveyId) {
		SQLCommand cmd = new SQLCommand();
		return -1 != cmd
				.executeSQL("delete from survey where s_id=" + surveyId);

	}

	public Survey findSurvey(Long surveyId) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from survey where s_id="
				+ surveyId);
		Survey survey = new Survey();
		try {
			if (rs.next()) {
				survey.setSId(rs.getLong("s_id"));
				survey.setSName(rs.getString("s_name"));
				survey.setSDesc(rs.getString("s_desc"));
				survey.setSAuthor(rs.getString("s_author"));
				survey.setSImg(rs.getString("s_img"));
				survey.setSCreateDate(rs.getDate("s_createdate"));
				survey.setSPassword(rs.getString("s_password"));
				survey.setSIsOpen(rs.getBoolean("s_isopen"));
				survey.setSExpireDate(rs.getDate("s_expiredate"));
				survey.setSIsAudited(rs.getBoolean("s_isaudited"));
				survey.setSUsehits(rs.getLong("s_usehits"));

				return survey;
			} else {
				return null;
			}

		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		} finally {
			SQLCommand.close(rs);
		}

	}

	public List<Survey> listAllSurvey(String order) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from survey order by " + order);
		List<Survey> list = new ArrayList<Survey>();
		Survey survey;
		try {
			while (rs.next()) {
				survey = new Survey();
				survey.setSId(rs.getLong("s_id"));
				survey.setSName(rs.getString("s_name"));
				survey.setSDesc(rs.getString("s_desc"));
				survey.setSAuthor(rs.getString("s_author"));
				survey.setSImg(rs.getString("s_img"));
				survey.setSCreateDate(rs.getDate("s_createdate"));
				survey.setSPassword(rs.getString("s_password"));
				survey.setSIsOpen(rs.getBoolean("s_isopen"));
				survey.setSExpireDate(rs.getDate("s_expiredate"));
				survey.setSIsAudited(rs.getBoolean("s_isaudited"));
				survey.setSUsehits(rs.getLong("s_usehits"));
				list.add(survey);
			}

			return list;

		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}

	}

	public boolean updateSurvey(Survey survey) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE survey "
				+ "SET s_name=?, s_desc=?, s_author=?, s_img=?,  s_createDate=?,"
				+ " s_password=?, s_isOpen=?, s_expireDate=?, "
				+ "s_isAudited=?,s_usehits=? " + "WHERE s_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, survey.getSName());
			pstmt.setString(2, survey.getSDesc());
			pstmt.setString(3, survey.getSAuthor());
			pstmt.setString(4, survey.getSImg());
			pstmt.setDate(5, new java.sql.Date(survey.getSCreateDate()
					.getTime()));
			pstmt.setString(6, survey.getSPassword());
			pstmt.setBoolean(7, survey.getSIsOpen());
			pstmt.setDate(8, new java.sql.Date(survey.getSExpireDate()
					.getTime()));
			pstmt.setBoolean(9, survey.getSIsAudited());
			pstmt.setLong(10, survey.getSUsehits());
			pstmt.setLong(11, survey.getSId());
			return pstmt.executeUpdate() == 1 ? true : false;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);

		}

	}

	public List<Survey> doSelect(int recordStart, int sizePage,
			PageConfig pageConfig) {
		List<Survey> newlist = new ArrayList<Survey>();
		if (this.list_survey == null) {
			if ("front_end".equals(pageConfig.getAction()))
				list_survey = this.listVisitableSurvey();
			else
				list_survey = this.listAllSurvey();
		}
		for (int i = recordStart; i < recordStart + sizePage; i++) {
			if (i < list_survey.size())
				newlist.add(list_survey.get(i));
			else
				break;

		}
		return newlist;
	}

	public int getCount(PageConfig pageConfig) {
		if (this.list_survey == null)
			list_survey = this.listAllSurvey();

		return list_survey.size();
	}

	public List<Survey> listAllSurvey() {
		return this.listAllSurvey("s_id desc");
	}

	public List<Survey> listVisitableSurvey() {

		return listVisitableSurvey("s_createdate desc,s_id desc");
	}

	public List<Survey> listVisitableSurvey(String order) {
		String sql = "select * from survey where  s_isOpen ='1' and s_isAudited=1 and s_expiredate>='"
				+ new java.sql.Date(new java.util.Date().getTime())
				+ "' order by " + order;
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet(sql);
		List<Survey> list = new ArrayList<Survey>();
		Survey survey;
		try {
			while (rs.next()) {
				survey = new Survey();
				survey.setSId(rs.getLong("s_id"));
				survey.setSName(rs.getString("s_name"));
				survey.setSDesc(rs.getString("s_desc"));
				survey.setSAuthor(rs.getString("s_author"));
				survey.setSImg(rs.getString("s_img"));
				survey.setSCreateDate(rs.getDate("s_createdate"));
				survey.setSPassword(rs.getString("s_password"));
				survey.setSIsOpen(rs.getBoolean("s_isopen"));
				survey.setSExpireDate(rs.getDate("s_expiredate"));
				survey.setSIsAudited(rs.getBoolean("s_isaudited"));
				survey.setSUsehits(rs.getLong("s_usehits"));
				list.add(survey);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			SQLCommand.close(rs);
		}

	}

}
