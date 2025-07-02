package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Dao.AddRecipeToDB;
import com.connection.DbConnection;
import com.model.User;



/**
 * Servlet implementation class AddRecipeServlet
 */
@WebServlet("/AddRecipeServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,    // 2MB
                 maxFileSize = 1024 * 1024 * 10,         // 10MB
                 maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class AddRecipeServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String recipeName = request.getParameter("recipeName");
		String description = request.getParameter("description");
		String[] ingredients = request.getParameterValues("ingredients");
		String[] steps = request.getParameterValues("steps");
		String category = request.getParameter("category");
		String duration = request.getParameter("cookTime");
		String difficulty = request.getParameter("difficulty");
		
		int categoryId = 0; // default to 0 if no match
		switch (category) {
		    case "Veg":
		        categoryId = 1;
		        break;
		    case "Non-Veg":
		        categoryId = 2;
		        break;
		    case "Desserts":
		        categoryId = 3;
		        break;
		    case "Snacks":
		        categoryId = 4;
		        break;
		    case "Soups":
		        categoryId = 5;
		        break;
		    case "Salads":
		        categoryId = 6;
		        break;
		    case "Main Course":
		        categoryId = 7;
		        break;
		    case "Beverages":
		        categoryId = 8;
		        break;
		    default:
		        // Optional: log or handle unknown category
		        System.out.println("Unknown category: " + category);
		}
		
		
		//for ingredients array
		
		String ingredient = null;
		
		for(String i : ingredients) {
			ingredient+=i+" , ";
		};
		
		// for steps array
	
       String step = null;
		
		for(String j : steps) {
			step+=j+" , ";
		};
		
		
		
		
		 // for image saving
		
		 Part filePart = request.getPart("image");
		 String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		 
		// Define folder to save image
		 String uploadPath = getServletContext().getRealPath("") + "assets";
		 File uploadDir = new File(uploadPath);
		 if (!uploadDir.exists()) uploadDir.mkdir();
		 
		 String filePath = uploadPath + File.separator + fileName;
	     filePart.write(filePath);
	     
	     // Store relative path in DB
	       String relativePath = "assets/" + fileName;
	       
	     	       
		try {
			
			// To getUser id
		    HttpSession session = request.getSession();
		    User user = (User) session.getAttribute("auth");
		    
		    if(user==null) {
		    	response.sendRedirect("addRecipe.jsp");
		    }
		         
		    int  userid  = user.getUserId();
			AddRecipeToDB addrecipe = new AddRecipeToDB(DbConnection.getConnection());
			boolean isAdded = addrecipe.toAddRecipeToDB(recipeName,description,ingredient,step,relativePath,duration,difficulty,categoryId,userid);
			
			if(isAdded) {
				session.setAttribute("msg", "✅ Recipe added successfully!");
				session.setAttribute("msgType", "success");
				response.sendRedirect("addRecipe.jsp");
			}
			else {
				session.setAttribute("msg", "❌ Failed to add recipe. Please try again.");
				session.setAttribute("msgType", "danger");
				response.sendRedirect("addRecipe.jsp");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       
	       
	}

}
