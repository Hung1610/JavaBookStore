package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.KhachHangBean;

public class KhachHangDao {
	DungChung dc = new DungChung();
	public ArrayList<KhachHangBean> getKH() throws Exception {
		ArrayList<KhachHangBean> ds = new ArrayList<KhachHangBean>();		
		dc.KetNoi();
		String sql = "SELECT * FROM khachhang";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long maKH = rs.getLong("makh");
			String hoTen = rs.getString("hoten");
			String diaChi = rs.getString("diachi");
			String sdt = rs.getString("sodt");
			String email = rs.getString("email");
			String tenDangNhap = rs.getString("tendn");
			String pass = rs.getString("pass");
			KhachHangBean bean = new KhachHangBean(maKH, hoTen, diaChi, sdt, email, tenDangNhap, pass);
			ds.add(bean);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}	

	
	public int them (String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception {
		dc.KetNoi();
			String sql = "INSERT INTO khachhang(hoten, diachi, sodt, email, tendn, pass) values (?,?,?,?,?,?)";
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, diachi);
			cmd.setString(2, sodt);
			cmd.setString(3, email);
			cmd.setString(4, tendn);
			cmd.setString(5, pass);
			int kq = cmd.executeUpdate();
			dc.cn.close();
			return kq;
	}
}
