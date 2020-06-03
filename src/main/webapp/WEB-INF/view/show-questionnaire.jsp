<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista ankiet</title>
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
		/* Questionnaire */
		.page-content .data .form-row .box.questionnaire textarea{
		    max-width: 100%;
		    border: 1px solid rgba(0,0,0,0.2);
		    margin: 0;
		}
		.page-content .data .form-row .box.questionnaire {
		    display: flex;
		    flex-direction: column;
		}
		.page-content .data .form-row .box.questionnaire input{
		    border: 1px solid rgba(0,0,0,0.2);
		    border-top: 0;
		    width: 100%;
		}
		.page-content .data .form-row .box.questionnaire input:hover{
		    border: none;
		}
		/* End - Questionnaire */
	</style>
</head>

<body>
	<div class="main-content">
		<div class="header">
			<h2>Lista ankiet</h2>
		</div>
	
		<div class="page-content">
			<div class="data">
				
				<table class="table table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>Tytuł</th>
							<th>Dodaj pytanie</th>
							<th>Dodaj odpowiedz</th>
							<th>Odpowiedz na ankiete</th>
							<th>Zobacz swoje odpowiedzi</th>
						</tr>
					</thead>
					<c:forEach var="tempQuest" items="${questionnaires}">
					
						<c:url var="addQuestion" value="/question/addQuestion">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						
						<c:url var="showQuestions" value="/question/showQuestions">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<c:url var="doResponse" value="/response/doResponse">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<c:url var="getResponses" value="/response/getResponses">
							<c:param name="questionnaireId" value="${tempQuest.id}"/>
						</c:url>
						<tr>
							<td>${tempQuest.id}</td>
							<td>${tempQuest.title}</td>		
							<td><a href="${addQuestion}" class="btn btn-outline-dark">Dodaj pytanie</a></td>	
							<td><a href="${showQuestions}" class="btn btn-outline-dark">Dodaj odpowiedź</a></td>	
							<td><a href="${doResponse}" class="btn btn-outline-dark">Odpowiedz na ankiete</a></td>	
							<td><a href="${getResponses}" class="btn btn-outline-dark">Zobacz odpowiedzi</a></td>	
						</tr>
						
					</c:forEach>
				</table>
			</div>	
			 	<a href="${pageContext.request.contextPath}">Wstecz</a>
		</div>
	</div>
</body>

</html>