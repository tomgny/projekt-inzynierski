<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
	<title>Wyszukaj odpowiedzi</title>
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div class="main-content">
		<div class="header">
			<h2>Podaj hasło wprowadzone przy zatwierdzaniu odpowiedzi</h2>
			
		</div>
	
		<div class="page-content">
			<div class="data">
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
					</tbody>
				</table>
				<br>
				<input type="submit" value="Wyszukaj" class="save"/>
			
			 </form:form>
			 
			 </div>
			 <br><br>
			 <a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>	 
		</div>
	</div>
</body>

</html>