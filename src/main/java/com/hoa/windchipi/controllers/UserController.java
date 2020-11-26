package com.hoa.windchipi.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.security.jwt.JwtUtils;
import com.hoa.windchipi.service.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/users")
public class UserController {
	@Autowired
	PasswordEncoder encoder;

	@Autowired
	JwtUtils jwtUtils;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/user")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public ResponseEntity<User> getUser(HttpServletRequest request) {
		String token = null;
		String headerAuth = request.getHeader("Authorization");

		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			token = headerAuth.substring(7, headerAuth.length());
		}
		String username = jwtUtils.getUserNameFromJwtToken(token);
		
		return new ResponseEntity<User>(userService.findUserByName(username), HttpStatus.OK);
	}
	@PatchMapping("/user")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public ResponseEntity<?> updateUser(HttpServletRequest request, @RequestBody User updateUser){
		String token = null;
		String headerAuth = request.getHeader("Authorization");

		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			token = headerAuth.substring(7, headerAuth.length());
		}
		String username = jwtUtils.getUserNameFromJwtToken(token);
		User user = userService.findUserByName(username);
		user.setFull_name(updateUser.getFull_name());
		user.setPhone(updateUser.getPhone());
		user.setAddress(updateUser.getAddress());
		if(updateUser.getPassword().equals("")) {
			System.out.println("rỗng!");
		}
		else {
			user.setPassword(encoder.encode(updateUser.getPassword()));
		}
		userService.save(user);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
