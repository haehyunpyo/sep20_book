package com.book.web.rental;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RentalController {
	
	@Autowired
	private RentalService rentalService;

	//책 대여
	   @ResponseBody
	   @PostMapping("/rental")
	   public String rental(@RequestParam Map<String, Object> map, HttpSession session) {
	      
	      JSONObject json = new JSONObject();
	      //System.out.println(session.getAttribute("mid"));
	      if(session.getAttribute("mid") != null && session.getAttribute("mid") != "") {
	         map.put("mid", session.getAttribute("mid"));
	         //System.out.println(map);
	         int result = rentalService.rental(map);
	         json.put("result", result);
	         
	         
	         return json.toString();
	      }
	      
	      return json.toString();
	   }
	   
	   //책 반납
	   @ResponseBody
	   @PostMapping("/returnBook")
	   public String returnBook(@RequestParam  Map<String, Object> map) {
		   JSONObject json = new JSONObject();
		   
		   int returnBook =  rentalService.returnBook(map);
		   json.put("returnBook", returnBook);
		  
		   System.out.println(returnBook);
		   return json.toString();
	   }
	   

}
