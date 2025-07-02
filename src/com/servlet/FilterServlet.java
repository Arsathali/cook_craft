package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.recipeDao;
import com.connection.DbConnection;
import com.model.Recipe;

@WebServlet("/FilterServlet")
public class FilterServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int category = Integer.parseInt(request.getParameter("category"));
		System.out.print(category);
		request.setAttribute("selectedCategoryIndex", category);

		recipeDao dao;
		try {
			dao = new recipeDao(DbConnection.getConnection());
			List<Recipe> filteredRecipes = dao.getRecipes(category);
			request.setAttribute("recipeList", filteredRecipes);
			request.getRequestDispatcher("home.jsp").forward(request, response);

			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
