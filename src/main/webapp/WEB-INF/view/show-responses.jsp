<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista odpowiedzi</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
	      
	<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/showResponse.css">

</head>

<body>
	
	<div class="main-content">
		<div class="header">
			<h2>Lista odpowiedzi</h2>
		</div>
	
		<div class="page-content">
			<div class="data">
				
				<!-- add out html table here -->
				<div class="col-xs-6">
					<div id="table-responsive" style="float: left;">
						<table class="table table-bordered table-striped">
							<thead class="thead-dark">
								<tr>
									<th>Id pytania</th>
									<th>Pytanie</th>
								</tr>
							</thead>
							
							<c:forEach var="tempQuest" items="${questions}" varStatus="questCounter">
								<!-- construct an "update" link with customer id -->
								<tr>
									<td>${tempQuest.id}</td>
									<td>${tempQuest.title}</td>		
								</tr>
								
							</c:forEach>
						</table>
					</div>
					<div id="table-responsive" style="float: left;">
						<table class="table table-bordered table-striped">
							<thead class="thead-dark">
								<tr>
									<th>Odpowiedź</th>
									<th>Hash</th>
								</tr>
							</thead>
							<c:forEach var="tempResp" items="${responses}" varStatus="respCounter">
								<!-- construct an "update" link with customer id -->
								<tr>
									<td>${tempResp.text}</td>
									<td>${tempResp.verification}</td>			
								</tr>
								
							</c:forEach>
						</table>
					</div>
					<div id="table-responsive" style="float: left;">
						<table class="table table-bordered table-striped">
							<thead class="thead-dark">
								<tr>
									<th>Weryfikacja</th>
								</tr>
							</thead>
							<c:forEach var="match" items="${checkHash}" varStatus="respCounter">
								<!-- construct an "update" link with customer id -->
								<tr>
									<td>
										<c:if test = "${!match}">
											<img src="${pageContext.request.contextPath}/resources/images/red_mark_new.png" alt="Hash doesn't match!">
										</c:if>
										<c:if test = "${match}">
											<img src="${pageContext.request.contextPath}/resources/images/green_mark_new.png" alt="Hash match!"/>
										</c:if>
									</td>			
								</tr>
								
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
			<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>
		</div>
	</div>
</body>

</html>