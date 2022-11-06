package com.jacaranda.pruebas;

import com.jacaranda.accesoDatos.UserDAO;

public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserDAO ud=new UserDAO();
		System.out.println(ud.validateUser("aziemi", "u4eIH4bu"));
		
	}

}
