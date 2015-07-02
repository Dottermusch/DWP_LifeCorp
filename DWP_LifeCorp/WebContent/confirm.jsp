<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Order</title>
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
          <a class="navbar-brand" href="displayProducts">View Products</a>
          <a class="navbar-brand" href="">View Order History</a>
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
		  <h2>Order Summary</h2><br>
		  <h3>Below is a summary of your order - press "Confirm" to place order.</h3><br>
		  <form action="confirmOrder" type="post" >
			  <label for="firstName">Customer First Name:</label>
			  <input type="text" name="firstName" value="${customer.firstName}" readonly="readonly" class="inputTransparent wide"><br>
			  <label for="lastName">Customer Last Name:</label>
			  <input type="text" name="lastName" value="${customer.lastName}" readonly="readonly" class="inputTransparent wide">	<br>	
			  <label for="address1">Customer Address:</label>
			  <input type="text" name="address1" value="${customer.address1}" readonly="readonly" class="inputTransparent wide"><br>
			  <label for="city">Customer City:</label>
			  <input type="text" name="city" value="${customer.city}" readonly="readonly" class="inputTransparent wide">	<br>
			  <label for="state">Customer State:</label>
			  <input type="text" name="state" value="${customer.state}" readonly="readonly" class="inputTransparent wide"> <br>
			  <label for="zipCode">Customer Zip-Code:</label>
			  <input type="text" name="zipCode" value="${customer.zipCode}" readonly="readonly" class="inputTransparent wide"><br>
			<br><br>		
			  <label for="productName">Product Ordered:</label>
			  <input type="text" name="productName" value="${product.productName}" readonly="readonly" class="inputTransparent wide"><br>
			  <label for="quantity">Quantity:</label>
			  <input type="text" name="listPrice" value="<fmt:formatNumber value="${product.listPrice}" type="currency"/>" readonly="readonly" class="inputTransparent right moreNarrow"><br>
			  <label for="listPrice">Unit Price:</label>
			  <input type="text" name="quantity" value="${order.quantity}" readonly="readonly" class="inputTransparent right moreNarrow"><br>
			  <label for="total">Total Price:</label>
			  <input type="text" name="total" value="<fmt:formatNumber value="${total}" type="currency"/>" readonly="readonly" class="inputTransparent right moreNarrow"><br><br>
			  
			  <input type="submit" value="Confirm Order">
    
    	  </form>
    
    </div><!-- /.container -->
</body>
</html>