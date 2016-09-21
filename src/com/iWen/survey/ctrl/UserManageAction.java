package com.iWen.survey.ctrl;

import com.iWen.survey.dao.DAOFactory;
import com.iWen.survey.dao.UserDAO;
import com.iWen.survey.dto.User;
import com.iWen.survey.util.StringUtil;


public class UserManageAction extends BaseAction {
	public String addUser(){
		String email = request.getParameter("email");
		String nickname = StringUtil.encodeString(request.getParameter("nickname"));
		String password = request.getParameter("password");
		UserDAO dao = DAOFactory.getUserDAO();
		User user = new User();
		user.setEmail(email);
		user.setNickname(nickname);
		user.setPassword(password);
		try {
			dao.addUser(user);
			request.getSession().setAttribute("user", user);

			//response.sendRedirect("../OpResult.jsp?op=reg&ret=true");
			return "success";
		} catch (Exception e) {
		//	response.sendRedirect("../OpResult.jsp?op=reg&ret=false");
			return "fail";
		}
	}
	
	
	public String userLogin(){
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		UserDAO dao = DAOFactory.getUserDAO();
		User user;
		try {
			//user = dao.findOneUserByEmail(email);
			user = dao.findOneUserByNickName(nickname);
			System.out.println(user.getNickname());
			if (user.getPassword().equals(password)) {
				request.getSession().setAttribute("user", user);
				//response.sendRedirect("../OpResult.jsp?op=login&ret=true");
				return "success";
			} else {
				//response.sendRedirect("../OpResult.jsp?op=login&ret=false");
				return "fail";
			}
		} catch (Exception e) {
			//response.sendRedirect("../OpResult.jsp?op=login&ret=false");
			return "fail";
		}
	}
}
