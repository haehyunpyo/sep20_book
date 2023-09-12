package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooklistService {

	@Autowired
	private BooklistDAO booklistDAO;

	public List<Map<String, Object>> booklist(Map<String, Object> map) {
		return booklistDAO.booklist(map);
	}

	public Map<String, Object> bookdetail(int bkno) {
		return booklistDAO.bookdetail(bkno);
	}

	public List<BooklistDTO> booktop() {
		return booklistDAO.booktop();
	}

	public void bookWrite(Map<String, Object> map) {
		booklistDAO.bookWrite(map);
		
	}

	public int getTotalBookCount(Map<String, Object> map) {
		return booklistDAO.bookCount(map);
	}

	
	
	
	
	
}
