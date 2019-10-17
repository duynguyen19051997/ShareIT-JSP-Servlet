package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CommentDAO;
import model.DAO.NewsDAO;
import model.bean.Comment;
import model.bean.News;

/**
 * Servlet implementation class PublicIndexDetailController
 */
//@WebServlet("/PublicIndexDetailController")
public class PublicIndexDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicIndexDetailController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		int id = 0;
		try {
			if(request.getParameter("id") != null) {
				id = Integer.valueOf(request.getParameter("id"));
			}
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		if(id < 0) {
			response.sendRedirect(request.getContextPath() + "/public/index");
			return;
		}
		News objNews = newsDAO.getItemPublicById(id);
		if (objNews == null) {
			response.sendRedirect(request.getContextPath() + "/public/index");
			return;
		}
		request.setAttribute("news", objNews);
		String name = "news-" + id;
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			Cookie newsId = new Cookie(name, "yes");
			newsId.setMaxAge(60 * 5);
			response.addCookie(newsId);
			newsDAO.increaseView(id, objNews.getView() + 1);
		} else {
			int check = 1;
			for (Cookie cookie2 : cookies) {
				if (cookie2.getName().equals(name)) {
					check = 0;
				}
			}
			if (check == 1) {
				Cookie newsId = new Cookie(name, "yes");
				newsId.setMaxAge(60 * 5);
				response.addCookie(newsId);
				newsDAO.increaseView(id, objNews.getView() + 1);
			}
		}
		CommentDAO cmtDAO = new CommentDAO();
		int coutComment = cmtDAO.getNumberOfItemsPublic(id);
		ArrayList<Comment> listCmt =  cmtDAO.getItems(objNews.getId());
		request.setAttribute("news", objNews);
		request.setAttribute("coutComment", coutComment);
		request.setAttribute("listCmt", listCmt);
		request.setAttribute("listNewsRelated", newsDAO.getNewsPublicRelated(objNews.getId(), objNews.getObjCat().getId()));
		RequestDispatcher rd = request.getRequestDispatcher("/public/detail.jsp");
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
