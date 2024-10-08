package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.InfinityArcade.util.InquireController;

public class DeleteInquary extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Corrected the doGet method signature
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the inquaryID from the request parameters
        String inquaryID = request.getParameter("inquaryID");

        // Delete the inquiry using InquireController
        boolean isDeleted = InquireController.deleteInquary(inquaryID);

        if (isDeleted) {
            // Redirect to shop page or show success message
            response.sendRedirect("myinquries.jsp");
        } else {
            // Handle error (e.g., show an error message)
            request.setAttribute("errorMessage", "Failed to delete the inquiry.");
            request.getRequestDispatcher("myinquries.jsp").forward(request, response);
        }
    }
}
