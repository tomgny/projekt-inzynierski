<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista ankiet</title>
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Lista ankiet</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			
			<!-- add out html table here -->
			<table>
				<tr>
					<th>Id</th>
					<th>Tytuł</th>
				</tr>
				
				<c:forEach var="tempQuest" items="${questionnaires}">
				
					<c:url var="addQuestion" value="/question/addQuestion">
						<c:param name="questionnaireId" value="${tempQuest.id}"/>
					</c:url>
					<!-- construct an "update" link with customer id -->
					<tr>
						<td>${tempQuest.id}</td>
						<td>${tempQuest.title}</td>		
						<td><a href="${addQuestion}">Dodaj pytanie</a></td>	
					</tr>
					
				</c:forEach>
			</table>
		</div>
	</div>
</body>

</html>