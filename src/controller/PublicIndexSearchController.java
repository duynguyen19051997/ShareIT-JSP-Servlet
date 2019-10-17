package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.NewsDAO;
import model.bean.News;

/**
 * Servlet implementation class PublicIndexSearchController
 */
//@WebServlet("/PublicIndexSearchController")
public class PublicIndexSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicIndexSearchController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		NewsDAO newsDAO = new NewsDAO();
		String search = request.getParameter("searchterms");
		ArrayList<News> listNewsBySearch = newsDAO.getItemsPublicBySearch(search);
		request.setAttribute("listNewsBySearch", listNewsBySearch);
		RequestDispatcher rd = request.getRequestDispatcher("/public/search.jsp");
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
