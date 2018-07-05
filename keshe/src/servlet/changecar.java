package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.core.RedirectSupport;

import user.Users;
import Dao.dao;
import book.book;
import bookcar.bookcar;

public class changecar extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public changecar() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		response.setContentType("text/html;charset=utf-8");
		try {
			dao dao=new dao();
			
			HttpSession session=request.getSession(true);
			Users users=(Users) session.getAttribute("Adm");
			ArrayList<bookcar> bookcars=(ArrayList<bookcar>)session.getAttribute("bookcars");
			String ISBN=request.getParameter("id");
			String email=users.getEmail();
			System.out.println("ISBN"+ISBN);
			
			dao.deleteorder(email, ISBN);
			
			response.sendRedirect(request.getContextPath()+session.getAttribute("path"));
			//ArrayList<bookcar> 
			
			
			//System.out.println(request.getParameter("n"));
			//int booknum=Integer.parseInt((String)session.getAttribute("booknum"));
			//Users Adm=(Users)session.getAttribute("Adm");
			//System.out.println(request.getParameter(bookcars.get(0).getISBN()));	
			//for(int i=0;i<bookcars.size();i++)
			//{
			//	int num=Integer.valueOf(request.getParameter(bookcars.get(i).getISBN()));
			//}
			//ArrayList<book> Book=(ArrayList<book>)session.getAttribute("Book");			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Î´µÇÂ¼");
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		
	
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
