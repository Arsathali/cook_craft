package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;

public class userDao {

	 private PreparedStatement ps;
	 private ResultSet rs;
	 private Connection con;
	 private String query;
	 
	 public userDao(Connection con) {
		 this.con = con;
	 }
	 
	 public User checkUser(String email,String password) {
		 
		 User user = null;
		 
		 try {
			 
			 query = "select * from user where email=? and password=?";
		     ps = con.prepareStatement(query);
			 ps.setString(1, email);
			 ps.setString(2, password);
			 rs = ps.executeQuery();
			 
			 if(rs.next()) {
				 user = new User();
				 user.setUserId(rs.getInt("id"));
				 user.setEmail(rs.getString("email"));
				 user.setPassword(rs.getString("password"));
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
             System.out.println(e.getMessage());
		 }
		 
		 
		 return user;
	 }
}
