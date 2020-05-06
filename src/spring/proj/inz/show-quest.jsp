<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista Pytań</title>
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Lista Pytań</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			
			<!-- add out html table here -->
			<table>
				<tr>
					<th>Id</th>
					<th>Pytanie</th>
				</tr>
				
				<c:forEach var="tempQuest" items="${questions}">
					
					<c:url var="addAnswer" value="/answer/addAnswer">
						<c:param name="questionId" value="${tempQuest.id}"/>
						<c:param name="questionnaireId" value="${param.questionnaireId}"/>
					</c:url>
					<!-- construct an "update" link with customer id -->
					<tr>
						<td>${tempQuest.id}</td>
						<td>${tempQuest.title}</td>		
						<td><a href="${addAnswer}">Dodaj odpowiedz</a></td>	
					</tr>
					
				</c:forEach>
			</table>
		</div>
	</div>
</body>

</html>