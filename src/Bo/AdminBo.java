package Bo;

import java.util.ArrayList;

import Bean.AdminBean;
import Dao.AdminDao;

public class AdminBo {
	AdminDao dao = new AdminDao();
	
	public ArrayList<AdminBean > getAdmin() throws Exception {
		return dao.getAdmin();
	}
	
	public AdminBean isExist(String tenDN, String pass) throws Exception {
		ArrayList<AdminBean> ds = getAdmin();
		for (AdminBean bean: ds) {
			if (bean.getUsername().equals(tenDN) && bean.getPassword().equals(pass))
				return bean;
		}
		return null;
	}
}
