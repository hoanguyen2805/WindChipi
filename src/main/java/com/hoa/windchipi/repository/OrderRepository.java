package com.hoa.windchipi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hoa.windchipi.entity.Order;
import com.hoa.windchipi.entity.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
	List<Order> findByUser(User user);
}
