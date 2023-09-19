package com.book.web.user;

import java.lang.ProcessBuilder.Redirect;
import java.util.Map;

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

import springfox.documentation.spring.web.json.Json;

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
	
	// 비밀번호 수정페이지(임시)
	@GetMapping("/myinfo")
	public String myinfo() {
		return "myinfo";
	}
	
	
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
	
	@GetMapping("/changepw")
	public String changepw(@RequestParam (value = "user", required = false, defaultValue = "none") String mid, Model model) {
		model.addAttribute("mid", mid);
		return "changepw";
	}
	
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
	
	
}
