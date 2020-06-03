<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!doctype html>
<html lang="pl">

<head>
	
	<title>Logowanie</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
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

			<!--  <div id="loginbox" style="margin-top: 50px;"
				class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">-->
			<div class="page-content">
				<div class="panel panel-info">
	
					<div class="panel-heading">
						<div class="panel-title">Zaloguj się</div>
					</div>
	
					<div style="padding-top: 30px" class="panel-body">
	
						<!-- Login Form -->
						<form:form action="${pageContext.request.contextPath}/authenticateTheUser" 
								   method="POST" class="form-horizontal">
	
						    <!-- Place for messages: error, alert etc ... -->
						    <div class="form-group">
						        <div class="col-xs-15">
						            <div>
											
									<!-- Check for login error -->
		
									<c:if test="${param.error != null}">
	
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Błędna nazwa użytkownika lub hasło.
										</div>
									
									</c:if>
									
									<c:if test="${param.logout != null}">
																			            
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											Zostałeś wylogowany.
										</div>
										
									 </c:if>   
	
						            </div>
						        </div>
						    </div>
	
							<!-- User name -->
							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
								
								<input type="text" name="username" placeholder="login" class="form-control">
							</div>
	
							<!-- Password -->
							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
								
								<input type="password" name="password" placeholder="hasło" class="form-control" >
							</div>
	
							<!-- Login/Submit Button -->
							<div style="margin-top: 10px" class="form-group">						
								<div class="col-sm-6 controls">
									<button type="submit" class="btn btn-success">Zaloguj</button>
								</div>
							</div>
	
						</form:form>
	
					</div>
	
				</div>
				
				<div>
					 <a href="${pageContext.request.contextPath}/register/showRegistrationForm"
					 	class="btn btn-primary"
					 	role="button" aria-pressed="true">
					 	Zarejestruj się
					 </a>
				</div>
	
			</div>

	</div>

</body>
</html>