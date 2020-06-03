<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
		.error {color:red}
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

<title>Insert title here</title>
</head>
	<body>
	
		<div class="main-content">
			<div class="header">
				<h2>Lista Pytań</h2>
			</div>
		
			<div class="page-content">
				<div class="data">
					<form:form id="myForm" action="saveResponse" modelAttribute="responses" method="POST">
						<input type="hidden" name="questionnaireId" value="${param.questionnaireId}">
						<!-- add out html table here -->
						<table class="table table-bordered table-striped">
							<thead class="thead-dark">
								<tr>
									<th>Numer pytania</th>
									<th>Pytanie</th>
									<th>Odpowiedzi</th>
								</tr>
							</thead>
							<c:forEach var="tempQuest" items="${responses.responses}" varStatus="theCount">
								
								<!-- construct an "update" link with customer id -->
								<tr>
									<td>${questions[theCount.index].id}</td>
									<td>${questions[theCount.index].title}</td>
									<td>
	
											<c:if test="${questions[theCount.index].type == '1'}">
												<c:forEach var="tempA" items="${questions[theCount.index].answers}" varStatus="answerCount">
													<form:radiobutton path = "responses[${theCount.index}].text" value = "${tempA.title}" label = "${tempA.title}" />
												</c:forEach>
												
											</c:if>
											<c:if test="${questions[theCount.index].type == '2'}">
												<c:forEach var="tempA" items="${questions[theCount.index].answers}" varStatus="answerCount">
													<form:checkbox path = "responses[${theCount.index}].text" value = "${tempA.title}" label = "${tempA.title}" />
												</c:forEach>
												
											</c:if>
											<c:if test="${questions[theCount.index].type == '3'}">
												<form:select path="responses[${theCount.index}].text">
													<c:forEach var="tempA" items="${questions[theCount.index].answers}" varStatus="answerCount">
														<form:option value="${tempA.title}"/>
													</c:forEach>
												</form:select>
												
											</c:if>
											<c:if test="${questions[theCount.index].type == '4'}">
													<form:textarea path = "responses[${theCount.index}].text" />
											</c:if>
										<form:errors path="responses[${theCount.index}].text" cssStyle="color: #ff0000;" />
									</td>
									<form:hidden path="responses[${theCount.index}].questionnaireId" value="${param.questionnaireId}"/>
									<form:hidden path="responses[${theCount.index}].questionId" value="${questions[theCount.index].id}"/>
								</tr>
	
							</c:forEach>
							
						</table>
						Przed zapisaniem odpowiedzi podaj hasło w celu odczytania swoich odpowiedzi w przyszłości oraz uzyskania anonimowości.
						
						<input type="text" id="passwd" name="passwd"/>
						<br><br>
						<input type="submit" value="Zapisz" class="save"/>
					</form:form>
				</div>
			</div>
			<br><br><br>
			<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>
		</div>
	</body>
</html>