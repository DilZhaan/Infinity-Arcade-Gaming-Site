package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.InfinityArcade.util.GameManager;

/**
 * Servlet implementation class DelGame
 */

public class DelGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gameID = request.getParameter("gameID");
        // Call your GameManager method to delete the game
        boolean isDeleted = GameManager.deleteGame(gameID);

        if (isDeleted) {
            // Redirect to shop page or show success message
            response.sendRedirect("shop.jsp");
        } else {
            // Handle error (e.g., show an error message)
            request.setAttribute("errorMessage", "Failed to delete the game.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
