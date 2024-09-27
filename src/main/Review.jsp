<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Review Page</title>
    <link rel="stylesheet" href="assets/css/Review.css">
</head>
<body>
    <div class="container">
        <div class="form-card">
            <h2>Submit Your Game Review</h2>
            <feildset>
            <form id="reviewForm">
                <label for="userName">User Name:</label>
                <input type="text" id="userName" name="userName" required>
                
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
                
                <label for="gameName">Game Name:</label>
                <input type="text" id="gameName" name="gameName" required>
                
                <label for="gameId">Game ID:</label>
                <input type="text" id="gameId" name="gameId" required>
                
                <label for="rating">Rating:</label>
                <input type="number" id="rating" name="rating" min="1" max="10" required>
                
                <label for="review">Review:</label>
                <textarea id="review" name="review" rows="4" required></textarea>
                
                <button type="submit">Submit</button>
            </form>
            </feildset>
        </div>
        
        <div class="table-card">
            <h2>Game Reviews</h2>
            <feildset>
            <table id="reviewsTable">
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Date</th>
                        <th>Game Name</th>
                        <th>Game ID</th>
                        <th>Rating</th>
                        <th>Review</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Reviews will be inserted here -->
                </tbody>
            </table>
            </feildset>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
