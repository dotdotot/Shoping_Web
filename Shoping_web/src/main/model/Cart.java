package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	/*
	 * 멤버 변수
	 */
	private int id;
	private int product_id;
	private int user_id;
	private int amonut;
	private String name;
	private Double price;
	private Double discount;
	private String image_path;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	private LocalDateTime deleted_at;

	/*
	 * 생성자
	 */
	public Cart() {

	}

	public Cart(int id, int product_id, int user_id, int amount, String name, Double price, Double discount,
			String image_path, LocalDateTime created_at, LocalDateTime updated_at, LocalDateTime deleted_at) {
		this.id = id;
		this.product_id = product_id;
		this.user_id = user_id;
		this.amonut = amount;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.deleted_at = deleted_at;
	}

	/*
	 * 특정 id 장바구니 세팅
	 */
	public void cartSetting(int id) {
		// 디폴트 값 할당
		int cart_id = 0;
		int product_id = 0;
		int user_id = 0;
		int amount = 0;
		String name = null;
		Double price = (double) 0;
		Double discount = (double) 0;
		String image_path = null;
		LocalDateTime created_at = null;
		LocalDateTime updated_at = null;
		LocalDateTime deleted_at = null;

		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String query = "SELECT * FROM carts WHERE id = ? LIMIT 1";
			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, id);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						// 결과 집합에서 데이터 가져오기
						cart_id = resultSet.getInt("id");
						product_id = resultSet.getInt("product_id");
						user_id = resultSet.getInt("user_id");
						amount = resultSet.getInt("amount");
						name = resultSet.getString("name");
						price = resultSet.getDouble("price");
						discount = resultSet.getDouble("discount");
						image_path = resultSet.getString("image_path");

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

		setId(cart_id);
		setProduct_id(product_id);
		setUser_id(user_id);
		setAmonut(amount);
		setName(name);
		setPrice(price);
		setDiscount(discount);
		setImage_path(image_path);
		setCreated_at(created_at);
		setUpdated_at(updated_at);
		setDeleted_at(deleted_at);
	}

	/*
	 * 특정 사용자 장바구니 세팅
	 */
	public void userCartSetting(int u_id) {
		// 디폴트 값 할당
		int cart_id = 0;
		int product_id = 0;
		int user_id = 0;
		int amount = 0;
		String name = null;
		Double price = (double) 0;
		Double discount = (double) 0;
		String image_path = null;
		LocalDateTime created_at = null;
		LocalDateTime updated_at = null;
		LocalDateTime deleted_at = null;

		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String query = "SELECT * FROM carts WHERE id = ? LIMIT 1";
			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, u_id);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						// 결과 집합에서 데이터 가져오기
						cart_id = resultSet.getInt("id");
						product_id = resultSet.getInt("product_id");
						user_id = resultSet.getInt("user_id");
						amount = resultSet.getInt("amount");
						name = resultSet.getString("name");
						price = resultSet.getDouble("price");
						discount = resultSet.getDouble("discount");
						image_path = resultSet.getString("image_path");

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

		setId(cart_id);
		setProduct_id(product_id);
		setUser_id(user_id);
		setAmonut(amount);
		setName(name);
		setPrice(price);
		setDiscount(discount);
		setImage_path(image_path);
		setCreated_at(created_at);
		setUpdated_at(updated_at);
		setDeleted_at(deleted_at);
	}

	/*
	 * 사용자가 가지고 있는 장바구니 리스트 반환
	 */
	public List<Cart> cartList(int userId) {
		List<Cart> cartList = new ArrayList<>();

		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String query = "SELECT * FROM carts WHERE user_id = ?";
			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, userId);
				try (ResultSet resultSet = statement.executeQuery()) {
					while (resultSet.next()) {
						int id = resultSet.getInt("id");
						int productId = resultSet.getInt("product_id");
						int user_id = resultSet.getInt("user_id");
						int amount = resultSet.getInt("amount");
						String name = resultSet.getString("name");
						Double price = resultSet.getDouble("price");
						Double discount = resultSet.getDouble("discount");
						String image_path = resultSet.getString("image_path");
						LocalDateTime createdAt = null;
						LocalDateTime updatedAt = null;
						LocalDateTime deletedAt = null;

						java.sql.Timestamp createdTimestamp = resultSet.getTimestamp("created_at");
						if (createdTimestamp != null) {
							createdAt = createdTimestamp.toLocalDateTime();
						}

						java.sql.Timestamp updatedTimestamp = resultSet.getTimestamp("updated_at");
						if (updatedTimestamp != null) {
							updatedAt = updatedTimestamp.toLocalDateTime();
						}

						java.sql.Timestamp deletedTimestamp = resultSet.getTimestamp("deleted_at");
						if (deletedTimestamp != null) {
							deletedAt = deletedTimestamp.toLocalDateTime();
						}

						Cart cart = new Cart(id, productId, user_id, amount, name, price, discount, image_path, createdAt, updatedAt, deletedAt);
						cartList.add(cart);
					}
				}
			}
		} catch (SQLException e) {
			// 데이터베이스 작업 중 발생한 예외 처리
			e.printStackTrace();
		}

		return cartList;
	}

	/*
	 * 장바구니 저장
	 */
	public void cartSave() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String selectQuery = "SELECT * FROM carts WHERE id = ? LIMIT 1";
			try (PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
				selectStatement.setInt(1, id);
				try (ResultSet resultSet = selectStatement.executeQuery()) {
					if (resultSet.next()) {
						// 장바구니 수량 추가 후 업데이트
						String updateQuery = "UPDATE carts SET product_id = ?, user_id = ?, amount = ?, name = ?, price = ?, discount = ?, image_path = ?, updated_at = ? WHERE id = ?";
						try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
							updateStatement.setInt(1, this.product_id);
							updateStatement.setInt(2, this.user_id);
							updateStatement.setInt(3, this.amonut);
							updateStatement.setString(4, this.name);
							updateStatement.setDouble(5, this.price);
							updateStatement.setDouble(6, this.discount);
							updateStatement.setString(7, this.image_path);
							updateStatement.setTimestamp(8, java.sql.Timestamp.valueOf(LocalDateTime.now()));
							updateStatement.setInt(9, id);
							updateStatement.executeUpdate();
						}
					} else {
						// 장바구니 생성
						String insertQuery = "INSERT INTO carts (product_id, user_id, amount, name, price, discount, image_path, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
						try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
							insertStatement.setInt(1, this.product_id);
							insertStatement.setInt(2, this.user_id);
							insertStatement.setInt(3, this.amonut);
							insertStatement.setString(4, this.name);
							insertStatement.setDouble(5, this.price);
							insertStatement.setDouble(6, this.discount);
							insertStatement.setString(7, this.image_path);
							insertStatement.setTimestamp(8, java.sql.Timestamp.valueOf(LocalDateTime.now()));
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
	 * 장바구니 삭제
	 */
	public void cartDelete() {
		// 데이터베이스 연결
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://13.209.55.246:3306/project",
				"projectuser", "projectuser")) {
			String deleteQuery = "DELETE FROM carts WHERE id = ?";
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
	 * getter, setter
	 */
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

	public int getAmonut() {
		return amonut;
	}

	public void setAmonut(int amonut) {
		this.amonut = amonut;
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

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
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
