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
			SachBean sachChon = (SachBean) request.getAttribute("sachChon");
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
						data-target="#addModal">Chi tiết sách</button>
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
										<td class="d-flex"><a
											href="AdminBooks?maChon=<%=bean.getMaSach()%>"
											class="btn btn-primary mr-2">Chi tiết</a> <a
											href="AdminBooks?maXoa=<%=bean.getMaSach()%>"
											class="btn btn-danger">Xóa</a></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Modal title</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form method="post" action="AdminBooks"
									enctype="multipart/form-data">
									<label>Mã sách</label> <input type="text" name="txtMaSach"
										value="<%if (sachChon != null)
				out.print(sachChon.getMaSach());%>"
										class="form-control"> <br> <label>Tên
										sách</label> <input type="text" name="txtTenSach"
										value="<%if (sachChon != null)
				out.print(sachChon.getTenSach());%>"
										class="form-control"> <br> <label>Tác giả</label>
									<input type="text" name="txtTacGia"
										value="<%if (sachChon != null)
				out.print(sachChon.getTacGia());%>"
										class="form-control"> <br> <label>Giá</label> <input
										type="number" name="txtGia"
										value="<%if (sachChon != null)
				out.print(sachChon.getGia());%>"
										class="form-control"> <br> <label>Số
										lượng</label> <input type="number" name="txtSoLuong"
										value="<%if (sachChon != null)
				out.print(sachChon.getSoLuong());%>"
										class="form-control"> <br> <label>Ngày
										nhập</label> <input type="date" name="txtNgayNhap"
										value="<%if (sachChon != null) {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date d1 = df.parse(sachChon.getNgayNhap());
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
										if (sachChon != null) {
									%>
									<img alt="anh" width="200px"
										src="<%out.print(sachChon.getAnh());%>">
									<%
										}
									%>
									<input type="file" name="txtfile" class="form-control"><br>
									<label>Số tập</label> <input type="text" name="txtSoTap"
										value="<%if (sachChon != null)
				out.print(sachChon.getSoTap());%>"
										class="form-control"> <br> <label>Loại</label> <select
										name="cbbMaLoai" class="form-control">
										<%
											ArrayList<LoaiBean> dsLoai = (ArrayList<LoaiBean>) request.getAttribute("dsLoai");
											for (int i = 0; i < dsLoai.size(); i++) {
												LoaiBean bean = dsLoai.get(i);
										%>
										<option value="<%=bean.getMaLoai()%>"
											<%if (sachChon != null)
					if (bean.getMaLoai().equals(sachChon.getMaLoai()))
						out.print("selected");%>>
											<%=bean.getTenLoai()%>
										</option>
										<%
											}
										%>
									</select> <br> <input type="submit" name="btnThem" value="Thêm"
										class="btn btn-primary"> <input type="submit"
										name="btnSua" value="Sửa" class="btn btn-primary"> <br>
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

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>

				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>

									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript:void(0)" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
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
				autoWidth : false
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
