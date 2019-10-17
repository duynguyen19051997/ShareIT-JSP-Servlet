package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CatDAO;
import model.bean.Category;
import util.AuthUtil;

/**
 * Servlet implementation class AdminSearchCatController
 */
//@WebServlet("/AdminSearchCatController")
public class AdminSearchCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminSearchCatController() {
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
		CatDAO catDAO = new CatDAO();
		String name = "";
		if (request.getParameter("seach") != null) {
			name = (String) request.getParameter("seach");
		}
		ArrayList<Category> listSearch = catDAO.searchItems(name);
		ArrayList<Category> listCatCha = catDAO.getItems();
		request.setAttribute("listCatCha", listCatCha);
		request.setAttribute("listSearch", listSearch);
		request.setAttribute("search", name);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/cat/search.jsp");
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
