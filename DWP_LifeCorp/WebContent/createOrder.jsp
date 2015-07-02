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
		  <h2>Create Order</h2><br>
		  <h3>Below is the product you selected - please enter purchase quantity:</h3><br>
		  <table>
			<tr>
				<th>Product #</th>
				<th>Product</th>
				<th>Price (each)</th>
				<th>Quantity</th>
				<th>Quantity</th>
			</tr>
			<form action="previewOrder" method="post">
				<tr>
					<td class="right" ><c:out value="${product.productId}" /></td>
					<td><c:out value="${product.productName}" /></td>
					<td class="right" ><fmt:formatNumber  value="${product.listPrice}" type="currency" /></td>
					<td><input type="number" name="quantity" class="right narrow" value="${quantity}" maxlength="2" min="1" max="10" required></td>
					<td><input type="submit" value="Proceed" class="btn btn-primary btn-lg login" /></td>
				</tr>
			</form>
		</table>
		<br><br>		

    </div><!-- /.container -->
</body>
</html>