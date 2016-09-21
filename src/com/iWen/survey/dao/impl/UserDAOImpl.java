package com.iWen.survey.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iWen.survey.dao.UserDAO;
import com.iWen.survey.dto.User;
import com.iWen.survey.sql.ConnectionFactory;
import com.mysql.jdbc.Statement;

public class UserDAOImpl implements UserDAO {

	private static final String SAVE = "insert into user(email,nickname,password) "
			+ "values (?,?,?)";

	/*
	 * 添加用户
	 */
	public void addUser(User user) throws Exception {
		System.out.println("USERDAO  aduser  execute....");
		System.out.println("user   " + user);
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pst = conn.prepareStatement(SAVE,
				Statement.RETURN_GENERATED_KEYS);
		pst.setString(1, user.getEmail());
		pst.setString(2, user.getNickname());
		pst.setString(3, user.getPassword());
		pst.executeUpdate();
		ResultSet rs = pst.getGeneratedKeys();
		rs.next();
		int id = rs.getInt(1);
		System.out.println("userdao    key   " + id);
		user.setId(id);

	}

	public List<User> findAllUser() throws Exception {
		Connection con = ConnectionFactory.getConnection();
		User user = null;
		List<User> users = new ArrayList<User>();
		String sql = "select * from d_user";
		PreparedStatement prep = con.prepareStatement(sql);
		ResultSet rs = prep.executeQuery();
		while (rs.next()) {
			user = new User();
			user.setId(rs.getInt("id"));
			user.setNickname(rs.getString("nickname"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			users.add(user);
		}
		return users;
	}

	public void delUser(int id) throws Exception {

		Connection con = ConnectionFactory.getConnection();
		String sql = "delete from d_user where id=?";
		PreparedStatement prep = con.prepareStatement(sql);
		prep.setInt(1, id);
		prep.executeUpdate();

	}

	/*
	 * 通过邮箱找到用户
	 */
	public User findOneUserByEmail(String email) throws Exception {
		User user = null;
		Connection con = ConnectionFactory.getConnection();
		String sql = "select * from user where email=?";
		PreparedStatement prep = con.prepareStatement(sql);
		prep.setString(1, email);
		ResultSet rs = prep.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setId(rs.getInt("id"));
			user.setNickname(rs.getString("nickname"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));

		}
		return user;
	}
	
	/*
	 * 通过姓名找到用户
	 */
	public User findOneUserByNickName(String nickname) throws Exception {
		User user = null;
		Connection con = ConnectionFactory.getConnection();
		String sql = "select * from user where nickname=?";
		PreparedStatement prep = con.prepareStatement(sql);
		prep.setString(1, nickname);
		ResultSet rs = prep.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setId(rs.getInt("id"));
			user.setNickname(rs.getString("nickname"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));

		}
		return user;
	}
}
