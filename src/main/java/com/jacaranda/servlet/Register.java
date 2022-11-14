package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.accesoDatos.UserDAO;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		String name = request.getParameter("user");
		String password = getMD5(request.getParameter("pass"));
		
		try {
			String cName = request.getParameter("cName");
			DateTimeFormatter formateo = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate birthday = LocalDate.parse(request.getParameter("birthday"), formateo);
			String gender = request.getParameter("gender");
			UserDAO ud = new UserDAO();
			if (ud.findUser(name) != null) {
				out.print("<html><h1>There is already an user with this name</h1>"
							+ "<form action=\"/miTiendaMartinez/index.jsp\" method=\"post\">\r\n"
							+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
							+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
							+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
							+ "	</form>"
							+ "</html>");
			} else if (ud.addUser(name, password, cName, birthday, gender)) {
				out.print("<html><h1>User created</h1>"
						+ "<form action=\"/miTiendaMartinez/index.jsp\" method=\"post\">\r\n"
						+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
						+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
						+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
						+ "	</form>"
						+ "</html>");
			} else {
				out.print("<html><h1>It seems there was a problem...</h1>"
						+ "<form action=\"/miTiendaMartinez/index.jsp\" method=\"post\">\r\n"
						+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
						+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
						+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
						+ "	</form>"
						+ "</html>");
			}
			
		} catch (Exception e) {
			out.println("<html><h1>Problem connecting with database</h1>"
						+ "<form action=\"/miTiendaMartinez/index.jsp\" method=\"post\">\r\n"
						+ "		<input type=\"text\" value="+ name+ "name=\"password\" hidden=\"\">\r\n"
						+ "		<input type=\"text\" value="+ password+ " name=\"user\" hidden=\"\">\r\n"
						+ "		<input type=\"submit\" name=\"boton\" id=\"boton\" value=\"Go back\">\r\n"
						+ "	</form>"
						+ "</html>");
		}

	}

}
