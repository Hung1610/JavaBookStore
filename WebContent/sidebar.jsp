
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Mục quản lý</li>
            <li><a href="AdminOrders"><i class="fa fa-circle-o"></i> Danh sách hóa đơn</a></li>
            <li><a href="AdminBooks"><i class="fa fa-circle-o"></i> Danh sách sách </a></li>
            <li><a href="AdminTypesList"><i class="fa fa-circle-o"></i> Danh sách loại sách </a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  