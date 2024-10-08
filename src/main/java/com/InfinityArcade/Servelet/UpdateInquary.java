package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.InfinityArcade.models.Inquary;
import com.InfinityArcade.util.InquireController;

public class UpdateInquary extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a new Inquary object and populate it with the updated values
        Inquary newInquary = new Inquary();

        // Retrieve form data from request parameters
        newInquary.setinquaryID(request.getParameter("inquaryID"));
        newInquary.setName(request.getParameter("name"));
        newInquary.setEmail(request.getParameter("email"));
        newInquary.setSubject(request.getParameter("subject"));
        newInquary.setmessage(request.getParameter("message"));

        // Pass the newly created Inquary object to the updateInquary method
        boolean isUpdated = InquireController.updateInquary(newInquary);

        // Redirect to the inquiry list page if the update is successful
        if (isUpdated) {
            response.sendRedirect("myinquries.jsp");
        } else {
            // If update fails, show an error message
            request.setAttribute("errorMessage", "Failed to update the inquiry.");
            request.getRequestDispatcher("myinquries.jsp").forward(request, response);
        }
    }
}
