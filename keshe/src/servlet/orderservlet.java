package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.Users;
import Dao.dao;
import bookcar.bookcar;

public class orderservlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public orderservlet() {
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

		request.setCharacterEncoding("utf-8");
		try {
			dao dao=new dao();
			
			HttpSession session=request.getSession(true);
			Users users=(Users) session.getAttribute("Adm");
			ArrayList<bookcar> bookcars=(ArrayList<bookcar>)session.getAttribute("bookcars");
			
			String tempnum=((String)session.getAttribute("booknum"));
			int booknum=Integer.valueOf(tempnum);
			//ArrayList<bookcar> 
			for(int i=0;i<booknum;i++)
			{
				String ISBN=request.getParameter(i+"");
			//	ArrayList<E>
				//dao.InsertOrder(bookcar);
			}
			
			
			
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
