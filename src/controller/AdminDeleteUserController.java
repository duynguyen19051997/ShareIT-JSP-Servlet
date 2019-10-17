package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.UserDAO;
import model.bean.User;
import util.AuthUtil;

/**
 * Servlet implementation class AdminDeleteUserController
 */
//@WebServlet("/AdminDeleteUserController")
public class AdminDeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteUserController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		UserDAO userDAO = new UserDAO();
		int id = Integer.valueOf(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		User userLogin = (User)session.getAttribute("userInfor");
		User user = userDAO.getItem(id);
		if("admin".equals(user.getUsername())) {
			response.sendRedirect(request.getContextPath()+"/admin/user/index?msg=6");
			return;
		} else {
			if ("admin".equals(userLogin.getUsername())) {
				if(userDAO.deleteItem(id) > 0) {
					//success
					response.sendRedirect(request.getContextPath()+"/admin/user/index?msg=3");
					return;
				}else {
					//fail
					response.sendRedirect(request.getContextPath()+"/admin/user/index?msg=0");
					return;
				}
			}else {
				response.sendRedirect(request.getContextPath()+"/admin/user/index?msg=6");
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
