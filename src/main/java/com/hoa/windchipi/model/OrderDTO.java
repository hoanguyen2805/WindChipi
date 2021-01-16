package com.hoa.windchipi.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
	private Long id;
	private String name;
	private Long idProduct;
	private double price;
	private int number_products;
	private String status;
	private double total_money;
	private double freight_cost;
	private String date_created;
	
	private String username;
	private Long idUser;
	
	private String size;
	private String full_name;
	private String address;
	private String phone;
}
