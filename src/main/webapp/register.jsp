<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="registerData">
		<form action="/miTiendaMartinez/Register" method="post" id="form">
			<p id="regis">Sign here in miTiendaMartinez</p>
			<div id="divUser">
				<label for="user">Enter here your user name</label><br> <input
					type="text" required id="user" name="user">
			</div>
			<br>
			<div id="divPassword">
				<label for="pass">Enter here your password</label><br> <input
					type="password" required id="pass" name="pass">
			</div>
			<br>
			<div id="divCompleteName">
				<label for="cName">Enter here your complete name</label><br> <input
					type="text" required id="cName" name="cName">
			</div>
			<br>
			<div id="divBirthDay">
				<label for="birthday">Enter here your birthday (YYYY-MM-DD)</label><br> <input
					type="text" required id="birthday" name="birthday">
			</div>
			<br>
			<div id="divGender">
				<label for="gender">Enter here your gender</label><br> <input
					type="text" required id="gender" name="gender">
			</div>
			<br>
	
	<br>
	<input type="submit" value="Create User" id="boton">
	</form>
	</div>
</body>
</html>