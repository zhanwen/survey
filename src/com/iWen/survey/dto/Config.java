package com.iWen.survey.dto;
public class Config implements java.io.Serializable {

	private static final long serialVersionUID = 2557876183072176111L;
	private Integer id;
	private String CSiteName;
	private String CSiteUrl;
	private Boolean CIsOpen;
	private String copyright;
	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}

	private String CCloseWord;

	 
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

 
	public String getCSiteName() {
		return this.CSiteName;
	}

	public void setCSiteName(String CSiteName) {
		this.CSiteName = CSiteName;
	}

	 
	public String getCSiteUrl() {
		return this.CSiteUrl;
	}

	public void setCSiteUrl(String CSiteUrl) {
		this.CSiteUrl = CSiteUrl;
	}

	 
	public Boolean getCIsOpen() {
		return this.CIsOpen;
	}

	public void setCIsOpen(Boolean CIsOpen) {
		this.CIsOpen = CIsOpen;
	}

	 
	public String getCCloseWord() {
		return this.CCloseWord;
	}

	public void setCCloseWord(String CCloseWord) {
		this.CCloseWord = CCloseWord;
	}

}