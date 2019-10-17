package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CatDAO;
import model.DAO.NewsDAO;
import util.DefineUtil;

/**
 * Servlet implementation class PublicIndexCatController
 */
//@WebServlet("/PublicIndexCatController")
public class PublicIndexCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicIndexCatController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		CatDAO catDAO = new CatDAO();
		int catId = 0;
		int currentPage = 1;
		try {
			if(request.getParameter("id") != null) {
				catId = Integer.valueOf(request.getParameter("id"));
			}
			if(request.getParameter("page") != null) {
				currentPage = Integer.valueOf(request.getParameter("page"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		int numberOfItems = newsDAO.getNumberOfItem(catId);
		int numberOfPages = (int)Math.ceil((float)numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		if(currentPage > numberOfPages) {
			currentPage = numberOfPages;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}
		
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		request.setAttribute("catName", catDAO.getItem(catId));
		request.setAttribute("newsMaxViewByCatID", newsDAO.getItemsPublicMaxViewByCatId(catId));
		request.setAttribute("catName", catDAO.getItem(catId));
		request.setAttribute("numberOfPage", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listNewsByCatId", newsDAO.getItemsPublicByCatIdPagination(catId,offset));
		RequestDispatcher rd = request.getRequestDispatcher("/public/category.jsp");
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
