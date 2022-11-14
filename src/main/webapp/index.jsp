<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
	<div id="loginData">
		<form action="/miTiendaMartinez/Login" method="post" id="form">
			<p id="login">miTienda</p>
			<div id="divUser">
				User<br> <input type="text" required id="user" name="user">
			</div>
			<br>
			<br>
			<div id="divPass">
				Password<br> <input type="password" required id="password"
					name="password">
			</div>
			<br>
			<input type="submit" value="Iniciar Sesión" id="boton">
		</form>
	</div>
	<br>
	<div id="register">
	<a href="register.jsp">Sign Here!</a>
	</div>
	
	<div id="closeSession">
	<button></button>
	<%HttpSession sesion=request.getSession();
	sesion.invalidate();
	%>
	</div>
	
</body>
</html>