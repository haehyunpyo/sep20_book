package com.book.web.admin;

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

import com.book.web.mypage.Util;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private Util util;
	
	@GetMapping("/stock")
	public String stock(Model model, @RequestParam Map<String, Object> map, HttpSession session,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			System.out.println(cate);
			System.out.println(map);
			List<Map<String, Object>> list = adminService.stocklist(map);
			model.addAttribute("list", list);
			return "/admin/stock";
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateStock")
	public String updateStock(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			System.out.println(map);// {bkno=11, bstock=20, cate=}
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			JSONObject json = new JSONObject();
			String bstock = (String) map.get("bstock");
			if(util.strToInt(bstock) == 0) {
				System.out.println("업데이트" + util.strToInt(bstock));
				json.put("bstock", 0);
				return json.toString();
			}
			adminService.updateStock(map);
			json.put("bstock", bstock);
			return json.toString();
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/board")
	public String board(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			System.out.println(cate);
			System.out.println(map);
			List<Map<String, Object>> list = adminService.boardlist(map);
			model.addAttribute("list", list);
			return "/admin/board";
		} else {
			return "redirect:/index";
		}
	}
	
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno, HttpSession session) 
			throws JsonProcessingException {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			Map<String, Object> detail = adminService.bdetail(bno);
			List<Map<String, Object>> comment = adminService.comment(bno);
			JSONObject json = new JSONObject();
			json.put("detail", detail);
			json.put("comment", comment);
			// System.out.println(comment);
			return json.toString();
			
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/memberOut")
	public String memberOut(@RequestParam(value = "mid", required = true) String mid, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			System.out.println(mid);
			adminService.memberOut(mid);
			return "/admin/board";
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/bdel")
	public String bdel(@RequestParam(value = "bno", required = true) int bno, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			System.out.println(bno);
			adminService.bdel(bno);
			return "/admin/board";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/rent")
	public String rent(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			System.out.println(cate);
			System.out.println(map);
			List<Map<String, Object>> list = adminService.rentlist(map);
			model.addAttribute("list", list);
			return "/admin/rent";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/sales")
	public String sales(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			List<Map<String, Object>> list = adminService.tradelist(map);
			model.addAttribute("list", list);
			return "/admin/sales";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/rentalAmount")
	public String rentalAmount(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			List<Map<String, Object>> list = adminService.rentalAmount(map);
			model.addAttribute("list", list);
			return "/admin/rentalAmount";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/product")
	public String product(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			
			return "/admin/product";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/notice")
	public String notice(Model model, HttpSession session, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			List<Map<String, Object>> list = adminService.notice(map);
			model.addAttribute("list", list);		
			return "/admin/notice";
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/ndetail")
	public String ndetail(@RequestParam(value = "bno", required = true) int bno, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			Map<String, Object> detail = adminService.ndetail(bno);
			List<Map<String, Object>> ncomment = adminService.ncomment(bno);
			JSONObject json = new JSONObject();
			json.put("detail", detail);
			json.put("ncomment", ncomment);
			return json.toString();
		} else {
			return "redirect:/index";
		}
	}
}
