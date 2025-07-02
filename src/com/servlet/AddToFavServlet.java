package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.AddToFav;
import com.connection.DbConnection;
import com.model.User;

@WebServlet("/AddToFavServlet")
public class AddToFavServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("auth");
		
		if(user==null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		int recipeId = Integer.parseInt(request.getParameter("recipeId"));
		
		int userId = user.getUserId();
		
		
		try {
			
			AddToFav addToFav = new AddToFav(DbConnection.getConnection());
			
			
			boolean isAddedAlready = addToFav.isAddedAlready(recipeId, userId);
			
			
			
			if(isAddedAlready) {
				System.out.print("added already");
				response.sendRedirect("ViewSingleRecipeservlet?recipeId=" + recipeId + "&message=Already added to fav List");
				return;
			}
			
			boolean isAdded = addToFav.toAddToFav(recipeId,userId);
			
			if (isAdded) {
			    System.out.print("added successfully");
			    response.sendRedirect("ViewSingleRecipeservlet?recipeId=" + recipeId + "&message=added To fav List");
			} else {
			    System.out.print("not added to fav");
			    response.sendRedirect("ViewSingleRecipeservlet?recipeId=" + recipeId + "&message=Not added due to Some error");
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
