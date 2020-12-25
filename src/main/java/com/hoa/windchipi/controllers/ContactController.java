package com.hoa.windchipi.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.entity.Contact;
import com.hoa.windchipi.service.ContactService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/contacts")
public class ContactController {
	@Autowired
	private ContactService contactService;
	
	@PostMapping("/contact")
	public ResponseEntity<?> createContact(@RequestBody Contact contact){
		contactService.save(contact);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/contacts")
	public ResponseEntity<List<Contact>> getAllContact(){
		List<Contact> listContacts = new ArrayList<Contact>();
		listContacts = contactService.getAllContact();
		return new ResponseEntity<List<Contact>>(listContacts, HttpStatus.OK);
	}
}
