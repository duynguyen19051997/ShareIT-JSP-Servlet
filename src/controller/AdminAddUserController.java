package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.UserDAO;
import model.bean.User;
import util.AuthUtil;
import util.StringUtil;

/**
 * Servlet implementation class AdminAddUserController
 */
//@WebServlet("/AdminAddUserController")
public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAddUserController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin =(User) session.getAttribute("userInfor");
		
		//chỉ anhduy mới được thêm người dùng
		if(!"admin".equals(userLogin.getUsername())) {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=4");
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp");
		rd.forward(request, response);
	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin =(User) session.getAttribute("userInfor");
		
		//chỉ anhduy mới được thêm người dùng
		if(!"admin".equals(userLogin.getUsername())) {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=4");
			return;
		}
		UserDAO userDAO = new UserDAO();
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String fullName = request.getParameter("fullname");
		if(userName.isEmpty() || password.isEmpty() || fullName.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp?msg=9");
			rd.forward(request, response);
			return;
		}
		password = StringUtil.md5(password);
		User user = new User(0, userName, password, fullName, "active.jpg");
		if(userDAO.hasUser(user)) {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp?msg=10");
			rd.forward(request, response);
			return;
		}else if(userDAO.addItem(user) > 0) {
			//success
			response.sendRedirect(request.getContextPath() + "/admin/user/index?page=1&msg=1");
			return;
		}else {
			//fail
			RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp?msg=0");
			rd.forward(request, response);
			return;
		}
	}

}
