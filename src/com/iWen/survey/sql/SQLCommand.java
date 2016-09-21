package com.iWen.survey.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.RowSet;
import javax.sql.rowset.CachedRowSet;

import com.sun.rowset.CachedRowSetImpl;


public class SQLCommand {
	private String JNDIname="";
	public SQLCommand(){
		
	}
	public SQLCommand(String JNDIname){
		this.JNDIname=JNDIname;
	}
	

	/**
	 * 完成批量添加
	 * @param sql
	 * @return
	 */
	public boolean executeSQLs(String [] sql){
		Connection conn=ConnectionFactory.getConnection();
		Statement stmt=null;
		try {
			stmt=conn.createStatement();
			for(int i=0;i<sql.length;i++){
				stmt.addBatch(sql[i]);
			}
			int [] ret=stmt.executeBatch();
			for(int i=0;i<ret.length;i++){
				if(ret[i]==-1)
					return false;
			}
			return true;
		} catch (SQLException e) {
			 
			e.printStackTrace();
			return false;
		}finally{
			SQLCommand.close(stmt);
			SQLCommand.close(conn);
		
		}
		
	}
	/**
	 * 完成數據更新
	 * @param sql
	 * @return
	 */
	public int executeSQL(String sql){
		Connection conn=ConnectionFactory.getConnection();
		Statement stmt=null;
		try {
			stmt=conn.createStatement();
			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			 
			e.printStackTrace();
			return -1;
		} finally{
			SQLCommand.close(stmt);
			SQLCommand.close(conn);
			
		}
		
	}
	/**
	 * queryRowSet
	 * @param sql
	 * @return
	 */
	public RowSet queryRowSet(String sql) {
		Connection conn=ConnectionFactory.getConnection();
		ResultSet rs=null;
		Statement stmt=null;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			CachedRowSet crs=new CachedRowSetImpl();
			crs.populate(rs);
			
			return crs;
		} catch (SQLException e) {
			 
			e.printStackTrace();
			
			return null;
		} finally{
			 
			SQLCommand.close(rs);
			SQLCommand.close(stmt);
			SQLCommand.close(conn);
		
		}
		
		
	}

	/**
	 * queryScalar
	 * @param sql
	 * @return
	 */
	public String queryScalar(String sql){
		
		RowSet rs=this.queryRowSet(sql);
		
		try {
			if (!rs.next())
				return "";
			else{
				return new String(rs.getObject(1).toString());
			}
		} catch (SQLException e) {
		 
			e.printStackTrace();
			return "";
		} 
	}
	
	public static void close(Connection conn){
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
	}
	public static void close(Statement stmt){
		if(stmt!=null)
			try {
				stmt.close();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
	}
	public static void close(PreparedStatement pstmt){
		if(pstmt!=null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
	}
	public static void close(ResultSet rs){
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
	}
 

}
