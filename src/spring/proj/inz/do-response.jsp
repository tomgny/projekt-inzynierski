<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>
	
		<div id="wrapper">
			<div id="header">
				<h2>Lista Pytań</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
				<form:form action="saveResponse" modelAttribute="response" method="POST">
					<form:hidden path="id"/>
					<form:hidden path="questionnaireId" value="${param.questionnaireId}"/>
					<form:hidden path="questionId" value="${tempQuest.id}"/>
					<!-- add out html table here -->
					<table>
						<tr>
							<th>Numer pytania</th>
							<th>Pytanie</th>
							<th>Odpowiedzi</th>
						</tr>
						
						<c:forEach var="tempQuest" items="${questions}">
							<c:set var = "questionId" scope = "session" value = "${tempQuest.id}"/>
							
							<!-- construct an "update" link with customer id -->
							<tr>
								<td>${tempQuest.id}</td>
								<td>${tempQuest.title}</td>	
								<td>
									<c:if test="${tempQuest.type == '1'}">
										<form:radiobuttons path="text" items="${tempQuest.answers}"></form:radiobuttons>
									</c:if>
								</td>
							</tr>
							
						</c:forEach>
						<form:hidden path="questionId" value="questionId"/>
					</table>
					<input type="submit" value="Zapisz" class="save"/>
				</form:form>
			</div>
		</div>
	</body>
</html>