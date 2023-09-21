package com.book.web.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.web.booklist.BooklistDTO;
import com.book.web.booklist.BooklistService;

@Controller
public class MainController {
	
	@Autowired
	private BooklistService booklistService; 
	@Autowired
	private MainService mainService;
	
	
	@GetMapping("/main")
	public String main(Model model,HttpSession session,@RequestParam Map<String, Object> map) {
		
		//배너
		List<MainDTO> bannerlist = mainService.bannerlist();
		model.addAttribute("bannerlist", bannerlist);

		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);
		
		//베스트대여
		List<BooklistDTO> bookrtop = booklistService.bookrtop();
		model.addAttribute("bookrtop", bookrtop);
		
		//마이페이지 대여목록
		map.put("mid", session.getAttribute("mid"));
		List<Map<String, Object>> rentlist = mainService.rentlist(map);
		model.addAttribute("rentlist", rentlist);
		
		return "main";
	}
}
