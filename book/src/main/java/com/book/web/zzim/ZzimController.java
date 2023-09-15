package com.book.web.zzim;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = { "/booklist", "/bookdetail" })
public class ZzimController {
	
	@Autowired
    private ZzimService zzimService;
	
	
	@PostMapping
    public ResponseEntity<Object> toggleZzim(@RequestBody Map<String, String> requestData, HttpSession session) {
        String bkno = requestData.get("bkno");
        String action = requestData.get("action");
        String mid = (String) session.getAttribute("mid");
        
        try {
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("mid", mid);
            parameters.put("bkno", bkno);

            if ("INSERT".equals(action)) {
                zzimService.insertZzim(parameters);
            } else if ("DELETE".equals(action)) {
                zzimService.deleteZzim(parameters);
            }

            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

}
