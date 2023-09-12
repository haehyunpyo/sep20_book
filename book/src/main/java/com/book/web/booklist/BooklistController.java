package com.book.web.booklist;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BooklistController {
	
	@Autowired
	private BooklistService booklistService; 

	@GetMapping("/booklist")
	public String list(Model model, 
		@RequestParam(name = "bkcate", required = false, defaultValue = "0") int bkcate,
		@RequestParam Map<String, Object> map,
		@RequestParam(name = "page", defaultValue = "1") int page, // 현재 페이지
        @RequestParam(name = "pageSize", defaultValue = "8") int pageSize // 페이지 크기
		){
		
		if(!(map.containsKey("bkcate")) || map.get("bkcate").equals(null) || map.get("bkcate").equals("")){
			map.put("bkcate", 0);
		}
		
		// 책 목록갯수
	    int totalBookCount = booklistService.getTotalBookCount(map);
	    
	    //System.out.println(totalBookCount);

	    // 페이징 정보계산
	    int totalPage = (int) Math.ceil((double) totalBookCount / pageSize);
	    if (page < 1) {
	        page = 1;
	    }
	    if (page > totalPage) {
	        page = totalPage;
	    }

	    int startRow = (page - 1) * pageSize;
	    int endRow = startRow + pageSize;
	    
	    
		System.out.println("카테고리 :" + bkcate );
		System.out.println("검색 :" + map );
		System.out.println("시작 페이지 : " + startRow);
		System.out.println("끝 페이지 : " + endRow);
		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);

		//책 목록 불러오기
		//List<BooklistDTO> booklist = booklistService.booklist(bkcate);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    map.put("pageSize", pageSize);
	    List<Map<String, Object>> booklist = booklistService.booklist(map);
		model.addAttribute("booklist", booklist);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPage", totalPage);
		
		
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
	
	@GetMapping("/booknotice")
	public String booknotice() {
		return "booknotice";
	}
	
	@PostMapping("/bookWrite")
	public String bookWrite(@RequestParam("upFile") MultipartFile upfile, @RequestParam Map<String, Object> map) {
		if (!upfile.isEmpty()) {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
					.getRequest();
			String path = request.getServletContext().getRealPath("/img/bookimg");

			//UUID uuid = UUID.randomUUID();
			LocalDateTime ldt = LocalDateTime.now();
			String format = ldt.format(DateTimeFormatter.ofPattern("YYYYMMddHHmmss"));
			String realFileName = format + upfile.getOriginalFilename();

			File newFileName = new File(path, realFileName);
			try {
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				FileCopyUtils.copy(upfile.getBytes(), newFileName);
			} catch (IOException e) {
				e.printStackTrace();
			}

			// #{upFile}, #{realFile}
			//map.put("upFile", upfile.getOriginalFilename());
			map.put("upFile", realFileName);
		}

		//map.put("mno", 4);// 로그인한 사람의 아이디를 담아주세요
	    booklistService.bookWrite(map);
		return "redirect:/booknotice";
	}
	
	
	
	
}
