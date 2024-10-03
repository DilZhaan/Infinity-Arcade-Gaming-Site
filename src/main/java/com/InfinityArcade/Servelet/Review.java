package com.InfinityArcade.Servelet;
import java.io.IOException;

import com.InfinityArcade.util.ReviewDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Servelet implementation class Review
 */
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String user = request.getParameter("");
		//String Gameid =request.getParameter("");
		//long Date =request.getParameter("");
		int Rating =request.getParameter("rating");
		String Review= request.getParameter("review");
		try {
		List <Review> ReviewDetails = ReviewDB.validate(Rating, Review);
		
		request.setAttribute("ReviewingDetails","ReviewDetails");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
			ReQuestDispatcher dis =request.getRequestDispatcher("Review.jsp");
	        dis.forword(request,response);
		
