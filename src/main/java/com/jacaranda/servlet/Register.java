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

		try {
			String name = request.getParameter("user");
			String password = getMD5(request.getParameter("pass"));
			String cName = request.getParameter("cName");
			DateTimeFormatter formateo = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate birthday = LocalDate.parse(request.getParameter("birthday"), formateo);
			String gender = request.getParameter("gender");
			UserDAO ud = new UserDAO();
			if (ud.findUser(name) != null) {
				out.print("Ya existe un usuario con ese nombre");
			} else if (ud.addUser(name, password, cName, birthday, gender)) {
				out.print("Usuario creado");
			} else {
				out.print("No se pudo crear el usuario");
			}
		} catch (Exception e) {
			out.println("Error en la conexión a base de datos");
		}

	}

}
