package com.book.web.login;

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

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	
	@GetMapping({"/", "/index"})
	public String index() {
		return "index";
	}
	
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		
		if(session.getAttribute("mid") != null) {  // 로그인상태에서 login페이지 이동 막기
			return "redirect:/";
		}
		return "login";
	}
	
	// 일반로그인 (form제출)
	@PostMapping("/Glogin")
	public String Glogin(@RequestParam Map<String, Object> map, HttpSession session) {

		//System.out.println(map);
		Map<String, Object> result = loginService.login(map);

		if (String.valueOf(result.get("count")).equals("1")) {
			session.setAttribute("mid", result.get("mid"));
			session.setAttribute("mname", result.get("mname"));
			System.out.println("Glogin완");
			return "redirect:/";
		}
		// 계정불일치 => 다시 로그인페이지로
		return "redirect:/login";	
	}
	
	// 자동로그인기록이 있을때 로그인진행
	@ResponseBody
	@PostMapping("/login")
	public String login(@RequestParam Map<String, Object> map, HttpSession session) {
			JSONObject json = new JSONObject();
			
			System.out.println(map); 
			int auto = loginService.hasAuto(map); // sid, setS
			System.out.println("auto값 : " + auto);

			if(auto == 1) {	// 자동로그인체크 + 계정일치
				if(map.get("setS") != null) {
					
					session.setAttribute("mid", map.get("sid"));
					System.out.println("자동로그인완");
					json.put("auto", auto); // auto = 1
					return json.toString();
				} 
			} else {	// 자동로그인체크 + 계정불일치
				json.put("auto", auto); // auto = 0
				return json.toString();			
			}
				
		return json.toString();
	}		
				
	// 자동로그인 체크시 db에 기록
	  @ResponseBody
	  @PostMapping("/autoCheck") 
	  public String autoCheck(@RequestParam Map<String, Object> map, HttpSession session) {
		
		  JSONObject json = new JSONObject();
		 
		  Map<String, Object> result = loginService.login(map); // id & pw 일치여부 확인
		  int auto = loginService.autoCheck(result); 			// 일치하는 id에 대한 auto를 1로설정
		  
		  json.put("auto", auto);
		  return json.toString(); 
	  }
	 
	  
	  // 로그아웃
	  @GetMapping("/logout")
		public String logout(HttpSession session) {
		  
			if(session.getAttribute("mid") != null) {
				session.invalidate();
				return "redirect:/index";
			}
			return "redirect:/index";
		}
	  
	  // 자동로그인 해제
	  @ResponseBody
	  @PostMapping("/autologout")
	  public String autoLogout(@RequestParam("sid") String sid) {
		
		  JSONObject json = new JSONObject();
		  
		  int result = loginService.autoLogout(sid);	// 일치하는 id에 대한 auto를 0으로 설정
		  System.out.println("자동로그아웃 : " + result);
		  json.put("result", result);
		  
		  return json.toString();
	  }
	  
	  

		@GetMapping("/login/kakao")
		public String kakaoLogin(@RequestParam(required = false) String code, HttpSession session, Model model) {

			// URL에 포함된 code를 이용하여 액세스 토큰 발급
			// System.out.println(code);
			String access_Token = loginService.getKakaoToken(code);
			Map<String, Object> kUser = loginService.getKakaoUser(access_Token);  // 서비스에서 리턴한 kmap값을 kUser로 받음.
			// System.out.println(kUser); // {kid=3002751483, kemail=gogus228@hanmail.net}

			// kakao 로그인기록 확인
			int result = loginService.hasKakaoUser(kUser);	// 0 또는 1

			if (kUser != null) { // kakao연결성공

				if (result == 1) {
					// db에 kakao계정정보 있다면 로그인진행
					session.setAttribute("mid", kUser.get("kid"));
					session.setAttribute("withK", "1");	// 로그아웃시 활용
					return "redirect:/";

				} else {
					//db에 kakao계정정보 없다면 생성(id&email) => subjoin에서 진행
					session.setAttribute("mid", kUser.get("kid")); 		// kid 세션에 저장
					session.setAttribute("withK", "1");					// 로그아웃시 활용
					model.addAttribute("memail", kUser.get("kemail")); 	// db에 넣을 추가정보
					
					return "subjoin";
				}
			} else {
				return "redirect:login";
			}
		}
	
	
		// 네이버 로그인
		@GetMapping("/login/naver")
		public String naverLogin(@RequestParam(required = false) String code, HttpSession session, Model model) {
			
			// URL에 포함된 code를 이용하여 액세스 토큰 발급
			//System.out.println(code);	
			String Naccess_Token = loginService.getNaverToken(code);
			Map<String, Object> nUser = loginService.getNaverUser(Naccess_Token); // 서비스에서 리턴한 Nmap값을 nUser로 받음.
			//System.out.println(nUser);
			
			// 네이버 로그인기록 확인
			int result = loginService.hasNaverUser(nUser); // 0 또는 1
			
			if(nUser != null) {		// 네이버 연결성공
				
				// db에 naver 계정정보 있다면 로그인진행
				if(result == 1) {
					session.setAttribute("mid", nUser.get("Nid"));
					session.setAttribute("withN", "2");	// 로그아웃시 활용
					return "redirect:/";
					
				} else {	
					// db에 naver계정정보 없다면 생성(id&email&name&phone) => subjoin에서 진행
					session.setAttribute("mid", nUser.get("Nid")); 		// Nid 세션에 저장
					session.setAttribute("withN", "2");					// 로그아웃시 활용
					
					model.addAttribute("memail", nUser.get("Nemail"));	// db에 넣을 추가정보들
					model.addAttribute("mname", nUser.get("Nname"));
					model.addAttribute("mphone", nUser.get("Nphone"));
					return "subjoin";
				}
			}else {
				return "redirect:login";
			}
		}
	

	// 아이디/비번찾기
	@GetMapping("/finduser")
	public String finduser(HttpSession session) {
		
		if(session.getAttribute("mid") != null) {	// 로그아웃상태에서 finduser페이지 이동 막기
			return "redirect:/";
		}
		return "finduser";
	}
	
	

}
