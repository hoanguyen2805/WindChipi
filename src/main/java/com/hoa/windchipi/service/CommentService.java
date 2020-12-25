package com.hoa.windchipi.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.Comment;
import com.hoa.windchipi.entity.Product;
import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.model.CommentDTO;
import com.hoa.windchipi.repository.CommentRepository;

@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepository;
	public List<CommentDTO> getCommentByProductId(Long id){
		List<CommentDTO> commentDTOs = new ArrayList<CommentDTO>();
		commentRepository.getCommentByProductId(id).forEach(item->{
			commentDTOs.add(new CommentDTO(item.getId(), item.getComment_content(), item.getDate_created(), item.getUser().getUsername(), item.getProduct().getId()));
		});
		return commentDTOs;
	}
	
	public void save(CommentDTO commentDTO, User user) {
		Comment comment = new Comment();
		
		Product product = new Product();
		product.setId(commentDTO.getProduct_id());
		
		comment.setComment_content(commentDTO.getComment_content());
		comment.setDate_created(commentDTO.getDate_created());
		comment.setProduct(product);
		comment.setUser(user);
		commentRepository.save(comment);
	}
}
