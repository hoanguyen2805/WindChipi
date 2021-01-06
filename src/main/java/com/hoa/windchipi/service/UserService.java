package com.hoa.windchipi.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.repository.CommentRepository;
import com.hoa.windchipi.repository.OrderRepository;
import com.hoa.windchipi.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	public User findUserByName(String username) {
		User user = userRepository.findByUsername(username).
				orElseThrow(() -> new UsernameNotFoundException("User Not Found with username: " + username));
		return user;
	}
	public void save(User user) {
		userRepository.save(user);
	}
	
	public int getSize(){
		return userRepository.findAll().size();
	}
	public List<User> paging(int page){
		return userRepository.findAll(PageRequest.of(page, 5)).getContent();
	}
	
	public int getSizeOrderByUser(Long id) {
		User user = new User();
		user.setId(id);
		return orderRepository.findByUser(user).size();
	}
	
	public int getSizeCommentByUser(Long id) {
		User user = new User();
		user.setId(id);
		return commentRepository.findByUser(user).size();
	}
	
	public void deleteUserByAdmin(Long id) {
		
		userRepository.deleteById(id);
	}
	
}
