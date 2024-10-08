<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.InfinityArcade.models.Inquary" %>
<%@ page import="com.InfinityArcade.util.InquireController" %>
    
<%
	String inquaryID = request.getParameter("inquaryID");
	Inquary inq = InquireController.getInq(inquaryID);

%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Infinity Arcade - Online Gaming Site</title>

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/images/favico.png">


    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

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

  <div class="contact-page section">d
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="left-text">
            <div class="section-heading">
              <h6>Contact Us</h6>
              <h2>Say Hello!</h2>
            </div>
            <p>Discover the ultimate collection of games at Infinity Arcade! From thrilling adventures to classic favorites, experience endless entertainment with easy access to all the top titles. Your next gaming journey starts here!</p>
            <ul>
              <li><span>Address</span> Infinity Arcade, Kaduwela Rd, Malabe</li>
              <li><span>Phone</span> +94 11 2 123 123</li>
              <li><span>Email</span> customersupport@infinityarcade.com</li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="right-content">
            <div class="row">
              <div class="col-lg-12">
                <div id="map">
                  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2800.7073666581045!2d79.97126022472209!3d6.914697724196296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae256db1a6771c5%3A0x2c63e344ab9a7536!2sSri%20Lanka%20Institute%20of%20Information%20Technology!5e0!3m2!1sen!2slk!4v1726933755512!5m2!1sen!2slk" width="100%" height="325px" frameborder="0" style="border:0; border-radius: 23px;" allowfullscreen=""></iframe>
                </div>
              </div>
              <div class="col-lg-12">
                <form id="contact-form" action="<%= (inq.getinquaryID() == null) ? "AddInquary" : "UpdateInquary" %>" method="post">
                  <div class="row">
                  <% if(inq.getinquaryID() !=null) { %>
                  <div class="col-lg-6">
                      <fieldset>
                        <input type="text" name="inquaryID" id="inquaryID" value="<%=  inq.getinquaryID() %>"  readonly>
                      </fieldset>
                    </div>
                   <% } %>
                    
                    <div class="col-lg-6">
                      <fieldset>
                        <input type="text" name="name" id="name" placeholder="Your Name..." autocomplete="on" value="<%= (inq.getinquaryID() != null) ? inq.getname() : "" %>"  required>
                      </fieldset>
                    </div>
                    <div class="col-lg-6">
                      <fieldset>
                        <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your E-mail..." value="<%= (inq.getinquaryID() != null) ? inq.getEmail() : "" %>"required>
                      </fieldset>
                    </div>
                    <div class="col-lg-6">
                      <fieldset>
                        <input type="text" name="subject" id="subject" <% if(inq.getinquaryID() == null){ %>style="width:210%" <% } %> placeholder="Subject..." autocomplete="on" value="<%= (inq.getinquaryID() != null) ? inq.getSubject() : "" %>" required>
                      </fieldset>
                    </div>
                    <div class="col-lg-12">
                      <fieldset>
                        <textarea name="message" id="message" placeholder="Your Message" required><%= (inq.getinquaryID() != null) ? inq.getmessage() : "" %></textarea>
                      </fieldset>
                    </div>
                    <div class="col-lg-12">
                      <fieldset>
                        <button type="submit" id="form-submit" class="orange-button">Send Message Now</button>
                      </fieldset>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
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
  <script>
		document.getElementById('contact').setAttribute('class','active');
  </script>

  </body>
</html>