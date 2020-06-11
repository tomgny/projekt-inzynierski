<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">

<title>Insert title here</title>
</head>
	<body>
	
		<div class="main-content">
			<div class="header">
				<h2>Lista Pytań</h2>
			</div>
		
			<div class="page-content">
				<div class="data">
					<form:form id="myForm" action="saveResponse" modelAttribute="responses" method="POST">
						<input type="hidden" name="questionnaireId" value="${param.questionnaireId}">
						<!-- add out html table here -->
						<table class="table table-bordered table-striped">
							<thead class="thead-dark">
								<tr>
									<th>Numer pytania</th>
									<th>Pytanie</th>
									<th>Odpowiedzi</th>
								</tr>
							</thead>
							<c:forEach var="tempQuest" items="${responses.responses}" varStatus="theCount">
								
								<!-- construct an "update" link with customer id -->
								<tr>
									<td>${questions[theCount.index].id}</td>
									<td>${questions[theCount.index].title}</td>
									<td>
	
											<c:if test="${questions[theCount.index].type == '1'}">
												<c:forEach var="tempA" items="${questions[theCount.index].answers}" varStatus="answerCount">
													<form:radiobutton path = "responses[${theCount.index}].text" value = "${tempA.title}" label = "${tempA.title}" />
												</c:forEach>
												
											</c:if>
											<c:if test="${questions[theCount.index].type == '2'}">
												<c:forEach var="tempA" items="${questions[theCount.index].answers}" varStatus="answerCount">
													<form:checkbox path = "responses[${theCount.index}].text" value = "${tempA.title}" label = "${tempA.title}" />
												</c:forEach>
												
											</c:if>
											<c:if test="${questions[theCount.index].type == '3'}">
												<form:select path="responses[${theCount.index}].text">
													<c:forEach var="tempA" items="${questions[theCount.index].answers}" varStatus="answerCount">
														<form:option value="${tempA.title}"/>
													</c:forEach>
												</form:select>
												
											</c:if>
											<c:if test="${questions[theCount.index].type == '4'}">
													<form:textarea path = "responses[${theCount.index}].text" />
											</c:if>
										<form:errors path="responses[${theCount.index}].text" cssStyle="color: #ff0000;" />
									</td>
									<form:hidden path="responses[${theCount.index}].questionnaireId" value="${param.questionnaireId}"/>
									<form:hidden path="responses[${theCount.index}].questionId" value="${questions[theCount.index].id}"/>
								</tr>
	
							</c:forEach>
							
						</table>
						Przed zapisaniem odpowiedzi podaj hasło w celu odczytania swoich odpowiedzi w przyszłości oraz uzyskania anonimowości.
						
						<input type="text" id="passwd" name="passwd"/>
						<br><br>
						<input type="submit" value="Zapisz" class="save"/>
					</form:form>
				</div>
			</div>
			<br><br><br>
			<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>
		</div>
	</body>
</html>