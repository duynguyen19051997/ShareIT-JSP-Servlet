package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.CatDAO;
import model.bean.Category;
import model.bean.User;
import util.AuthUtil;
@MultipartConfig
/**
 * Servlet implementation class AdminAddCatController
 */
//@WebServlet("/AdminEditCatController")
public class AdminEditCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEditCatController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		CatDAO catDao = new CatDAO();
		int page = 1;
		int id = 0;
		try {
			if (request.getParameter("page") != null) {
				page = Integer.valueOf(request.getParameter("page"));
			}
			if (request.getParameter("id") != null) {
				id = Integer.valueOf(request.getParameter("id"));
			}
		} catch (NumberFormatException e) {
		}
		int numberOfPages = catDao.getNumberOfItem();
		if (catDao.getId(id) == 0) {
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?page=" + 1 + "&msg=7");
			return;
		}
		if (page > numberOfPages || page < 1) {
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?page=" + 1 + "&msg=8");
			return;
		}
		request.setAttribute("page", page);
		request.setAttribute("objCat", catDao.getItem(id));
		RequestDispatcher rd = request.getRequestDispatcher("/admin/cat/edit.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userInfor");
		int page = 1;
		CatDAO catDao = new CatDAO();
		int id = Integer.valueOf(request.getParameter("id"));
		int sort = 500;
		int parent_id = 0;
		try {
			if (request.getParameter("number") != null) {
				sort = Integer.valueOf(request.getParameter("number"));
			}
			if (request.getParameter("page") != null) {
				page = Integer.valueOf(request.getParameter("page"));
			}
			if (request.getParameter("danhmuccha") != null) {
				parent_id = Integer.valueOf(request.getParameter("danhmuccha"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		String name = "";
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
		}
		
		Category objCat = new Category(id, parent_id, sort, name, userLogin.getUsername());
		if (catDao.editItem(objCat) > 0) {
			// success
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?page=" + page + "&msg=2");
			return;
		} else {
			// fail
			response.sendRedirect(request.getContextPath() + "/admin/cat/edit?msg=0");
			return;
		}
	}

}
