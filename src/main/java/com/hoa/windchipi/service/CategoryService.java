package com.hoa.windchipi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.model.CategoryDTO;
import com.hoa.windchipi.repository.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	public List<CategoryDTO> getAll(){
		List<CategoryDTO> categoryDTOs = new ArrayList<CategoryDTO>();
		categoryRepository.findAll().forEach(item -> {
			categoryDTOs.add(new CategoryDTO(item.getId(), item.getName()));
		});
		return categoryDTOs;
	}
}
