package com.book.web.mypage;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.web.booklist.BooklistService;
import com.book.web.booklist.CartDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private BooklistService booklistService;
	
	@Autowired
	private SmsUtil smsUtil;
	
	@GetMapping({"/", "/main"})
	public String main(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.booklist(mid);
			model.addAttribute("list", list);
			return "/mypage/main";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/cart")
	public String cart(Model model, HttpSession session) {
		CartDTO dto = new CartDTO();
		dto.setMid((String) session.getAttribute("mid"));
		List<Map<String, Object>> cart = booklistService.cart(dto);
		model.addAttribute("cart", cart);

		
		
		List<Map<String, Object>> coupon = booklistService.coupon(dto);
        model.addAttribute("coupon", coupon);
	
		return "/cart";
	}
	
	
	
	@GetMapping("/zzim")
	public String zzim(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.zzimlist(mid);
			model.addAttribute("list", list);
			return "/mypage/zzim";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/zdelete")
	public String zdelete(@RequestParam(value="valueArr") String[] del, Model model, HttpSession session) {
		System.out.println(Arrays.toString(del));
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < del.length; i++) {
				map.put("del", del[i]);
				map.put("mid", session.getAttribute("mid"));
				int result = myPageService.zdelete(map);
				model.addAttribute("data", result);
			}
			return "redirect:/mypage/zzim";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/buy")
	public String buy(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			List<Map<String, Object>> list = myPageService.buylist(map);
			model.addAttribute("list", list);
			return "/mypage/buy";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/rent")
	public String rent(Model model, @RequestParam Map<String, Object> map, HttpSession session,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			map.put("mid", session.getAttribute("mid"));
			List<Map<String, Object>> list = myPageService.rentlist(map);
			model.addAttribute("list", list);
			return "/mypage/rent";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/returnBook")
	public String returnBook(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			myPageService.returnBook(map);
			return "/mypage/rent";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/board")
	public String board(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			System.out.println(cate);
			System.out.println(map);
			map.put("mid", session.getAttribute("mid"));
			List<Map<String, Object>> list = myPageService.boardlist(map);
			model.addAttribute("list", list);
			return "/mypage/board";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, HttpSession session) throws JsonProcessingException {
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = myPageService.bdetail(bno);
			
			ObjectMapper mapp = new ObjectMapper();
			String json = mapp.writeValueAsString(map);
			return json;
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, Map<String, Object> map, HttpSession session) {
		// System.out.println(bno);
		if(session.getAttribute("mid") != null) {
			map.put("bno", bno);
			map.put("mid", session.getAttribute("mid"));
			System.out.println(map);
			myPageService.bdelete(map);
			return "redirect:/mypage/board";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/comment")
	public String comment(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			map.put("mid", session.getAttribute("mid"));
			System.out.println(cate);
			System.out.println(map);
			List<Map<String, Object>> list = myPageService.commentlist(map);
			model.addAttribute("list", list);
			return "/mypage/comment";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/cdetail")
	public String cdetail(@RequestParam(value = "cno", required = true, defaultValue = "0") int cno
			, HttpSession session) throws JsonProcessingException {
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = myPageService.cdetail(cno);
			
			ObjectMapper mapp = new ObjectMapper();
			String json = mapp.writeValueAsString(map);
			return json;
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/info")
	public String info(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			map.put("mno", session.getAttribute("mno"));
			Map<String, Object> info = myPageService.info(map);
			model.addAttribute("info", info);
			return "/mypage/info";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/phoneCheck")// 휴대폰 문자보내기
	public String sendSMS(@RequestParam(name="phone", required = false) String phone, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			System.out.println(phone);
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
	
			smsUtil.sendOne(phone, randomNumber);
			return String.valueOf(randomNumber);
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/phoneSave")
	public String phoneSave(@RequestParam(name="phone", required = false) String phone, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			System.out.println("phonSave : " + phone);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("phone", phone);
			map.put("mno", session.getAttribute("mno"));
			myPageService.phoneSave(map);
			return "redirect:/mypage/info";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/idchk")
	public String idchk(@RequestParam(name="id", required = true) String id, HttpSession session) {
		System.out.println(id);
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = myPageService.idchk(id);
			JSONObject json = new JSONObject();
			json.put("count", map.get("count"));
			json.put("mid", map.get("mid"));
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/emailchk")
	public String emailchk(@RequestParam(name="email", required = true) String email, HttpSession session) {
		System.out.println(email);
		if(session.getAttribute("mid") != null) {
			String mid = (String)session.getAttribute("mid");
			Map<String, Object> map = myPageService.emailchk(email, mid);
			System.out.println(map);
			JSONObject json = new JSONObject();
			json.put("count", map.get("count"));
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/infoChange")
	public String infoChange(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);// {postcode=0, address=서울, detailAddress=11, extraAddress= (신사동)}
		// 아무것도 없을 때 : {id=, pw=, postcode=, address=, detailAddress=, extraAddress=, birth=, emailId=dddd, selectEmailDomain=0, emailDomain=}
		if(session.getAttribute("mid") != null) {
			String address = (String) map.get("address");
			String postcode = (String) map.get("postcode");
			String detailAddress = (String) map.get("detailAddress");
			String extraAddress = (String) map.get("extraAddress");
			String id = (String) map.get("id");
			String pw = (String) map.get("pw");
			String birth = (String) map.get("birth");
			String emailBefore = (String) map.get("emailId");
			String selectEmailDomain = (String) map.get("selectEmailDomain");
			String emailDomain = (String) map.get("emailDomain");
			System.out.println(id + " " +pw);
			
			if(id != null && !id.isEmpty() || pw != null && !pw.isEmpty() || 
					birth != null && !birth.isEmpty() || address != null && !address.isEmpty() &&
					postcode != null && !postcode.isEmpty() &&
					detailAddress != null && !detailAddress.isEmpty() &&
					extraAddress != null && !extraAddress.isEmpty() ||
					emailBefore != null && !emailBefore.isEmpty() &&
					selectEmailDomain != null && !selectEmailDomain.isEmpty()) {
				
				if(postcode != null && !postcode.isEmpty() &&
						detailAddress != null && !detailAddress.isEmpty() &&
						extraAddress != null && !extraAddress.isEmpty()) {
					
					String addr = address + " " + postcode + " " + detailAddress + " " + extraAddress;
					map.put("addr", addr);
				}
				
				if(emailBefore != null && !emailBefore.isEmpty() &&
						selectEmailDomain != null && !selectEmailDomain.isEmpty()) {
					String email = "";
					if(selectEmailDomain.equals("5")) {
						email = emailBefore + "@" + emailDomain;
					} else {
						email = emailBefore + "@" + selectEmailDomain;
					}
					map.put("email", email);
				}
				map.put("mno", session.getAttribute("mno"));
				System.out.println(map);
				myPageService.infoChange(map);
				return "redirect:/mypage/info";
			}
			return "redirect:/mypage/info?error=empty";
			
		} else {
			return "redirect:/login";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}