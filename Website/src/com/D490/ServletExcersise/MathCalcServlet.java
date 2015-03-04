package com.D490.ServletExcersise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MathCalcServlet
 */
@WebServlet("/MathCalcServlet")
public class MathCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MathCalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		double num1 = Double.parseDouble(request.getParameter("num1"));
		double num2 = Double.parseDouble(request.getParameter("num2"));
		
		 PrintWriter out = response.getWriter();   
		 out.println("Number 1 + Number 2 = " +  (num1 + num2) +  "</h1></br>");
		 out.println("Number 1 - Number 2 = " +  (num1 - num2) +  "</h1></br>");
		 out.println("Number 1 * Number 2 = " +  (num1 * num2) +  "</h1></br>");
		 out.println("Number 1 / Number 2 = " +  (num1 / num2) +  "</h1></br>");
		 out.println("Number 1 % Number 2 = " +  (num1 % num2) +  "</h1></br>");
		
		
	}

}
