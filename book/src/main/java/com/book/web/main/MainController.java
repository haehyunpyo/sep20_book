package com.book.web.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.book.web.booklist.BooklistDTO;
import com.book.web.booklist.BooklistService;

@Controller
public class MainController {
	
	@Autowired
	private BooklistService booklistService; 
	@Autowired
	private MainService mainService;
	
	@GetMapping({"/main"})
	public String main(Model model) {
		
		//배너
		List<MainDTO> bannerlist = mainService.bannerlist();
		model.addAttribute("bannerlist", bannerlist);

		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);
		
		//베스트대여
		List<BooklistDTO> bookrtop = booklistService.bookrtop();
		model.addAttribute("bookrtop", bookrtop);
		
		return "main";
	}
}
