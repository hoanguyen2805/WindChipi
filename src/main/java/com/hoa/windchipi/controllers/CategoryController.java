package com.hoa.windchipi.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
}
