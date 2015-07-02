<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank You</title>
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
          <a class="navbar-brand" href="displayProducts">Back to Products</a>
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
	    
	    <div class="jumbotron">
		  <h2>Thank you!!</h2><br><br>
		  <h3>${message}</h3>
		  <p>
<!-- 		  <a class="btn btn-primary btn-lg float-left" href="editCustomer" role="button">Edit Customer</a> -->
<!-- 		  <a class="btn btn-primary btn-lg float-left margin_left" href="deleteCustomer" role="button">Delete Customer</a> -->
		  ${anchorTagEditString}
		  <span class="spacer float-left">&nbsp;</span>
		  ${anchorTagDeleteString}
		  </p>
<table>
<tr>
	<th>Order #</th>
	<th>Date</th>
	<th>Item</th>
	<th>Purchase Price</th>
	
</tr>
	<c:forEach var="order" items="${orders}">
		<tr>
<!-- 		<a href="http://www.w3schools.com">Visit W3Schools.com!</a> 
			<a href="page2.jsp?${cust.customerId}">${cust.custFirstName }</a>
			<a href="<c:url value="/jsp/index.htm"/>">TEST</a>
			 -->
			
			<td class="right" ><c:out value="${order.orderId}" /></td>
			
<%-- ORIGINAL	<td><a href="getCust?cust=${cust.customerId}&page=page2.jsp">${cust.custFirstName }</a></td> --%>
			
			<td><fmt:formatDate type="date" dateStyle="medium" value="${order.orderDate}" /></td>
			
<%-- ORIGINAL	<td><a href="getCust?cust=${cust.customerId}&page=page2.jsp">${cust.custLastName }</a></td> --%>
		
			<td><c:url value="${order.product.productName}"/></td>
			
			<td class="right" ><fmt:formatNumber  value="${order.product.listPrice * order.quantity}" type="currency" /></td>
			
		</tr>
	</c:forEach>
</table>
    </div><!-- /.container -->
</body>
</html>