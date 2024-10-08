<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.InfinityArcade.models.Review" %>
<%@ page import="com.InfinityArcade.util.ReviewHandler" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <title>Infinity Arcade - Online Gaming Site</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="icon" type="image/x-icon" href="assets/images/favico.png">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="assets/css/Review.css">
</head>
<body>
	<jsp:include page="assets/config/header.jsp" />
	<%
        List<Review> reviews = ReviewHandler.getAllReviews(request.getParameter("gameID")); 
      %>
	  <div class="page-heading header-text">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12">
	          <h3>Contact Us</h3>
	          <span class="breadcrumb"><a href="index.jsp">Home</a>  >  Contact Us</span>
	        </div>
	      </div>
	    </div>
	  </div>
	 
    <div class="containerRev">
    
    <div class="table-card">
            <h2>Game Reviews</h2>
            <%
                for (Review rev : reviews) {
            %>
	            <div class="reviewCard">
	            	<div class="reviewInfo">
	            		<label class="Reviewer"><%= rev.getUser() %></label>
	            		<label class="Game"><%= rev.getGameId() %></label>
	            		<label class="Rating"><%= rev.getRating() %></label>
	            	</div>
	            	<div class="ReviewDesc">
	            		<p class="reviewDescription"><%= rev.getReview() %></p>
	            	</div>
	            	<div class="revFooter">
	            		<div class="date">
	            			<label class="revDate"><%= rev.getPostedDate() %></label>
	            			<label class="revDate"> | </label>
	            			<label class="revDate"><%= rev.getUpdatedDate() %></label>
	            		</div>
	            		
	            		<% if (session.getAttribute("username") != null && session.getAttribute("username").equals(rev.getUser())) { %>
	            		<div class="revController"> 
	            		<a href="Review.jsp?revID=<%= rev.getReviewID() %>" class="revDate">edit</a>
	            		<a href="DeleteReview?revID=<%= rev.getReviewID() %>" class="revDate">delete</a>
	            		</div>
	            		<% } %>
	            		
	            	</div>
	            </div>
            <% } %>
            
        </div>
        
        
        <div class="form-card">
            <h2>Submit Your Game Review</h2>
            <feildset>
            <form id="reviewForm" action="ReviewAddServlet" method="post">
            
                 <label for="User">User</label>
                <input  id="user" name="user" value="<%= session.getAttribute("username") %>"  readonly>
                
                <label for="Gameid">GameId</label>
                <input id="gameid" name="gameid" value="<%= request.getParameter("gameID") %>"  readonly>
                               
                <label for="rating">Rating:</label>
                <input type="number" id="rating" name="rating" min="1" max="5" required>
                
                <label for="review">Review:</label>
                <textarea id="review" name="review" rows="4" required></textarea>
                
                <button type="submit" name="submit">Submit</button>
            </form>
            </feildset>
        </div>
        
        
    </div>
 <jsp:include page="assets/config/footer.jsp" />

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/counter.js"></script>
  <script src="assets/js/custom.js"></script>
    <script src="script.js"></script>
</body>
</html>
