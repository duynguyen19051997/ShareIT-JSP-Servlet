package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CatDAO;
import model.DAO.CommentDAO;
import model.bean.Category;
import util.AuthUtil;
import util.DefineUtil;

/**
 * Servlet implementation class AdminIndexCommentController
 */
//@WebServlet("/AdminIndexCommentController")
public class AdminIndexCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminIndexCommentController() {
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
		CommentDAO cmtDAO = new CommentDAO();
		// lấy ra tổng số tin
		int numberOfItems = cmtDAO.getNumberOfItem();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		int currentPages = 1;
		try {
			if (request.getParameter("page") != null) {
				currentPages = Integer.valueOf(request.getParameter("page"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		if (currentPages > numberOfPages || currentPages < 1) {
			currentPages = 1;
		}
		int offset = (currentPages - 1) * DefineUtil.NUMBER_PER_PAGE;
		request.setAttribute("numberOfItems", numberOfItems);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPages", currentPages);
		request.setAttribute("listCmt", cmtDAO.getItemsPagination(offset));
		RequestDispatcher rd = request.getRequestDispatcher("/admin/comment/index.jsp");
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
