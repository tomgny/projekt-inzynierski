<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html lang="pl">
<head>
	<title>Dodaj ankiete</title>
	        
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Dodawanie ankiet</h2>
			
		</div>
	</div>
	
	<div id="container">
		<h3>Zapisz ankiete</h3>
		
		<form:form action="saveQuestionnaire" modelAttribute="questionnaire" method="POST">
			<!-- need to associate this data with customer id -->
			<form:hidden path="id" />
			<table>
				<tbody>
					<tr>
						<td><label>Tytul:</label></td>
						<td><form:input path="title"></form:input></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save"/></td>
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