package com.tognyp.springsecurity.demo.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
* Entity class of Question
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Entity
@Table(name="question")
public class Question {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="quest")
	private String title;
	
	@Column(name="type")
	private String type;
	
	@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="questionnaire_id")
	private Questionnaire questionnaire;
	
	@OneToMany(mappedBy="question", fetch=FetchType.EAGER, cascade=CascadeType.ALL, orphanRemoval = true)
	private Set<Answer> answers;
	
	public Question() {
		
	}
	
	public Question(String title, Questionnaire questionnaire, String type, Set<Answer> answers) {
		this.title = title;
		this.questionnaire = questionnaire;
		this.answers = answers;
		this.type = type;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Question(String title, Questionnaire questionnaire, String type) {
		this.title = title;
		this.questionnaire = questionnaire;
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Questionnaire getQuestionnaire() {
		return questionnaire;
	}

	public void setQuestionnaire(Questionnaire questionnaire) {
		this.questionnaire = questionnaire;
	}

	public Set<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

	
}
