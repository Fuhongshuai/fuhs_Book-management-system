package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.book;
import bookcar.bookcar;

import user.Users;
import Dao.dao;

public class buybook extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public buybook() {
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
			Users Adm=(Users)session.getAttribute("Adm");
			
			
			book Book=(book)session.getAttribute("Book");
			System.out.println(Adm.getEmail());
			System.out.println(Book.getBookName());
			
			
			bookcar bookcar=new bookcar();
			
			bookcar.setAddress(dao.geteadress(Adm.getEmail()));
			bookcar.setAuthor(Book.getAuthor());
			bookcar.setBookname(Book.getBookName());
			bookcar.setBookPrice(Book.getBookPrice());
			bookcar.setEmail(Adm.getEmail());
			bookcar.setFinish("no");
			bookcar.setISBN(Book.getISBN());
			bookcar.setNum(1);
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");   
	        //System.out.println(df.format(System.currentTimeMillis()));  
			bookcar.setOrderNO(df.format(System.currentTimeMillis()));
			SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			bookcar.setOrdertime(df2.format(System.currentTimeMillis()));
			try {
				
				if(dao.InsertOrder(bookcar))
				{
					System.out.println("buybook方法成功");
				}
				else {
					System.out.println("buybook失败");
				}
				
				request.getSession().setAttribute("id", Book.getISBN());
				response.sendRedirect(request.getContextPath()+"/bookdetail.jsp?id="+Book.getISBN());
				//response.sendRedirect(request.getContextPath()+"/login.jsp");
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("加入购物车失败");
			}
			dao.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("未登录");
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
