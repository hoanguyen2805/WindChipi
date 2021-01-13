package com.hoa.windchipi.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hoa.windchipi.entity.Comment;
import com.hoa.windchipi.entity.Product;
import com.hoa.windchipi.entity.User;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
	@Query("SELECT c FROM Comment c WHERE c.product.id = :id")
	List<Comment> getCommentByProductId(@Param("id") Long id);

	List<Comment> findByUser(User user);

	List<Comment> findByProduct(Product product);
	
	@Query(value="SELECT * FROM dbo.comments WHERE user_id IN (SELECT id FROM dbo.users WHERE username LIKE %:content%) OR product_id IN (SELECT id FROM dbo.products WHERE name LIKE %:content%)", nativeQuery = true)
	Page<Comment> searchComment(@Param("content") String content, Pageable pageable);
	
	@Query(value="SELECT * FROM dbo.comments WHERE user_id IN (SELECT id FROM dbo.users WHERE username LIKE %:content%) OR product_id IN (SELECT id FROM dbo.products WHERE name LIKE %:content%)", nativeQuery = true)
	List<Comment> getSizeSearch(@Param("content") String content);
}
