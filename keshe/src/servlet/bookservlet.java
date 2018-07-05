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

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

import user.Users;
import Dao.dao;
import bookcar.bookcar;

public class bookservlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public bookservlet() {
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
			for(int j=0;j<bookcars.size();j++)
			{
				String ISBN=request.getParameter(bookcars.get(j).getISBN());
				System.out.println(bookcars.get(j).getBookname()+"得到ISBN为"+bookcars.get(j).getISBN()+"wei"+ISBN);
				bookcars.get(j).setNum(Integer.valueOf(ISBN));
				
				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 				
				bookcars.get(j).setOrdertime(df2.format(System.currentTimeMillis()));
				dao.yeOrder(bookcars.get(j));
				System.out.println(bookcars.get(j).getBookname()+":"+bookcars.get(j).getNum());
			}
			response.sendRedirect(request.getContextPath()+"/shopcar.jsp");
			
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("出错");
			response.sendRedirect(request.getContextPath()+"/articles.jsp");
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
