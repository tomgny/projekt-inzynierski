<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!doctype html>
<html lang="pl">
<head>
	<meta charset="ISO-8859-1">
	<title>Błąd dodawania roli</title>
	<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
	<div class="main-content">
		<div class="header">
			<h2>Błąd dodawania roli</h2>
		</div>
		<div class="page-content">
			<div class="data">
				Użytkownik aktualnie posiada tę rolę.
			</div>
		</div>
		<br><br>
		<a href="${pageContext.request.contextPath}/systems/showUsers">Wstecz</a>
	</div>
</body>
</html>