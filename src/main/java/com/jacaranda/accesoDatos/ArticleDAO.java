package com.jacaranda.accesoDatos;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.jacaranda.logica.Article;

public class ArticleDAO {

	private StandardServiceRegistry sr;
	private SessionFactory sf;
	private Session session;

	public ArticleDAO() {
		super();
		sr = new StandardServiceRegistryBuilder().configure().build();
		sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		session = sf.openSession();
	}

	public boolean addArticle(Article a) {
		boolean resul = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(a);
			session.getTransaction().commit();
			// Si hace el commit significa que no ha habido error y pongo true
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return resul;
	}

	public boolean deleteArticle(int id) {
		boolean resul = false;
		try {
			Article a = (Article) session.get(Article.class, id);
			session.getTransaction().begin();
			session.delete(a);
			session.getTransaction().commit();
			// Si hace el commit significa que no ha habido error y pongo true
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return resul;
	}

	public Article findArticle(int id) {
		Article a = (Article) session.get(Article.class, id);
		return a;
	}

}
