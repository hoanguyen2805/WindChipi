package com.hoa.windchipi.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hoa.windchipi.entity.Order;
import com.hoa.windchipi.entity.Product;
import com.hoa.windchipi.entity.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
	List<Order> findByUserOrderByStatusAsc(User user);
	
	List<Order> findByUser(User user);
	
	List<Order> findByProduct(Product product);
	
	@Query(value="SELECT * FROM dbo.orders WHERE user_id IN (SELECT id FROM dbo.users WHERE username LIKE %:content%) OR product_id IN (SELECT id FROM dbo.products WHERE name LIKE %:content%) OR full_name LIKE %:content% OR address LIKE %:content% OR phone LIKE %:content%", nativeQuery = true)
	List<Order> getSizeSearch(@Param("content") String content);
	
	@Query(value="SELECT * FROM dbo.orders WHERE user_id IN (SELECT id FROM dbo.users WHERE username LIKE %:content%) OR product_id IN (SELECT id FROM dbo.products WHERE name LIKE %:content%) OR full_name LIKE %:content% OR address LIKE %:content% OR phone LIKE %:content%", nativeQuery = true)
	Page<Order> searchOrder(@Param("content") String content, Pageable pageable);
}
