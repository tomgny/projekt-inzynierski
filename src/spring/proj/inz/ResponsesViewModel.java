package com.tognyp.springsecurity.demo.user;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.Response;

public class ResponsesViewModel {
	
	private List<Response> responses;

	public ResponsesViewModel(List<Response> responses) {
		this.responses = responses;
	}
	
	public void addResponse(Response response) {
		this.responses.add(response);
	}

	public ResponsesViewModel() {
	}

	public List<Response> getResponses() {
		return responses;
	}

	public void setResponses(List<Response> responses) {
		this.responses = responses;
	}

}
