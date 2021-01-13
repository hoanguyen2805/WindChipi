package com.hoa.windchipi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.Category;
import com.hoa.windchipi.entity.Product;
import com.hoa.windchipi.model.ProductDTO;
import com.hoa.windchipi.repository.CommentRepository;
import com.hoa.windchipi.repository.OrderRepository;
import com.hoa.windchipi.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	public List<ProductDTO> searchAllAndKeyWord(String keyword) {
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.searchAllAndKeyWord(keyword).forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productsDTO;
	}

	public List<ProductDTO> searchCategoryAndKeyWord(Long category, String keyword) {
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.searchCategoryAndKeyWord(category, keyword).forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productsDTO;
	}

	public List<ProductDTO> searchCategory(Long category) {
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.searchCategory(category).forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productsDTO;
	}

	public List<ProductDTO> searchAll() {
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.findAll().forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productsDTO;
	}

	public ProductDTO getProductById(Long id) {
		Product product = new Product();
		product = productRepository.findById(id).isPresent() ? productRepository.findById(id).get() : null;
		if (product == null) {
			return null;
		} else {
			return new ProductDTO(product.getId(), product.getName(), product.getPrice(), product.getImages(),
					product.getSold(), product.getTotal(), product.getDescribe(), product.getCategory().getId(),
					product.getImages2(), product.getImages3());
		}
	}

	public List<ProductDTO> getNewProducts() {
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.findAll(PageRequest.of(0, 8, Sort.by("id").descending())).getContent().forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productsDTO;
	}

	public List<ProductDTO> getHotProduct() {
		List<ProductDTO> productsDTO = new ArrayList<ProductDTO>();
		productRepository.findAll(PageRequest.of(0, 4, Sort.by("sold").descending())).getContent().forEach(item -> {
			productsDTO.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productsDTO;
	}

	public List<Product> getRelatedProducts(Long category_id, Long product_id) {
		return productRepository.getRelatedProduct(category_id, product_id);
	}

	public int getTotalProduct(Long id) {
		return productRepository.findById(id).get().getTotal();
	}
	
	public int getSize() {
		return productRepository.findAll().size();
	}
	
	public List<ProductDTO> paging(int page){
		List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
		productRepository.findAll(PageRequest.of(page, 8)).getContent().forEach(item -> {
			productDTOs.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productDTOs;
	}
	
	/* START DELETE PRODUCT */
	public int getSizeOrderByProduct(Long id) {
		Product product = new Product();
		product.setId(id);
		return orderRepository.findByProduct(product).size();
	}
	
	public int getSizeCommentByProduct(Long id) {
		Product product = new Product();
		product.setId(id);
		return commentRepository.findByProduct(product).size();
	}
	
	public void deleteProductByAdmin(Long id) {
		productRepository.deleteById(id);
	}
	/* END DELETE PRODUCT */
	
	public void save(ProductDTO productDTO) {
		Product product = new Product();
		Category category = new Category();
		category.setId(productDTO.getCategories_id());
		
		product.setName(productDTO.getName());
		product.setCategory(category);
		product.setPrice(productDTO.getPrice());
		product.setImages(productDTO.getImages());
		product.setSold(productDTO.getSold());
		product.setTotal(productDTO.getTotal());
		product.setDescribe(productDTO.getDescribe());
		product.setImages2(productDTO.getImages2());
		product.setImages3(productDTO.getImages3());
		productRepository.save(product);
		
	}
	
	public void update(ProductDTO productDTO) {
		Product product = new Product();
		Category category = new Category();
		category.setId(productDTO.getCategories_id());
		
		product.setId(productDTO.getId());
		product.setName(productDTO.getName());
		product.setCategory(category);
		product.setPrice(productDTO.getPrice());
		product.setImages(productDTO.getImages());
		product.setSold(productDTO.getSold());
		product.setTotal(productDTO.getTotal());
		product.setDescribe(productDTO.getDescribe());
		product.setImages2(productDTO.getImages2());
		product.setImages3(productDTO.getImages3());
		productRepository.save(product);
	}
	
	public List<ProductDTO> searchProduct(String content, int page){
		List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
		productRepository.searchProduct(content, PageRequest.of(page, 8)).getContent().forEach(item -> {
			productDTOs.add(new ProductDTO(item.getId(), item.getName(), item.getPrice(), item.getImages(),
					item.getSold(), item.getTotal(), item.getDescribe(), item.getCategory().getId(),
					item.getImages2(), item.getImages3()));
		});
		return productDTOs;
	}
	
	public int getSizeSearch(String content) {
		return productRepository.getSizeSearch(content).size();
	}
}
