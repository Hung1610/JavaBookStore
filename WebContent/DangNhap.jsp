<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Screen</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="Content/Site.css">

</head>
<body>

	<div class="jumbotron jumbotron-fluid bg-dark text-white">
		<div class="container">
			<h1 class="display-4">Nhà sách Thăng Long</h1>
			<p class="lead">Cháo mừng đến nhà sách của chúng tôi!</p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="d-flex justify-content-center">
					<div class="card" style="margin: 50px; width: 500px;">
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<h5 class="card-title">Đăng nhập</h5>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<form method="post" action="ktController">
										<div class="form-group">
											<label for="username">Username</label> <input type="text"
												name="username" class="form-control" id="username"
												aria-describedby="userHelp" placeholder="Enter username">
										</div>
										<div class="form-group">
											<label for="pass">Password</label> <input type="password"
												name="pass" class="form-control" id="pass"
												placeholder="Password">
										</div>
										<div class="row">
											<div class="col-12 text-center">
												<button type="submit" class="btn btn-light btn-block"
													name="btn" value="Dang nhap">Đăng nhập</button>
											</div>
										</div>
										<div class="row">
											<div class="col-12 text-center">
												<a href="/Sach/DangKyController" class="btn btn-light btn-block"
													name="btn" value="register">Đăng ký</a>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>