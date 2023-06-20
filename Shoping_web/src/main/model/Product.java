package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class Product {
	private int id;
	private int categori_id;
	private String name;
	private Double price;
	private int image_id;
	private Double discount;
	private int amount;
	private String product_introduce;
	private String main_image_path;
	private String sub_image_path;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	private LocalDateTime deleted_at;

	public Product() {
	}

	public Product(int id, int categori_id, String name, Double price, int image_id, Double discount, int amount,
			String product_introduce, String main_image_path, String sub_image_path, LocalDateTime created_at,
			LocalDateTime updated_at, LocalDateTime deleted_at) {
		this.id = id;
		this.categori_id = categori_id;
		this.name = name;
		this.price = price;
		this.image_id = image_id;
		this.discount = discount;
		this.amount = amount;
		this.product_introduce = product_introduce;
		this.main_image_path = main_image_path;
		this.sub_image_path = sub_image_path;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.deleted_at = deleted_at;
	}

	public void productSetting(int id) {
		// 디폴트 값 할당
		int product_id = 0;
		int categori_id = 0;
		String name = null;
		Double price = (double) 0;
		int image_id = 0;
		Double discount = (double) 0;
		int amount = 0;
		String product_introduce = null;
		String main_image_path = null;
		String sub_image_path = null;
		LocalDateTime created_at = null;
		LocalDateTime updated_at = null;
		LocalDateTime deleted_at = null;

		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String query = "SELECT * FROM products WHERE id = ? LIMIT 1";
			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, id);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						// 결과 집합에서 데이터 가져오기
						product_id = resultSet.getInt("id");
						categori_id = resultSet.getInt("category_id");
						name = resultSet.getString("name");
						price = resultSet.getDouble("price");
						image_id = resultSet.getInt("image_id");
						discount = resultSet.getDouble("discount");
						amount = resultSet.getInt("amount");
						product_introduce = resultSet.getString("product_introduce");
						main_image_path = resultSet.getString("main_image_path");
						sub_image_path = resultSet.getString("sub_image_path");
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

		setId(product_id);
		setCategori_id(categori_id);
		setName(name);
		setPrice(price);
		setImage_id(image_id);
		setDiscount(discount);
		setAmount(amount);
		setProduct_introduce(product_introduce);
		setMain_image_path(main_image_path);
		setSub_image_path(sub_image_path);
		setCreated_at(created_at);
		setUpdated_at(updated_at);
		setDeleted_at(deleted_at);
	}

	public void productSave() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String selectQuery = "SELECT * FROM products WHERE id = ? LIMIT 1";
			try (PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
				selectStatement.setInt(1, id);
				try (ResultSet resultSet = selectStatement.executeQuery()) {
					if (resultSet.next()) {
						// 사용자 업데이트
						String updateQuery = "UPDATE products SET category_id = ?, name = ?, price = ?, image_id = ?, discount = ?, amount = ?, product_introduce = ?,"
								+ "main_image_path = ?, sub_image_path = ?, updated_at = ? WHERE id = ?";
						try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
							updateStatement.setInt(1, this.categori_id);
							updateStatement.setString(2, this.name);
							updateStatement.setDouble(3, this.price);
							updateStatement.setInt(4, this.image_id);
							updateStatement.setDouble(5, this.discount);
							updateStatement.setInt(6, this.amount);
							updateStatement.setString(7, this.product_introduce);
							updateStatement.setString(8, this.main_image_path);
							updateStatement.setString(9, this.sub_image_path);
							updateStatement.setTimestamp(10, java.sql.Timestamp.valueOf(LocalDateTime.now()));
							updateStatement.setInt(11, id);
							updateStatement.executeUpdate();
						}
					} else {
						// 사용자 생성
						String insertQuery = "INSERT INTO products (category_id, name, price, image_id, discount, amount, product_introduce, main_image_path, sub_image_path, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
							insertStatement.setInt(1, this.categori_id);
							insertStatement.setString(2, this.name);
							insertStatement.setDouble(3, this.price);
							insertStatement.setInt(4, this.image_id);
							insertStatement.setDouble(5, this.discount);
							insertStatement.setInt(6, this.amount);
							insertStatement.setString(7, this.product_introduce);
							insertStatement.setString(8, this.main_image_path);
							insertStatement.setString(9, this.sub_image_path);
							insertStatement.setTimestamp(10, java.sql.Timestamp.valueOf(LocalDateTime.now()));
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

	public void productDelete() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String deleteQuery = "DELETE FROM products WHERE id = ?";
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

	public int getCategori_id() {
		return categori_id;
	}

	public void setCategori_id(int categori_id) {
		this.categori_id = categori_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getProduct_introduce() {
		return product_introduce;
	}

	public void setProduct_introduce(String product_introduce) {
		this.product_introduce = product_introduce;
	}

	public String getMain_image_path() {
		return main_image_path;
	}

	public void setMain_image_path(String main_image_path) {
		this.main_image_path = main_image_path;
	}

	public String getSub_image_path() {
		return sub_image_path;
	}

	public void setSub_image_path(String sub_image_path) {
		this.sub_image_path = sub_image_path;
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
