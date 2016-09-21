package com.iWen.survey.ctrl;

import java.net.URLEncoder;

import com.iWen.survey.dao.AdminDAO;
import com.iWen.survey.dao.DAOFactory;
import com.iWen.survey.dao.impl.AdminDAOimpl;
import com.iWen.survey.dto.Admin;

public class AdminAction extends BaseAction
{
	private int userId;
	private String userName;
	private String userPw;
	private String email;
	private String phone;
	private String message;
	private String path;
	private int index=1;
	private AdminDAO adminDAO= new AdminDAOimpl();

	public String adminAdd()
	{
		Admin admin=new Admin();
		admin.setA_user(userName);
		admin.setA_pass(userPw);
		admin.setA_email(email);
		admin.setA_phone(phone);
		adminDAO.addAdmin(admin);
		this.setMessage("操作成功");
		this.setPath("adminManage.action");
		return "success";
	}
	public String adminManage()
	{
		/*List adminList=adminDAO.listAllAdmin();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("adminList", adminList);*/
		return "success";
	}
	public String adminDel()
	{
		adminDAO.delAdmin(userId);
		this.setMessage("删除成功");
		this.setPath("adminManage.action");
		return "success";
	}
public String EditAdmin() throws Exception{
	
	Long aid=Long.valueOf(request.getParameter("aid"));
	String oldpwd=request.getParameter("oldpwd");
	String pwd=request.getParameter("pwd");
	String username=request.getParameter("username");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	AdminDAO dao=DAOFactory.getAdminDAO();
	if(dao.checkPwd(username, oldpwd)!=true){
		this.message=URLEncoder.encode("原始密码错误,修改失败！", "UTF-8");
		return "fail";
	}

	Admin admin=dao.findAdmin(aid);
	admin.setA_email(email);
	admin.setA_phone(phone);
	admin.setA_pass(pwd);
	boolean ret1=dao.updateAdmin(admin);
	if(ret1){
		//response.sendRedirect("../admin/AdminList.jsp");
		return "success";
	}else{
		this.message=URLEncoder.encode("编辑管理员出错！请联系管理员！", "UTF-8");
		//response.sendRedirect("../admin/OpResult.jsp?op=default&ret=false&words="+URLEncoder.encode("编辑管理员出错！请联系管理员", "UTF-8"));
		return "fail";
	}
	
}



	public String getMessage()
	{
		return message;
	}

	public int getIndex()
	{
		return index;
	}
	public void setIndex(int index)
	{
		this.index = index;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	 
}
