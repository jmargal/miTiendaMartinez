<%@page import="com.jacaranda.accesoDatos.ArticleDAO"%>
<%@page import="com.jacaranda.logica.ItemCarrito"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@page import="com.jacaranda.logica.Article"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Added</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	int idCat=(int)(sesion.getAttribute("idCat"));
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	Carro cart = (Carro) sesion.getAttribute("carrito");
	int cant = Integer.parseInt(request.getParameter("cant"));
	int idArticle = Integer.parseInt(request.getParameter("idArticle"));
	ItemCarrito item = new ItemCarrito(idArticle, cant);
	cart.addItem(item);
	
	out.println(cart.toString());
	%>

	<form action="mainArticles.jsp?id=<%=idCat%>" method="post">
		<input type="text" value=<%=name%> name="user" hidden=""> <input
			type="text" value=<%=password%> name="password" hidden=""> <input
			type="submit" name="boton" id="boton" value="Go back">
	</form>



</body>
</html>