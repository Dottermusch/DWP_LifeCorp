<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	
	<!-- Local style sheet in case needed for local modifications -->
	<link rel="stylesheet" href="styles/main.css">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="displayProducts">Display Products</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="welcome.jsp">Home</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<br />
<br />
<br />
    <div class="container">
	   
	    <div class="jumbotron"><br>
		  <h2>Create Account</h2><br>
		  <p>
			<form action="createCustomer" method="post">
			<label for="firstName">First Name:</label>
			<input type="text" name="firstName" class="wide" placeholder="First Name" required /><br>
			<label for="firstName">Last Name:</label>
			<input type="text" name="lastName" class="wide" placeholder="Last Name" required /><br>
			<label for="email">Email Login:</label>
			<input type="text" name="email" class="wide" placeholder="email" required /><br>
			<label for="password">Password:</label>
			<input type="password" name="password" class="wide" placeholder="password" required/><br>
			<label for="address1">Street Address:</label>
			<input type="text" name="address1" class="wide" placeholder="address" required/><br>
			<label for="city">City:</label>
			<input type="text" name="city" class="wide" placeholder="city" required/><br>
			<label for="state">State:</label>
			<input type="text" name="state" class="wide" placeholder="state" required maxlength="2" /><br>
			<label for="zipCode">Zip Code:</label>
			<input type="text" name="zipCode" class="wide" placeholder="zipCode" required maxlength="10" /><br>
			
			<label>&nbsp;</label>
			<input type="submit" value="Create Account" class="btn btn-primary btn-lg login" />
			</form>
			<br><br><span class="red" >${message}</span>
		  </p>

    	</div><!-- /.container -->
    </div>
</body>
</html>