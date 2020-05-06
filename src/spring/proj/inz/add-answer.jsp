<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dodawnie odpowiedzi</title>
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>Dodawanie odpowiedzi</h2>
			
		</div>
	</div>
	<div id="container">
		<h3>Zapisz odpowiedz</h3>
		
		<form:form action="saveAnswer/${param.questionnaireId}" modelAttribute="answer" method="POST">

		<c:url var="saveQ" value="/answer/saveAnswer">
			<c:param name="questionId" value="${param.questionId}"/>
		</c:url>
			<!-- need to associate this data with customer id -->
			<form:hidden path="id" />
			<form:hidden path="question" value="${param.questionId}"/>
			<table>
				<tbody>
					<tr>
						<td><label>Treść odpowiedzi:</label></td>
						<td><form:input path="answer"></form:input></td>
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
		 	<a href="${pageContext.request.contextPath}/question/show-quest">Powrót do listy pytań</a>
		 </p>
		 
	</div>
	
</body>
</html>