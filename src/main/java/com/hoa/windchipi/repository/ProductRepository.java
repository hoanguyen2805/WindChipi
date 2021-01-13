package com.hoa.windchipi.repository;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hoa.windchipi.entity.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
	
	@Query("SELECT p FROM Product p WHERE p.name LIKE %:keyword%")
	List<Product> searchAllAndKeyWord(@Param("keyword") String keyword);
	
	@Query("SELECT p FROM Product p WHERE p.category.id = :category AND p.name LIKE %:keyword%")
	List<Product> searchCategoryAndKeyWord(@Param("category") Long category, @Param("keyword") String keyword);
	
	@Query("SELECT p FROM Product p WHERE p.category.id = :category")
	List<Product> searchCategory(@Param("category") Long category);
	
	@Query(value="SELECT TOP 4 * FROM products WHERE categories_id = :category AND id != :product_id", nativeQuery = true)
	List<Product> getRelatedProduct(@Param("category") Long category, @Param("product_id") Long product_id);

	@Query(value="SELECT * FROM dbo.products WHERE name LIKE %:content%", nativeQuery = true)
	Page<Product> searchProduct(@Param("content") String content, Pageable pageable);
	
	@Query(value="SELECT * FROM dbo.products WHERE name LIKE %:content%", nativeQuery = true)
	List<Product> getSizeSearch(@Param("content") String content);
//	@Modifying
//	@Query(value="UPDATE products SET categories_id = NULL WHERE categories_id = :idc", nativeQuery = true)
//	void updateCategoryId(@Param("idc") Long idc);
//	@Query(value="SELECT * FROM products WHERE id IN (:ids)", nativeQuery = true)
//	List<Product> getProductByQueryIn(@Param("ids") List<String> ids);
}
