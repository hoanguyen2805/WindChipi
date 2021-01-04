package com.hoa.windchipi.controllers;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.model.CategoryDTO;
import com.hoa.windchipi.service.CategoryService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/categories")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/list")
	public ResponseEntity<List<CategoryDTO>> findAll(){
		List<CategoryDTO> listLoaiSP = new ArrayList<CategoryDTO>();
		listLoaiSP = categoryService.getAll();
		return new ResponseEntity<List<CategoryDTO>>(listLoaiSP, HttpStatus.OK);
	}
	@GetMapping("/{id}")
	public ResponseEntity<CategoryDTO> getProductByCategory(@PathVariable Long id){
		return new ResponseEntity<CategoryDTO>(categoryService.getProductByCategory(id), HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/page/{page}")
	public ResponseEntity<List<CategoryDTO>> paging(@PathVariable int page){
		return new ResponseEntity<List<CategoryDTO>>(categoryService.paging(page), HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@PostMapping("/add")
	public ResponseEntity<String> add(@RequestBody CategoryDTO categoryDTO){
		categoryService.save(categoryDTO);
		return new ResponseEntity<String>("Created", HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@DeleteMapping("/{id}")
	public ResponseEntity<String> delete(@PathVariable Long id){
		categoryService.delete(id);
		return new ResponseEntity<String>("Deleted!", HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("/update")
	public ResponseEntity<String> update(@RequestBody CategoryDTO categoryDTO){
		categoryService.update(categoryDTO);
		return new ResponseEntity<String>("Updated!", HttpStatus.OK);
	}
}
