package com.iWen.survey.dao;

import com.iWen.survey.dto.User;

public interface UserDAO {
	void addUser(User user) throws Exception;

	User findOneUserByEmail(String email) throws Exception;
	
	User findOneUserByNickName(String nickname) throws Exception;
	
	void delUser(int id) throws Exception;

}
