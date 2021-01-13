package com.hoa.windchipi.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hoa.windchipi.entity.Contact;
@Repository
public interface ContactRepository extends JpaRepository<Contact, Long>{
	
	@Query(value="SELECT * FROM dbo.contacts WHERE full_name LIKE %:content% OR email LIKE %:content% ORDER BY id DESC", nativeQuery = true)
	Page<Contact> searchContact(@Param("content") String content, Pageable pageable);
	
	@Query(value="SELECT * FROM dbo.contacts WHERE full_name LIKE %:content% OR email LIKE %:content% ORDER BY id DESC", nativeQuery = true)
	List<Contact> getSizeSearch(@Param("content") String content);
}
