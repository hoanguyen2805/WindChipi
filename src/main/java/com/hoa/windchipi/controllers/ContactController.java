package com.hoa.windchipi.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.model.CommentDTO;
import com.hoa.windchipi.model.ContactDTO;
import com.hoa.windchipi.service.ContactService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/contacts")
public class ContactController {
	@Autowired
	private ContactService contactService;

	@PostMapping("/contact")
	public ResponseEntity<?> createContact(@RequestBody ContactDTO contact) {
		contactService.save(contact);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	
	@GetMapping("/contacts")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<ContactDTO>> getAllContact() {
		return new ResponseEntity<List<ContactDTO>>(contactService.getAllContact(), HttpStatus.OK);
	}
	
	
	@GetMapping("/page/{page}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<ContactDTO>> paging(@PathVariable int page) {
		return new ResponseEntity<List<ContactDTO>>(contactService.paging(page), HttpStatus.OK);
	}
	
	
	@DeleteMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> delete(@PathVariable Long id){
		contactService.delete(id);
		return new ResponseEntity<String>("Deleted", HttpStatus.OK);
	}
	
	@GetMapping("/search")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<ContactDTO>> searchContact(@RequestParam("content") String content, @RequestParam("page") int page){
		return new ResponseEntity<List<ContactDTO>>(contactService.searchContact(content, page), HttpStatus.OK);
	}
	@GetMapping("/getsize")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSizeSearch(@RequestParam("content") String content){
		return new ResponseEntity<Integer>(contactService.getSizeSearch(content), HttpStatus.OK);
	}
}
