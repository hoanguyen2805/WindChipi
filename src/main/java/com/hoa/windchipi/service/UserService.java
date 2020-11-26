package com.hoa.windchipi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	public User findUserByName(String username) {
		User user = userRepository.findByUsername(username).
				orElseThrow(() -> new UsernameNotFoundException("User Not Found with username: " + username));
		return user;
	}
	public void save(User user) {
		userRepository.save(user);
	}
}
