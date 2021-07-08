<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="/nav.css" rel="stylesheet"></link>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
</head>
<body>
	
	<jsp:include page="nav.jsp"></jsp:include>

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">E-COMMERCE CART</h1>
		</div>
	</section>

	<div class="container mb-4">
		<div class="row">
			<div class="col-12">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Name</th>
								<th scope="col">Price</th>
								<th scope="col">Image</th>
								<th scope="col">Quantity</th>
								<th scope="col">Amount</th>
								<th></th>
							</tr>
						</thead>

						<tbody>

							<c:forEach var="item" items="${cart.items}">
								<form action="/cart/update/${item.id}" method="post">
									<input type="hidden" name="id" value="${item.id}">

									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td>${item.price}</td>
										<td><img style="width: 30px" src="${pageContext.request.contextPath}/images/${item.image}"></td>
										<td><input name="qty" value="${item.quantity}"
											class="form-control" onblur="this.form.submit()"
											style="width: 50px;"></td>
										<td>${item.price * item.quantity}</td>
										<!-- <td><a href="">Remove</a></td> -->
										<td class="text-right"><button
												formaction="/cart/remove/${item.id}"
												class="btn btn-sm btn-danger">
												<i class="fa fa-trash"></i>
											</button></td>
									</tr>
								</form>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><strong>Total</strong></td>
								<td class="text-right mr-auto"><strong>${cart.total}</strong></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col mb-2">
				<div class="row">
					<div class="col-sm-12  col-md-6">
						<a class="btn btn-block btn-light" href="/cart/add-more">Continue
							Shopping</a>

					</div>
					<div class="col-sm-12 col-md-6 text-right">
						<div class="mt-3">
			<!-- <a class="btn btn-primary float-right mb-2" href="/adress">Check Out
                    
                    </a> -->
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-block btn-success"
				data-toggle="modal" data-target="#exampleModalLong" style="margin-top: -16px;">CHECK
				OUT</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModalLong" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Enter your email address</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="/cart/checkout">
								<div class="form-group">
									 <input
										type="text" name="address" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
								</div>
								<button class="btn btn-primary">Send</button>
								<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<button id="topBtn">
		<i class="fas fa-arrow-up"></i>
	</button>
	<script src="../js/slide.js"></script>
</body>
</html>