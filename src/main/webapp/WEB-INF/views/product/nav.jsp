<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
 <style>
    .img-circular {
      width: 100px;
      height: 50px;
      background-size: cover;
      display: block;
      border-radius: 100px;
      -webkit-border-radius: 100px;
      -moz-border-radius: 100px;
    }
  </style>
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


				<form action="/products" method="post"
					class="form-inline my-2 my-lg-0" enctype="multipart/form-data">
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
					<a class="btn btn-success btn-sm ml-3" href="/cart/view"> <i
						class="fa fa-shopping-cart"></i> Cart <span
						class="badge badge-light">${cart.count}</span>
					</a>
					
					<a style="color:white; font-weight: bold;" class="nav-link nav-item">Hi ,${username}</a>
					<img class="img-circular" style="width:50px">${photo}
				</form>

			</div>
		</div>
	</nav>
</body>
</html>