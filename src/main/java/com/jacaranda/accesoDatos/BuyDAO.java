package com.jacaranda.accesoDatos;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.hibernate.Session;

import com.jacaranda.logica.Article;
import com.jacaranda.logica.Buy;
import com.jacaranda.logica.User;

public class BuyDAO {

	public static boolean addBuy(Article id_article, User user_name, double price, LocalDateTime buy_date, int cant) {
		Session session = ConnectionBD.getSession();
		Buy b = new Buy(id_article, user_name, price, buy_date, cant);
		boolean resul = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(b);
			session.getTransaction().commit();
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}
		return resul;

	}
}
