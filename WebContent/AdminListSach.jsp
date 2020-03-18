<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Bean.SachBean"%>
<%@page import="Bean.LoaiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Blank Page</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<link href="plugins/DataTables/datatables.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">

		<%@include file="header.jsp"%>
		<!-- =============================================== -->

		<!-- Left side column. contains the sidebar -->
		<%@include file="sidebar.jsp"%>
		<%
			if (request.getAttribute("kqThem") != null) {
				out.print("<script>alert('Trùng mã!')</script>");
			}
			SachBean sbean = (SachBean) request.getAttribute("bean");
		%>
		<!-- =============================================== -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Sách</h1>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div>

					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#addModal">Thêm sách</button>
					<div class="box">
						<div class="box-body">
							<table class="table mt-3">
								<thead class="thead-dark">
									<tr>
										<th scope="col" width="5%">Mã Sách</th>
										<th scope="col" width="30%">Tên Sách</th>
										<th scope="col" width="30%">Tác Giả</th>
										<th scope="col" width="12%">Giá</th>
										<th scope="col" width="10%">Số Lượng</th>
										<th scope="col" width="13%">Thao Tác</th>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<SachBean> dsSach = (ArrayList<SachBean>) request.getAttribute("dsSach");
										for (int i = 0; i < dsSach.size(); i++) {
											SachBean bean = dsSach.get(i);
									%>
									<tr>
										<td><%=bean.getMaSach()%></td>
										<td><%=bean.getTenSach()%></td>
										<td><%=bean.getTacGia()%></td>
										<td><%=bean.getGia()%></td>
										<td><%=bean.getSoLuong()%></td>
										<td class="d-flex">

											<button type="button" class="btn btn-primary"
												data-toggle="modal"
												data-target="#addModal<%=bean.getMaSach()%>">Chi
												tiết</button>
											<a href="AdminBooks?maXoa=<%=bean.getMaSach()%>"
											class="btn btn-danger">Xóa</a>
										</td>
									</tr>

									<div class="modal fade" id="addModal<%=bean.getMaSach()%>"
										tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Chi tiết sách</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form method="post" action="AdminBooks"
														enctype="multipart/form-data">
														<label>Mã sách</label> <input type="text" name="txtMaSach"
															value="<%if (bean != null)
					out.print(bean.getMaSach());%>"
															class="form-control"> <br> <label>Tên
															sách</label> <input type="text" name="txtTenSach"
															value="<%if (bean != null)
					out.print(bean.getTenSach());%>"
															class="form-control"> <br> <label>Tác
															giả</label> <input type="text" name="txtTacGia"
															value="<%if (bean != null)
					out.print(bean.getTacGia());%>"
															class="form-control"> <br> <label>Giá</label>
														<input type="number" name="txtGia"
															value="<%if (bean != null)
					out.print(bean.getGia());%>"
															class="form-control"> <br> <label>Số
															lượng</label> <input type="number" name="txtSoLuong"
															value="<%if (bean != null)
					out.print(bean.getSoLuong());%>"
															class="form-control"> <br> <label>Ngày
															nhập</label> <input type="date" name="txtNgayNhap"
															value="<%if (bean != null) {
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					Date d1 = df.parse(bean.getNgayNhap());
					SimpleDateFormat y = new SimpleDateFormat("yyyy");
					String year = y.format(d1);
					SimpleDateFormat m = new SimpleDateFormat("MM");
					String month = m.format(d1);
					SimpleDateFormat d = new SimpleDateFormat("dd");
					String date = d.format(d1);
					out.print(year + "-" + month + "-" + date);
				}%>"
															class="form-control"> <br> <label>Ảnh</label>
														<%
															if (bean != null) {
														%>
														<img alt="anh" width="200px"
															src="<%out.print(bean.getAnh());%>">
														<%
															}
														%>
														<input type="file" name="txtfile" class="form-control"><br>
														<label>Số tập</label> <input type="text" name="txtSoTap"
															value="<%if (bean != null)
					out.print(bean.getSoTap());%>"
															class="form-control"> <br> <label>Loại</label>
														<select name="cbbMaLoai" class="form-control">
															<%
																ArrayList<LoaiBean> dsLoai = (ArrayList<LoaiBean>) request.getAttribute("dsLoai");
																	for (int j = 0; j < dsLoai.size(); j++) {
																		LoaiBean lbean = dsLoai.get(j);
															%>
															<option value="<%=lbean.getMaLoai()%>"
																<%if (lbean != null)
						if (bean.getMaLoai().equals(lbean.getMaLoai()))
							out.print("selected");%>>
																<%=lbean.getTenLoai()%>
															</option>
															<%
																}
															%>
														</select> <br> <input
															type="submit" name="btnSua" value="Sửa"
															class="btn btn-primary"> <br>
													</form>
												</div>
											</div>
										</div>
									</div>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
									<div class="modal fade" id="addModal"
										tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Thêm sách</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form method="post" action="AdminBooks"
														enctype="multipart/form-data">
														<label>Mã sách</label> <input type="text" name="txtMaSach"
															value=""
															class="form-control"> <br> <label>Tên
															sách</label> <input type="text" name="txtTenSach"
															value=""
															class="form-control"> <br> <label>Tác
															giả</label> <input type="text" name="txtTacGia"
															value=""
															class="form-control"> <br> <label>Giá</label>
														<input type="number" name="txtGia"
															value=">"
															class="form-control"> <br> <label>Số
															lượng</label> <input type="number" name="txtSoLuong"
															value=""
															class="form-control"> <br> <label>Ngày
															nhập</label> <input type="date" name="txtNgayNhap"
															value=""
															class="form-control"> <br> <label>Ảnh</label>
														<img alt="anh" width="200px"
															src="">
														<input type="file" name="txtfile" class="form-control"><br>
														<label>Số tập</label> <input type="text" name="txtSoTap"
															value=""
															class="form-control"> <br> <label>Loại</label>
														<select name="cbbMaLoai" class="form-control">
															<%
																ArrayList<LoaiBean> dsLoai = (ArrayList<LoaiBean>) request.getAttribute("dsLoai");
																	for (int j = 0; j < dsLoai.size(); j++) {
																		LoaiBean lbean = dsLoai.get(j);
															%>
															<option value="<%=lbean.getMaLoai()%>"
																>
																<%=lbean.getTenLoai()%>
															</option>
															<%
																}
															%>
														</select> <br> <input type="submit" name="btnThem"
															value="Thêm" class="btn btn-primary"> <br>
													</form>
												</div>
											</div>
										</div>
									</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.18
			</div>
			<strong>Copyright &copy; 2014-2019 <a
				href="https://adminlte.io">AdminLTE</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<script src="plugins/DataTables/datatables.js"
		asp-append-version="true"></script>
	<script>
		$(document).ready(function() {
			var _$table = $('.table').DataTable({
				responsive : true,
				columnDefs : [ {
					width : '10%',
					targets : 'all'
				} ],
				autoWidth : false,
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ]
			});
		})
	</script>
	<script>
		$(document).ready(function() {
			$('.sidebar-menu').tree()
		})
	</script>
</body>
</html>
