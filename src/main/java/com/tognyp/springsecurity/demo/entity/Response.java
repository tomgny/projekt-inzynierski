package com.tognyp.springsecurity.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
* Entity class of Response
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

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
	
	@Column(name="verifitaction")
	private String verification;

	public Response() {
		
	}
	
	public Response(Long id, String user, Long questionnaireId, Long questionId, String text, String verification) {
		this.id = id;
		this.user = user;
		this.questionnaireId = questionnaireId;
		this.questionId = questionId;
		this.text = text;
		this.verification = verification;
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

	public String getVerification() {
		return verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}
	
}
