package com.hoa.windchipi.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;


import java.util.List;


/**
 * The persistent class for the products database table.
 * 
 */
@Entity
@Table(name="products")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String images;
	private String name;
	private double price;
	private int sold;
	private int total;
	private String describe;

	
	@OneToMany(mappedBy="product")
	private List<Comment> comments;
	@OneToMany(mappedBy="product")
	private List<Order> orders;
	//bi-directional many-to-one association to Category
	@JsonIgnore
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="categories_id")
	private Category category;

	public Product() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImages() {
		return this.images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getTotal() {
		return this.total;
	}

	public void setTotal(int total) {
		this.total = total;
	}


	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}



	public List<Comment> getComments() {
		return this.comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Comment addComment(Comment comment) {
		getComments().add(comment);
		comment.setProduct(this);

		return comment;
	}

	public Comment removeComment(Comment comment) {
		getComments().remove(comment);
		comment.setProduct(null);

		return comment;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}