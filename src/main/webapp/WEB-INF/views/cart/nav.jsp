<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/products">E-Commerce</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExampleDefault"
				aria-controls="navbarsExampleDefault" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarsExampleDefault">
				<ul class="navbar-nav m-auto">
					<li class="nav-item m-auto"><a class="nav-link"
						href="/products">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/products">Product</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/cart/view">Cart
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/account/login">Account</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="category.html">Info</a>
					</li>
				</ul>

				<form action="/product/search" method="post"
					class="form-inline my-2 my-lg-0">
					<div class="input-group input-group-sm">
						<input name="keywords" value="${keywords}" type="text"
							class="form-control" aria-label="Small"
							aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
						<div class="input-group-append">
							<button class="btn btn-secondary btn-number">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>