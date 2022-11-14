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
<meta charset="UTF-8">
<title>Articles</title>
</head>
<body>

	<%
	//Cojo el id de categoría que me han mandado para mostrar sus articulos
	int id = Integer.parseInt(request.getParameter("id"));
	CategoryDAO cdao = new CategoryDAO();
	Category c = new Category();
	//Creo la sesion para recoger los atributos que tenía en el login
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	UserDAO udao = new UserDAO();
	//Con esos atributos busco y guardo ese user
	User u = udao.findUser(name);
	if(u==null){
		out.print("No se pasaron los parámetros adecuados");
	}
	//Si es admin le saco que pueda añadir article
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


		</tr>
		<%
		c = cdao.findCategory(id);
		List<Article> list = c.getArticleList();
		for (Article a : list) {
		%>
		<tr>
			<td><%=a.getId()%></td>
			<td><%=a.getName()%></td>
			<td><%=a.getDescription()%></td>
			<td><%=a.getPrice()%></td>
			<td><%=a.getId_cat().getId_cat()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<!-- Form oculto para volver al login con esos atributos -->
	<form action="/miTiendaMartinez/Login" method="post">
		<input type="text" value=<%=name%> name="password" hidden="">
		<input type="text" value=<%=password%> name="user" hidden="">
		<input type="submit" name="boton" id="boton" value="Go back">
	</form>

</body>
</html>