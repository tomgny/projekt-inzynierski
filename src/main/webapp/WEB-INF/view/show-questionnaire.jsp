<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista ankiet</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	<div class="main-content">
		<div class="header">
			<h2>Lista ankiet</h2>
		</div>
	
		<div class="page-content">
			<div class="data">
				
				<table class="table table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>Tytuł</th>
							<th>Dodaj pytanie</th>
							<th>Dodaj odpowiedz</th>
							<th>Odpowiedz na ankiete</th>
							<th>Zobacz swoje odpowiedzi</th>
							<security:authorize access="hasRole('ADMIN')">  
								<th>Wyniki ankiet</th>
							</security:authorize>	
						</tr>
					</thead>
					<c:forEach var="tempQuest" items="${questionnaires}">
					
						<c:url var="addQuestion" value="/question/addQuestion">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<c:url var="showQuestions" value="/question/showQuestions">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<c:url var="doResponse" value="/response/doResponse">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<c:url var="getResponses" value="/response/getResponses">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<c:url var="showResults" value="/response/showResults">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<tr>
							<td>${tempQuest.id}</td>
							<td>${tempQuest.title}</td>		
							<td><a href="${addQuestion}" class="btn btn-outline-dark">Dodaj pytanie</a></td>	
							<td><a href="${showQuestions}" class="btn btn-outline-dark">Dodaj odpowiedź</a></td>	
							<td><a href="${doResponse}" class="btn btn-outline-dark">Odpowiedz na ankiete</a></td>	
							<td><a href="${getResponses}" class="btn btn-outline-dark">Zobacz odpowiedzi</a></td>
							<security:authorize access="hasRole('ADMIN')">  
								<td><a href="${showResults}" class="btn btn-outline-dark">Wyniki</a></td>
							</security:authorize>	
						</tr>
						
					</c:forEach>
				</table>
			</div>	
			 	<a href="${pageContext.request.contextPath}">Wstecz</a>
		</div>
	</div>
</body>

</html>