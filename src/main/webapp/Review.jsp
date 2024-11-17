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
	    String gameID = request.getParameter("gameID");
	    String revID = request.getParameter("revID");
	    List<Review> reviews = (gameID != null) ? ReviewHandler.getAllReviews(gameID) : new ArrayList<>();
	    Review review = (revID != null) ? ReviewHandler.getReview(revID) : null;
	%>
	  <div class="page-heading header-text">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12">
	          <h3>Review</h3>
	          <span class="breadcrumb"><a href="index.jsp">Home</a>  >  <a href="shop.jsp">Shop</a> > <a href="product-details.jsp?gameID=<%= gameID %>"><%= gameID %></a> >Review </span>
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
	            		<a href="Review.jsp?gameID=<%= rev.getGameId() %>&revID=<%= rev.getReviewID() %>" class="revDate">edit</a>
	            		<a href="DeleteReview?gameID=<%= rev.getGameId() %>&revID=<%= rev.getReviewID() %>" class="revDate">delete</a>
	            		</div>
	            		<% } %>
	            		
	            	</div>
	            </div>
            <% } %>
            
        </div>
        
        
        <div class="form-card">
            <h2>Submit Your Game Review</h2>
            <fieldset>
            <form id="reviewForm" action="<%= (review != null)? "UpdateReview" : "ReviewAddServlet" %>" method="post">
            
            	<% if(review != null){%>
            		<label for="RevID">Review ID</label>
                	<input  id="RevID" name="RevID" value="<%= review.getReviewID() %>"  readonly>
            	 <% } %>
            	 
                 <label for="User">User</label>
                <input  id="user" name="user" value="<%= session.getAttribute("username") %>"  readonly>
                
                <label for="Gameid">GameId</label>
                <input id="gameid" name="gameid" value="<%= request.getParameter("gameID") %>"  readonly>
                               
                <label for="rating">Rating:</label>
                <input type="number" id="rating" name="rating" min="1" max="5" <% if(review != null){%> value = "<%= review.getRating() %>" <% } %> required>
                
                <label for="review">Review:</label>
                <textarea id="review" name="review" rows="4"  required><% if(review != null){%><%= review.getReview() %><% } %></textarea>
                
                <button type="submit" name="submit" <% if (session.getAttribute("username") == null) { %>disabled <% } %> > <%= (review != null) ? "Update" : "Submit" %> </button>
                <% if(review != null) { %>
                	<button onclick="document.location ='Review.jsp?gameID=<%= request.getParameter("gameID") %>'" style="background-color:black;"> Clear </button>
                <% } %>
            </form>
            </fieldset>
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
