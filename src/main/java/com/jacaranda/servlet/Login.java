package com.jacaranda.servlet;

import java.math.BigInteger;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.accesoDatos.CategoryDAO;
import com.jacaranda.accesoDatos.UserDAO;
import com.jacaranda.logica.Carro;
import com.jacaranda.logica.Category;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);

			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		/*
		 * Desde donde vengan me han tenido que mandar parámetros
		 */
		String name = request.getParameter("user");
		String password = request.getParameter("password");
		if (name == null || password == null) {
			out.print("<html><head><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>Parameters required</h1>"
					+ "<form action=\"index.jsp\" method=\"post\">\r\n"
					+ "		<input type=\"text\" value=" + name + "name=\"password\" hidden=\"\">\r\n"
					+ "		<input type=\"text\" value=" + password + " name=\"user\" hidden=\"\">\r\n"
					+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n" + "	</form>"
					+ "</body></html>");
		}

		try {

			/* Si no son nulos proceso */
			if (name != null && password != null) {
				HttpSession sesion = request.getSession();
				// Setteo atributos que voy a utilizar en el mainArticles
				sesion.setAttribute("name", name);
				sesion.setAttribute("password", password);
				/*
				 * La cifro porque en la base de datos la guardo cifrada
				 */
				password = getMD5(password);
				// Si el usuario es válido muestro
				if (UserDAO.findUser(name) == null) {
					out.print("<html><head><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>Parece que no estás registrado</h1>" + "<h3>Do you want to sign up?</h3>"
							+ "<a href=register.jsp>Sign Here!</a>"
							+ "<form action=\"index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value=" + name + "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value=" + password + " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</form>" + "<body></html>");
				} else if (UserDAO.validateUser(name, password)) {

					out.print("<html><head>\r\n" + "<link rel=\"stylesheet\" href=\"styles/mainArticles.css\">\r\n"
							+ "<meta charset=\"UTF-8\">\r\n" + "<title>Categories</title>\r\n" + "</head>" + "<body>");
					out.print("<h2>Categories</h2>");
					Carro cart = (Carro) sesion.getAttribute("carrito");
					
					List<Category> categoryList = CategoryDAO.devuelveCategories();
					out.print("<table border=1>");
					out.print("<td>Name</td>" + "<td>Description</td>" + "<td>Id_cat</td>");
					for (Category c : categoryList) {
						out.println(

								"<tr>" + "<td>" + c.getName() + "</td>" + "<td>" + c.getDescription() + "</td>" + "<td>"
										+ c.getId_cat() + "</td>" + "<td><a href=/miTiendaMartinez/mainArticles.jsp?id="
										+ c.getId_cat() + ">See Articles</td>" + "</tr>");
					}
					;
					out.print("</table><form action=\"index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value=" + name + "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value=" + password + " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</form>" + "</body>" + "</html>");
					// Si no es válido le digo que no está registrado
				} else {
					out.print("<html><head><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>No valid password</h1>"
							+ "<form action=\"index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value=" + name + "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value=" + password + " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</form>" + "<div id=\"closeSession\">" + "<button type=\"button\">" + "Close session"
							+ "</button>" + "</div>" + "<body></html>");
				}
			}
		} catch (Exception e) {
			out.println("<html><head><link rel=\"stylesheet\" href=\"styles/index.css\"></head><body><h1>Problem connecting with database</h1>"
					+ "<form action=\"index.jsp\" method=\"post\">\r\n"
					+ "		<input type=\"text\" value=" + name + "name=\"password\" hidden=\"\">\r\n"
					+ "		<input type=\"text\" value=" + password + " name=\"user\" hidden=\"\">\r\n"
					+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n" + "	</form>"
					+ "</body></html>");
		}
	}

}
