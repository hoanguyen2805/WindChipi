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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hoa.windchipi.entity.Product;
import com.hoa.windchipi.model.ContactDTO;
import com.hoa.windchipi.model.ProductDTO;
import com.hoa.windchipi.service.ProductService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/products")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@GetMapping("/search/{category}/{keyword}")
	public ResponseEntity<List<ProductDTO>> searchCategoryAndKeyWord(@PathVariable Long category, @PathVariable String keyword){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		if(category == 0) {
			list = productService.searchAllAndKeyWord(keyword);
		}
		else {
			list = productService.searchCategoryAndKeyWord(category, keyword);
		}
		return new ResponseEntity<List<ProductDTO>>(list, HttpStatus.OK);
	}
	@GetMapping("/search/{category}")
	public ResponseEntity<List<ProductDTO>> searchCategory(@PathVariable Long category){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		if(category == 0) {
			list = productService.searchAll();
		}
		else {
			list = productService.searchCategory(category);
		}
		return new ResponseEntity<List<ProductDTO>>(list, HttpStatus.OK);
	}
	@GetMapping("/{id}")
	public ResponseEntity<ProductDTO> getProductById(@PathVariable("id") Long id){
		return new ResponseEntity<ProductDTO>(productService.getProductById(id), HttpStatus.OK);
	}
	@GetMapping("/newproducts")
	public ResponseEntity<List<ProductDTO>> getNewProducts(){
		return new ResponseEntity<List<ProductDTO>>(productService.getNewProducts(), HttpStatus.OK);
	}
	@GetMapping("/hotproducts")
	public ResponseEntity<List<ProductDTO>> getHotProducts(){
		return new ResponseEntity<List<ProductDTO>>(productService.getHotProduct(), HttpStatus.OK);
	}
	@GetMapping("/relatedproduct/{category}/{id}")
	public ResponseEntity<List<Product>> getRelatedProduct(@PathVariable("category") Long category, @PathVariable("id") Long id){
		return new ResponseEntity<List<Product>>(productService.getRelatedProducts(category, id), HttpStatus.OK);
	}
	
	@GetMapping("gettotal/{id}")
	public ResponseEntity<Integer> getTotalProduct(@PathVariable("id") Long id){
		return new ResponseEntity<Integer>(productService.getTotalProduct(id), HttpStatus.OK);
	}

	@GetMapping("/size")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSize(){
		return new ResponseEntity<Integer>(productService.getSize(), HttpStatus.OK);
	}
	
	@GetMapping("/page/{page}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<ProductDTO>> paging(@PathVariable int page){
		return new ResponseEntity<List<ProductDTO>>(productService.paging(page), HttpStatus.OK);
	}
	
	/* delete product */
	@GetMapping("/sizeorder/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSizeOrderByProduct(@PathVariable Long id){
		return new ResponseEntity<Integer>(productService.getSizeOrderByProduct(id), HttpStatus.OK);
	}
	
	@GetMapping("/sizecomment/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSizeCommentByProduct(@PathVariable Long id){
		return new ResponseEntity<Integer>(productService.getSizeCommentByProduct(id), HttpStatus.OK);
	}
	@DeleteMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> deleteProductByAdmin(@PathVariable Long id){
		productService.deleteProductByAdmin(id);
		return new ResponseEntity<String>("Delete!", HttpStatus.OK);
	}
	/* END */
	
	@PostMapping("/save")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> save(@RequestBody ProductDTO productDTO){
		productService.save(productDTO);
		return new ResponseEntity<String>("saved!", HttpStatus.OK);
	}
	
	@PatchMapping("/update")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> update(@RequestBody ProductDTO productDTO){
		productService.update(productDTO);
		return new ResponseEntity<String>("updated!", HttpStatus.OK);
	}
	
	@GetMapping("/search")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<ProductDTO>> searchProduct(@RequestParam("content") String content, @RequestParam("page") int page){
		return new ResponseEntity<List<ProductDTO>>(productService.searchProduct(content, page), HttpStatus.OK);
	}
	@GetMapping("/getsize")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Integer> getSizeSearch(@RequestParam("content") String content){
		return new ResponseEntity<Integer>(productService.getSizeSearch(content), HttpStatus.OK);
	}
}
