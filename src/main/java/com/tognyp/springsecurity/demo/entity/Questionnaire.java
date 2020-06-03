package com.tognyp.springsecurity.demo.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
* Entity class of Questionnaire
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@Entity
@Table(name="questionnaire")
public class Questionnaire {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="title")
	private String title;
	
	@OneToMany(mappedBy="questionnaire", fetch=FetchType.EAGER, cascade=CascadeType.ALL, orphanRemoval = true)
	private Set<Question> questions;
	
	
	public Questionnaire() {
		
	}
	
	public Questionnaire(String title) {
		this.title = title;
	}
	

	public Questionnaire(String title, Set<Question> questions) {
		this.title = title;
		this.questions = questions;
	}

	public Set<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
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

}
