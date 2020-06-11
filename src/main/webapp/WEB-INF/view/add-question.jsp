<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dodawnie pytań do ankiety</title>

	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&display=swap" rel="stylesheet">
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/main.css"> 
</head>
<body>

	<div class="main-content">
		<div class="header">
			<h2>Dodaj pytanie</h2>
			
		</div>
	<div class="page-content">
		<div class="data">
			<form:form action="saveQuestion" modelAttribute="question" method="POST">
	
			<c:url var="saveQuest" value="/question/saveQuestion">
				<c:param name="questionnaireId" value="${param.questionnaireId}"/>
			</c:url>
				<!-- need to associate this data with customer id -->
				<form:hidden path="id" />
				<form:hidden path="questionnaire" value="${param.questionnaireId}"/>
				<table>
					<tbody>
						<tr>
							<td><label>Treść pytania:</label></td>
							<td><form:input path="title"></form:input></td>
						</tr>
						<tr>
							<td><label>Typ pytania:</label></td>
							<td><form:radiobutton path="type" value="1" label="Jedna odpowiedz"></form:radiobutton></td>
							<td><form:radiobutton path="type" value="2" label="Wiele odpowiedzi"></form:radiobutton></td>
							<td><form:radiobutton path="type" value="3" label="Lista odpowiedzi"></form:radiobutton></td>
							<td><form:radiobutton path="type" value="4" label="Otwarta odpowiedz"></form:radiobutton></td>
						</tr>
						
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Zapisz" class="save"/></td>
						</tr>
					</tbody>
				</table>
			
			
			 </form:form>
		 
		 </div>
		 <br><br>
		 <a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>
	</div>		 
		 	
		 
	</div>
	
</body>
</html>