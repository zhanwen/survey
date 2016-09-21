package com.iWen.survey.dao;

import com.iWen.survey.dao.impl.AdminDAOimpl;
import com.iWen.survey.dao.impl.AnswersheetDAOimpl;
import com.iWen.survey.dao.impl.ConfigDAOimpl;
import com.iWen.survey.dao.impl.LinkDAOimpl;
import com.iWen.survey.dao.impl.QuestionDAOimpl;
import com.iWen.survey.dao.impl.SurveyDAOimpl;
import com.iWen.survey.dao.impl.UserDAOImpl;

public class DAOFactory {

	private DAOFactory() {
	}
	public static SurveyDAO getSurveyDAO() {
		return new SurveyDAOimpl();
	}

	public static QuestionDAO getQuestionDAO() {
		return new QuestionDAOimpl();
	}

	public static ConfigDAO getConfigDAO() {
		return new ConfigDAOimpl();
	}

	public static AnswersheetDAO getAnswersheetDAO() {
		return new AnswersheetDAOimpl();
	}

	public static AdminDAO getAdminDAO() {
		return new AdminDAOimpl();
	}

	public static LinkDAO getLinkDAO() {
		return new LinkDAOimpl();
	}

	public static UserDAO getUserDAO() {
		return new UserDAOImpl();
	}
}
