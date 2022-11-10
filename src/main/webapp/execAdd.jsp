<%@page import="com.jacaranda.logica.Article"%>
<%@page import="com.jacaranda.logica.Category"%>
<%@page import="com.jacaranda.accesoDatos.CategoryDAO"%>
<%@page import="com.jacaranda.accesoDatos.ArticleDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ExecAdd</title>
</head>
<body>
	<%
	int idCat = Integer.parseInt(request.getParameter("id_cat"));
	ArticleDAO adao = new ArticleDAO();
	CategoryDAO cdao = new CategoryDAO();
	//Necesito la category pq para crear article necesito el object
	Category c = cdao.findCategory(idCat);
	Article a = new Article(Integer.parseInt(request.getParameter("idArticle")), request.getParameter("name"),
			request.getParameter("desc"), Double.parseDouble(request.getParameter("price")), c);
	//Si encuentra alguien con ese id es que ya existe
	if (adao.findArticle(a.getId()) != null) {
		out.write("No se pudo a�adir el jugador porque ya existe uno con ese id!!");
	}
	//Si lo crea muestro mensaje
	if (adao.addArticle(a)) {
		out.write("A�adido con �xito");
	}
	%>

</body>
</html>