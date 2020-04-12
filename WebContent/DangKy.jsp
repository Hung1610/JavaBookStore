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
									<h5 class="card-title">Đăng ký</h5>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<form method="post" action="ktController">
										<div class="form-group">
											<label for="hoten">Họ tên</label> <input type="text"
												name="hoten" class="form-control" id="hoten"
												aria-describedby="userHelp" placeholder="Nhập họ tên">
										</div>
										<div class="form-group">
											<label for="diachi">Địa chỉ</label> <input type="text"
												name="diachi" class="form-control" id="diachi"
												aria-describedby="userHelp" placeholder="Nhập địa chỉ">
										</div>
										<div class="form-group">
											<label for="sodt">Số điện thoại</label> <input type="text"
												name="sodt" class="form-control" id="sodt"
												aria-describedby="userHelp" placeholder="Nhập số đt">
										</div>
										<div class="form-group">
											<label for="email">Email</label> <input type="text"
												name="email" class="form-control" id="email"
												aria-describedby="userHelp" placeholder="Nhập email">
										</div>
										<div class="form-group">
											<label for="tendn">Tên đăng nhập</label> <input type="text"
												name="tendn" class="form-control" id="tendn"
												aria-describedby="userHelp" placeholder="Nhập tên đăng nhập">
										</div>
										<div class="form-group">
											<label for="pass">Mật khẩu</label> <input type="password"
												name="pass" class="form-control" id="pass"
												placeholder="Nhập mật khẩu">
										</div>
										<div class="row">
											<div class="col-12 text-center">
												<button type="submit" class="btn btn-light btn-block"
													name="btn" value="register">Đăng ký</button>
											</div>
										</div>
										<div class="row">
											<div class="col-12 text-center">
												<a href="/Sach/ktController" class="btn btn-light btn-block"
													name="btn" value="register"><-- Trở lại</a>
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