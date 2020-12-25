package com.hoa.windchipi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {
	private Long id;
	private String comment_content;
	private String date_created;
	private String username;
	private Long product_id;
}
