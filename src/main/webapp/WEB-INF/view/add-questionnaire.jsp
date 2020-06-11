<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html lang="pl">
<head>
	<title>Dodaj ankiete</title>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&display=swap" rel="stylesheet">
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/main.css">  
</head>

<body>
	<div class="main-content">
			<div class="header">
				<div class="title">
					<h1>Dodaj ankietę</h1>
				</div>
			</div>
			<div class="page-content">
			<div class="data">
				<form:form action="saveQuestionnaire" modelAttribute="questionnaire" method="POST">
					<form:hidden path="id" />
					<div class="form-row">
						<label><h3>Nazwa ankiety:</h3></label>
						<br>
						<div class="box questionnaire">
							<form:input path="title"></form:input>
							<input type="submit" value="Zapisz" />
						</div>
					</div>
				</form:form>
			</div>
			<br><br><br>
			<a href="${pageContext.request.contextPath}/">Wstecz</a>
		</div>
	</div> 
		
		
</body>

</html>