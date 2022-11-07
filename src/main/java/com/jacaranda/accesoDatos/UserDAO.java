package com.jacaranda.accesoDatos;

import java.time.LocalDate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.jacaranda.logica.User;

public class UserDAO {
	StandardServiceRegistry sr;
	SessionFactory sf;
	Session session;

	public UserDAO() {
		super();
		this.sr = new StandardServiceRegistryBuilder().configure().build();
		;
		this.sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		this.session = sf.openSession();
	}

	public boolean validateUser(String login, String password) {
		boolean valid = false;
		User u = (User) session.get(User.class, login);
		if (u == null) {
			u = new User();
		} else {
			if (u.getPassword().toUpperCase().equalsIgnoreCase(password.toUpperCase())) {
				valid = true;
			}

		}
		return valid;
	}
	
	public boolean addUser(String name, String password,String cName, LocalDate birthday, String gender) {
		boolean resul=false;
		User u= new User(name, password, cName, birthday, gender);
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(u);
			session.getTransaction().commit();
			resul=true;
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return resul;
	}
	
}