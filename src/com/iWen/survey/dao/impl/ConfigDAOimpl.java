package com.iWen.survey.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.RowSet;

import com.iWen.survey.dao.ConfigDAO;
import com.iWen.survey.dto.Config;
import com.iWen.survey.sql.ConnectionFactory;
import com.iWen.survey.sql.SQLCommand;

public class ConfigDAOimpl implements ConfigDAO{

	
	public boolean updateConfig(Config config) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt=null;
		String sql = "UPDATE config SET c_siteName=?, c_siteURL=?, "
			+"c_isOpen=?, c_closeWord=? ,copyright=? WHERE id=1";
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, config.getCSiteName());
			 pstmt.setString(2, config.getCSiteUrl());
			 pstmt.setBoolean(3, config.getCIsOpen());
			 pstmt.setString(4, config.getCCloseWord());
			 pstmt.setString(5, config.getCopyright());

			return pstmt.executeUpdate()==1?true:false;

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}finally{
			SQLCommand.close(pstmt);
			SQLCommand.close(conn);
		}
		
	}

	
	public Config findConfig() {
		SQLCommand cmd = new SQLCommand();
		RowSet rs = cmd.queryRowSet("select * from config where id=1");
		Config config =new Config();
		try {
			if (rs.next()) {
				config.setCSiteName(rs.getString("c_siteName"));
				config.setCSiteUrl(rs.getString("c_siteUrl"));
				config.setCIsOpen(rs.getBoolean("c_isOpen"));
				config.setCCloseWord(rs.getString("c_closeWord"));
				config.setCopyright(rs.getString("copyright"));
				return config;
			}

			return null;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

}
