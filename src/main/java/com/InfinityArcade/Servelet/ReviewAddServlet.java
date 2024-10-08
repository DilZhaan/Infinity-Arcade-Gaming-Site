package com.InfinityArcade.Servelet;
import java.io.IOException;
import com.InfinityArcade.models.Review;
import com.InfinityArcade.util.ReviewHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form parameters
    	Review review = new Review();
        review.setUser(request.getParameter("user"));
        review.setGameId(request.getParameter("gameid"));
        review.setRating(request.getParameter("rating"));
        review.setReview(request.getParameter("review"));
        
        ReviewHandler.addReview(review);
        

        response.sendRedirect("Review.jsp?gameID=" + review.getGameId());

        
    }
}
