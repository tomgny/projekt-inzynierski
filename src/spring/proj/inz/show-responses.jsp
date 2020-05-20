<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
	<title>Lista odpowiedzi</title>
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Lista odpowiedzi</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			
			<!-- add out html table here -->
			<table>
				<tr>
					<th>Id</th>
					<th>Pytanie</th>
				</tr>
				
				<c:forEach var="tempQuest" items="${questions}" varStatus="questConter">
					<!-- construct an "update" link with customer id -->
					<tr>
						<td>${questCounter.index}</td>
						<td>${tempQuest.title}</td>		
					</tr>
					
				</c:forEach>
			</table>
			
			<table>
				<tr>
					<th>Id</th>
					<th>Odp</th>
				</tr>
				
				<c:forEach var="tempResp" items="${responses}" varStatus="respCounter">
					<!-- construct an "update" link with customer id -->
					<tr>
						<td>${respCounter.index}</td>
						<td>${tempResp.text}</td>		
					</tr>
					
				</c:forEach>
			</table>
		</div>
	</div>
</body>

</html>