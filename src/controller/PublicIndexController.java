package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.NewsDAO;
import util.DefineUtil;

/**
 * Servlet implementation class PublicIndexController
 */
//@WebServlet("/PublicIndexController")
public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicIndexController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		int currentPage = 1;
		int numberOfItems = newsDAO.getNumberOfItem();
		try {
			if(request.getParameter("page") != null) {
				currentPage = Integer.valueOf(request.getParameter("page"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		int numberOfPage = (int)Math.ceil((float)numberOfItems / DefineUtil.NUMBER_PER_PAGE) ;
		if(currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listNewsViewMax", newsDAO.getItemsPublicByViewMax());
		request.setAttribute("listNewsLatest", newsDAO.getItemsLatest());
		request.setAttribute("listNews", newsDAO.getItemsPublicPagination(offset));
		RequestDispatcher rd = request.getRequestDispatcher("/public/index.jsp");
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
