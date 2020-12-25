package com.hoa.windchipi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.Product;
import com.hoa.windchipi.model.ProductDTO;
import com.hoa.windchipi.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	public List<ProductDTO> searchAllAndKeyWord(String keyword){
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.searchAllAndKeyWord(keyword).forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(), item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
		});
		return productsDTO;
	}
	
	public List<ProductDTO> searchCategoryAndKeyWord(Long category, String keyword){
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.searchCategoryAndKeyWord(category, keyword).forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(), item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
		});
		return productsDTO;
	}
	
	public List<ProductDTO> searchCategory(Long category){
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.searchCategory(category).forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(), item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
		});
		return productsDTO;
	}
	
	public List<ProductDTO> searchAll(){
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.findAll().forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(), item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
		});
		return productsDTO;
	}
	
	public ProductDTO getProductById(Long id) {
		Product product = productRepository.findById(id).get();
		return new ProductDTO(product.getId(), product.getName(), product.getPrice(), product.getImages(), product.getSold(), product.getTotal(), product.getDescribe(), product.getCategory().getId());
	}
	public List<ProductDTO> getNewProducts(){
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.findAll(PageRequest.of(0, 8, Sort.by("id").descending())).getContent().forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(), item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
		});
		return productsDTO;
	}
	public List<ProductDTO> getHotProduct(){
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.findAll(PageRequest.of(0, 4, Sort.by("sold").descending())).getContent().forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(), item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId()));
		});
		return productsDTO;
	}
	
	public List<Product> getRelatedProducts(Long category_id, Long product_id){
		return productRepository.getRelatedProduct(category_id, product_id);
	}
}
