<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dodawnie odpowiedzi</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>

	<div class="main-content">
		<div class="header">
			<h2>Dodaj odpowiedź</h2>
			
		</div>
		<div class="page-content">
			<div class="data">
				<form:form action="saveAnswer/${param.questionnaireId}" modelAttribute="answer" method="POST">
		
				<c:url var="back" value="/question/showQuestions">
					<c:param name="questionnaireId" value="${param.questionnaireId}"/>
				</c:url>
					<!-- need to associate this data with customer id -->
					<form:hidden path="id" />
					<form:hidden path="question" value="${param.questionId}"/>
					<table>
						<tbody>
							<tr>
								<td><label>Treść odpowiedzi:</label></td>
								<td><form:input path="title"></form:input></td>
							</tr>
							
							<tr>
								<td><label></label></td>
								<td><input type="submit" value="Zapisz" class="btn btn-dark"/></td>
							</tr>
						</tbody>
					</table>
				
				
				 </form:form>
		 
			</div>
			<a href="${back}">Wstecz</a>
		</div>
	</div>
	
</body>
</html>