package com.iWen.survey.dto;

import java.util.Date;

public class Link implements java.io.Serializable {

	private static final long serialVersionUID = 5993297914232661795L;

	private Long LId;
	private String LUrl;
	private String LName;
	private String LImg;
	private String LInfo;
	private boolean LIsLock;
	private Date LAddtime;

	public Long getLId() {
		return this.LId;
	}

	public void setLId(Long LId) {
		this.LId = LId;
	}


	public String getLUrl() {
		return this.LUrl;
	}

	public void setLUrl(String LUrl) {
		this.LUrl = LUrl;
	}

	
	public String getLName() {
		return this.LName;
	}

	public void setLName(String LName) {
		this.LName = LName;
	}

	
	public String getLImg() {
		return this.LImg;
	}

	public void setLImg(String LImg) {
		this.LImg = LImg;
	}

	
	public String getLInfo() {
		return this.LInfo;
	}

	public void setLInfo(String LInfo) {
		this.LInfo = LInfo;
	}

	
	public boolean getLIsLock() {
		return this.LIsLock;
	}

	public void setLIsLock(boolean LIsLock) {
		this.LIsLock = LIsLock;
	}

	
	public Date getLAddtime() {
		return this.LAddtime;
	}

	public void setLAddtime(Date LAddtime) {
		this.LAddtime = LAddtime;
	}

}