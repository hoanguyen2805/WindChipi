package com.hoa.windchipi.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.entity.ERole;
import com.hoa.windchipi.entity.Role;
import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.payload.request.SignupRequest;
import com.hoa.windchipi.repository.RoleRepository;
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
	
	@Autowired
	RoleRepository roleRepository;
	
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
	
	@GetMapping("/size")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSize(){
		return new ResponseEntity<Integer>(userService.getSize(), HttpStatus.OK);
	}
	
	@GetMapping("/paging/{page}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<User>> paging(@PathVariable int page){
		return new ResponseEntity<List<User>>(userService.paging(page), HttpStatus.OK);
	}
	
	/* delete user */
	@GetMapping("/sizeorder/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSizeOrderByUser(@PathVariable Long id){
		return new ResponseEntity<Integer>(userService.getSizeOrderByUser(id), HttpStatus.OK);
	}
	
	@GetMapping("/sizecomment/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSizeCommentByUser(@PathVariable Long id){
		return new ResponseEntity<Integer>(userService.getSizeCommentByUser(id), HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> deleteUserByAdmin(@PathVariable Long id){
		userService.deleteUserByAdmin(id);
		return new ResponseEntity<String>("Delete!", HttpStatus.OK);
	}
	
	@PatchMapping("/updateuser")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> updateUserByAdmin(HttpServletRequest request, @RequestBody SignupRequest updateUser){
		User user = userService.findUserByName(updateUser.getUsername());
		
		user.setFull_name(updateUser.getFull_name());
		user.setPhone(updateUser.getPhone());
		user.setAddress(updateUser.getAddress());
		
		if(updateUser.getPassword().equals("")) {
//			System.out.println("rỗng, không đổi!");
		}
		else {
//			System.out.println("đổi mk!");
			user.setPassword(encoder.encode(updateUser.getPassword()));
		}
		
//		System.out.println("roles: "+updateUser.getRole());
		Set<String> strRoles = updateUser.getRole();
		Set<Role> roles = new HashSet<>();
		if (strRoles == null) {
			Role userRole = roleRepository.findByName(ERole.ROLE_USER)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);

					break;
				case "mod":
					Role modRole = roleRepository.findByName(ERole.ROLE_MODERATOR)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(modRole);

					break;
				default:
					Role userRole = roleRepository.findByName(ERole.ROLE_USER)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(userRole);
				}
			});
		}
		
		user.setRoles(roles);
		userService.save(user);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@GetMapping("/search")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<User>> searchUser(@RequestParam("content") String content, @RequestParam("page") int page){
		return new ResponseEntity<List<User>>(userService.searchUser(content, page), HttpStatus.OK);
	}
	@GetMapping("/getsize")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSizeSearch(@RequestParam("content") String content){
		return new ResponseEntity<Integer>(userService.getSizeSearch(content), HttpStatus.OK);
	}
}
