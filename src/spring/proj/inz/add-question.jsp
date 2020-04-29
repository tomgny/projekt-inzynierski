<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dodawnie pytań do ankiety</title>
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>Dodawanie pytań</h2>
			
		</div>
	</div>
	<div id="container">
		<h3>Zapisz pytanie</h3>
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
						<td><label></label></td>
						<td><input type="submit" value="Zapisz" class="save"/></td>
					</tr>
				</tbody>
			</table>
		
		
		 </form:form>
		 
		 <div style="clear; both;"></div>
		 
		 <p>
		 	<a href="${pageContext.request.contextPath}/questionnaire/show-questionnaire">Powrót do listy</a>
		 </p>
		 
	</div>
	
</body>
</html>