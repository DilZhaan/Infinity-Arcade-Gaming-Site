package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.InfinityArcade.util.ReviewHandler;

/**
 * Servlet implementation class DeleteReview
 */
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve the inquaryID from the request parameters
        String revID = request.getParameter("revID");

        // Delete the inquiry using InquireController
        boolean isDeleted = ReviewHandler.deleteReview(revID);

        if (isDeleted) {
            // Redirect to shop page or show success message
            response.sendRedirect("Review.jsp?gameID=" +request.getParameter("gameID"));
        } else {
            // Handle error (e.g., show an error message)
            request.setAttribute("errorMessage", "Failed to delete the Review.");
            request.getRequestDispatcher("Review.jsp").forward(request, response);
        }
	}

}
