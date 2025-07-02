package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Recipe;

public class recipeDao {

	 private PreparedStatement ps;
	 private ResultSet rs;
	 private Connection con;
	 private String query;
	 
	 public recipeDao(Connection con) {
		 this.con = con;
	 }
	 
	 
	 
	 public List<Recipe> getRecipes(int cat) {
		    
		    cat = cat+1;
		    List<Recipe> recipeList = new ArrayList<>();

		    String query = "SELECT * FROM recipe WHERE category_id = ?";

		    try (
		        PreparedStatement ps = con.prepareStatement(query)
		    ) {
		        ps.setInt(1, cat);

		        try (ResultSet rs = ps.executeQuery()) {
		            while (rs.next()) {
		                Recipe res = new Recipe();
		                res.setName(rs.getString("title"));
		                res.setRecipeId(rs.getInt("id"));
		                res.setInstructions(rs.getString("instructions"));
		                res.setIngredients(rs.getString("ingredients"));
		                res.setImagePath(rs.getString("image_path"));
		                res.setDifficulty(rs.getString("difficulty"));
		                res.setDescription(rs.getString("description"));
		                res.setTime(rs.getString("duration"));
		                res.setCategoryId(rs.getInt("category_id"));
		                res.setCreatedTime(rs.getTimestamp("created_at"));
		                res.setCreatorId(rs.getInt("createrId"));
		                recipeList.add(res);
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace(); // Always print full stack trace during development
		    }

		    return recipeList;
		}
	 
	 public Recipe getSingleRecipes(int recipeId) {
		    
		    Recipe res = null;

		    String query = "SELECT * FROM recipe WHERE id = ?";

		    try (
		        PreparedStatement ps = con.prepareStatement(query)
		    ) {
		        ps.setInt(1, recipeId);

		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		                res = new Recipe();
		                res.setName(rs.getString("title"));
		                res.setRecipeId(rs.getInt("id"));
		                res.setInstructions(rs.getString("instructions"));
		                res.setIngredients(rs.getString("ingredients"));
		                res.setImagePath(rs.getString("image_path"));
		                res.setDifficulty(rs.getString("difficulty"));
		                res.setDescription(rs.getString("description"));
		                res.setTime(rs.getString("duration"));
		                res.setCategoryId(rs.getInt("category_id"));
		                res.setCreatedTime(rs.getTimestamp("created_at"));
		                res.setCreatorId(rs.getInt("createrId"));
		                return res;
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace(); // Always print full stack trace during development
		    }

		    return res;
		}
	 
	 
	 public List<Recipe> getMyList(int createrId) {
		    
		    
		    List<Recipe> recipeList = new ArrayList<>();

		    String query = "SELECT * FROM recipe WHERE createrId = ?";

		    try (
		        PreparedStatement ps = con.prepareStatement(query)
		    ) {
		        ps.setInt(1, createrId);

		        try (ResultSet rs = ps.executeQuery()) {
		            while (rs.next()) {
		                Recipe res = new Recipe();
		                res.setName(rs.getString("title"));
		                res.setRecipeId(rs.getInt("id"));
		                res.setInstructions(rs.getString("instructions"));
		                res.setIngredients(rs.getString("ingredients"));
		                res.setImagePath(rs.getString("image_path"));
		                res.setDifficulty(rs.getString("difficulty"));
		                res.setDescription(rs.getString("description"));
		                res.setTime(rs.getString("duration"));
		                res.setCategoryId(rs.getInt("category_id"));
		                res.setCreatedTime(rs.getTimestamp("created_at"));
		                res.setCreatorId(rs.getInt("createrId"));
		                recipeList.add(res);
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace(); // Always print full stack trace during development
		    }

		    return recipeList;
		}

	 
	 public List<Recipe> getFavoriteRecipesByUserId(int userId)  {
		    List<Recipe> favoriteRecipes = new ArrayList<>();
		    
		    String query = "SELECT r.* FROM favorites f JOIN recipe r ON f.recipe_id = r.id WHERE f.user_id = ?";
		  
		        try {
		        	  
				    PreparedStatement ps = con.prepareStatement(query);
				    ps.setInt(1, userId);
				    
				    ResultSet rs = ps.executeQuery();
				    
				    while (rs.next()) {
				        Recipe r = new Recipe();
				        r.setRecipeId(rs.getInt("id"));
				        r.setName(rs.getString("title"));
				        r.setDescription(rs.getString("description"));
				        r.setIngredients(rs.getString("ingredients"));
				        r.setInstructions(rs.getString("instructions"));
				        r.setImagePath(rs.getString("image_path"));
				        r.setTime(rs.getString("duration"));
				        r.setCreatedTime(rs.getTimestamp("created_at"));
				        r.setDifficulty(rs.getString("difficulty"));
				        r.setCategoryId(rs.getInt("category_id"));
					    r.setCreatorId(rs.getInt("createrId"));
					
					 favoriteRecipes.add(r);
				    }
				}catch(SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    return favoriteRecipes;
		}
	 
	 
}
