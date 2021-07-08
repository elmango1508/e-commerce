<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="/admin.css" rel="stylesheet" />
</head>
<body>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
									<b><i style="margin-left: 142px">${message}${param.error}</i></b>
								</div>
								<div class="card-body">
									<form action="/account/login" method="post">
										<div class="form-floating mb-3">
											<input name="username" class="form-control" id="inputEmail"
												type="text" placeholder="Username" /> <label
												for="inputEmail">Username</label>
										</div>
										<div class="form-floating mb-3">
											<input name="password" class="form-control"
												id="inputPassword" type="password" placeholder="Password" />
											<label for="inputPassword">Password</label>
										</div>
										<div class="form-check mb-3">
											<input class="form-check-input" id="inputRememberPassword"
												type="checkbox" value="" /> <label class="form-check-label"
												for="inputRememberPassword">Remember Password</label>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="/forgot_password">Forgot Password?</a>
											<button class="btn btn-primary">Login</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="/account/register">Need an account? Sign up!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>














<<%-- h3>LOGIN</h3> <b><i>${message}</i></b> <form
action="/account/login" method="post"> <input name="username"
placeholder="Username?"> <input name="password" placeholder="Password?">
<button>Login</button> </form> --%>
</body>
</html>