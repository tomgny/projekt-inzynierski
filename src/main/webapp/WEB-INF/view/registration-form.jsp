<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!doctype html>
<html lang="pl">

<head>
	
	<title>Rejestracja</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link type="text/css"
     rel="stylesheet"
     href="${pageContext.request.contextPath}/resources/css/login.css">
     
     <style>
		body{
		    font-family: 'Montserrat', sans-serif;
		    margin: 0;
		    padding: 0;
		    background-image: linear-gradient(90deg, #b92b27, #1565C0);
		    max-width: 100vw;
		    max-height: 100vh;
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
	</style>

</head>

<body>

	<div class="main-content">
		
		<!--  <div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">-->
		<div class="page-content">
			<div class="panel panel-primary">

				<div class="panel-heading">
					<div class="panel-title">Rejestracja</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Registration Form -->
					<form:form action="${pageContext.request.contextPath}/register/processRegistrationForm" 
						  	   modelAttribute="questUser"
						  	   class="form-horizontal">

					    <!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>
								
									<!-- Check for registration error -->
									<c:if test="${registrationError != null}">
								
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											${registrationError}
										</div>
		
									</c:if>
																			
					            </div>
					        </div>
					    </div>

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							<form:errors path="userName" cssClass="error" />
							<form:input path="userName" placeholder="nazwa użytkownika (*)" class="form-control" />
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
							<form:errors path="password" cssClass="error" />
							<form:password path="password" placeholder="hasło (*)" class="form-control" />
						</div>
						
						<!-- Confirm Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
							<form:errors path="matchingPassword" cssClass="error" />
							<form:password path="matchingPassword" placeholder="potwierdź hasło (*)" class="form-control" />
						</div>
					
						
						<!-- First name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							<form:errors path="firstName" cssClass="error" />
							<form:input path="firstName" placeholder="imie (*)" class="form-control" />
						</div>
						
						<!-- Last name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							<form:errors path="lastName" cssClass="error" />
							<form:input path="lastName" placeholder="nazwisko (*)" class="form-control" />
						</div>
						
						<!-- Email -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							<form:errors path="email" cssClass="error" />
							<form:input path="email" placeholder="email (*)" class="form-control" />
						</div>
						
						

						<!-- Register Button -->
						<div style="margin-top: 10px" class="form-group">						
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-primary">Zarejestruj</button>
							</div>
						</div>
						
					</form:form>

				</div>

			</div>

		</div>

	</div>

</body>
</html>