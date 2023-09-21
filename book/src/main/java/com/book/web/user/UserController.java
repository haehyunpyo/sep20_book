package com.book.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/findId")
	public String finduser() {
		
		return "finduser";
	}
	
	@ResponseBody
	@PostMapping("/findId")
	public String finduser(UserDTO dto) throws JsonProcessingException {
		ObjectMapper jmap = new ObjectMapper();
		
		UserDTO result = userService.findId(dto);
		String json = jmap.writeValueAsString(result);

		return json;
	}
	
	
	// 아이디찾기
	@ResponseBody
	@PostMapping("/findPW")
	public String findpw(UserDTO dto) {
		JSONObject json = new JSONObject();

		//System.out.println(dto);
		UserDTO result = userService.findpw(dto);
		System.out.println(result.getCount());
		json.put("result", result);
		
		if(result.getCount() == 1) {
			int changepw = userService.setPw(dto);
			System.out.println("비번찾기일치여부 : " + changepw);
			System.out.println("mid : " + dto.getMid());
			json.put("mid", dto.getMid());
			json.put("changepw", changepw);
			return json.toString();
		}
		return json.toString();
	}
	
	// 비밀번호찾기
	@GetMapping("/changepw")
	public String changepw(@RequestParam (value = "user", required = false, defaultValue = "none") String mid, Model model) {
		model.addAttribute("mid", mid);
		return "changepw";
	}
	
	// 비밀번호수정
	@ResponseBody
	@PostMapping("/editpw")
	public String editpw(UserDTO dto) {
		JSONObject json = new JSONObject();
		
		System.out.println("mid: " + dto.getMid());
		System.out.println("mpw: " + dto.getMpw());
		System.out.println(dto);
		
		int result = userService.editpw(dto);
		System.out.println(result);
		json.put("result", result);
		
		return json.toString();
	}
	
	
	@GetMapping("/userinfo")
	public String userinfo(UserDTO dto, Model model, HttpSession session) {
		
		if(session.getAttribute("mid") != null) {
			
			dto.setMid(String.valueOf(session.getAttribute("mid")));
			UserDTO info = userService.userinfo(dto);
			//System.out.println(info);
			//UserDTO(mno=135, count=0, mname=해현, mid=pororo, mpw=12345, maddr=대전 동구 판교1길 3,경기 성남시 분당구 대왕판교로 477, mbrith=null, memail=pororo@naver.com, mphone=01046521234)
			model.addAttribute("info", info);
			
			return "userinfo";
		}
		return "/login";
	}
	
	
	
}
