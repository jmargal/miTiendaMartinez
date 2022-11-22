<%@page import="com.jacaranda.logica.Article"%>
<%@page import="com.jacaranda.accesoDatos.ArticleDAO"%>
<%@page import="com.jacaranda.logica.ItemCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	Carro cart = (Carro) sesion.getAttribute("carrito");
	ArrayList<ItemCarrito> list = cart.getListaArts();
	%>
	<h2>You have purchased the following items</h2>
	<table border="1">
		<tr>
			<td>Id_Article</td>
			<td>Id_Cat</td>
			<td>Price</td>
			<td>Name</td>
			<td>Quantity</td>
		</tr>
		<%
		for (ItemCarrito i : list) {
			Article a = ArticleDAO.findArticle(i.getId_article());
		%>
		<tr>
			<td><%=i.getId_article()%></td>
			<td><%=a.getId_cat()%></td>
			<td><%=a.getPrice()%></td>
			<td><%=a.getName()%></td>
			<td><%=i.getCant()%></td>
		</tr>
		<%
		}
		%>
	<form action="Login" method="post">
		<input type="text" value=<%=name%> name="user" hidden=""> <input
			type="text" value=<%=password%> name="password" hidden=""> <input
			type="submit" name="boton" id="boton" value="Go to Login">
	</form>
	<form action="buyComplete.jsp">
		<input type="submit" name="boton" id="bot" value="Purchase">
	</form>
</body>
</html>