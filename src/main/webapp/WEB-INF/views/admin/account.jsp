<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>
<link href="/admin.css" rel="stylesheet"></link>
<script type="text/javascript" src="/datatables-simple-demo.js"></script>
<script type="text/javascript" src="/scripts.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Administrator</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<!-- <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
            </div> -->
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a class="nav-link"
				id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="profile.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Profile
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="/product/index"
							data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
							aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Products
							<div class="sb-sidenav-collapse-arrow"></div>
						</a> <a class="nav-link" href="/category/index">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Categories
						</a> <a class="nav-link collapsed" href="/order/index"
							data-bs-toggle="collapse" data-bs-target="#collapsePages"
							aria-expanded="false" aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Orders
							<div class="sb-sidenav-collapse-arrow"></div>
						</a> <a class="nav-link" href="/order-detail/index">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Ordersdetails
						</a> <a class="nav-link" href="/account/index">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Account
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<h3 class="text-center text-uppercase font-weight-bold">Account</h3>
				<hr class="w-25 m-auto">
				<form:form action="/category/index" modelAttribute="item" enctype="multipart/form-data">

					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="home-tab"
							data-toggle="tab" href="#home" role="tab" aria-controls="home"
							aria-selected="true">Home</a></li>
						<li class="nav-item"><a class="nav-link" id="profile-tab"
							data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">Profile</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<table class="table mt-5">
								<thead class="thead-light">
									<tr>
										<th scope="col">Image</th>
										<th scope="col">Username</th>
										<th scope="col">Fullname</th>
										<th scope="col">Email</th>
										<th scope="col">Role</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<c:forEach var="i" items="${items}">
									<tr>
										<td><img style="width: 40px"
											src="${pageContext.request.contextPath}/account/${i.photo}"></td>
										<td scope="col">${i.username}</td>
										<td scope="col">${i.fullname}</td>
										<td scope="col">${i.email}</td>
										<td scope="col">${i.admin}</td>
										<td scope="col"><a class="btn btn-primary"
											href="/account/edit/${i.username}"><i class="fas fa-edit"></i>
										</a>| <a href="/account/delete/${i.username}"
											class="btn btn-danger"> <i class="fas fa-window-close"></i>
										</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="form-group ml-3">
								<label for="exampleInputEmail1">Username</label>
								<form:input path="username" type="text" class="form-control "
									id="exampleInputEmail1" aria-describedby="emailHelp" />
							</div>
							<div class="form-group ml-3">
								<label for="exampleInputEmail1">Fullname</label>
								<form:input path="fullname" cssClass="form-control "
									id="exampleInputEmail1" aria-describedby="emailHelp" />
							</div>
							<div class="form-group ml-3">
								<label for="exampleInputEmail1">Image</label> <input
									name="photo" type="file" cssClass="form-control "
									id="exampleInputEmail1" aria-describedby="emailHelp" />
							</div>
							<div class="form-group ml-3">
								<label for="exampleInputEmail1">Email</label>
								<form:input path="email" cssClass="form-control "
									id="exampleInputEmail1" aria-describedby="emailHelp" />
							</div>
							<form:label path="admin" for="exampleInputEmail1">Role</form:label>
							<div class="form-check form-check-inline ml-3">
								<form:radiobutton class="form-check-input" path="admin"
									id="inlineRadio1" value="true" />
								<label class="form-check-label" for="inlineRadio1">Admin</label>
							</div>
							<div class="form-check form-check-inline">
								<form:radiobutton class="form-check-input" path="admin"
									id="inlineRadio2" value="false" />
								<label class="form-check-label" for="inlineRadio2">User</label>
							</div>

							<div class="ml-3">
								<button class="btn btn-primary" formaction="/account/create">Create</button>
								<button class="btn btn-success" formaction="/account/update">Update</button>
								<button class="btn btn-success" formaction="/account/index">Clear</button>
							</div>
						</div>
					</div>
				</form:form>
			</main>

		</div>
	</div>

</body>

</html>