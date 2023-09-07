package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BooklistController {
	
	@Autowired
	private BooklistService booklistService; 

	@GetMapping("/booklist")
	public String list(Model model, 
		@RequestParam(name = "bkcate", required = false, defaultValue = "0") int bkcate,
		@RequestParam Map<String, Object> map) {
		
		if(!(map.containsKey("bkcate")) || map.get("bkcate").equals(null) || map.get("bkcate").equals("")){
			map.put("bkcate", 0);
			
		}
		System.out.println("카테고리 :" + bkcate );
		System.out.println("검색 :" + map );
		//책 목록 불러오기
		List<Map<String, Object>> booklist = booklistService.booklist(map);
		//List<BooklistDTO> booklist = booklistService.booklist(bkcate);
		model.addAttribute("booklist", booklist);
		
		
		return "booklist";
	}
	
	
	@GetMapping("/bookdetail")
	public String detail(@RequestParam("bkno") int bkno,Model model) {
		
		//책 상세페이지
		Map<String, Object> bookdetail = booklistService.bookdetail(bkno);
		model.addAttribute("bookdetail", bookdetail);
		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);
		
		return "bookdetail";
	}
	
	
	
}
