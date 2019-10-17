package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.NewsDAO;
import model.DAO.UserDAO;

/**
 * Servlet implementation class AdminActiveNewsController
 */
//@WebServlet("/AdminActiveUserController")
public class AdminActiveUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminActiveUserController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		int id = 0;
		try {
			id = Integer.valueOf(request.getParameter("aId"));
		} catch (Exception e) {
		}
		PrintWriter out = response.getWriter();
		String src = request.getParameter("aSrc");
		String status = src.substring(src.lastIndexOf("/") + 1, src.lastIndexOf("."));
		if ("active".equals(status)) {
			if(userDAO.updateActive(id, "disactive") > 0) {
				src = request.getContextPath() + "/templates/admin/images/disactive.jpg";
			}
		} else {
			if(userDAO.updateActive(id, "active") > 0) {
				src = request.getContextPath() + "/templates/admin/images/active.jpg";
			}
		}
		out.print(src);
	}

}
