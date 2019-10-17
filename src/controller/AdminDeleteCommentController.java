package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CommentDAO;
import util.AuthUtil;

/**
 * Servlet implementation class AdminDeleteCommentController
 */
//@WebServlet("/AdminDeleteCommentController")
public class AdminDeleteCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteCommentController() {
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
		int id = 0;
		try {
			if(request.getParameter("id") != null) {
				id = Integer.valueOf(request.getParameter("id"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		if(cmtDAO.getItemById(id) == null) {
			response.sendRedirect(request.getContextPath() + "/admin/comment/index?page=" + 1 + "&msg=7");
			return;
		} else {
			if(cmtDAO.deleteItem(id) > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/comment/index?page=" + 1 + "&msg=3");
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/comment/index?page=" + 1 + "&msg=0");
				return;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
