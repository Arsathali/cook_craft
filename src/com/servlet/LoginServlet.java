package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.userDao;
import com.connection.DbConnection;
import com.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		
		
		try {
			userDao userdao = new userDao(DbConnection.getConnection());
			
			User user = userdao.checkUser(uname, pass);
			
			if(user == null) {
				response.sendRedirect("login.jsp");
				System.out.println("user not found");
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("auth", user);
				response.sendRedirect("home.jsp");
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
