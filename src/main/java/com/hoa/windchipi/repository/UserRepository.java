package com.hoa.windchipi.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hoa.windchipi.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	Optional<User> findByUsername(String username);

	Boolean existsByUsername(String username);

	Boolean existsByEmail(String email);
	
	
	@Query(value="SELECT * FROM dbo.users WHERE username LIKE %:content% OR email LIKE  %:content% OR full_name LIKE  %:content% OR address LIKE  %:content%", nativeQuery = true)
	Page<User> searchUser(@Param("content") String content, Pageable pageable);
	
	@Query(value="SELECT * FROM dbo.users WHERE username LIKE %:content% OR email LIKE  %:content% OR full_name LIKE  %:content% OR address LIKE  %:content%", nativeQuery = true)
	List<User> getSizeSearch(@Param("content") String content);
}
