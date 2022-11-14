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
		try {
			/*Desde donde vengan me han tenido que mandar 
			parámetros*/
			String name = request.getParameter("user");
			String password = request.getParameter("password");
			/*Si no son nulos proceso*/
			if (name != null && password != null) {
				HttpSession sesion = request.getSession();
				//Setteo atributos que voy a utilizar en el mainArticles
				sesion.setAttribute("name", name);
				sesion.setAttribute("password", password);
				/*La cifro porque en la base de datos la
				guardo cifrada*/
				password = getMD5(password);	
				UserDAO ud = new UserDAO();
				//Si el usuario es válido muestro
				if(ud.findUser(name)==null) {
					out.print("<html><h1>Parece que no estás registrado</h1>"
							+ "<h3>Do you want to sign up?</h3>"+"<a href=register.jsp>Sign Here!</a>"+
							"<form action=\"/miTiendaMartinez/index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</form>"+"</html>");
				}
				else if (ud.validateUser(name, password)) {
					CategoryDAO cDao = new CategoryDAO();
					out.print("<html>");
					out.print("<h2>Categories</h2>");
					List<Category> categoryList = cDao.devuelveCategories();
					out.print("<table border=1>");
					out.print("<td>Name</td>" + "<td>Description</td>" + "<td>Id_cat</td>");
					for (Category c : categoryList) {
						out.println(

								"<tr>" + "<td>" + c.getName() + "</td>" + "<td>" + c.getDescription() + "</td>" + "<td>"
										+ c.getId_cat() + "</td>" + "<td><a href=/miTiendaMartinez/mainArticles.jsp?id="
										+ c.getId_cat() + ">See Articles</td>" + "</tr>");
					}
					;
					out.print("</table><form action=\"/miTiendaMartinez/index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</form></html>");
				//Si no es válido le digo que no está registrado
				} else {
					out.print("<html><h1>No valid password</h1>"
							+ "<form action=\"/miTiendaMartinez/index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</form></html>");
				}
			}
		} catch (Exception e) {
			out.println("<html><h1>Ocurrió un error inesperado en la conexión de base de datos</h1></html>");
		}
	}
	
	

	
}
