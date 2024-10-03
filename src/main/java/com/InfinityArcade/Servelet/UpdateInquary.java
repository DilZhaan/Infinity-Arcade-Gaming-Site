package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.InfinityArcade.models.Inquary;
import com.InfinityArcade.util.InquireController;


public class UpdateInquary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response, Inquary updatedInquary) throws ServletException, IOException {
	     Inquary newInquary = new Inquary();
	        
	        // Retrieve form data
	     newInquary.setInquaryID(request.getParameter("inquaryID"));
	     newInquary.setName(request.getParameter("Name"));
	     newInquary.setEmail(request.getParameter("Email"));
	     newInquary.setSubject(request.getParameter("Subject"));
	     newInquary.setMessage(request.getParameter("Message"));
	     
	     InquireController.updateInquary(updatedInquary);
	     response.sendRedirect("myinquaries.jsp");
	     
	}

}
