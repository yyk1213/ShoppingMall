package clothImage;

import java.io.*;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class Img
 */
@WebServlet("/Img")
public class DisplayImage extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		OutputStream output = response.getOutputStream();
		InputStream input = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
			stmt = conn.createStatement();
			String sql = "SELECT img FROM product where productID=" + id;

			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				input = rs.getBinaryStream(1);
				int byteRead;
				while ((byteRead = input.read()) != -1) {
					output.write(byteRead);
				}
				input.close();
			}
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			try {if (rs != null) rs.close();} catch (Exception ex) {} 
			try {if (stmt != null) stmt.close();} catch (Exception ex) {} 
			try {if (conn != null) conn.close();} catch (Exception ex) {}
		}
		input.close();
		output.flush();
		output.close();
	}
}
