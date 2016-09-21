package com.iWen.survey.ctrl;

import com.iWen.survey.dao.ConfigDAO;
import com.iWen.survey.dao.DAOFactory;
import com.iWen.survey.dto.Config;
import com.iWen.survey.util.StringUtil;
public class ConfigAction extends BaseAction
{

 private ConfigDAO configdao=DAOFactory.getConfigDAO();

	public String config()
	{
		Config config=new Config();
		config.setCSiteName(StringUtil.encodeString(request.getParameter("siteName")));
		config.setCSiteUrl(StringUtil.encodeString(request.getParameter("siteURL")));
		config.setCIsOpen(Boolean.valueOf(request.getParameter("siteOpen")));
		config.setCCloseWord(StringUtil.encodeString(request.getParameter("closeWord")));
		config.setCopyright(StringUtil.encodeString(request.getParameter("copyright")));
		boolean ret=configdao.updateConfig(config);
		if (ret==true){
//			response.sendRedirect("../admin/OpResult.jsp?op=SysConfig&ret=true");
			return "success";
		}else{
//			response.sendRedirect("../admin/OpResult.jsp?op=SysConfig&ret=false");
			return "fail";
		}
	}
	

	 
}
