package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.UserDAO;
import model.bean.User;
import util.AuthUtil;
import util.DefineUtil;

/**
 * Servlet implementation class AdminIndexUserController
 */
//@WebServlet("/AdminIndexUserController")
public class AdminIndexUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminIndexUserController() {
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
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		UserDAO userDAO = new UserDAO();
		int numberOfItem = userDAO.getNumberOfItem();
		int numberOfPage = (int) Math.ceil((float) numberOfItem / DefineUtil.NUMBER_PER_PAGE);
		int currentPage = 1;
		try {
			if (request.getParameter("page") != null) {
				currentPage = Integer.valueOf(request.getParameter("page"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		if (currentPage < 1) {
			currentPage = 1;
		}
		if (currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		ArrayList<User> listUser = userDAO.getItemsPagination(offset);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("numberOfItem", numberOfItem);
		request.setAttribute("listUser", listUser);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/user/index.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
