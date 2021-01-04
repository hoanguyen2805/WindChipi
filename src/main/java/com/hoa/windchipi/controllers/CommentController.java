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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.model.CommentDTO;
import com.hoa.windchipi.security.jwt.JwtUtils;
import com.hoa.windchipi.service.CommentService;
import com.hoa.windchipi.service.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/comments")
public class CommentController {
	@Autowired
	private CommentService commentService;

	@Autowired
	JwtUtils jwtUtils;

	@Autowired
	UserService userService;

	@GetMapping("/listbyproductid/{id}")
	public ResponseEntity<List<CommentDTO>> getCommentByProductId(@PathVariable("id") Long id) {
		return new ResponseEntity<List<CommentDTO>>(commentService.getCommentByProductId(id), HttpStatus.OK);
	}

	@PostMapping("/save")
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<?> createComment(@RequestBody CommentDTO commentDTO, HttpServletRequest request) {

		String token = null;
		String headerAuth = request.getHeader("Authorization");

		if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
			token = headerAuth.substring(7, headerAuth.length());
		}
		String username = jwtUtils.getUserNameFromJwtToken(token);
		User user = userService.findUserByName(username);
		commentService.save(commentDTO, user);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@GetMapping("/size")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<CommentDTO>> getSize() {
		return new ResponseEntity<List<CommentDTO>>(commentService.getSize(), HttpStatus.OK);
	}

	@GetMapping("/page/{page}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<CommentDTO>> paging(@PathVariable int page) {
		return new ResponseEntity<List<CommentDTO>>(commentService.paging(page), HttpStatus.OK);
	}

	@DeleteMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> deleteById(@PathVariable Long id) {
		commentService.deletebyId(id);
		return new ResponseEntity<String>("Deleted!", HttpStatus.OK);
	}

}
