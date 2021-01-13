package com.hoa.windchipi.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.Contact;
import com.hoa.windchipi.model.ContactDTO;
import com.hoa.windchipi.repository.ContactRepository;

@Service
public class ContactService {
	@Autowired
	private ContactRepository contactRepository;

	public void save(ContactDTO contactDTO) {
		Contact contact = new Contact();
		contact.setFull_name(contactDTO.getFull_name());
		contact.setEmail(contactDTO.getEmail());
		contact.setPhone(contactDTO.getPhone());
		contact.setMessage(contactDTO.getMessage());
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		contact.setDate_created(timestamp);
		contactRepository.save(contact);
	}
 
	public List<ContactDTO> getAllContact(){
		List<ContactDTO> contactDTOs = new ArrayList<ContactDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		contactRepository.findAll().forEach(item -> {
			contactDTOs.add(new ContactDTO(item.getId(), item.getEmail(), item.getFull_name(),
					item.getMessage(), item.getPhone(), sdf.format(item.getDate_created())));
		});
		return contactDTOs;
	}
	
	public List<ContactDTO> paging(int page){
		List<ContactDTO> contactDTOs = new ArrayList<ContactDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		contactRepository.findAll(PageRequest.of(page, 5, Sort.by("id").descending())).getContent().forEach(item -> {
			contactDTOs.add(new ContactDTO(item.getId(), item.getEmail(), item.getFull_name(),
					item.getMessage(), item.getPhone(), sdf.format(item.getDate_created())));
		});
		return contactDTOs;
	}
	
	public void delete(Long id) {
		contactRepository.deleteById(id);
	}
	
	public List<ContactDTO> searchContact(String content, int page){
		List<ContactDTO> contactDTOs = new ArrayList<ContactDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		contactRepository.searchContact(content, PageRequest.of(page, 5)).getContent().forEach(item -> {
			contactDTOs.add(new ContactDTO(item.getId(), item.getEmail(), item.getFull_name(),
					item.getMessage(), item.getPhone(), sdf.format(item.getDate_created())));
		});
		return contactDTOs;
	}
	
	public int getSizeSearch(String content) {
		return contactRepository.getSizeSearch(content).size();
	}
}
