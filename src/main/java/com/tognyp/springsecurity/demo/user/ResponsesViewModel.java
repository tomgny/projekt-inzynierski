package com.tognyp.springsecurity.demo.user;

import java.util.List;

import javax.validation.Valid;

/**
* Wrapper class uses to pass model to view 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public class ResponsesViewModel {
	
	
	private List<@Valid QuestResponse> responses;

	public ResponsesViewModel(List<QuestResponse> responses) {
		this.responses = responses;
	}
	
	public void addResponse(QuestResponse response) {
		this.responses.add(response);
	}

	public ResponsesViewModel() {
	}

	public List<QuestResponse> getResponses() {
		return responses;
	}

	public void setResponses(List<QuestResponse> responses) {
		this.responses = responses;
	}

}
