<%@page import="Bean.LoaiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Quản lý loại sách</title>
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
        Loại sách
        <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

	<% 	
	if (request.getAttribute("kqXoa")!=null) {
		out.print("<script>alert('Loại có sách không xóa được!')</script>");
	}
	%>
      <!-- Default box -->
     <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Danh sách loại sách</h3>
        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" class="form-control" ng-model="keyword" placeholder="Từ khóa">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="button" ng-click="search()">Tìm kiếm</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <button class="btn btn-success" onclick="window.location.href='AdminLoaiController?btnAdd=1'">Thêm mới</button>
                    <button class="btn btn-danger" ng-click="deleteMultiple()" id="btnDelete" disabled>Xóa</button>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                	
                    <table class="table table-bordered">
                        <tr>
                            <th><input name="all" type="checkbox" ng-click="selectAll()" /></th>
                            <th style="width: 35%">Mã loại</th>
                            <th style="width: 57%">Tên loại</th>
                            <th style="width: 8%"></th>
                        </tr>
                       <%
                       	ArrayList<LoaiBean> dsLoai = (ArrayList<LoaiBean>) request.getAttribute("dsloai");
                       for (int i =0; i<dsLoai.size(); i++) {
               			LoaiBean loai = dsLoai.get(i); %>
               				<tr>
                            <td><input name="all" type="checkbox"/></td>
                            <td><%=loai.getMaLoai() %></td>
                            <td><%=loai.getTenLoai() %></td>
                            <td>
                                <button class="btn btn-sm btn-primary" onclick="window.location.href='AdminType?maLoaiChon=<%=loai.getMaLoai()%>'"><i class="fa fa-pencil"></i></button>                           
                                <button onclick="window.location.href='AdminType?maLoaiXoa=<%=loai.getMaLoai()%>'" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                            </td>
                        </tr>
                       <% } %>  
                              
                        <tfoot>
                            <tr>
                                <td colspan="5"><span class="pull-right">Số bản ghi: <%=dsLoai.size() %></span></td>
                            </tr>
                        </tfoot>
                    </table>
                   
                </div>
            </div>
        </div><!-- /.box-body -->
        
    </div><!-- /.box -->

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
