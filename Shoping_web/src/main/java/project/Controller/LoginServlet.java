package project.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String uid = request.getParameter("username");
			String pwd =request.getParameter("password");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String url = "jdbc:mysql://13.209.55.246/project?characterEncoding=UTF-8&serverTimezone=UTC";
			String id = "projectuser";
			String pw = "projectuser";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,id,pw);
			String sql = "select uid, pwd from users where uid='"+uid+"' and pwd='"+pwd+"'";
			System.out.println("sql: "+sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(uid+"님 로그인");
				request.setAttribute("loginstate", "로그인 성공");
			}else {
				System.out.println("없는 계정으로 로그인 실패");
				request.setAttribute("loginstate", "로그인 실패");
			}
			rs.next();
			pstmt.close();
			conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("login.jsp");
		}
}
