package com.iWen.survey.pager;

import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class PageControl  {
	PageListener pageListener;

	int countRecord = 0;
	int sizePage = 8;
	int currentPage = 0;
	int countPage = 0;
	int recordstart = 0;
	String url = null;
	String connector = "?";
	String pageForward = null;

	PageConfig pageConfig = null;
	String pageUp = "<font face=宋体 size=2>上一页</font>";
	String pageDown = "<font face=宋体 size=2>下一页</font>";
	String firstPage = "<font face=宋体 size=2>首页</font>";
	String lastPage = "<font face=宋体 size=2>末页</font>";


	/**
	 * 获取总记录数
	 * @return
	 */
	public int getCountRecord() {
		if (this.countRecord == 0)
			this.countRecord = this.pageListener.getCount(this.pageConfig);

		return this.countRecord;
	}

	/**
	 * 生成并返回“首页”的HTML标记
	 * @return
	 */
	public String getFirstPageHTML() {
		StringBuffer sb = new StringBuffer("");
		if (this.countRecord == 0)
			this.countRecord = getCountRecord();

		if ((this.currentPage == 1) || (this.countRecord <= 0)) {
			sb.append(this.firstPage);
		} else {
			sb.append("<a href='");
			sb.append(this.url);
			sb.append(this.connector);
			sb.append("pageid=");
			sb.append(1);
			sb.append("'>");
			sb.append(this.firstPage);
			sb.append("</a>");
		}
		String firstPage = sb.toString();
		return firstPage;
	}

	/**
	 * 自定义“首页”链接的文本字样
	 * @param firstPage
	 */
	public void setFirstPageHTML(String firstPage) {

		this.firstPage = firstPage;
	}

	/**
	 * 生成并返回“末页”的HTML标记
	 * @return
	 */
	public String getLastPageHTML() {
		StringBuffer sb = new StringBuffer("");
		int countRecords = this.currentPage * this.sizePage;
		if (this.countRecord == 0)
			this.countRecord = getCountRecord();

		if (this.countPage == 0)
			this.countPage = getCountPage();

		if ((countRecords >= this.countRecord) || (this.countRecord <= 0)) {
			sb.append(this.lastPage);
		} else {
			sb.append("<a href='");
			sb.append(this.url);
			sb.append(this.connector);
			sb.append("pageid=");
			sb.append(this.countPage);
			sb.append("'>");
			sb.append(this.lastPage);
			sb.append("</a>");
		}
		String lastPage = sb.toString();
		return lastPage;
	}

	/**
	 * 自定义“末页”链接的文本字样
	 * @param firstPage
	 */
	public void setLastPageHTML(String lastPage) {

		this.lastPage = lastPage;
	}

	/**
	 * 生成并返回“下一页”的HTML标记
	 * @return
	 */
	public String getPageDownHTML() {
		StringBuffer sb = new StringBuffer("");
		int pageid = this.currentPage + 1;
		int countRecords = this.currentPage * this.sizePage;
		if (this.countRecord == 0)
			this.countRecord = getCountRecord();

		if (this.countPage == 0)
			this.countPage = getCountPage();

		if ((countRecords >= this.countRecord) || (this.countPage == 0)) {
			sb.append(this.pageDown);
		} else {
			sb.append("<a href='");
			sb.append(this.url);
			sb.append(this.connector);
			sb.append("pageid=");
			sb.append(pageid);
			sb.append("'>");
			sb.append(this.pageDown);
			sb.append("</a>");
		}
		String pageDown = sb.toString();
		return pageDown;
	}

	/**
	 * 自定义“下一页”链接的文本字样
	 * @return
	 */
	public void setPageDownHTML(String pageDown) {

		this.pageDown = pageDown;
	}

	/**
	 * 生成并返回“上一页”的HTML标记
	 * @return
	 */
	public String getPageUpHTML() {
		StringBuffer sb = new StringBuffer("");
		int pageid = this.currentPage - 1;
		if (pageid <= 0) {
			sb.append(this.pageUp);
		} else {
			sb.append("<a href='");
			sb.append(this.url);
			sb.append(this.connector);
			sb.append("pageid=");
			sb.append(pageid);
			sb.append("'>");
			sb.append(this.pageUp);
			sb.append("</a>");
		}
		String pageUp = sb.toString();
		return pageUp;
	}

	/**
	 * 自定义“上一页”链接的文本字样
	 * @return
	 */
	public void setPageUpHTML(String pageUp) {

		this.pageUp = pageUp;
	}

	/**
	 * 返回每页行数
	 * @return
	 */
	public int getSizePage() {
		return this.sizePage;
	}

	/**
	 * 设置每页显示行数
	 * @param sizePage
	 */
	public void setSizePage(int sizePage) {
		this.sizePage = sizePage;
	}

	/**
	 * 返回"总页数"HTML
	 * @return
	 */
	public String getCountPageHTML() {
		if (this.countRecord == 0)
			this.countRecord = getCountRecord();

		if (this.countRecord < this.sizePage) {
			this.countPage = 1;
		} else if (this.countRecord % this.sizePage == 0)
			this.countPage = (this.countRecord / this.sizePage);
		else {
			this.countPage = (this.countRecord / this.sizePage + 1);
		}

		return "<font face=宋体 size=2>/共" + this.countPage + "页</font>";
	}

	/**
	 * 返回总页数 
	 * @return
	 */
	public int getCountPage() {
		if (this.countRecord == 0)
			this.countRecord = getCountRecord();

		if (this.countRecord < this.sizePage) {
			this.countPage = 1;
		} else if (this.countRecord % this.sizePage == 0)
			this.countPage = (this.countRecord / this.sizePage);
		else {
			this.countPage = (this.countRecord / this.sizePage + 1);
		}

		return this.countPage;
	}

	/**
	 * 获取记录数据
	 * @return
	 */
	public List  getRecord() {
		List  list = null;
		this.recordstart = (this.sizePage * (this.currentPage - 1));
		list = this.pageListener.doSelect(this.recordstart, this.sizePage,
				this.pageConfig);
	 
	 
		return list;
	}

	/**
	 * 设置页面监听器，将实现了PageListener接口的类的对象传入
	 * @param pageListener
	 */
	private void setPageListener(PageListener pageListener) {
		this.pageListener = pageListener;
	}

	/**
	 * 设置配置参数
	 * @param pageListener
	 * @param pageConfig
	 * @param url
	 */
	public PageControl(PageListener pageListener,PageConfig pageConfig,String url){
		this.setPageListener(pageListener);
		this.setPageConfig(pageConfig);
		this.setUrl(url);
	}
	/**
	 * 设置返回URL的样式
	 * @param url
	 */
	private void setUrl(String url) {
		HttpServletRequest request = this.pageConfig.getRequest();
		String newUrl=this.getNewUrl(request, url);
	    this.url = newUrl;
	    if (url.indexOf("?") != -1)
	      this.connector = "&";
	    else
	      this.connector = "?";
	}

	/**
	 * 返回当前页码
	 * @return
	 */
	public int getCurrentPage() {
		return this.currentPage;
	}

	/**
	 * 返回"当前页码"HTML
	 * @return
	 * <font face=宋体 size=2>当前第N页</font>
	 */
	public String getCurrentPageHTML() {
		return "<font face=宋体 size=2> 当前第" + this.currentPage + "页</font>";
	}

	/**
	 * 生成并返回“跳转”的HTML标签
	 * @return
	 */
	public String getPageForwardHTML() {
		if (this.countPage == 0)
			this.countPage = getCountPage();

		StringBuffer sb = new StringBuffer("");
		sb.append("<font face='宋体' size='2'>跳转到</font>");
		sb
				.append("<input id='pageto' onkeydown='on_pageKeydown()' name=pageto type=text size='2' style='border:1px solid #EEE6D0; width: 30; height: 16'>");
		sb
				.append("<font face='宋体' size='2'>页&nbsp;<button onclick='on_pageClick()' style='font-size:12px;width: 25; height: 20'>GO</button>");
		sb.append("</font>");
		sb.append("\n<script type='text/javascript'>\n");
		sb.append("function on_pageKeydown()\n");
		sb.append("{\t if(event.keyCode==13) on_pageClick();}\n");
		sb.append("function on_pageClick()");
		sb.append("{var page = pageto.value;");
		sb.append("if(page=='')");
		sb.append("{alert('您输入数据不合法！');}");
		sb.append("else if(isNaN(page)) {");
		sb.append("alert('您输入数据不合法！');}");
		sb.append("else if(page>");
		sb.append(this.countPage);
		sb.append("||page<=0)");
		sb.append("{alert('您输入数据不合法！');}");
		sb.append("else\t{\twindow.location.href='");
		sb.append(this.url);
		sb.append(this.connector);
		sb.append("pageid='+page;");
		sb.append("}\t}</script>");
		String pageForward = sb.toString();
		return pageForward;
	}

	public PageConfig getPageConfig() {
		return this.pageConfig;
	}

	private void setPageConfig(PageConfig pageConfig) {
		HttpServletRequest request = null;
		this.pageConfig = pageConfig;
		request = this.pageConfig.getRequest();
		try {
			this.currentPage = Integer.parseInt(request.getParameter("pageid"));
		} catch (Exception e) {
			this.currentPage = 1;
		}
	}
	/**
	 * 将REQUEST中的Parameter封装成URL的QueryString
	 * @param request
	 * @param url
	 * @return
	 */
	private String getNewUrl(HttpServletRequest request, String url)
	  {
	    String newUrl = null;
	    String connector = "?";
	    
	    if ((request != null) && (url != null)) {
	      StringBuffer sburl = new StringBuffer(url);
	      Enumeration enu = request.getParameterNames();
	      while (enu.hasMoreElements()) {
	        String paraName = (String)enu.nextElement();
	        String paraValue = request.getParameter(paraName);
	        
	        if (sburl.indexOf("?") != -1)
	              connector = "&";
	        if ((!(paraName.equals("pageid")))&&url.indexOf(paraName)==-1) {
	 
	            sburl.append(connector);
	            sburl.append(paraName);
	            sburl.append("=");
	            sburl.append(paraValue);
	            
	          }
	      }
	      newUrl = sburl.toString();
	    }
	    return newUrl;
	  }
}
