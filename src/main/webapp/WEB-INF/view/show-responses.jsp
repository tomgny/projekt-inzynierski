<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista odpowiedzi</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/showResponse.css">
	<style>
		#wrapper{
		   width: 500px;
		   overflow: hidden; /* will contain if #first is longer than #second */
		   border: 1px solid black;
		}
		#table1{
		    width: 300px;
		    float: left; /* add this */
		}
		#table2{
		    overflow: hidden; /* if you don't want #second to wrap below #first */
		}
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
			<h2>Lista odpowiedzi</h2>
		</div>
	
		<div class="page-content">
			<div class="data">
				
				<!-- add out html table here -->
				<div id="table1">
					<table class="table table-bordered table-striped">
						<thead class="thead-dark">
							<tr>
								<th>Id</th>
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
				<div id="table2">
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
			</div>
			<br><br>
			<a href="${pageContext.request.contextPath}/questionnaires/show-questionnaire">Wstecz</a>
		</div>
	</div>
</body>

</html>