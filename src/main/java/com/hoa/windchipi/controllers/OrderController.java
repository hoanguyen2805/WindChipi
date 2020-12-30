package com.hoa.windchipi.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.entity.Order;
import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.model.OrderDTO;
import com.hoa.windchipi.security.jwt.JwtUtils;
import com.hoa.windchipi.service.OrderService;
import com.hoa.windchipi.service.UserService;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/orders")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	JwtUtils jwtUtils;
	
	@Autowired
	UserService userService;
	@GetMapping("/save/{id}/{number}")
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<?> save(@PathVariable Long id, @PathVariable int number, HttpServletRequest request){
		String token = null;
		String headerAuth = request.getHeader("Authorization");

		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			token = headerAuth.substring(7, headerAuth.length());
		}
		String username = jwtUtils.getUserNameFromJwtToken(token);
		User user = userService.findUserByName(username);
		
		orderService.save(id, number, user.getId());
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@GetMapping("getbyuser")
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<List<OrderDTO>> getByUser(HttpServletRequest request){
		String token = null;
		String headerAuth = request.getHeader("Authorization");

		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			token = headerAuth.substring(7, headerAuth.length());
		}
		String username = jwtUtils.getUserNameFromJwtToken(token);
		User user = userService.findUserByName(username);
		return new ResponseEntity<List<OrderDTO>>(orderService.getByUser(user),HttpStatus.OK);
	}
}
