package com.hoa.windchipi.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContactDTO {
	private Long id;

	private String email;

	private String full_name;

	private String message;

	private String phone;

	private String date_created;
}
