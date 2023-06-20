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

@WebServlet("/findId")
public class FindIdServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://13.209.55.246/project?characterEncoding=UTF-8&serverTimezone=UTC";
    private static final String DB_USERNAME = "projectuser";
    private static final String DB_PASSWORD = "projectuser";

    public static Connection getConnection() throws SQLException {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return connection;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 클라이언트로부터 전달받은 이름과 이메일 가져오기
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // 데이터베이스 연결 및 쿼리 실행
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String foundId = null;

        try {
            // 데이터베이스 연결 생성
            connection = getConnection();

            // 아이디 찾기 쿼리 작성 및 실행
            String query = "SELECT uid FROM users WHERE name=? AND email=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, email);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // 결과에서 아이디 값 가져오기
                foundId = resultSet.getString("uid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // 응답 데이터 타입과 인코딩 설정
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        // 아이디 응답 출력
        PrintWriter out = response.getWriter();
        if (foundId != null) {
            out.write(foundId);
        } else {
            out.write(""); // 아이디가 없을 경우 빈 문자열 반환
        }
    }
}
