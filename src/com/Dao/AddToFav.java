package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class AddToFav{
	
	 private PreparedStatement ps;
	 private ResultSet rs;
	 private Connection con;
	 private String query;
	 
	 public AddToFav(Connection con) {
		 this.con = con;
	 }
     
	 public boolean isAddedAlready( int recipeId,int userId) {
		 
		 boolean isAddedAlready = false;
		 
	       
	        try {
		        String checkQuery = "SELECT * FROM favorites WHERE user_id = ? AND recipe_id = ?";
		        ps = con.prepareStatement(checkQuery);
		        ps.setInt(1, userId);
		        ps.setInt(2, recipeId);
		        rs = ps.executeQuery();

		        if (rs.next()) {
		            return true;
		         }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     return isAddedAlready;
	 }
	 
	 
	 
	 public boolean toAddToFav(
			 int recipeId,
			 int userId
			 ) {
		 
		 boolean isAdded = false;
		 
		 String query = "INSERT INTO favorites (user_id, recipe_id, added_at) VALUES (?, ?, ?);";
		try {
			
			ps = con.prepareStatement(query);
				ps.setInt(1,userId);
				ps.setInt(2, recipeId);
				ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
				
			  int rowsInserted = ps.executeUpdate(); 
		      if (rowsInserted > 0) {
		            isAdded = true;
		       }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		 return isAdded;
	 }
}
