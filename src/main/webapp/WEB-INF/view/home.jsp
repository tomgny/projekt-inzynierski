<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">

<head>
	<title>Projekt inżynierski</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&display=swap" rel="stylesheet"> 
	<link rel="stylesheet" href="style.css">
	
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
	
</head>

<body>
	<div class="main-content">
		<div class="header">
			<div class="title">
				<h1>Strona główna</h1>
			</div>
			
			<div class="menu">
				<a href="${pageContext.request.contextPath}/questionnaires/add-questionnaire">Dodaj ankiete</a>
				<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wyświetl ankiety</a>
				<security:authorize access="hasRole('ADMIN')">  

					<a href="${pageContext.request.contextPath}/systems/showUsers">Panel admina</a>
				
				</security:authorize>
				<form:form action="${pageContext.request.contextPath}/logout" 
						   method="POST">
				
					<input type="submit" value="Wyloguj" />
				
				</form:form>
			</div>
		</div>
			<div class="page-content">
				<div class="data-title">
					<h3> Zalogowano jako: </h3>
				</div>
				<div class="data">	
					<p>Użytkownik: <security:authentication property="principal.username" /></p>
					<p>Imię: ${user.firstName} </p>
					<p>Nazwisko: ${user.lastName} </p>
					<p>Email: ${user.email} </p>
				</div>
			</div>			
		</div>			
</body>

</html>