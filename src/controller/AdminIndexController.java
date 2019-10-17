package controller;

import java.awt.color.CMMException;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CatDAO;
import model.DAO.CommentDAO;
import model.DAO.NewsDAO;
import model.DAO.UserDAO;
import util.AuthUtil;

/**
 * Servlet implementation class AdminIndexController
 */
//@WebServlet("/AdminIndexController")
public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminIndexController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		CatDAO catDAO = new CatDAO();
		UserDAO userDAO = new UserDAO();
		NewsDAO newsDAO = new NewsDAO();
		CommentDAO cmtDAO = new CommentDAO();
		int numberOfCat = catDAO.getNumberOfItem();
		int numberOfNews = newsDAO.getNumberOfItem();
		int numberOfUser = userDAO.getNumberOfItem();
		int numberOfCmt = cmtDAO.getNumberOfItem();
		request.setAttribute("numberOfCmt", numberOfCmt);
		request.setAttribute("numberOfCat", numberOfCat);
		request.setAttribute("numberOfNews", numberOfNews);
		request.setAttribute("numberOfUser", numberOfUser);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/index/index.jsp");
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
