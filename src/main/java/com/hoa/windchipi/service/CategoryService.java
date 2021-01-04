package com.hoa.windchipi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hoa.windchipi.entity.Category;
import com.hoa.windchipi.model.CategoryDTO;
import com.hoa.windchipi.model.ProductDTO;
import com.hoa.windchipi.repository.CategoryRepository;

@Service
@Transactional
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;

	public List<CategoryDTO> getAll() {
		List<CategoryDTO> categoryDTOs = new ArrayList<CategoryDTO>();
		categoryRepository.findAll().forEach(item -> {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setId(item.getId());
			categoryDTO.setName(item.getName());
			List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
			item.getProducts().forEach(pt -> {
				productDTOs.add(new ProductDTO(pt.getId(), pt.getName(), pt.getPrice(), pt.getImages(), pt.getSold(),
						pt.getTotal(), pt.getDescribe(), pt.getCategory().getId()));
			});
			categoryDTO.setProducts(productDTOs);
			categoryDTOs.add(categoryDTO);
		});
		return categoryDTOs;
	}

	public CategoryDTO getProductByCategory(Long id) {
		Category category = new Category();
		category = categoryRepository.findById(id).isPresent() ? categoryRepository.findById(id).get() : null;
		if (category == null) {
			return null;
		} else {
			List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
			category.getProducts().forEach(item -> {
				productDTOs.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
						item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
			});
			return new CategoryDTO(category.getId(), category.getName(), productDTOs);
		}
	}

	public List<CategoryDTO> paging(int page) {
		List<CategoryDTO> categoryDTOs = new ArrayList<CategoryDTO>();
		categoryRepository.findAll(PageRequest.of(page, 5)).getContent().forEach(item -> {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setId(item.getId());
			categoryDTO.setName(item.getName());
			categoryDTOs.add(categoryDTO);
		});
		return categoryDTOs;
	}

	public void save(CategoryDTO categoryDTO) {
		Category category = new Category();
		category.setName(categoryDTO.getName());
		categoryRepository.save(category);
	}

	public void delete(Long id) {
		categoryRepository.deleteById(id);
	}

	public void update(CategoryDTO categoryDTO) {
		Category category = new Category();
		category.setId(categoryDTO.getId());
		category.setName(categoryDTO.getName());
		categoryRepository.save(category);
	}
}
