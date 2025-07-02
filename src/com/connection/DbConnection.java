package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	  private static String name ="root";
	  private static String password = "Abdevilliers17";
	  private static Connection connection = null;
	  private static String url = "jdbc:mysql://localhost:3306/cook_craft";
	  
	  public static Connection getConnection() throws ClassNotFoundException , SQLException{
		  
		  if(connection==null) {
			   
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  connection = DriverManager.getConnection(url,name,password);
		  }
		  return connection;
	  }
}
