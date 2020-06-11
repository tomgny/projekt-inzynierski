<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<div class="main-content">
		<div class="header">
			<h2>Wyniki</h2>
		</div>
		
		<div class="page-content">
			<div class="data">
	
				<c:forEach var="question" items="${questions}">
					<caption><h3>Pytanie: ${question.title}</h3></caption>
					<table class="table table-bordered table-striped">
						<thead class="thead-dark">
							<tr>
								<th>Odpowiedź</th>
								<th>Ilość odpowiedzi</th>
							</tr>
						</thead>
						<c:if test="${question.type != '4'}">
							<c:set var="total" value="${0}"/>
							<c:forEach var="answer" items="${question.answers}">
								<c:forEach var="response" items="${responses}">
									<c:if test="${response.key.questionId == question.id && response.key.text == answer.title}">
										<c:set var="total" value="${total + response.value}" />
										<tr>
											<td>${response.key.text}</td>
											<td>${response.value}</td>
										</tr>
									</c:if>
									
								</c:forEach>
								<br>
							</c:forEach>
							Łączna ilość odpowiedzi: ${total}
						</c:if>
							
						<c:if test="${question.type == '4'}">
							<c:set var="total" value="${0}"/>
							<br><br><br>
							<c:forEach var="response" items="${responses}">
								<c:if test="${response.key.questionId == question.id}">
									<c:set var="total" value="${total + response.value}" />
									<tr>
										<td>${response.key.text}</td>
										<td>${response.value}</td>
									</tr>
								</c:if>
								
							</c:forEach>
							Łączna ilość odpowiedzi: ${total}
						</c:if>
					</table>
					<hr><br>
				</c:forEach>
			</div>
			<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>
		</div>
	</div>
</body>
</html>