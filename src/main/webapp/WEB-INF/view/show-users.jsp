<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="pl">

<head>
	<title>Panel admina</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>

<div class="main-content">
		<div class="header">
			<h2>Lista użytkowników</h2>
		</div>
	
		<div class="page-content">
			<div class="data">
				
				<!-- add out html table here -->
				<table class="table table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>Nazwa użytkownika</th>
							<th>Rola</th>
							<th>Zmień role</th>
						</tr>
					</thead>
					
					<c:forEach var="user" items="${users}">
						<c:url var="setRoles" value="/systems/setRoles">
							<c:param name="username" value="${user.userName}"/>
						</c:url>
						<!-- construct an "update" link with customer id -->
						<tr>
							<td>${user.id}</td>
							<td>${user.userName}</td>
							<td>
								<c:forEach var="role" items="${user.roles}">
									${role}
								</c:forEach>
							</td>
							<td>
								<a href="${setRoles}" class="btn btn-outline-dark">Edytuj role</a>
							</td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
		</div>
		<br>
		<a href="${pageContext.request.contextPath}/">Wstecz</a>
	</div>

</body>

</html>









