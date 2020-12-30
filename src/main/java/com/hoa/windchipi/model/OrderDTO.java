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
	private int numberProducts;
	private String status;
	private double totalMoney;
	private double freightCost;
	private String dateCreated;
}
