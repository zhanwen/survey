package com.iWen.survey.dto;

import java.util.Date;

public class Survey implements java.io.Serializable {

	private static final long serialVersionUID = -5612405124894422928L;
	private Long SId; // 问卷ID
	private String SName; //问卷名称
	private String SDesc; //问卷描述
	private String SAuthor; // 问卷发起人
	private String SImg; // 问卷图片
	private Date SCreateDate;  // 问卷创建日期
	private String SPassword;
	private Boolean SIsOpen; // 是否公开此问卷
	private Date SExpireDate;  //问卷结束日期
	private Boolean SIsAudited; // 问卷是否审核 0代表未审核 1 代表审核通过
	private Long SUsehits; // 用户点击量
	public Long getSId() {
		return SId;
	}
	public void setSId(Long sId) {
		SId = sId;
	}
	public String getSName() {
		return SName;
	}
	public void setSName(String sName) {
		SName = sName;
	}
	public String getSDesc() {
		return SDesc;
	}
	public void setSDesc(String sDesc) {
		SDesc = sDesc;
	}
	public String getSAuthor() {
		return SAuthor;
	}
	public void setSAuthor(String sAuthor) {
		SAuthor = sAuthor;
	}
	public String getSImg() {
		return SImg;
	}
	public void setSImg(String sImg) {
		SImg = sImg;
	}
	public Date getSCreateDate() {
		return SCreateDate;
	}
	public void setSCreateDate(Date sCreateDate) {
		SCreateDate = sCreateDate;
	}
	public String getSPassword() {
		return SPassword;
	}
	public void setSPassword(String sPassword) {
		SPassword = sPassword;
	}
	public Boolean getSIsOpen() {
		return SIsOpen;
	}
	public void setSIsOpen(Boolean sIsOpen) {
		SIsOpen = sIsOpen;
	}
	public Date getSExpireDate() {
		return SExpireDate;
	}
	public void setSExpireDate(Date sExpireDate) {
		SExpireDate = sExpireDate;
	}
	public Boolean getSIsAudited() {
		return SIsAudited;
	}
	public void setSIsAudited(Boolean sIsAudited) {
		SIsAudited = sIsAudited;
	}
	public Long getSUsehits() {
		return SUsehits;
	}
	public void setSUsehits(Long sUsehits) {
		SUsehits = sUsehits;
	}

	

}