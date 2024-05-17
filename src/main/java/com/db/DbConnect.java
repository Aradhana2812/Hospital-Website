package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
	
	private static Connection conn;
	
	public static Connection getConn(){
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital_System","root","Aradhana@281517");
		System.out.println("done");
		
		
		}catch(Exception e)
		{System.out.println(e);}
		
		return conn;
	}

}
