package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CommentDAO;
import model.bean.Comment;

/**
 * Servlet implementation class PublicCommentController
 */
//@WebServlet("/PublicCommentController")
public class PublicCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicCommentController() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		int news_id = Integer.valueOf(request.getParameter("aId"));
		String email = request.getParameter("aEmail");
		String message = request.getParameter("aMessage");
		Comment objCom = new Comment(email, message, "active.jpg", 0, news_id);
		CommentDAO cmtDAO = new CommentDAO();
		if(cmtDAO.addComment(objCom) > 0) {
			ArrayList<Comment> listCmt = cmtDAO.getItems(news_id);
			request.setAttribute("listCmt", listCmt);
			RequestDispatcher rd = request.getRequestDispatcher("/public/comment.jsp");
			rd.forward(request, response);
		}
	}

}
