package com.iWen.survey.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.RowSet;

import com.iWen.survey.dao.AdminDAO;
import com.iWen.survey.dto.Admin;
import com.iWen.survey.sql.ConnectionFactory;
import com.iWen.survey.sql.SQLCommand;

public class AdminDAOimpl implements AdminDAO{


	public boolean addAdmin(Admin admin) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt=null;
		String sql = "insert into admins(a_user,a_pass,a_email,a_phone) values(?,?,?,?)";
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, admin.getA_user());
			 pstmt.setString(2, admin.getA_pass());
			 pstmt.setString(3, admin.getA_email());
			 pstmt.setString(4, admin.getA_phone());
			return pstmt.executeUpdate()==1?true:false;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);
		}
		
	}


	public boolean checkPwd(String username, String pwd) {
		SQLCommand cmd=new SQLCommand();
		String realpwd=cmd.queryScalar("select a_pass from admins where a_user='"+username+"'");
		if(pwd.equals(realpwd))
			return true;
		else
			return false;
	}


	public boolean delAdmin(long a_id) {
		SQLCommand cmd = new SQLCommand();
		int ret = cmd.executeSQL("delete from admins where a_id="+a_id);
		if(ret==1)
			return true;
		else
			return false;

		
	}


	public Admin findAdmin(long a_id) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from admins where a_id="+a_id);
		Admin admin=new Admin();
		try {
			if (rs.next()) {
				admin.setA_id(rs.getLong("a_id"));
				admin.setA_user(rs.getString("a_user"));
				admin.setA_pass(rs.getString("a_pass"));
				admin.setA_email(rs.getString("a_email"));
				admin.setA_phone(rs.getString("a_phone"));
				return admin;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Admin findAdmin(String username) {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from admins where a_user='"+username+"'");
		Admin admin=new Admin();
		try {
			if (rs.next()) {
				admin.setA_id(rs.getLong("a_id"));
				admin.setA_user(rs.getString("a_user"));
				admin.setA_pass(rs.getString("a_pass"));
				return admin;
			}
			return null;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}
	public List listAllAdmin() {
		SQLCommand cmd=new SQLCommand();
		RowSet rs=cmd.queryRowSet("select * from admins");
		List<Admin> list=new ArrayList<Admin>();
		Admin admin;
		try {
			while(rs.next()){
				admin=new Admin();	
				admin.setA_id(rs.getLong("a_id"));
				admin.setA_user(rs.getString("a_user"));
				admin.setA_pass(rs.getString("a_pass"));
				admin.setA_email(rs.getString("a_email"));
				admin.setA_phone(rs.getString("a_phone"));
				list.add(admin);
			}
			 return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} 
	}

	public boolean updateAdmin(Admin admin) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt=null;
		String sql = "UPDATE admins set a_user=?,a_pass=? ,a_email=?,a_phone=? where a_id=?";
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, admin.getA_user());
			 pstmt.setString(2, admin.getA_pass());
			 pstmt.setString(3, admin.getA_email());
			 pstmt.setString(4, admin.getA_phone());
			 pstmt.setLong(5, admin.getA_id());

			return pstmt.executeUpdate()==1?true:false;

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}finally{
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);
		}
	}

}
