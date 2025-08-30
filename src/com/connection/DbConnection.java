package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	  private static String name ="root";
	  private static String password = "QkYWUmHRACxKUKihFrlQLzdeCvDFbexd";
	  private static Connection connection = null;
	  private static String url = "jdbc:mysql://switchback.proxy.rlwy.net:33714/railway";
	  
	  public static Connection getConnection() throws ClassNotFoundException , SQLException{
		  
		  if(connection==null) {
			   
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  connection = DriverManager.getConnection(url,name,password);
		  }
		  return connection;
	  }
}
