package com.hoa.windchipi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hoa.windchipi.entity.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
	@Query("SELECT c FROM Comment c WHERE c.product.id = :id")
	List<Comment> getCommentByProductId(@Param("id") Long id);

}
