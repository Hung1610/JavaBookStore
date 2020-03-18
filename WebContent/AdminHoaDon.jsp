<%@page import="Bean.HoaDonBean"%>
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
  <title>Book Store</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

	<%@include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Left side column. contains the sidebar -->
	<%@include file="sidebar.jsp" %>
	<!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Hóa đơn
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
            <h3 class="box-title">Danh sách hóa đơn</h3>
        </div>
<div class="box-body">
	<table class="table">
		<thead class="thead-dark">
		    <tr>
		      <th scope="col">Mã Hóa Đơn</th>
		      <th scope="col">Mã Khách Hàng</th>
		      <th scope="col">Ngày Mua</th>
		      <th scope="col"></th>
		      <th scope="col">Trạng Thái</th>
		    </tr>
	  	</thead>
	  	<tbody>
		<%ArrayList<HoaDonBean> ds = (ArrayList<HoaDonBean>) request.getAttribute("ds");
			for (HoaDonBean hd: ds) {%>
				<tr>
					<th scope="row"><%=hd.getMaHD() %></th>
					<td><%=hd.getMaKH() %></td>
					<td><%=hd.getDate() %></td>
					<td scope="row"><a class="btn btn-info" href="AdminDetailOrder?maHD=<%=hd.getMaHD() %>">Chi tiết</a></td>
					<td><% if(hd.isDaMua()==true) out.print("Đã xác nhận"); 
						else { %>
						<a href="AdminOrders?btnConfirm=<%=hd.getMaHD() %>" class="btn btn-primary mr-2">Xác nhận</a>
						<%} %>
					</td>
				</tr>
			<%} %>
		</tbody>
	</table>
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
    <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
    reserved.
  </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
    <script src="plugins/DataTables/datatables.js" asp-append-version="true"></script>
    <script>
	$(document).ready(function() {
	    var _$table = $('.table').DataTable({
	        responsive: true,
	        columnDefs: [
	            { width: '10%', targets: 'all' }
	        ],
	        autoWidth: false,
	        dom: 'Bfrtip',
	        buttons: [
	            'copy', 'csv', 'excel', 'pdf', 'print'
	        ]
	    });
	})
    </script>
<script>
  $(document).ready(function () {
    $('.sidebar-menu').tree()
  })
</script>
</body>
</html>
