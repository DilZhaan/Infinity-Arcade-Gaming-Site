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

    <script src="script.js"></script>
</body>
</html>
