package com.hoa.windchipi;

import javax.annotation.Resource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.hoa.windchipi.service.FilesStorageService;

@SpringBootApplication
public class WindChipiApplication {
	@Resource
	FilesStorageService storageService;

	public static void main(String[] args) {
		SpringApplication.run(WindChipiApplication.class, args);
	}

	public void run(String... arg) throws Exception {
		storageService.deleteAll();
		storageService.init();
	}

}
