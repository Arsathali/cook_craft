package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.recipeDao;
import com.connection.DbConnection;
import com.model.Recipe;

/**
 * Servlet implementation class ViewSingleRecipeservlet
 */
@WebServlet("/ViewSingleRecipeservlet")
public class ViewSingleRecipeservlet extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
		int recipeId = Integer.parseInt(request.getParameter("recipeId"));
		
		String message = request.getParameter("message");
		
		
		recipeDao dao;
		try {
			
			dao = new recipeDao(DbConnection.getConnection());
			Recipe recipe = dao.getSingleRecipes(recipeId);
			
			if(recipe != null) {
				request.setAttribute("Message", message);
				request.setAttribute("recipe", recipe); 
				request.getRequestDispatcher("viewRecipe.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("home.jsp");
				System.out.print("error in servlet");
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
