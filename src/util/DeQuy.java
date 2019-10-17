package util;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import model.DAO.CatDAO;
import model.bean.Category;

public class DeQuy {

	public static void CreateChildMenu(int parentId, javax.servlet.jsp.JspWriter out, HttpServletRequest request) {
		CatDAO catDao = new CatDAO();
		try {
			ArrayList<Category> listChildMenu = catDao.getItemByPid(parentId);
			if (listChildMenu.size() > 0)// Nếu tồn tại menu con với parent_id=parentId
			{
				out.println("<ul class=\"dropdown\" >");
				for (Category childItem : listChildMenu) {
					//String urlSlug = request.getContextPath() + "/public/cat?id=" + childItem.getId() + "&page=1";
					String urlSlug = request.getContextPath() + "/danh-muc/" + StringUtil.makeSlug(childItem.getName()) + "/"
							+ childItem.getId() + "/" + 1 + ".html";
					out.println("<li>");
					out.println("<a id='dequy' href='" + urlSlug + "'>" + childItem.getName() + "</a>");
					CreateChildMenu(childItem.getId(), out, request);
				}
				out.println("</ul>");
			} else {
				out.println("</li>");
			}
		} catch (IOException ex) {
		}
	}

	public static void CreateMenu(javax.servlet.jsp.JspWriter out, HttpServletRequest request) {
		CatDAO catDao = new CatDAO();
		try {
			ArrayList<Category> listCat = catDao.getItemByPid(0);
			if (listCat.size() > 0) {
				out.println("<ul>");
				out.println("<li><a href='" + request.getContextPath() + "/trang-chu/1.html'>Trang chủ</a></li>");
				for (Category item : listCat) {
					//String urlSlug = request.getContextPath() + "/public/cat?id=" + item.getId() + "&page=1";
					//String urlSlug = request.getContextPath() + "/danh-muc/" + StringUtil.makeSlug(item.getName()) + "/"
							//+ item.getId() + "/" + 1 + ".html";
					out.println("<li>");
					out.println("<a href='javascript:void(0)'>" + item.getName() + "</a>");
					CreateChildMenu(item.getId(), out, request);
					out.print("</li>");
				}
				out.println("</ul>");
			}
		} catch (IOException ex) {

		}
	}
	
	public static int deleteCat(int id, ArrayList<Category> listCat) {
		int result = 0;
		CatDAO catDAO = new CatDAO();
		for (Category category : listCat) {
			if (category.getId() == id) {
				result += catDAO.deleteItem(id);
			}
			if (category.getParent_id() == id) {
				result += catDAO.deleteItem(id) + catDAO.deleteItemsByParent_id(id)
						+ deleteCat(category.getId(), listCat);
			}
		}
		return result;
	}

}
