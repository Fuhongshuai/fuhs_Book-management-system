package Dao;

import order.order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.xml.registry.infomodel.EmailAddress;
import javax.xml.registry.infomodel.User;

import com.sun.org.apache.regexp.internal.recompile;

import book.book;
import bookcar.bookcar;
import user.*;
public class dao {
	 static Connection con;
	 static Statement st;
	 public dao() {
		// TODO Auto-generated constructor stub
		try{
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        	}catch(Exception e)
        	{
        		System.out.println("找不到数据库");
        	} 
			
        try {
            con =DriverManager.getConnection("jdbc:sqlserver://localhost:5327;databaseName=keshe","fjq","123456");
            System.out.println("连接数据库成功");
            st=con.createStatement();
            } catch (Exception e) {
                e.printStackTrace();
            }
        
	}
	 public boolean changeordertype(String orderNO){
	 		String sql = "update bookorder set finish='ok' where orderNO = '"+orderNO+"'";
	    	try {
	        	st=con.createStatement();
	        	st.executeUpdate(sql);
	        	System.out.println("更新完毕");
	        	return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
	 	}
	 public String superAdmsNO(String sName)
	    {
	    	
	    	String sql = "select sNO from superAdm where sName='"+sName+"'";
	    	String sNO;
	        try {
	        	
	        	ResultSet rs = st.executeQuery(sql);
				ResultSetMetaData rsmd = rs.getMetaData();
				rs.next();
				sNO=rs.getString(1);//名字在表的第2列
		        rs.close();
		        return sNO;
		        
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				return null;
			}
			
	    }
	 public void refinishorder(String sNO,String orderNO)
	    {
	    	String sql = "update vfinishorder set sNO='"+sNO+"' where orderNO='"+orderNO+"'";
	    	System.out.print(sNO);
	    	System.out.print(orderNO);
	        try {
	        	st=con.createStatement();
	        	st.executeUpdate(sql);
	        	System.out.println("更新完毕");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	 
	 public boolean deletefinishorder(String orderNO)
	 {
	 	String sql;	
	 	sql = "delete from finishorder where orderNO='"+orderNO+"'";
	 	
	 	//String sql = "insert into bookorder values('"+u.getOrderNO()+"','"+u.getEmail()+"','"+u.getISBN()+"','"+u.getNum()+"','"+u.getFinish()+"','"+u.getOrdertime()+"','"+u.getAddress()+"')";
	     try {
	     	st=con.createStatement();
	     	st.executeUpdate(sql);
	     	System.out.println("更新成功");
	     	return true;
	 		} catch (SQLException e) {
	 			// TODO Auto-generated catch block
	 			
	 			e.printStackTrace();
	 			return false;
	 		}
	 }
	 public boolean insertfinishorder(String orderNO,String sNO,String ordertime)
	 {
	 	String sql;	
	 	sql = "insert into finishorder values('"+orderNO+"','"+sNO+"','"+ordertime+"')";
	 	
	 	//String sql = "insert into bookorder values('"+u.getOrderNO()+"','"+u.getEmail()+"','"+u.getISBN()+"','"+u.getNum()+"','"+u.getFinish()+"','"+u.getOrdertime()+"','"+u.getAddress()+"')";
	     try {
	     	st=con.createStatement();
	     	st.executeUpdate(sql);
	     	System.out.println("更新成功");
	     	return true;
	 		} catch (SQLException e) {
	 			// TODO Auto-generated catch block
	 			
	 			e.printStackTrace();
	 			return false;
	 		}
	 }
    //参数：
    public String SearchAdm(String email,String password)
    {
    	
    	String sql = "exec SearchAdm '"+email+"','"+password+"'";
    	String name;
        try {
        	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			/*int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
	            for (int i = 1; i <= number; i++) {
	                System.out.print(rs.getString(i)+" ");
	            }
	            System.out.println();
	        }*/
			rs.next();
			name=rs.getString(2);//名字在表的第2列
	        rs.close();
	        return name;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
		
    }
    public Users getAdm(String email)
    {
    	
    	String sql = "select * from Adm where email='"+email+"'";
    	Users u=new Users();
        try {
        	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			/*int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
	            for (int i = 1; i <= number; i++) {
	                System.out.print(rs.getString(i)+" ");
	            }
	            System.out.println();
	        }*/
			rs.next();
			u.setAddress(rs.getString(5));
			u.setEmail(rs.getString(1));
			u.setPhone(rs.getString(4));
			u.setUername(rs.getString(2));
			//名字在表的第2列
	        rs.close();
	        return u;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
		
    }
    public String Getorderprice(String ISBN)
    {
    	
    	String sql = "select * from vbook where ISBN = '"+ISBN+"'";
    	String price;
        try {
        	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			rs.next();
			price=rs.getString(4);//名字在表的第2列
	        rs.close();
	        return price;
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
		
    }
    public boolean SearchEmail(String email)
    {
    	
    	String sql = "exec SearchBookName '"+email+"'";
    	String name;
        try {
        	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			/*int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
	            for (int i = 1; i <= number; i++) {
	                System.out.print(rs.getString(i)+" ");
	            }
	            System.out.println();
	        }*/
			if(rs.next())
			{
				return true;
			}
			else {
				return false;
			}
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
    }
    public boolean SearchBook(String type)
    {
    	
    	String sql = "exec SearchBookType '"+type+"'";
        try {	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
	            for (int i = 1; i <= number; i++) {
	                System.out.print(rs.getString(i)+" ");
	            }
	          
			}
			if(rs.next())
			{
				return true;
			}
			else {
				return false;
			}
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
    }
    public boolean InsertAdm(Users u)
    {
    	String sql = "exec InsertAdm '"+u.getEmail()+"','"+u.getUername()+"','"+u.getPassword()+"','"+u.getPhone()+"','"+u.getAddress()+"'";
        try {
        	st=con.createStatement();
        	st.executeUpdate(sql);
        	System.out.println("注册完毕");
        	return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return false;
		}
    }
    public void Insertbook()
    {
    	String sql = "insert into Table_1 values('100','cshi','0')";
        try {
        	st=con.createStatement();
        	st.executeUpdate(sql);
        	System.out.println("删除完毕");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public void deleteorder(String email,String ISBN)
    {
    	String sql = "delete  from bookorder where email='"+email+"' and ISBN='"+ISBN+"'";
        try {
        	st=con.createStatement();
        	st.executeUpdate(sql);
        	System.out.println("删除完毕");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void close()
    {
    	try {
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}       
    }
    public book SearchISBN(String id)
    {
    	book book=new book();
    	String sql = "exec SearchISBN '"+id+"'";
    	
        try {	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			
			if (rs.next()) {
	           
	           book.setISBN(rs.getString(1));
	           book.setBookName(rs.getString(2));
	           book.setBookKind(rs.getString(3));
	           book.setBookPrice(Float.parseFloat(rs.getString(4)));
	           book.setBookPub(rs.getString(5));
	           book.setAuthor(rs.getString(6));
	           book.setBookNum(Integer.valueOf(rs.getString(7))) ;
	           return book;
			}
			else {
				System.out.println("书不存在");
				return null;
			}
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
    }
    
    public ArrayList<book> SearchBookName(String name)
    {
    	String sql = "exec SearchBookName '%"+name+"%'";
    	
    	ArrayList<book> list = new ArrayList<book>(); // 商品集合
		try {
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
				book item = new book();
				item.setISBN(rs.getString("ISBN"));
				item.setBookName(rs.getString("bookName"));
				item.setBookKind(rs.getString("bookKind"));
				item.setBookPrice(rs.getFloat("bookPrice"));
				item.setBookPub(rs.getString("bookPub"));
				item.setAuthor(rs.getString("Author"));
				list.add(item);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
			// 释放数据集对象

		
    }
	public String GetBookNum()
    {
    	
    	String sql = "exec GetBookNum";
    	String name;
        try {
        	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			rs.next();
			name=rs.getString(1);//名字在表的第2列
	        rs.close();
	        return name;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
		
    }
    public ArrayList<book> getAllbook() {
		
		
		ArrayList<book> list = new ArrayList<book>(); // 商品集合
		try {
			String sql = "exec searchbook";
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
				book item = new book();
				item.setISBN(rs.getString("ISBN"));
				item.setBookName(rs.getString("bookName"));
				item.setBookKind(rs.getString("bookKind"));
				item.setBookPrice(rs.getFloat("bookPrice"));
				item.setBookPub(rs.getString("bookPub"));
				item.setAuthor(rs.getString("Author"));
				list.add(item);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
			// 释放数据集对象

	}
 public ArrayList<book> getAllType(String type) {
		
		
		ArrayList<book> list = new ArrayList<book>(); // 商品集合
		try {
			String sql;
			if(type.equals("")||type.equals("首页"))
			{
				sql = "select * from vBook ";
			}
			else {
				sql = "declare @tmp char(8) set @tmp='"+type+"' exec searchtype @tmp";
			}
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
				book item = new book();
				item.setISBN(rs.getString("ISBN"));
				item.setBookName(rs.getString("bookName"));
				item.setBookKind(rs.getString("bookKind"));
				item.setBookPrice(rs.getFloat("bookPrice"));
				item.setBookPub(rs.getString("bookPub"));
				item.setAuthor(rs.getString("Author"));
				list.add(item);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
			// 释放数据集对象

	}
 public ArrayList<String> getBookType() {
		
		
		ArrayList<String> list = new ArrayList<String>(); // 商品集合
		try {
			String sql = "exec GetBookType";
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
				list.add(rs.getString("bookKind"));
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
			// 释放数据集对象

	}
 	
 	public static bookcar getbookcar(String orderNO,String email,String ISBN,int num,String finish,String address)
 	
 	{
 		bookcar c=new bookcar();
 		c.setOrderNO(orderNO);
 		c.setEmail(email);
 		c.setISBN(ISBN);
 		c.setNum(num);
 		c.setFinish(finish);
 		c.setAddress(address);
 		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        
 		c.setOrdertime(df.format(System.currentTimeMillis()));
 		return c;
 	}
public ArrayList<bookcar> getbookcar(String email) {
		
		
		ArrayList<bookcar> list = new ArrayList<bookcar>(); // 商品集合
		try {
			String sql;
			
			sql = "select * from getbookcar where email='"+email+"'";
			
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
				bookcar c=new bookcar();
		 		c.setOrderNO(rs.getString("orderNO"));
		 		c.setEmail(rs.getString("email"));
		 		c.setISBN(rs.getString("ISBN"));
		 		c.setNum(Integer.valueOf(rs.getString("num")));
		 		c.setFinish(rs.getString("finish"));
		 		c.setAddress(rs.getString("address"));
		 		c.setBookname(rs.getString("bookName"));
		        c.setAuthor(rs.getString("Author"));
		 		c.setOrdertime(rs.getString("ordertime"));
		 		
				c.setBookPrice(Float.parseFloat(rs.getString("bookPrice")));
				list.add(c);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
			// 释放数据集对象

	}
public ArrayList<bookcar> getbookcar(String email ,String f) {
	
	
	ArrayList<bookcar> list = new ArrayList<bookcar>(); // 商品集合
	try {
		String sql;
		
		sql = "select * from getbookcar where email='"+email+"' and finish='"+f+"'";
		
		ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		int number = rsmd.getColumnCount();//得到列数
		while (rs.next()) {
			bookcar c=new bookcar();
	 		c.setOrderNO(rs.getString("orderNO"));
	 		c.setEmail(rs.getString("email"));
	 		c.setISBN(rs.getString("ISBN"));
	 		c.setNum(Integer.valueOf(rs.getString("num")));
	 		c.setFinish(rs.getString("finish"));
	 		c.setAddress(rs.getString("address"));
	 		c.setBookname(rs.getString("bookName"));
	        c.setAuthor(rs.getString("Author"));
	 		c.setOrdertime(rs.getString("ordertime"));
	 		
			c.setBookPrice(Float.parseFloat(rs.getString("bookPrice")));
			list.add(c);// 把一个商品加入集合
		}
		return list; // 返回集合。
	} catch (Exception ex) {
		ex.printStackTrace();
		return null;
	} 
		// 释放数据集对象

}



	public ArrayList<book> GetBookPrice()
    {
    	String sql = "exec GetBookPrice";
    	ArrayList<book> list = new ArrayList<book>();
    	try{
    		ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
				book item = new book();
				item.setISBN(rs.getString("ISBN"));
				item.setBookName(rs.getString("bookName"));
				item.setBookKind(rs.getString("bookKind"));
				item.setBookPrice(rs.getFloat("bookPrice"));
				item.setBookPub(rs.getString("bookPub"));
				item.setAuthor(rs.getString("Author"));
				list.add(item);// 把一个商品加入集合
			}
			return list;
    	}
    	catch(Exception ex){
    		ex.printStackTrace();
    		return null;
    	}
    }

public boolean InsertOrder(bookcar u)
{
	String sql;	
	if(caninsertorder(u.getEmail(), u.getISBN()))
	{
		sql = "insert into bookorder values('"+u.getOrderNO()+"','"+u.getEmail()+"','"+u.getISBN()+"','"+u.getNum()+"','"+u.getFinish()+"','"+u.getOrdertime()+"','"+u.getAddress()+"')";
	}
	else 
	{
		sql ="update bookorder set num='"+u.getNum()+"' where email='"+u.getEmail()+"' and ISBN='"+u.getISBN()+"';";
	}
	//String sql = "insert into bookorder values('"+u.getOrderNO()+"','"+u.getEmail()+"','"+u.getISBN()+"','"+u.getNum()+"','"+u.getFinish()+"','"+u.getOrdertime()+"','"+u.getAddress()+"')";
    try {
    	st=con.createStatement();
    	st.executeUpdate(sql);
    	System.out.println("购物车添加成功");
    	return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return false;
		}
}
public boolean yeOrder(bookcar u)
{
	String sql;	
	if(caninsertorder(u.getEmail(), u.getISBN()))
	{
		sql = "insert into bookorder values('"+u.getOrderNO()+"','"+u.getEmail()+"','"+u.getISBN()+"','"+u.getNum()+"','"+u.getFinish()+"','"+u.getOrdertime()+"','"+u.getAddress()+"')";
	}
	else 
	{
		sql ="UPDATE bookorder SET  num = "+u.getNum()+",finish = '"+"ye"+"' ,ordertime = '"+u.getOrdertime()+"' WHERE email='"+u.getEmail()+"' and ISBN='"+u.getISBN()+"'";
	}
	//String sql = "insert into bookorder values('"+u.getOrderNO()+"','"+u.getEmail()+"','"+u.getISBN()+"','"+u.getNum()+"','"+u.getFinish()+"','"+u.getOrdertime()+"','"+u.getAddress()+"')";
    try {
    	st=con.createStatement();
    	st.executeUpdate(sql);
    	System.out.println("订单提交成功");
    	return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return false;
		}
}
public boolean caninsertorder(String email,String ISBN)
{
	
	String sql = "select * from bookorder where email='"+email+"' and ISBN='"+ISBN+"'";
	String name;
    try {
    	
    	ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		/*int number = rsmd.getColumnCount();//得到列数
		while (rs.next()) {
            for (int i = 1; i <= number; i++) {
                System.out.print(rs.getString(i)+" ");
            }
            System.out.println();
        }*/
		if(rs.next())
		{
			System.out.print("ke修改");
			return false;
		}
		else {
			System.out.print("可插入");
			return true;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}
	
}
public boolean resetbookorder(String email,ArrayList<bookcar> bookcars)
{
	String sql = "delete  from bookorder where email='"+email+"'";
    try {
    	st=con.createStatement();
    	st.executeUpdate(sql);
    	System.out.println("删除完毕");
    	
    	for(int i=0;i<bookcars.size();i++)
    	{
    		
    		this.InsertOrder(bookcars.get(i));
    	}
    	
    	return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		
		e.printStackTrace();
		return false;
	}
}

public boolean Insertbook(book book)
{
	String sql = "insert into Book values('"+book.getISBN()+"','"+book.getBookName()+"','"+book.getBookKind()+"','"+book.getBookPrice()+"','"+book.getBookPub()+"','"+book.getAuthor()+"')";
    try {
    	st=con.createStatement();
    	st.executeUpdate(sql);
    	System.out.println("注册完毕");
    	return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		
		e.printStackTrace();
		return false;
	}
}
public boolean deletebookorder(String orderNO){
	String sql = "delete  from bookorder where orderNO= '"+orderNO+"'";
	try {
    	st=con.createStatement();
    	st.executeUpdate(sql);
    	System.out.println("删除完毕");
    	return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}
}
public boolean deletebook(String ISBN){
	
	String sql = "delete  from Book where ISBN= '"+ISBN+"'";
	try {
    	st=con.createStatement();
    	st.executeUpdate(sql);
    	System.out.println("删除完毕");
    	return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}
}
public String SearchsuperAdm(String email,String password)
{
	
	String sql = "select * from superAdm where sNO ='"+email+"' and sPass = '"+password+"'";
	String name;
    try {
    	
    	ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		System.out.print(email);
		/*int number = rsmd.getColumnCount();//得到列数
		while (rs.next()) {
            for (int i = 1; i <= number; i++) {
                System.out.print(rs.getString(i)+" ");
            }
            System.out.println();
        }*/
		rs.next();
		name=rs.getString(2);//名字在表的第2列
        rs.close();
        return name;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
		return null;
	}
	
}
public String GetorderNum()
{
	
	String sql = "exec GetOrderNum";
	String num;
    try {
    	ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		rs.next();
		num=rs.getString(1);//名字在表的第2列
        rs.close();
        return num;
        
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
		return null;
	}
	
}
public String getsuperprice(String sNO)
{
	
	String sql = "select grade from superAdm where sNO = '"+sNO+"'";
	String num;
    try {
    	ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		rs.next();
		num=rs.getString(1);//名字在表的第2列
        rs.close();
        return num;
        
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
		return null;
	}
	
}
public ArrayList<order> getAllorder() {	
	ArrayList<order> list = new ArrayList<order>(); // 商品集合
	try {
		String sql = "exec GetAllorder";
		ResultSet rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		int number = rsmd.getColumnCount();//得到列数
		while (rs.next()) {
			order item = new order();
			item.setorderNO(rs.getString("orderNO"));
			item.setemail(rs.getString("email"));
			item.setISBN(rs.getString("ISBN"));
			item.setnum(rs.getInt("num"));
			item.setfinish(rs.getString("finish"));
			item.setordertime(rs.getString("ordertime"));
			item.setaddress(rs.getString("address"));
			list.add(item);// 把一个商品加入集合
		}
		return list; // 返回集合。
	} catch (Exception ex) {
		ex.printStackTrace();
		return null;
	} 
		// 释放数据集对象

}
    public static void main(String[] args) {
        dao mySQL= new dao();
        String s = mySQL.GetBookNum();
        System.out.println(s);
        //mySQL.GetData("*");
        //mySQL.Insertbook();
        /*
        Users u=new Users();
        u.setEmail("13662520416@qq.com");
 		u.setPassword("1366250416");
 		u.setPhone("18856333955");
 		u.setUername("哈哈哈哈");
 		u.setAddress("我在这");
       mySQL.InsertAdm(u);
       */
       /*if( mySQL.SearchEmail("1366250416@qq.com"))
       {
     	  System.out.println("存在");
       }
       else {
     	  System.out.println("不存在");
 	}*/
        //mySQL.DeleteData();
        //mySQL.GetData("*");
        //mySQL.close();
       //book book= mySQL.SearchISBN("2");
       //System.out.println(book.getBookPrice());
       //ArrayList<book> data= mySQL.SearchBookName("平凡");
       //for(int i=0;i<data.size();i++)
       //System.out.println(data.get(i).getBookName());
       // bookcar c= dao.getbookcar("123456", "1366250416@qq.com", "20", 2, "no", "宣城");
      // mySQL.InsertOrder(c);
        //ArrayList<bookcar> bookcar=new ArrayList<bookcar>();
        //bookcar=mySQL.getbookcar("1366250416@qq.com");
        //System.out.println(bookcar.get(0).getISBN());
        //SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");   
        //System.out.println(df.format(System.currentTimeMillis()));   
        //mySQL.deleteorder("1366250416@", "1");
        //bookcar c= dao.getbookcar("123456", "1366250416@qq.com", "20", 3, "no", "宣城");
        //mySQL.yeOrder(c);
        
        //System.out.println(mySQL.geteadress("1366250416@qq.com"));
        Users us=mySQL.getAdm("1366250416@qq.com");
        System.out.println(us.getUername());
 }
    public String geteadress(String email)
    {
    	
    	String sql = "exec getaddress '"+email+"'";
    	String name;
        try {
        	
        	ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			/*int number = rsmd.getColumnCount();//得到列数
			while (rs.next()) {
	            for (int i = 1; i <= number; i++) {
	                System.out.print(rs.getString(i)+" ");
	            }
	            System.out.println();
	        }*/
			rs.next();
			name=rs.getString(1);//地址在表的第2列
	        rs.close();
	        return name;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
		
    }
    
	public boolean changebook(book b) {
		// TODO Auto-generated method stub
		String sql = "UPDATE Book SET bookName = '"+b.getBookName()+"' ,bookKind = '"+b.getBookKind()+"',bookPrice = '"+b.getBookPrice()+"',bookPub = '"+b.getBookPub()+"',Author = '"+b.getAuthor()+"' ,bookNum = '"+b.getBookNum()+"' WHERE ISBN='"+b.getISBN()+"'";
	    try {
	    	st=con.createStatement();
	    	st.executeUpdate(sql);
	    	System.out.println("修改完毕");
	    	return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return false;
		}
	}

	public boolean changeAdm(Users u) {
		String sql = "UPDATE Adm SET  admName= '"+u.getUername()+"' ,admPass = '"+u.getPassword()+"',phone = '"+u.getPhone()+"', address= '"+u.getAddress()+"' where email='"+u.getEmail()+"'";
	    try {
	    	st=con.createStatement();
	    	st.executeUpdate(sql);
	    	System.out.println("用户修改完毕");
	    	return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return false;
		}
	}
}

