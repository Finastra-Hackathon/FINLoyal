package com.finastra.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/model")
public class ModelServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ModelServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		gotoLandingPage(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		gotoLandingPage(request, response);
	}

	private void gotoLandingPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/app.jsp").forward(request, response);
	}
}