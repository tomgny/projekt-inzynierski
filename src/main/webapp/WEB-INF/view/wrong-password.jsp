<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Brak wyników</title>
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<div class="main-content">
			<div class="header">
				<div class="title">
					<h2>Podałeś złe hasło lub nie odpowiedziałeś jeszcze na tę ankietę.</h2>
				</div>
			</div>
			<br><br>
			<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Powrót</a>
		</div>
</body>
</html>