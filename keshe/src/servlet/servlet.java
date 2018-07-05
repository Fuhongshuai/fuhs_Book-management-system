package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.User;

import com.sun.corba.se.spi.activation.Repository;

import user.Users;
import Dao.dao;
public class servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servlet() {
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
		String email,password;
		
		String name;
		try {
			email=request.getParameter("email");
			System.out.println(email);
			password=request.getParameter("password");
			dao d=new dao();					
				name=d.SearchAdm(email,password);
				if(name!=null)
				{
					System.out.println("欢迎"+name);
					Users u=new Users();
					u.setEmail(email);
					u.setUername(name);
					String address=d.geteadress(email);
					u.setAddress(address);
					//把注册成功的用户对象保存在session中
					request.getSession().setAttribute("regUser", u);
					//跳转到注册成功页面
					response.sendRedirect("../articles.jsp");
				}
				else if(d.SearchAdm(email,password)!=null)
				{
					System.out.println("欢迎"+name);
					Users u=new Users();
					u.setEmail(email);
					u.setUername(name);
					//把注册成功的用户对象保存在session中
					request.getSession().setAttribute("regUser", u);
					//跳转到注册成功页面
					response.sendRedirect("../articles.jsp");
					
				}
				else if(d.SearchsuperAdm(email,password)!=null)
				{
					name=d.SearchsuperAdm(email,password);
					System.out.println("欢迎"+name);
					Users u=new Users();
					u.setEmail(email);
					u.setUername(name);
					//把注册成功的用户对象保存在session中
					request.getSession().setAttribute("regUser", u);
					//跳转到注册成功页面
					response.sendRedirect("../admin-index.jsp");
					
				}
				else 
				{
					System.out.println("登录失败");
					response.sendRedirect(request.getContextPath()+"/login.jsp");
					//返回登录且显示错误
				}
				
				
		} catch (Exception e) {
			// TODO: handle exception
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
