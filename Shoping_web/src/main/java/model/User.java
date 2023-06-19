package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class User {
	private int id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private String role;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	private LocalDateTime deleted_at;

	public User() {
	}

	public User(int id, String name, String email, String phone, String address, String gender, String role,
			LocalDateTime created_at, LocalDateTime updated_at, LocalDateTime deleted_at) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.gender = gender;
		this.role = role;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.deleted_at = deleted_at;
	}
	
	public void userSetting(int id) {
		// 디폴트 값 할당
		int user_id = 0;
		String name = null;
		String email = null;
		String phone = null;
		String address = null;
		String gender = null;
		String role = null;
		LocalDateTime created_at = null;
		LocalDateTime updated_at = null;
		LocalDateTime deleted_at = null;

		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project", "projectuser",
				"projectuser")) {
			String query = "SELECT * FROM users WHERE id = ? LIMIT 1";
			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, id);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						// 결과 집합에서 데이터 가져오기
						user_id = resultSet.getInt("id");
						name = resultSet.getString("name");
						email = resultSet.getString("email");
						phone = resultSet.getString("phone");
						address = resultSet.getString("address");
						gender = resultSet.getString("gender");
						role = resultSet.getString("role");
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
		
		setId(user_id);
		setName(name);
		setEmail(email);
		setPhone(phone);
		setAddress(address);
		setGender(gender);
		setRole(role);
		setCreated_at(created_at);
		setUpdated_at(updated_at);
		setDeleted_at(deleted_at);
	}
	
	public void userSave() {
	    // 데이터베이스 연결
	    try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project", "projectuser", "projectuser")) {
	        String selectQuery = "SELECT * FROM users WHERE id = ? LIMIT 1";
	        try (PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
	            selectStatement.setInt(1, id);
	            try (ResultSet resultSet = selectStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    // 사용자 업데이트
	                    String updateQuery = "UPDATE users SET name = ?, email = ?, phone = ?, address = ?, gender = ?, role = ?, updated_at = ? WHERE id = ?";
	                    try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
	                        updateStatement.setString(1, name);
	                        updateStatement.setString(2, email);
	                        updateStatement.setString(3, phone);
	                        updateStatement.setString(4, address);
	                        updateStatement.setString(5, gender);
	                        updateStatement.setString(6, role);
	                        updateStatement.setTimestamp(7, java.sql.Timestamp.valueOf(LocalDateTime.now()));
	                        updateStatement.setInt(8, id);
	                        updateStatement.executeUpdate();
	                    }
	                } else {
	                    // 사용자 생성
	                    String insertQuery = "INSERT INTO users (name, email, phone, address, gender, role, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
	                    try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
	                        insertStatement.setString(1, name);
	                        insertStatement.setString(2, email);
	                        insertStatement.setString(3, phone);
	                        insertStatement.setString(4, address);
	                        insertStatement.setString(5, gender);
	                        insertStatement.setString(6, role);
	                        insertStatement.setTimestamp(7, java.sql.Timestamp.valueOf(LocalDateTime.now()));
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

	public void userDelete() {
	    // 데이터베이스 연결
	    try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project", "projectuser", "projectuser")) {
	        String deleteQuery = "DELETE FROM users WHERE id = ?";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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
