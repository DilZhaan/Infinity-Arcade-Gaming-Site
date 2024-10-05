package com.InfinityArcade.Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



@WebServlet("/AddReview")
public class AddReview extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details (you'll need to update these according to your DB)
    String jdbcURL = "jdbc:mysql://localhost:8085/infinity_arcade";
    String dbUser = "root";
    String dbPassword = "root";
;

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

        // Connecting to the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL Query to insert the review
            String sql = "INSERT INTO reviews (user, game_id, review_date, rating, review) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            // Setting parameters for the prepared statement
            stmt.setString(1, user);
            stmt.setString(2, gameId);
            stmt.setLong(3, date);
            stmt.setInt(4, rating);
            stmt.setString(5, review);

            // Execute the query
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h2>Review added successfully!</h2>");
            } else {
                out.println("<h2>Failed to add the review. Please try again.</h2>");
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
        doPost(request, response); // For handling GET requests as POST
    }
}
*/
