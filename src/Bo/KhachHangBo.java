package Bo;

import java.util.ArrayList;

import Bean.KhachHangBean;
import Dao.KhachHangDao;

public class KhachHangBo {

KhachHangDao dao = new KhachHangDao();
	
	public ArrayList<KhachHangBean> getKH() throws Exception {
		return dao.getKH();
	}
	
	public KhachHangBean isExist(String tenDN, String pass) throws Exception {
		ArrayList<KhachHangBean> ds = getKH();
		for (KhachHangBean bean: ds) {
			if (bean.getTenDangNhap().equals(tenDN) && bean.getPass().equals(pass))
				return bean;
		}
		return null;
	}
	
	public int them (String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception {
		return dao.them(hoten, diachi, sodt, email, tendn, pass);
	}
}
