package com.iWen.survey.dto;

public class Question implements java.io.Serializable {

	private static final long serialVersionUID = -4179328348522550986L;

	private Long QId; // 问题ID
	private Long survey; // 问卷
	private Long QType; // 问题类型 单选 多选
	private String QHead; // 问题内容
	private String QBody; // 问题备选答案
	private String QResult; // 回答问题的结果
	private String QImg; // 问题图片
	private String QJdtz;
	private Long QOrder;

	public Question() {
	}

	public Question(Long QId, Long survey) {
		this.QId = QId;
		this.survey = survey;
	}

	public Question(Long QId, Long survey, Long QType, String QHead,
			String QBody, String QResult, String QImg, String QJdtz, Long QOrder) {
		this.QId = QId;
		this.survey = survey;
		this.QType = QType;
		this.QHead = QHead;
		this.QBody = QBody;
		this.QResult = QResult;
		this.QImg = QImg;
		this.QJdtz = QJdtz;
		this.QOrder = QOrder;
	}

	public Long getQId() {
		return this.QId;
	}

	public void setQId(Long QId) {
		this.QId = QId;
	}

	public Long getSurvey() {
		return this.survey;
	}

	public void setSurvey(Long survey) {
		this.survey = survey;
	}

	
	public Long getQType() {
		return this.QType;
	}

	public void setQType(Long QType) {
		this.QType = QType;
	}


	public String getQHead() {
		return this.QHead;
	}

	public void setQHead(String QHead) {
		this.QHead = QHead;
	}
	
	public String getQBody() {
		return this.QBody;
	}

	public void setQBody(String QBody) {
		this.QBody = QBody;
	}

	
	public String getQResult() {
		return this.QResult;
	}

	public void setQResult(String QResult) {
		this.QResult = QResult;
	}

	
	public String getQImg() {
		return this.QImg;
	}

	public void setQImg(String QImg) {
		this.QImg = QImg;
	}

	
	public String getQJdtz() {
		return this.QJdtz;
	}

	public void setQJdtz(String QJdtz) {
		this.QJdtz = QJdtz;
	}

	
	public Long getQOrder() {
		return this.QOrder;
	}

	public void setQOrder(Long QOrder) {
		this.QOrder = QOrder;
	}

}