package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getSession().getAttribute("auth")!=null) {
			request.getSession().removeAttribute("auth");
			response.sendRedirect("login.jsp");
		}
		else {
			response.sendRedirect("home.jsp");
		}
	}

 

}
