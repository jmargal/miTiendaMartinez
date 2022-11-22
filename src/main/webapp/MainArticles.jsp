<%@page import="com.jacaranda.logica.Carro"%>
<%@page import="com.jacaranda.accesoDatos.UserDAO"%>
<%@page import="com.jacaranda.logica.User"%>
<%@page import="com.jacaranda.accesoDatos.CategoryDAO"%>
<%@page import="com.jacaranda.logica.Category"%>
<%@page import="com.jacaranda.logica.Article"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/mainArticles.css">
<meta charset="UTF-8">
<title>Articles</title>
</head>
<body>

	<%
	//Creo la sesion para recoger los atributos que ten�a en el login
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	//Cojo el id de categor�a que me han mandado para mostrar sus articulos
	int id = Integer.parseInt(request.getParameter("id"));
	Category c = CategoryDAO.findCategory(id);
	//Creo la sesion para recoger los atributos que ten�a en el login

	sesion.setAttribute("idCat", id);
	Carro cart = (Carro) sesion.getAttribute("carrito");

	if (name == null || password == null) {
		response.sendRedirect("error.jsp");
	} else {

		//Con esos atributos busco y guardo ese user
		User u = UserDAO.findUser(name);
		//Si es admin le saco que pueda a�adir article
	%>
	<div id=cat>
		<h2>
			Category:
			<%=c.getName()%></h2>
	</div>
	<%
	if (u.isAdmin()) {
	%>

	<a href="addArticle.jsp?id=<%=id%>">
		<button>Add new product</button>
	</a>
	<br>

	<%
	}
	%>


	<table border="1">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Description</td>
			<td>Price</td>
			<td>Id_cat</td>
			<td>Stock</td>
			<td>
		</tr>
		<%
		List<Article> list = c.getArticleList();
		for (Article a : list) {
		%>
		<tr>
			<td><%=a.getId()%></td>
			<td><%=a.getName()%></td>
			<td><%=a.getDescription()%></td>
			<td><%=a.getPrice()%></td>
			<td><%=a.getId_cat().getId_cat()%></td>
			<td><%=a.getStock()%></td>
			<td>
				<form action="addToCart.jsp" class="formBuy" method="post"
					id="formCarrito">
					<input type="number" name="cant" id="cant" placeholder="Quantity">
					<input type="number" value=<%=a.getId()%> name="idArticle"
						hidden=""> <input type="submit" value="Add"
						id="cantButton">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<!-- Form oculto para volver al login con esos atributos -->
	<form action="Login" method="post">
		<input type="text" value=<%=name%> name="user" hidden=""> <input
			type="text" value=<%=password%> name="password" hidden=""> <input
			type="submit" name="boton" id="boton" value="Go back">
	</form>
	<form action="execBuy.jsp" method="post">
		<input type="submit" name="botonCart" id="botonCart" value="Purchase">
	</form>

	<%
	}
	%>
	<script src="articles.js"></script>
</body>
</html>