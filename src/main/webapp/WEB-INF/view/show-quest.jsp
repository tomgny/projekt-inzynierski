<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista Pytań</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div class="main-content">
		<div class="header">
			<h2>Lista Pytań</h2>
		</div>
	
		<div class="page-content">
			<div class="data">
				
				<!-- add out html table here -->
				<table class="table table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>Pytanie</th>
							<th>Dodaj odpowiedź</th>
						</tr>
					</thead>
					
					<c:forEach var="tempQuest" items="${questions}">
						
						<c:url var="addAnswer" value="/answer/addAnswer">
							<c:param name="questionId" value="${tempQuest.id}"/>
							<c:param name="questionnaireId" value="${param.questionnaireId}"/>
						</c:url>
						<!-- construct an "update" link with customer id -->
						<tr>
							<td>${tempQuest.id}</td>
							<td>${tempQuest.title}</td>		
							<td><a href="${addAnswer}" class="btn btn-outline-dark">Dodaj odpowiedz</a></td>	
						</tr>
						
					</c:forEach>
				</table>
			</div>
			<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>
		</div>
	</div>
</body>

</html>