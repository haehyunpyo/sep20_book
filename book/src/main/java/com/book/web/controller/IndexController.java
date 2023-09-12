package com.book.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.book.web.booklist.BooklistDTO;
import com.book.web.booklist.BooklistService;

@Controller
public class IndexController {
	
	@Autowired
	private BooklistService booklistService; 
	
	@GetMapping({"/", "/index"})
	public String index(Model model) {
		

		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);
		
		
		return "index";
	}
}
