<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <div class="reviewCard">
            	<div class="reviewInfo">
            		<label class="Reviewer">User1</label>
            		<label class="Game">COD MW</label>
            		<label class="Rating">5.0</label>
            	</div>
            	<div class="ReviewDesc">
            		<p class="reviewDescription">kjdsbfhiojfd o dnsiofdgjofskdv iupaodsjbf dnv;pifediof</p>
            	</div>
            	<div class="revFooter">
            		<div class="date">
            			<label class="revDate">2023/32/32</label>
            		</div>
            		<div class="revController">
            		<a href="#" class="revDate">edit</a>
            		<a href="#" class="revDate">delete</a>
            		</div>
            	</div>
            </div>
        </div>
        
        
        <div class="form-card">
            <h2>Submit Your Game Review</h2>
            <feildset>
            <form id="reviewForm" action="#" method="post">
            
                 <label for="User">User</label>
                <input  id="user" name="user"  readonly>
                
                <label for="Gameid">GameId</label>
                <input id="gameid" name="gameid"  readonly>
                               
                <label for="rating">Rating:</label>
                <input type="number" id="rating" name="rating" min="1" max="10" required>
                
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
