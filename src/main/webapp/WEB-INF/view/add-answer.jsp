<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dodawnie odpowiedzi</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
		/* Add */
		.add-options{
		    display: flex;
		    justify-content: space-between;
		}
		.add-options a{
		    padding: 25px 75px;
		    background-image: linear-gradient(270deg, rgb(185, 43, 39), rgb(21, 101, 192));
		    max-width: 250px;
		    font-weight: 500;
		    color: #fff;
		    transition: all 500ms;
		    opacity: 0.5;
		}
		.add-options a:hover,
		.add-options a.active{
		    opacity: 0.8;
		}
		/* End - Add */
	</style>
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