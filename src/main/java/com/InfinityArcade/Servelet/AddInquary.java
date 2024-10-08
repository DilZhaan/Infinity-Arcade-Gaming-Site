package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.InfinityArcade.models.Inquary;
import com.InfinityArcade.util.InquireController;

public class AddInquary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     Inquary newInquary = new Inquary();
	        
	        // Retrieve form data
	     newInquary.setName(request.getParameter("name"));
	     newInquary.setEmail(request.getParameter("email"));
	     newInquary.setSubject(request.getParameter("subject"));
	     newInquary.setmessage(request.getParameter("message"));

	     HttpSession session = request.getSession();
	     newInquary.setUserID((String) session.getAttribute("username")); 

	     
	     
	     InquireController.addInquary(newInquary);
	     response.sendRedirect("contact.jsp");
	     
	}

}
