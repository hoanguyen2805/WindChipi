package com.hoa.windchipi.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


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
	@PostMapping("/save")
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<String> save(@RequestBody OrderDTO orderDTO, HttpServletRequest request){
		String token = null;
		String headerAuth = request.getHeader("Authorization");

		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			token = headerAuth.substring(7, headerAuth.length());
		}
		String username = jwtUtils.getUserNameFromJwtToken(token);
		User user = userService.findUserByName(username);
		
		orderService.save(orderDTO, user);
		return new ResponseEntity<String>("saved!", HttpStatus.OK);
	}
	
	@GetMapping("/getordersbyuser")
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<List<OrderDTO>> getByUser(HttpServletRequest request){
		String token = null;
		String headerAuth = request.getHeader("Authorization");

		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			token = headerAuth.substring(7, headerAuth.length());
		}
		String username = jwtUtils.getUserNameFromJwtToken(token);
		User user = userService.findUserByName(username);
		return new ResponseEntity<List<OrderDTO>>(orderService.getOrdersByUser(user),HttpStatus.OK);
	}
	
	@GetMapping("/page/{page}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<OrderDTO>> paging(@PathVariable int page){
		return new ResponseEntity<List<OrderDTO>>(orderService.paging(page), HttpStatus.OK);
	}
	
	@GetMapping("/getsize")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSize(@RequestParam("content") String content){
		return new ResponseEntity<Integer>(orderService.getSizeSearch(content), HttpStatus.OK);
	}
	
	@DeleteMapping({"/{id}"})
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> deleteById(@PathVariable Long id){
		orderService.deleteById(id);
		return new ResponseEntity<String>("Deleted!", HttpStatus.OK);
	}
	
	@PutMapping("/{bot}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> updateThem(@RequestBody OrderDTO orderDTO, @PathVariable int bot){
			orderService.update(orderDTO, bot);
		return new ResponseEntity<String>("updated!", HttpStatus.OK);
	}
	
	@GetMapping("/search")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<OrderDTO>> searchOrder(@RequestParam("content") String content, @RequestParam("page") int page){
		return new ResponseEntity<List<OrderDTO>>(orderService.searchOrder(content, page), HttpStatus.OK);
	}
}
