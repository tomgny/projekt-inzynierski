package com.tognyp.springsecurity.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="response")
public class Response {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="username")
	private String user;
	
	@Column(name="questionnaire_id")
	private Long questionnaireId;
	
	@Column(name="question_id")
	private Long questionId;
	
	@Column(name="text")
	private String text;

	public Response() {
		
	}
	
	public Response(String user, Long questionnaireId, Long questionId, String text) {
		this.user = user;
		this.questionnaireId = questionnaireId;
		this.questionId = questionId;
		this.text = text;
	}

	public Response(Long questionnaireId, Long questionId, String text) {
		this.questionnaireId = questionnaireId;
		this.questionId = questionId;
		this.text = text;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Long getQuestionnaireId() {
		return questionnaireId;
	}

	public void setQuestionnaireId(Long questionnaireId) {
		this.questionnaireId = questionnaireId;
	}

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
