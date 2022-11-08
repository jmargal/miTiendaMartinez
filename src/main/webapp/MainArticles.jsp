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
	int id = Integer.parseInt(request.getParameter("id"));
	CategoryDAO cdao = new CategoryDAO();
	Category c = new Category();
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
			<td><%=a.getId_cat()%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>