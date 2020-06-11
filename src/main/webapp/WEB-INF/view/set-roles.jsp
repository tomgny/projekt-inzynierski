<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edycja ról</title>
	<link type="text/css"
	      rel="stylesheet"
	      href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>

	<div class="main-content">
		<div class="header">
			<h2>Edycja ról</h2>
		</div>
		<div class="page-content">
			<div class="data">
				<form:form action="saveRoles" modelAttribute="roleUser" method="POST">
					<form:hidden path="userName" value="${user.userName}"/>
					<!-- need to associate this data with customer id -->
					<table>
						<tbody>
							<tr>
								<td><label>Lista ról dla użytkownika ${user.userName}</label></td>
								<td>
									<form:select path="roleName" name="roles">
										<c:forEach var="role" items="${roles}">
											<form:option value="${role}">${role}</form:option>
										</c:forEach>
									</form:select>
								</td>
							</tr>
							
							<tr>
								<td><label></label></td>
								<td><input type="submit" value="Zapisz" class="save"/></td>
							</tr>
						</tbody>
					</table>
				
				
				 </form:form>
			 
			</div>
			<br><br>
			<a href="${pageContext.request.contextPath}/systems/showUsers">Wstecz</a>
		 </div>
	</div>
	
</body>
</html>