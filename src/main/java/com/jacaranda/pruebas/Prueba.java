package com.jacaranda.pruebas;

import java.util.List;

import com.jacaranda.accesoDatos.CategoryDAO;
import com.jacaranda.accesoDatos.UserDAO;
import com.jacaranda.logica.Category;

public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		UserDAO ud=new UserDAO();
//		System.out.println(ud.validateUser("aziemi", "u4eIH4bu"));
		CategoryDAO c=new CategoryDAO();
//		List<Category> lista=c.devuelveCategories();
//		System.out.println(lista.toString());
		System.out.println(c.findCategory(1));
	}

}
