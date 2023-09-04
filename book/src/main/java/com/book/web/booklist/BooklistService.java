package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooklistService {

	@Autowired
	private BooklistDAO booklistDAO;

	public List<BooklistDTO> list() {
		return booklistDAO.list();
	}

	public Map<String, Object> detail(int bkno) {
		return booklistDAO.detail(bkno);
	}

	
	
}
