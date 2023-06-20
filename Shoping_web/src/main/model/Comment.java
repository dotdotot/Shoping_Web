package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class Comment {
	private int id;
	private int product_id;
	private int user_id;
	private String comment;
	private int star;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	private LocalDateTime deleted_at;

	public Comment() {
	}

	public Comment(int id, int product_id, int user_id, String comment, int star, LocalDateTime created_at,
			LocalDateTime updated_at, LocalDateTime deleted_at) {
		this.id = id;
		this.product_id = product_id;
		this.user_id = user_id;
		this.comment = comment;
		this.star = star;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.deleted_at = deleted_at;
	}

	public void commentSetting(int id) {
		// 디폴트 값 할당
		int comment_id = 0;
		int product_id = 0;
		int user_id = 0;
		String comment = null;
		int star = 0;
		LocalDateTime created_at = null;
		LocalDateTime updated_at = null;
		LocalDateTime deleted_at = null;

		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String query = "SELECT * FROM comments WHERE id = ? LIMIT 1";
			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, id);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						// 결과 집합에서 데이터 가져오기
						comment_id = resultSet.getInt("id");
						product_id = resultSet.getInt("product_id");
						user_id = resultSet.getInt("user_id");
						comment = resultSet.getString("comment");
						star = resultSet.getInt("star");
						// LocalDateTime으로 변환하여 할당
						java.sql.Timestamp createdTimestamp = resultSet.getTimestamp("created_at");
						if (createdTimestamp != null) {
							created_at = createdTimestamp.toLocalDateTime();
						}

						java.sql.Timestamp updatedTimestamp = resultSet.getTimestamp("updated_at");
						if (updatedTimestamp != null) {
							updated_at = updatedTimestamp.toLocalDateTime();
						}

						java.sql.Timestamp deletedTimestamp = resultSet.getTimestamp("deleted_at");
						if (deletedTimestamp != null) {
							deleted_at = deletedTimestamp.toLocalDateTime();
						}
					}
				}
			}
		} catch (SQLException e) {
			// 데이터베이스 작업 중 발생한 예외 처리
			e.printStackTrace();
		}

		setId(comment_id);
		setProduct_id(product_id);
		setUser_id(user_id);
		setComment(comment);
		setStar(star);
		setCreated_at(created_at);
		setUpdated_at(updated_at);
		setDeleted_at(deleted_at);
	}

	public void commentSave() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String selectQuery = "SELECT * FROM comments WHERE id = ? LIMIT 1";
			try (PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
				selectStatement.setInt(1, id);
				try (ResultSet resultSet = selectStatement.executeQuery()) {
					if (resultSet.next()) {
						// 사용자 업데이트
						String updateQuery = "UPDATE comments SET product_id = ?, user_id = ?, comment = ?, star = ?, updated_at = ? WHERE id = ?";
						try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
							updateStatement.setInt(1, this.product_id);
							updateStatement.setInt(2, this.user_id);
							updateStatement.setString(3, this.comment);
							updateStatement.setInt(4, this.star);
							updateStatement.setTimestamp(5, java.sql.Timestamp.valueOf(LocalDateTime.now()));
							updateStatement.setInt(6, id);
							updateStatement.executeUpdate();
						}
					} else {
						// 사용자 생성
						String insertQuery = "INSERT INTO comments (product_id, user_id, comment, star, created_at) VALUES (?, ?, ?, ?, ?)";
						try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
							insertStatement.setInt(1, this.product_id);
							insertStatement.setInt(2, this.user_id);
							insertStatement.setString(3, this.comment);
							insertStatement.setInt(4, this.star);
							insertStatement.setTimestamp(5, java.sql.Timestamp.valueOf(LocalDateTime.now()));
							insertStatement.executeUpdate();
						}
					}
				}
			}
		} catch (SQLException e) {
			// 데이터베이스 작업 중 발생한 예외 처리
			e.printStackTrace();
		}
	}

	public void commentDelete() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String deleteQuery = "DELETE FROM comments WHERE id = ?";
			try (PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery)) {
				deleteStatement.setInt(1, id);
				deleteStatement.executeUpdate();
			}
		} catch (SQLException e) {
			// 데이터베이스 작업 중 발생한 예외 처리
			e.printStackTrace();
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public LocalDateTime getCreated_at() {
		return created_at;
	}

	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}

	public LocalDateTime getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(LocalDateTime updated_at) {
		this.updated_at = updated_at;
	}

	public LocalDateTime getDeleted_at() {
		return deleted_at;
	}

	public void setDeleted_at(LocalDateTime deleted_at) {
		this.deleted_at = deleted_at;
	}

}
