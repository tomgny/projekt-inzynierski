<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="pl">

<head>
	<title>Panel admina</title>
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
	</style>
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









