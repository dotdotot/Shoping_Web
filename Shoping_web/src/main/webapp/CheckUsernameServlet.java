package project.Controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checkUsername")
public class CheckUsernameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        // 데이터베이스 연결 설정
        String url = "jdbc:mysql://13.209.55.246:3306/project?characterEncoding=UTF-8&serverTimezone=UTC"; // db_name은 실제 데이터베이스 이름으로 변경해야 합니다.
        String user = "projectuser"; // 사용자명
        String password = "projectuser"; // 비밀번호

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.jdbc.Driver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(url, user, password);

            // SQL 문 실행
            String sql = "SELECT uid FROM user_table WHERE uid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            // 아이디 중복 여부 확인
            boolean isDuplicate = rs.next();

            // AJAX 응답 데이터 작성
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
            if (isDuplicate) {
                // 중복된 아이디인 경우
                out.write("중복된 아이디입니다.");
            } else {
                // 중복되지 않은 아이디인 경우
                out.write("사용가능한 아이디입니다.");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
