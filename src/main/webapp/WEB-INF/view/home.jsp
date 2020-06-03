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
	
	<style>
		/* Main */
		body{
		    font-family: 'Montserrat', sans-serif;
		    margin: 0;
		    padding: 0;
		    background-image: linear-gradient(90deg, #b92b27, #1565C0);
		    max-width: 100vw;
		    max-height: 100vh;
		}
		h1,h2,h3{
		    margin: 0;
		    font-weight: 500;
		}
		a{
		    color: #000;
		    text-decoration: none;
		}
		.main-content{
		    max-width: 1170px;
		    padding: 0 15px;
		    margin: auto;
		    background-color: #fff;
		    padding: 50px;
		    margin-top: 100px;
		    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.75);
		    border-radius: 5px;
		}
		.header{
		    display: flex;
		    justify-content: space-between;
		    padding-bottom: 20px;
		    border-bottom: 1px solid rgba(0,0,0,0.2);
		}
		.header .title{
		    display: flex;
		}
		.header .menu{
		    display: flex;
		}
		.header .menu a{
		    display: inline-block;
		    font-weight: 500;
		    padding: 10px 20px;
		    border: 1px solid rgba(0,0,0,0);
		    margin: 0 10px;
		    transition: all 500ms;
		}
		.header .menu input{
		    font-weight: 500;
		    padding: 10px 20px;
		    border: 1px solid rgba(0,0,0,0.2);
		    font-family: 'Montserrat', sans-serif;
		    font-size: 16px;
		    background-color: rgba(255,255,255,0);
		    transition: all 500ms;
		}
		.header .menu input:hover{
		    background-color:rgba(0,0,0,0.5);
		    border: 1px solid rgba(0,0,0,0);
		    color: #fff;
		}
		.header .menu a:hover{
		    border: 1px solid rgba(0,0,0,0.2);
		}
		/* End - Main */
		/* Homepage */
		.page-content{
		    padding: 50px 0;
		    border-bottom: 1px solid rgba(0,0,0,0.2);
		}
		.page-content .data-title{
		    margin-top: 25px;
		}
		/* End Homepage */
	</style>
	
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