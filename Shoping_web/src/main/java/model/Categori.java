package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Categori {
	/*
	 * 멤버 변수
	 */
	private int id;
	private String name;
	private int parent_category_id;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	private LocalDateTime deleted_at;

	/*
	 * 생성자
	 */
	public Categori() {

	}

	public Categori(int id, String name, int parent_category_id, LocalDateTime created_at, LocalDateTime updated_at,
			LocalDateTime deleted_at) {
		this.id = id;
		this.name = name;
		this.parent_category_id = parent_category_id;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.deleted_at = deleted_at;
	}

	/*
	 * 특정 id 카테고리 세팅
	 */
	public void categorySetting(int id) {
		// 디폴트 값 할당
		int categori_id = 0;
		String name = null;
		int parent_category_id = 0;
		LocalDateTime created_at = null;
		LocalDateTime updated_at = null;
		LocalDateTime deleted_at = null;

		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String query = "SELECT * FROM categoris WHERE id = ? LIMIT 1";
			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, id);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						// 결과 집합에서 데이터 가져오기
						categori_id = resultSet.getInt("id");
						name = resultSet.getString("name");
						parent_category_id = resultSet.getInt("parent_category_id");

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

		setId(categori_id);
		setName(name);
		setParent_category_id(parent_category_id);
		setCreated_at(created_at);
		setUpdated_at(updated_at);
		setDeleted_at(deleted_at);
	}

	/*
	 * 카테고리 저장
	 */
	public void cartSave() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String selectQuery = "SELECT * FROM categoris WHERE id = ? LIMIT 1";
			try (PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
				selectStatement.setInt(1, id);
				try (ResultSet resultSet = selectStatement.executeQuery()) {
					if (resultSet.next()) {
						// 업데이트
						String updateQuery = "UPDATE categoris SET name = ?, parent_category_id = ?, updated_at = ? WHERE id = ?";
						try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
							updateStatement.setString(1, this.name);
							updateStatement.setInt(2, this.parent_category_id);
							updateStatement.setTimestamp(3, java.sql.Timestamp.valueOf(LocalDateTime.now()));
							updateStatement.setInt(4, this.id);
							updateStatement.executeUpdate();
						}
					} else {
						// 카테고리 생성
						String insertQuery = "INSERT INTO carts (name, parent_category_id, created_at) VALUES (?, ?, ?)";
						try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
							insertStatement.setString(1, name);
							insertStatement.setInt(2, this.parent_category_id);
							insertStatement.setTimestamp(3, java.sql.Timestamp.valueOf(LocalDateTime.now()));
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

	/*
	 * 카테고리 삭제
	 */
	public void cartDelete() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String deleteQuery = "DELETE FROM categoris WHERE id = ?";
			try (PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery)) {
				deleteStatement.setInt(1, id);
				deleteStatement.executeUpdate();
			}
		} catch (SQLException e) {
			// 데이터베이스 작업 중 발생한 예외 처리
			e.printStackTrace();
		}
	}

	/*
	 * 상위 카테고리 리스트를 반환
	 */
	public List<Categori> getParentCategories() {
	    List<Categori> parentCategories = new ArrayList<>();

	    // 데이터베이스 연결
	    try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
	            "projectuser", "projectuser")) {
	        String query = "SELECT * FROM categoris WHERE id = ?";
	        try (PreparedStatement statement = connection.prepareStatement(query)) {
	            statement.setInt(1, this.parent_category_id);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                while (resultSet.next()) {
	                    int id = resultSet.getInt("id");
	                    String name = resultSet.getString("name");
	                    int categoryId = resultSet.getInt("parent_category_id");
	                    LocalDateTime createdAt = null;
	                    LocalDateTime updatedAt = null;
	                    LocalDateTime deletedAt = null;

	                    java.sql.Timestamp createdTimestamp = resultSet.getTimestamp("created_at");
	                    if (!resultSet.wasNull()) {
	                        createdAt = createdTimestamp.toLocalDateTime();
	                    }

	                    java.sql.Timestamp updatedTimestamp = resultSet.getTimestamp("updated_at");
	                    if (!resultSet.wasNull()) {
	                        updatedAt = updatedTimestamp.toLocalDateTime();
	                    }

	                    java.sql.Timestamp deletedTimestamp = resultSet.getTimestamp("deleted_at");
	                    if (!resultSet.wasNull()) {
	                        deletedAt = deletedTimestamp.toLocalDateTime();
	                    }

	                    Categori parentCategory = new Categori(id, name, categoryId, createdAt, updatedAt, deletedAt);
	                    parentCategories.add(parentCategory);
	                }
	            }
	        }
	    } catch (SQLException e) {
	        // 데이터베이스 작업 중 발생한 예외 처리
	        e.printStackTrace();
	    }

	    return parentCategories;
	}


	/*
	 * 하위 카테고리 리스트 반환
	 */
	public List<Categori> getChildCategories() {
	    List<Categori> childCategories = new ArrayList<>();

	    // 데이터베이스 연결
	    try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
	            "projectuser", "projectuser")) {
	        String query = "SELECT * FROM categoris WHERE parent_category_id = ?";
	        try (PreparedStatement statement = connection.prepareStatement(query)) {
	            statement.setInt(1, this.parent_category_id);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                while (resultSet.next()) {
	                    int id = resultSet.getInt("id");
	                    String name = resultSet.getString("name");
	                    int categoryId = resultSet.getInt("parent_category_id");
	                    LocalDateTime createdAt = null;
	                    LocalDateTime updatedAt = null;
	                    LocalDateTime deletedAt = null;

	                    java.sql.Timestamp createdTimestamp = resultSet.getTimestamp("created_at");
	                    if (!resultSet.wasNull()) {
	                        createdAt = createdTimestamp.toLocalDateTime();
	                    }

	                    java.sql.Timestamp updatedTimestamp = resultSet.getTimestamp("updated_at");
	                    if (!resultSet.wasNull()) {
	                        updatedAt = updatedTimestamp.toLocalDateTime();
	                    }

	                    java.sql.Timestamp deletedTimestamp = resultSet.getTimestamp("deleted_at");
	                    if (!resultSet.wasNull()) {
	                        deletedAt = deletedTimestamp.toLocalDateTime();
	                    }

	                    Categori subcategory = new Categori(id, name, categoryId, createdAt, updatedAt, deletedAt);
	                    childCategories.add(subcategory);
	                }
	            }
	        }
	    } catch (SQLException e) {
	        // 데이터베이스 작업 중 발생한 예외 처리
	        e.printStackTrace();
	    }

	    return childCategories;
	}

	/*
	 * getter, setter
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParent_category_id() {
		return parent_category_id;
	}

	public void setParent_category_id(int parent_category_id) {
		this.parent_category_id = parent_category_id;
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
