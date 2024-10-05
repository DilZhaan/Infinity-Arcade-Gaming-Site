package com.InfinityArcade.Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/UpdateReview")
public class UpdateReview extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details (you'll need to update these according to your DB)
    String jdbcURL = "jdbc:mysql://localhost:8085/infinity_arcade";
    String dbUser = "root";
    String dbPassword = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Getting parameters from the request
        String user = request.getParameter("user");
        String gameId = request.getParameter("gameId");
        long date = Long.parseLong(request.getParameter("date"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String review = request.getParameter("review");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Basic validation to check if required parameters are provided
        if (user == null || user.isEmpty() || gameId == null || gameId.isEmpty()) {
            out.println("<h2>Error: Missing required parameters (user or gameId)!</h2>");
            return;
        }

        // Connecting to the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query to update the review based on user, gameId, and date
            String sql = "UPDATE reviews SET rating = ?, review = ? WHERE user = ? AND game_id = ? AND review_date = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            // Setting parameters for the prepared statement
            stmt.setInt(1, rating);
            stmt.setString(2, review);
            stmt.setString(3, user);
            stmt.setString(4, gameId);
            stmt.setLong(5, date);

            // Execute the update query
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<h2>Review updated successfully!</h2>");
            } else {
                out.println("<h2>No matching review found for update.</h2>");
            }

            // Close connection
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<h2>Database connection error: " + e.getMessage() + "</h2>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); // Handle GET request same as POST
    }
}
*/
