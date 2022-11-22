<%@page import="com.jacaranda.accesoDatos.BuyDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.jacaranda.accesoDatos.UserDAO"%>
<%@page import="com.jacaranda.accesoDatos.ArticleDAO"%>
<%@page import="com.jacaranda.logica.Carro"%>
<%@page import="com.jacaranda.logica.User"%>
<%@page import="com.jacaranda.logica.Article"%>
<%@page import="com.jacaranda.logica.ItemCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyComplete</title>
</head>
<body>


	<%
	HttpSession sesion = request.getSession();
	String name = (String) sesion.getAttribute("name");
	String password = (String) sesion.getAttribute("password");
	Carro cart = (Carro) sesion.getAttribute("carrito");

	ArrayList<ItemCarrito> list = cart.getListaArts();

	for (ItemCarrito i : list) {

		//Consigo el articulo con el id
		Article a = ArticleDAO.findArticle(i.getId_article());
		//Consigo el user
		User u = UserDAO.findUser(name);
		double article_price = a.getPrice();
		int cant = i.getCant();
		//Hago la inserción en base de datos con los datos
		out.println(BuyDAO.addBuy(a, u, article_price, LocalDateTime.now(), cant));

	}
	%>




</body>
</html>