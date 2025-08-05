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

@WebServlet("/log")
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String uname = req.getParameter("username");
        String password = req.getParameter("password");

        // Correct JDBC URL
        String url = "jdbc:mysql://localhost:3306/login";
        String user = "root";
        String sqlpassword = "Vivek@1436";
        String query = "SELECT * FROM userdetails WHERE name = ? AND password = ?";

        Connection con = null;
        PreparedStatement stmt = null;
        PrintWriter out = res.getWriter();
	
	try {
	    System.out.println("🚀 Attempting to load JDBC Driver...");
	    Class.forName("com.mysql.jdbc.Driver");
	    System.out.println("✅ Driver Loaded Successfully!");

	    System.out.println("🚀 Attempting to Connect to Database...");
	    con = DriverManager.getConnection(url, user, sqlpassword);
	    System.out.println("✅ Database Connected!");

	    stmt = con.prepareStatement(query);
	    stmt.setString(1, uname);
	    stmt.setString(2, password);

	  ResultSet rs=stmt.executeQuery();
	  
	  if(rs.next()) {
		  HttpSession session = req.getSession();
          session.setAttribute("username", uname);
          res.sendRedirect("home.jsp");
	  }
	  else {
		  out.println("<script type=\"text/javascript\">");
          out.println("alert('Invalid username or password if you dont have an account Create one');");
          out.println("location='login.jsp';");
          out.println("</script>");
	  }
	  
	  
	   
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
}

