package project.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/save")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String email = request.getParameter("username");
		String email_d=request.getParameter("email_domain");
		String email_di=request.getParameter("email_domain_input");
		String remail = "";
		if(email_d != null && email_d.equals("직접입력")){
			remail = email+"@"+email_di;
		}else{
			remail = email+"@"+email_d;
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		String url = "jdbc:mysql://13.209.55.246:3306/project?characterEncoding=UTF-8&serverTimezone=UTC";
		String id = "projectuser";
		String pw = "projectuser";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,id,pw);
		
		String sql = "insert into users(uid, pwd, name, email, phone, address, gender, updated_at, deleted_at)"
				+"values(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("username"));
		pstmt.setString(2, request.getParameter("pwd"));
		pstmt.setString(3, request.getParameter("name"));
		pstmt.setString(4, remail);
		pstmt.setString(5, request.getParameter("phone"));
		pstmt.setString(6, request.getParameter("address"));
		pstmt.setString(7, request.getParameter("gender"));
		pstmt.setDate(8, null);
		pstmt.setDate(9, null);
			
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("login.jsp");
	}
}