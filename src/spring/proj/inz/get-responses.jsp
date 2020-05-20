<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
	<title>Wyszukaj odpowiedzi</title>
	        
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Podaj hasło wprowadzone przy zatwierdzaniu odpowiedzi</h2>
			
		</div>
	</div>
	
	<div id="container">
		<form:form action="showResponses" method="POST">
			<c:url var="showResponses" value="/response/showResponses">
				<c:param name="questionnaireId" value="${param.questionnaireId}"/>
			</c:url>
			<!-- need to associate this data with customer id -->
			<input type="hidden" name="questionnaireId" value="${param.questionnaireId}">
			<table>
				<tbody>
					<tr>
						<td><label>Hasło:</label></td>
						<td><input type="text" id="passwd" name="passwd"/></td>
						
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><td><input type="submit" value="Zapisz" class="save"/></td></td>
					</tr>
				</tbody>
			</table>
		
		
		 </form:form>
		 
		 <div style="clear; both;"></div>
		 
		 <p>
		 	<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Powrót do listy</a>
		 </p>
		 
	</div>
		
</body>

</html>