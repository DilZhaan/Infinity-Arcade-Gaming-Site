<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="assests/css/signOperations.css">
    <link rel="stylesheet" type="text/css" href="assests/css/generalStyle.css">
    <link rel="icon" type="image/x-icon" href="assests/images/Icons/favicon.png">
    <title>Sky Luxe | Sign In</title>
</head>
<body>
    <jsp:include page="assets/config/header.jsp" />
    
    <div class="body-content">
        <div class="image">
            <img src="../images/others/signIn.png" alt="signUp image">
        </div>
        <div class="form">
            <h2>Sign In</h2>
            <form method="post" action="SignInServlet">
                <label>Username:</label>
                <input type="text" id="username" name="username" placeholder="Username" pattern="[A-Z a-z 0-9]{4,12}" required>
                
                <label>Password:</label>
                <input type="password" id="pwd" name="pwd" placeholder="Password" pattern="[a-z A-Z 0-9 \. @ % #]{8,}" required>
                
                <c:if test="${not empty errorMsg}">
                    <span id="err">&#9888; ${errorMsg}</span>
                </c:if>
                
                <div class="submitButton">
                    <a href="signup.jsp">Do you want to create an Account?</a>
                    <input type="submit" value="Sign In" name="SignIn">
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="assets/config/footer.jsp" />
</body>
</html>
