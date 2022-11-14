package com.jacaranda.pruebas;

import java.util.List;

import com.jacaranda.accesoDatos.CategoryDAO;
import com.jacaranda.accesoDatos.UserDAO;
import com.jacaranda.logica.Category;

public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserDAO ud=new UserDAO();
		System.out.println(ud.findUser("javi"));
	}

}
