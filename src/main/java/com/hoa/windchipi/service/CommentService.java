package com.hoa.windchipi.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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

	public List<CommentDTO> getCommentByProductId(Long id) {
		List<CommentDTO> commentDTOs = new ArrayList<CommentDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		commentRepository.getCommentByProductId(id).forEach(item -> {
			commentDTOs.add(new CommentDTO(item.getId(), item.getComment_content(), sdf.format(item.getDate_created()),
					item.getUser().getUsername(), item.getUser().getId(), item.getProduct().getName(),
					item.getProduct().getId()));
		});
		return commentDTOs;
	}

	public void save(CommentDTO commentDTO, User user) {
		Comment comment = new Comment();
		Product product = new Product();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		product.setId(commentDTO.getProduct_id());
		comment.setComment_content(commentDTO.getComment_content());
		comment.setDate_created(timestamp);
		comment.setProduct(product);
		comment.setUser(user);
		commentRepository.save(comment);
	}

	public List<CommentDTO> getSize() {
		List<CommentDTO> commentDTOs = new ArrayList<CommentDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		commentRepository.findAll().forEach(item -> {
			commentDTOs.add(new CommentDTO(item.getId(), item.getComment_content(), sdf.format(item.getDate_created()),
					item.getUser().getUsername(), item.getUser().getId(), item.getProduct().getName(),
					item.getProduct().getId()));
		});
		return commentDTOs;
	}

	public List<CommentDTO> paging(int page) {
		List<CommentDTO> commentDTOs = new ArrayList<CommentDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		commentRepository.findAll(PageRequest.of(page, 5)).getContent().forEach(item -> {
			commentDTOs.add(new CommentDTO(item.getId(), item.getComment_content(), sdf.format(item.getDate_created()),
					item.getUser().getUsername(), item.getUser().getId(), item.getProduct().getName(),
					item.getProduct().getId()));
		});
		return commentDTOs;
	}

	public void deletebyId(Long id) {
		commentRepository.deleteById(id);
	}
}
