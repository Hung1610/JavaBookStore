package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.AdminBean;

public class AdminDao {
	DungChung dc = new DungChung();
	public ArrayList<AdminBean> getAdmin() throws Exception {
		ArrayList<AdminBean> ds = new ArrayList<AdminBean>();		
		dc.KetNoi();
		String sql = "SELECT * FROM DangNhap";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String username = rs.getString("TenDangNhap");
			String password = rs.getString("MatKhau");			
			AdminBean bean = new AdminBean(username, password);
			ds.add(bean);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}	
}
