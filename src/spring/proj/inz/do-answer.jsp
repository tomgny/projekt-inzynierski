<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>
	
		<div id="wrapper">
			<div id="header">
				<h2>Lista Pytań</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
				
				<!-- add out html table here -->
				<table>
					<tr>
						<th>Numer pytania</th>
						<th>Pytanie</th>
					</tr>
					
					<c:forEach var="tempQuest" items="${questions}">
					
						<!-- construct an "update" link with customer id -->
						<tr>
							<td>${tempQuest.id}</td>
							<td>${tempQuest.title}</td>	
														<td>
								<c:forEach var="tempAnswer" items="${tempQuest.answers}">
									<tr>
										<td>${tempAnswer.answer}</td>
									</tr>
								</c:forEach>
							</td>

						</tr>
						
					</c:forEach>
				</table>
				
			</div>
		</div>
	</body>
</html>