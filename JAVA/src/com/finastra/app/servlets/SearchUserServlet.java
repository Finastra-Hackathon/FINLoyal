package com.finastra.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchUser")
public class SearchUserServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public SearchUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getUserDetails(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getUserDetails(request, response);
	}

	private void getUserDetails(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String appUser = request.getParameter("user");
		if (appUser.equalsIgnoreCase("Linda")) {
			getServletContext().getRequestDispatcher("/user-linda.jsp").forward(request, response);
		} else if (appUser.equalsIgnoreCase("Robert")) {
			getServletContext().getRequestDispatcher("/user-robert.jsp").forward(request, response);
		} else {
			System.out.println("No user found");
		}
	}
}