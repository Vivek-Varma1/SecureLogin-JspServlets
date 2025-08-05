package com.vivek;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/signUp")
public class SignUpData extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String uname = req.getParameter("username").trim();
        String password = req.getParameter("password").trim();
        String confirm_pass=req.getParameter("confirm_password").trim();
        String email=req.getParameter("email").trim();
        if (uname.contains(" ") || password.contains(" ") || confirm_pass.contains(" ") || email.contains(" ")) {
            
            req.setAttribute("error", "Fields must not contain spaces. Kindly check your input and try again.");
            req.getRequestDispatcher("signup.jsp").forward(req, res);
            return;
        }
        PrintWriter out=res.getWriter();
        if(!(uname.equals("") || email.equals("") || password.equals(""))) {  
        
      if(password.equals(confirm_pass)) {  
        String url = "jdbc:mysql://localhost:3306/login";
        String user = "root";
        String sqlpassword = "Vivek@1436";
        String query = "INSERT INTO userdetails (name, password,email) VALUES (?, ?, ?);";
        String query1 = "SELECT * FROM userdetails WHERE name = ?";
        String query2 = "SELECT * FROM userdetails WHERE email = ?";
        
        Connection con = null;
        PreparedStatement stmt = null;
       
	
	try {
	    System.out.println("🚀 Attempting to load JDBC Driver...");
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    System.out.println("✅ Driver Loaded Successfully!");

	    System.out.println("🚀 Attempting to Connect to Database...");
	    con = DriverManager.getConnection(url, user, sqlpassword);
	    System.out.println("✅ Database Connected!");

	    
	 //to check does the username valid or not 
	    stmt = con.prepareStatement(query1);
	    stmt.setString(1, uname);
	  
	  ResultSet rs=stmt.executeQuery();
	  
	  if(rs.next()) {
//		  out.println("<script type=\"text/javascript\">");
//          out.println("alert('UserName already Exists');");
//          out.println("location='signup.jsp';");
//          out.println("</script>");
		  
		  req.setAttribute("error", "Username already Exists.");	//Username unavailable. Try another unique username
          req.getRequestDispatcher("signup.jsp").forward(req, res);
          return;
	  }
	  else {
		 
//to check for email
		  stmt = con.prepareStatement(query2);
		    stmt.setString(1, email);
		  
		rs=stmt.executeQuery();
		  
		  if(rs.next()) {
//			  out.println("<script type=\"text/javascript\">");
//	          out.println("alert(' your Email already has an account try to login');");
	          req.setAttribute("error", "User email Exists.");
	          req.getRequestDispatcher("signup.jsp").forward(req, res);
//	          out.println("location='signup.jsp';");
//	          out.println("</script>");
	          return;
		  }
		  else {
	    
//insert 	    
	    stmt = con.prepareStatement(query);
	    stmt.setString(1, uname);
	    stmt.setString(2, password);
	    stmt.setString(3, email);
	    
	    System.out.println("🚀 Attempting to insert data into database...");
	    int rowsInserted = stmt.executeUpdate();

	    if (rowsInserted > 0) {
	    	 System.out.println("Inserted data into database...");
	       out.println("✅ Registration Successful!");
	       req.setAttribute("error", "success");
	       req.getRequestDispatcher("login.jsp").forward(req, res);
	      // res.sendRedirect("login.jsp");
	    } else {
	    	 req.setAttribute("error", "failed");
		       req.getRequestDispatcher("login.jsp").forward(req, res);
	    }
		  } }
	} catch (ClassNotFoundException e) {
	    System.err.println("❌ JDBC Driver Not Found!");
	    e.printStackTrace();
	} catch (SQLException e) {
	    System.err.println("❌ SQL Error: " + e.getMessage());
	    e.printStackTrace();
	} catch (Exception e) {
	    System.err.println("❌ Unexpected Error: " + e.getMessage());
	    e.printStackTrace();
	} finally {
	    try {
	        if (stmt != null) stmt.close();
	        if (con != null) con.close();
	    } catch (SQLException e) {
	        System.err.println("❌ Error Closing Resources: " + e.getMessage());
	        e.printStackTrace();
	    }
	}
	
    }
	
      else {
//     	 out.println("<script type=\"text/javascript\">");
//          out.println("alert('password missmatched');");
//          out.println("location='signup.jsp';");
//          out.println("</script>");
    	  req.setAttribute("error", "password missmatched..");
          req.getRequestDispatcher("signup.jsp").forward(req, res);
     }
        }
    
        else {
//        	 out.println("<script type=\"text/javascript\">");
//             out.println("alert('password missmatched');");
//             out.println("location='signup.jsp';");
//             out.println("</script>");
       	  req.setAttribute("error", "⚠️ Invalid input: Username, email, and password must not contain spaces.");
             req.getRequestDispatcher("signup.jsp").forward(req, res);
        }
        }
}

