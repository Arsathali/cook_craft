package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class AddRecipeToDB {

	 private PreparedStatement ps;
	 private ResultSet rs;
	 private Connection con;
	 private String query;
	 
	 public AddRecipeToDB(Connection con) {
		 this.con = con;
	 }
	 
	 public boolean toAddRecipeToDB(
			 String title,
			 String description,
			 String ingredients,
			 String instructions,
			 String imagePath,
			 String duration,
			 String difficulty,
			 int categoryId,
			 int createrId
			 ) {
		 
		 boolean isAdded = false;
		 
		 String query = "INSERT INTO recipe ("
			        + "title, description, ingredients, instructions, image_path, "
			        + "duration, difficulty, category_id, created_at, createrId"
			        + ") VALUES ("
			        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
			        + ");";
		try {
			
			ps = con.prepareStatement(query);
				ps.setString(1, title);
				ps.setString(2, description);
				ps.setString(3, ingredients);
				ps.setString(4, instructions);
				ps.setString(5, imagePath);
				ps.setString(6, duration);
				ps.setString(7, difficulty);
				ps.setInt(8, categoryId);
				ps.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
				ps.setInt(10, createrId);
			int rowsInserted = ps.executeUpdate(); // ✅ correct method
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
