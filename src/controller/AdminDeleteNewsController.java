package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CommentDAO;
import model.DAO.NewsDAO;
import model.bean.News;
import util.AuthUtil;
import util.DefineUtil;

/**
 * Servlet implementation class AdminDeleteNewsController
 */
//@WebServlet("/AdminDeleteNewsController")
public class AdminDeleteNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteNewsController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		NewsDAO newsDAO = new NewsDAO();
		int id = 0;
		int page = 1;
		try {
			if (request.getParameter("id") != null) {
				id = Integer.valueOf(request.getParameter("id"));
			}
			if (request.getParameter("page") != null) {
				page = Integer.valueOf(request.getParameter("page"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		News objNews = newsDAO.getItem(id);
		String picture = objNews.getPicture();
		if(!picture.isEmpty()) {
			File file = new File(request.getServletContext().getRealPath("") + DefineUtil.DI_STRING + File.separator + picture);
			file.delete();
		}
		if(newsDAO.deleteItem(id) > 0) {
			CommentDAO cmt = new CommentDAO();
			if(cmt.deleteItemByNewsId(id) > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/news/index?page=" + page + "&msg=3");
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/news/index?page=" + page + "&msg=0");
				return;
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/news/index?page=" + page + "&msg=0");
			return;
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
