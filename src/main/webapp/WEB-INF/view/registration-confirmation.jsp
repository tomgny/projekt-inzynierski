<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!doctype html>
<html lang="pl">

<head>
	<title>Potwierdzenie rejestracji</title>
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
			<h2>Użytkownik zarejestrowany pomyślnie!</h2>
		</div>
		<div class="page-content">
		<br><br>
		<a href="${pageContext.request.contextPath}/showMyLoginPage">Zaloguj się</a>
		</div>
	</div>
</body>

</html>