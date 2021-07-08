<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://kit.fontawesome.com/438a233d1e.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Web Player</title>

<link href="/nav.css" rel="stylesheet"></link>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>

	<br>
	<div class="container">
		<h1 class="text-center">SHOPPING</h1>
		<hr>
		<div class="row">
			<c:forEach var="item" items="${page.content}">
				<div class="col-md-4 product-grid">
					<div class="image">
						<a href="#"> <img
							src="${pageContext.request.contextPath}/images/${item.image}"
							class="w-100">
							<div class="overlay">
								<div class="detail">View Details</div>
							</div>
						</a>
					</div>
					<h5 class="text-center">${item.name}</h5>
					<h5 class="text-center">Price: ${item.price}</h5>
					<a href="/cart/add/${item.id}" class="btn buy">Add To Cart</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<button id="topBtn">
		<i class="fas fa-arrow-up"></i>
	</button>
	<br>
	<nav aria-label="Page navigation example">
		<ul class="pagination" style="margin-left: 600px;">
			<li class="page-item"><a class="page-link" href="/products?p=${page.number-1}">Previous</a></li>
			<li class="page-item"><a class="page-link" href="/products?p=${page.number+1}">Next</a></li>
		</ul>
	</nav>
	<script src="../js/slide.js"></script>
</body>
</html>