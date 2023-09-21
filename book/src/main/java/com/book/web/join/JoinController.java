package com.book.web.join;

import java.security.SecureRandom;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;

	@GetMapping("/join")
	public String join() {
	  return "join"; 
		}
	

	
	
	@PostMapping("/join")
	public String join(JoinDTO joinDTO) {
		//System.out.println("jsp에서 오는 값 : " + joinDTO);
		
		//System.out.println(joinDTO);
		
		int result = joinService.join(joinDTO);
		//System.out.println(result);
		
	
		String rand = UUID.randomUUID().toString();
		String realrand = rand.substring(24,rand.length());
		String welcome = "wel"+realrand;
		String welcoupon = "웰컴 10%할인쿠폰";
		joinDTO.setCocode(welcome);
		joinDTO.setCocontent(welcoupon);
		System.out.println(welcome);
		
		System.out.println(joinDTO);
		
		if(result == 1) {
			
		 int plz = joinService.num(joinDTO);
		 System.out.println(plz);
			
			
			return "redirect:/login";
		}
		return "redirect:/join";
	}
	
	
	//아이디 중복검사
	@ResponseBody
	@PostMapping("/checkID")
	public String checkID(@RequestParam("mid") String mid) {
		System.out.println("id : " + mid);
		int result = joinService.checkID(mid);
			return result + "";
	}
	
	// 로그인연동 추가정보
	@GetMapping("/subjoin")
	public String subjoin() {
		return "subjoin";
	}
	
	
	@PostMapping("/login/subjoin")
	public String subjoin(JoinDTO joinDTO, HttpSession session) {
		
		System.out.println("subjoin제출값 : "+joinDTO);

		if(session.getAttribute("withK") != null) {
			
			System.out.println(joinDTO);
			joinDTO.setMid(String.valueOf(session.getAttribute("mid")));
			joinDTO.setWithK(String.valueOf(session.getAttribute("withK")));
			session.setAttribute("mname", joinDTO.getMname());
			session.setAttribute("mgrade", 1);

			joinService.setKakaoUser(joinDTO);
			
		} else if(session.getAttribute("withN") != null) {
			
			joinDTO.setMid(String.valueOf(session.getAttribute("mid")));
			joinDTO.setWithK(String.valueOf(session.getAttribute("withN")));
			session.setAttribute("mname", joinDTO.getMname());
			session.setAttribute("mgrade", 1);
			
			joinService.setNaverUser(joinDTO);
		}

		return "redirect:/main";
	}
	
}