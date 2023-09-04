package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BooklistController {
	
	@Autowired
	private BooklistService booklistService; 

	@GetMapping("/booklist")
	public String list(Model model) {
		List<BooklistDTO> list = booklistService.list();
		model.addAttribute("list", list);
		
		return "booklist";
	}
	
	@GetMapping("bookdetail")
	public String detail(@RequestParam("bkno") int bkno,Model model) {
		
		
		Map<String, Object> detail = booklistService.detail(bkno);
		model.addAttribute("detail", detail);
		
		
		return "bookdetail";
	}
	
	
	
}
