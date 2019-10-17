package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.DAO.CatDAO;
import model.bean.Category;
import model.bean.User;
import util.AuthUtil;
import util.DefineUtil;
import util.FileUtil;

@MultipartConfig
/**
 * Servlet implementation class AdminAddCatController
 */
//@WebServlet("/AdminAddCatController")
public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAddCatController() {
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
		RequestDispatcher rd = request.getRequestDispatcher("/admin/cat/add.jsp");
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
		CatDAO catDao = new CatDAO();
		String catName = request.getParameter("name");
		int sort = 500;
		int parent_id = 0;
		try {
			if (request.getParameter("number") != null) {
				sort = Integer.valueOf(request.getParameter("number"));
			}
			if (request.getParameter("parent_cat") != null) {
				parent_id = Integer.valueOf(request.getParameter("parent_cat"));
				if (parent_id == -1) {
					parent_id = 0;
				}
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		if (catName.isEmpty() || "".equals(catName)) {
			request.setAttribute("name-error", "Vui lòng không để trống!");
			RequestDispatcher rd = request.getRequestDispatcher("/admin/cat/add.jsp");
			rd.forward(request, response);
			return;
		} else {
			Category objCat = new Category(0, parent_id, sort, catName, userLogin.getUsername());
			if (catDao.addItem(objCat) > 0) {
				// success
				response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=1");
				return;
			} else {
				// fail
				response.sendRedirect(request.getContextPath() + "/admin/cat/add?msg=0");
				return;
			}
		}
	}

}
