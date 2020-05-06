<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">

<head>
	<title>Projekt inżynierski</title>
	<meta charset="utf-8">
</head>

<body>
	<h2>Strona główna</h2>
	<hr>
	<p>
	Witamy na stronie głównej!
	</p>
	
		<!-- display user name and role -->
	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
		<br><br>
		First name: ${user.firstName}, Last name: ${user.lastName}, Email: ${user.email}
		<br><br>
		<a href="${pageContext.request.contextPath}/questionnaires/add-questionnaire">Dodaj ankiete</a>
		
		<br><br>
		<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wyświetl ankiety</a>
	</p>
	
	
	<security:authorize access="hasRole('ADMIN')">  

		<!-- Add a link to point to /systems ... this is for the admins -->
		
		<p>
			<a href="${pageContext.request.contextPath}/systems">Panel admina</a>
		</p>
	
	</security:authorize>
	
	<hr>
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Wyloguj" />
	
	</form:form>
	
</body>

</html>