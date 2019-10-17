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
import util.DefineUtil;
import util.StringUtil;

/**
 * Servlet implementation class AdminEditUserController
 */
//@WebServlet("/AdminEditUserController")
public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEditUserController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		UserDAO userDAO = new UserDAO();
		int id = Integer.valueOf(request.getParameter("id"));

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userInfor");

		if ("admin".equals(userLogin.getUsername()) || id == userLogin.getId()) {
			User objUser = userDAO.getItem(id);
			if (objUser != null) {
				request.setAttribute("objUser", objUser);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/user/edit.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=7");
				return;
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		UserDAO userDAO = new UserDAO();
		int id = Integer.valueOf(request.getParameter("id"));
		int currentPage = 1;
		try {
			if ((request.getParameter("page")) != null) {
				currentPage = Integer.valueOf(request.getParameter("page"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		int numberOfPages = (int) Math.ceil((float) userDAO.getNumberOfItem() / DefineUtil.NUMBER_PER_PAGE);

		if (userDAO.getId(id) != id || id < 1) {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=7");
			return;
		}
		
		if(currentPage < 1 || currentPage > numberOfPages) {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=8");
			return;
		}

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userInfor");

		if ("admin".equals(userLogin.getUsername()) || id == userLogin.getId()) {
			User objUser = userDAO.getItem(id);
			if (objUser == null) {
				RequestDispatcher rd = request.getRequestDispatcher("/admin/user/edit.jsp?msg=0");
				rd.forward(request, response);
				return;
			}
			// get data
			String password = request.getParameter("password");
			if (password.isEmpty()) {
				password = objUser.getPassword();
			} else {
				password = StringUtil.md5(password);
			}
			String fullName = request.getParameter("fullname");

			// validate by java
			if (fullName.isEmpty()) {
				RequestDispatcher rd = request.getRequestDispatcher("/admin/user/edit.jsp?msg=9");
				rd.forward(request, response);
				return;
			}

			// set data
			objUser.setPassword(password);
			objUser.setFullname(fullName);
			if (userDAO.editItem(objUser) > 0) {
				// success
				response.sendRedirect(request.getContextPath() + "/admin/user/index?page=" + currentPage + "&msg=2");
				return;
			} else {
				// fail
				RequestDispatcher rd = request.getRequestDispatcher("/admin/user/edit.jsp?msg=0");
				rd.forward(request, response);
				return;
			}

		} else {
			response.sendRedirect(request.getContextPath() + "/admin/user/index?msg=5");
			return;
		}
	}

}
