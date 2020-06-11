package com.tognyp.springsecurity.demo.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
* Class use to validate and process form received from view
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public class QuestResponse {
	
	@NotNull(message="Coœ posz³o nie tak...")
	private Long questionnaireId;
	
	@NotNull(message="Coœ posz³o nie tak...")
	private Long questionId;
	
	@NotBlank(message="Proszê wype³niæ wszystkie pola odpowiedzi")
	private String text;

	public QuestResponse() {
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
