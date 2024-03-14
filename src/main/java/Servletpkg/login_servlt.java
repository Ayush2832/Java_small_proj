package Servletpkg;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class login_servlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Uname = request.getParameter("username");
		String Password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		
		
		if("POST".equalsIgnoreCase(request.getMethod())) {
			try {
				String url = "jdbc:mysql://localhost:3306/experiment6";
				String dbuser = "root";
				String dbpasswd = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, dbuser, dbpasswd);
				
				String query = "select Username from admin where Username= ? and Password= ?";
				PreparedStatement stmt = con.prepareStatement(query);
				stmt.setString(1,Uname);
				stmt.setString(2, Password);
				
				ResultSet rs = stmt.executeQuery();
				
				if(rs.next()) {
					String userName = rs.getString("Username");
					
					HttpSession session = request.getSession();
					
					session.setAttribute("loggedInUser", userName);
					RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
					rd.forward(request,response);
//					response.sendRedirect("https://www.google.com");
				}
				else {
					response.setContentType("text/html");
					out.print("<h3>Enter valid fields</h3>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.html");
					rd.include(request, response);
//					response.sendRedirect("login_res.jsp");
					
					
				}
				
			}catch(ClassNotFoundException |SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
