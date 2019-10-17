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
import model.DAO.NewsDAO;
import model.bean.Category;
import model.bean.News;
import model.bean.User;
import util.AuthUtil;
import util.DefineUtil;
import util.FileUtil;

@MultipartConfig
/**
 * Servlet implementation class AdminEditNewsController
 */
//@WebServlet("/AdminEditNewsController")
public class AdminEditNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEditNewsController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
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
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		int numberOfPages = (int) Math.ceil((float) newsDAO.getNumberOfItem() / DefineUtil.NUMBER_PER_PAGE);
		if (newsDAO.getId(id) != id) {
			response.sendRedirect(request.getContextPath() + "/admin/news/index?page=" + 1 + "&msg=7");
			return;
		}
		if (page > numberOfPages || page < 1) {
			response.sendRedirect(request.getContextPath() + "/admin/news/index?page=" + 1 + "&msg=8");
			return;
		}
		News objNews = newsDAO.getItem(id);
		request.setAttribute("objNews", objNews);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/news/edit.jsp");
		rd.forward(request, response);
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
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin =(User) session.getAttribute("userInfor");
		CatDAO catDAO = new CatDAO();
		NewsDAO newsDAO = new NewsDAO();
		String name = request.getParameter("nameNews");
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		int id = 0;
		int cat_id = 0;
		int page = 1;
		int numberOfPages = (int) Math.ceil((float) newsDAO.getNumberOfItem() / DefineUtil.NUMBER_PER_PAGE);
		try {
			if (request.getParameter("page") != null) {
				page = Integer.valueOf(request.getParameter("page"));
				if (page > numberOfPages || page < 1) {
					page = 1;
				}
			}
			if (request.getParameter("id") != null) {
				id = Integer.valueOf(request.getParameter("id"));
			}
		} catch (Exception e) {
		}
		if (newsDAO.getId(id) == 0) {
			response.sendRedirect(request.getContextPath() + "/admin/news/index?page=" + 1 + "&msg=7");
			return;
		}
		String active = "active.jpg";
		try {
			if (request.getParameter("parent_cat") != null) {
				cat_id = Integer.valueOf(request.getParameter("parent_cat"));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		// thông tin file
		Part filePart = request.getPart("picture");

		// lấy file name vừa upload
		String picture = filePart.getSubmittedFileName();

		if (!picture.isEmpty()) {
			// tạo thư mực chứa file upload
			String dirPath = request.getServletContext().getRealPath("") + DefineUtil.DI_STRING;
			// đặt lại tên
			picture = FileUtil.rename(picture);
			File createDir = new File(dirPath);
			// kiểm tra đã có file hay chưa
			if (!createDir.exists()) {
				createDir.mkdir();
			}
			// tạo đường dẫn file
			String filePath = dirPath + File.separator + picture;
			// ghi file
			filePart.write(filePath);
		}

		if (name.isEmpty() || preview.isEmpty() || detail.isEmpty()) {
			request.setAttribute("name-error", "Vui lòng điền đầy đủ các thông tin!");
			RequestDispatcher rd = request.getRequestDispatcher("/admin/news/add.jsp");
			rd.forward(request, response);
			return;
		}
		Category objCat = catDAO.getItem(cat_id);
		News objNews = new News(name, preview, detail, userLogin.getUsername(), picture, active, id,
				new Category(cat_id, objCat.getParent_id(), objCat.getName()));
		if (newsDAO.editItem(objNews) > 0) {
			// success
			response.sendRedirect(request.getContextPath() + "/admin/news/index?page=" + page + "&msg=2");
			return;
		} else {
			// fail
			response.sendRedirect(request.getContextPath() + "/admin/news/edit?msg=0");
			return;
		}

	}

}
