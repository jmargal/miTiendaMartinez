package com.jacaranda.accesoDatos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import com.jacaranda.logica.Article;
import com.jacaranda.logica.Category;

public class CategoryDAO {

	private StandardServiceRegistry sr;
	private SessionFactory sf;
	private Session sesion;

	public CategoryDAO() {
		sr = new StandardServiceRegistryBuilder().configure().build();
		sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		sesion = sf.openSession();
	}

	public boolean addCategory(Category c) {
		boolean resul = false;
		try {
			sesion.getTransaction().begin();
			sesion.saveOrUpdate(c);
			sesion.getTransaction().commit();
			// Si hace el commit significa que no ha habido error y pongo true
			resul = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return resul;
	}

	public Category findCategory(int id) {
		Category aux = null;
		try {
			aux = sesion.get(Category.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return aux;
	}

	public List<Category> devuelveCategories() {
		Query query = sesion.createQuery("SELECT a FROM com.jacaranda.logica.Category a");
		List<Category> conjunto = (List<Category>) query.getResultList();
		return conjunto;
	}
}
