package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.InfinityArcade.models.Review;
import com.InfinityArcade.util.ReviewHandler;

/**
 * Servlet implementation class UpdateReview
 */
public class UpdateReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the form parameters
    	Review review = new Review();
    	review.setGameId(request.getParameter("gameid"));
        review.setReviewID(request.getParameter("RevID"));
        review.setRating(request.getParameter("rating"));
        review.setReview(request.getParameter("review"));
        
        ReviewHandler.updateReview(review);
        

        response.sendRedirect("Review.jsp?gameID=" + review.getGameId());
	}

}
