package Servletpkg;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class register_Servlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Uname = request.getParameter("reg-username");
		String Password = request.getParameter("reg-password");
		System.out.println(Uname);
		System.out.println(Password);
		if("POST".equalsIgnoreCase(request.getMethod())) {
			//JDBC CONNECTION
			String url = "jdbc:mysql://localhost:3306/experiment6";
			String dbuser = "root";
			String dbpasswd = "root";
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url,dbuser,dbpasswd);
				
				String query = "Insert into admin(Username,Password) Values(?,?)";
				PreparedStatement stmt = con.prepareStatement(query);
				stmt.setString(1,Uname);
				stmt.setString(2,Password);
				
				stmt.executeUpdate();
				System.out.println("Data inserted successfully");
				response.sendRedirect("regis_response.jsp");
				
				stmt.close();
				con.close();
				
				
			}catch(ClassNotFoundException|SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
