package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import Dao.dao;
import book.book;

public class warehouse extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public warehouse() {
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

		System.out.println("***********doGet_servlet*********************");

        this.doPost(request, response);//调用doPost方法
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

		System.out.println("***********doPost_servlet*********************");

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String method=request.getParameter("method");
        if("getall".equals(method)) {
            List<book> allGoodsList = new ArrayList<book>();

            System.out.println("getallxxxxxxxxxxxxxxxxxxxxxxxxx");

            dao dao = new dao();

            allGoodsList = dao.getAllbook();

            request.getSession().setAttribute("allGoodsList", allGoodsList);

            //System.out.println(allGoodsList.get(0).getName());
           // request.getRequestDispatcher(request.getContextPath()+"/admin-form.jsp").forward(request,response); 
            response.sendRedirect("../admin-form.jsp");//需要用重定向  这样地址栏不变
        }else if("add".equals(method))
        { 
       
            	
            System.out.println(request.getParameter("name"));
            System.out.println(request.getParameter("inprice"));
            book item = new book();
            item.setISBN(request.getParameter("ISBN"));
    		item.setBookName(request.getParameter("name"));
    		item.setBookKind(request.getParameter("Kind"));
    		item.setBookPrice(new Float(request.getParameter("price")));
    		item.setBookPub(request.getParameter("Pub"));
    		item.setAuthor(request.getParameter("author"));

            dao dao=new dao();
            if(dao.Insertbook(item))//如果插入成功
            {
                System.out.println("successf");
                response.sendRedirect("../admin-form.jsp");//需要用重定向  这样地址栏不变
            }
            else
            {
                System.out.println("faail");
                response.sendRedirect("../admin-form.jsp");//需要用重定向  这样地址栏不变
            }
        }
        else if("delete".equals(method))
        {System.out.print("delete order");
    	dao dd = new dao();
    	if(dd.changeordertype(request.getParameter("deleteorderID")))
    	{
    	
    		String orderNO = request.getParameter("deleteorderID");
    		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    		String datetime = df.format(System.currentTimeMillis());// new Date()为获取当前系统时间
    		System.out.print(request.getParameter("deleteorderID"));
    		String sNO = dd.superAdmsNO(request.getParameter("userName"));
    		dd.refinishorder(sNO,orderNO);
    		dd.deletefinishorder(orderNO);
    		dd.insertfinishorder(orderNO,sNO,datetime);
    		System.out.println(request.getParameter("userName"));
            response.sendRedirect("../admin-table.jsp");//需要用重定向  这样地址栏不变
    	}
    	else
        {
            System.out.println("fail");
            response.sendRedirect("../admin-table.jsp");//需要用重定向  这样地址栏不变
        }}
        else if("deletebook".equals(method))
        {
        	System.out.print("delete book");
        	dao dd = new dao();
        	if(dd.deletebook(request.getParameter("deletebookID"))==true)
        	{
        		System.out.println(request.getParameter("deleteorderID"));
                response.sendRedirect("../admin_article.jsp");//需要用重定向  这样地址栏不变
        	}
        	else
            {
                System.out.println("fail");
                response.sendRedirect("../admin_article.jsp");//需要用重定向  这样地址栏不变
            }
        }
        
        else if("change".equals(method))
        {
        	System.out.println(request.getParameter("name"));
            System.out.println(request.getParameter("inprice"));
            book item = new book();
            item.setISBN(request.getParameter("ISBN"));
    		item.setBookName(request.getParameter("name"));
    		item.setBookKind(request.getParameter("Kind"));
    		item.setBookPrice(new Float(request.getParameter("price")));
    		item.setBookPub(request.getParameter("Pub"));
    		item.setAuthor(request.getParameter("author"));

            dao dao=new dao();
            if(dao.changebook(item))//如果插入成功
            {
                System.out.println("successf");
                response.sendRedirect("../admin_article.jsp");//需要用重定向  这样地址栏不变
            }
            else
            {
                System.out.println("faail");
                response.sendRedirect("../admin-form1.jsp");//需要用重定向  这样地址栏不变
            }
        }
        
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		System.out.println("***********init_servlet*********************");
	}

}
