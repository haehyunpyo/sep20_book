package com.book.web.rental;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentalService {

	@Autowired
	private RentalDAO rentalDAO;
	
	public int rental(Map<String, Object> map) {
		return rentalDAO.rental(map);
	}
	
	public int returnBook(Map<String, Object> map) {
		return rentalDAO.returnBook(map);
	}
	

	
}
