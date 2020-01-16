package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bo.LoaiBo;

/**
 * Servlet implementation class AdminType
 */
@WebServlet("/AdminType")
public class AdminType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminType() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    LoaiBo bo = new LoaiBo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String maLoai = request.getParameter("maLoai");
			String tenLoai = request.getParameter("tenLoai");
			
			if(request.getParameter("btnAdd")!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("addLoai.jsp");
				rd.forward(request, response);
			}
			
			if (request.getParameter("addLoai")!=null) {
				int n = bo.them(maLoai, tenLoai);
				if (n==0) request.setAttribute("kqThem", 0);
			}
			
			if (request.getParameter("editLoai")!=null) {
				bo.sua(maLoai, tenLoai);
			}
			
			if (request.getParameter("maLoaiChon")!=null) {
				request.setAttribute("loaiChon", bo.getLoaiByMa(request.getParameter("maLoaiChon")));
				request.setAttribute("dsloai", bo.getLoai());
				RequestDispatcher rd = request.getRequestDispatcher("editLoai.jsp");
				rd.forward(request, response);
			}
			
			if (request.getParameter("maLoaiXoa")!=null) {
				int n = bo.xoa(request.getParameter("maLoaiXoa"));
				if (n==0) request.setAttribute("kqXoa", 0);
			}
			request.setAttribute("dsloai", bo.getLoai());
			RequestDispatcher rd = request.getRequestDispatcher("AdminListLoai.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
