package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.accesoDatos.CategoryDAO;
import com.jacaranda.logica.Article;
import com.jacaranda.logica.Category;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Main() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		
		PrintWriter out = response.getWriter();
		CategoryDAO cDao=new CategoryDAO();
		out.print("<html>");
		out.print("<h2>Categories</h2>");
		List<Category> categoryList=cDao.devuelveCategories();
		out.print("<table border=1>");
		out.print("<td>Name</td>"+
					"<td>Description</td>"+
					"<td>Id_cat</td>"
					);
		for (Category c : categoryList) {			
			out.println(

				"<tr>"+
				"<td>"+c.getName()+"</td>"+
				"<td>"+c.getDescription()+"</td>"+
				"<td>"+c.getId_cat()+"</td>"+
				"<td><a href=/miTiendaMartinez/mainArticles.jsp?id=" + c.getId_cat() +">See Articles</td>"+
				"</tr>");
			};
		out.print("</table></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
