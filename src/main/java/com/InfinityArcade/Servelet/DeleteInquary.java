package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.InfinityArcade.models.Inquary;
import com.InfinityArcade.util.InquireController;


public class DeleteInquary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response, Inquary updatedInquary, String inquaryID) throws ServletException, IOException {
	     Inquary newInquary = new Inquary();
	        
	        // Retrieve form data
	     newInquary.setInquaryID(request.getParameter("inquaryID"));
	     
	     
	     boolean isDeleted = InquireController.deleteInquary(inquaryID);
	     
	     if (isDeleted) {
	    	 // Redirect to shop page or show success message
			 response.sendRedirect("myinquries.jsp");
	     } else {
			 // Handle error (e.g., show an error message)
			 request.setAttribute("errorMessage", "Failed to delete the game.");
			 request.getRequestDispatcher("myinquries.jsp").forward(request, response);
	     }
	}
}