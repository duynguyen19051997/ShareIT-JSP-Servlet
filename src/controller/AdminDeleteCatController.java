package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CatDAO;
import model.bean.Category;
import util.AuthUtil;
import util.DeQuy;

/**
 * Servlet implementation class AdminDeleteCatController
 */
//@WebServlet("/AdminDeleteCatController")
public class AdminDeleteCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteCatController() {
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
		CatDAO catDAO = new CatDAO();
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
		ArrayList<Category> listCat = catDAO.getItems();
		if(DeQuy.deleteCat(id, listCat) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?page=" + page + "&msg=3");
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?page=" + page + "&msg=0");
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
