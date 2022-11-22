package com.jacaranda.pruebas;

import java.time.LocalDateTime;
import java.util.List;

import com.jacaranda.accesoDatos.ArticleDAO;
import com.jacaranda.accesoDatos.BuyDAO;
import com.jacaranda.accesoDatos.CategoryDAO;
import com.jacaranda.accesoDatos.UserDAO;
import com.jacaranda.logica.Article;
import com.jacaranda.logica.Category;
import com.jacaranda.logica.User;

public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Category c=CategoryDAO.findCategory(3);
		User u=UserDAO.findUser("javi");
		Article a=ArticleDAO.findArticle(1);
		System.out.println(c);
		System.out.println(a);
		System.out.println(u);
		System.out.println(BuyDAO.addBuy(a, u, a.getPrice(), LocalDateTime.now(),1));
	}

}
