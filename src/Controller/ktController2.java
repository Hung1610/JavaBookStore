package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.KhachHangBean;
import Bo.KhachHangBo;
import Bo.LoaiBo;
import Bo.SachBo;

/**
 * Servlet implementation class ktController
 */
@WebServlet("/DangKyController")
public class ktController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    KhachHangBo bo = new KhachHangBo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Lấy giá trị từ client gửi lên
				HttpSession session = request.getSession();
				String hoten = request.getParameter("hoten");
				String diachi = request.getParameter("diachi");
				String sodt = request.getParameter("sodt");
				String email = request.getParameter("email");
				String tendn = request.getParameter("tendn");
				String pass = request.getParameter("pass");

				if (request.getParameter("register")!=null) {
					int n;
					try {
						n = bo.them(hoten, diachi, sodt, email, tendn, pass);
						if (n==0) request.setAttribute("kqThem", 0);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("DangKy.jsp");
					rd.forward(request, response);
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("DangNhap.jsp");
				rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
