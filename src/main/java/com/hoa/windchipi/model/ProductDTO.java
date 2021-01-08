package com.hoa.windchipi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	private Long id;
	private String name;
	private double price;
	private String images;
	private int sold;
	private int total;
	private String describe;
	private Long categories_id;
	private String images2;
	private String images3;
}
