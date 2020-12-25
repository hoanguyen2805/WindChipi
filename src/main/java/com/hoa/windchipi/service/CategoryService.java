package com.hoa.windchipi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.Category;
import com.hoa.windchipi.model.CategoryDTO;
import com.hoa.windchipi.model.ProductDTO;
import com.hoa.windchipi.repository.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	public List<CategoryDTO> getAll(){
		List<CategoryDTO> categoryDTOs = new ArrayList<CategoryDTO>();
		categoryRepository.findAll().forEach(item -> {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setId(item.getId());
			categoryDTO.setName(item.getName());
			List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
			item.getProducts().forEach(pt->{
				productDTOs.add(new ProductDTO(pt.getId(), pt.getName(), pt.getPrice(), pt.getImages(), pt.getSold(), pt.getTotal(), pt.getDescribe(), pt.getCategory().getId()));
			});
			categoryDTO.setProducts(productDTOs);
			categoryDTOs.add(categoryDTO);
		});
		return categoryDTOs;
	}
	
	public CategoryDTO getProductByCategory(Long id) {
		Category category = categoryRepository.findById(id).get();
		List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
		category.getProducts().forEach(item->{
			productDTOs.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(), item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
		});
		return new CategoryDTO(category.getId(), category.getName(), productDTOs);
	}
}
