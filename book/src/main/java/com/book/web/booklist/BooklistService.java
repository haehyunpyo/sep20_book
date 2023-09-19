package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooklistService {

	@Autowired
	private BooklistDAO booklistDAO;
	
	/*--------------------------범식-----------------------------------*/

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

	public List<BooklistDTO> bookrtop() {
		return booklistDAO.bookrtop();
	}

	public void bookWrite2(Map<String, Object> map) {
		booklistDAO.bookWrite2(map);
	}
	
	/*-----------------------------------------------------------------*/
	
	/*--------------------------상민-----------------------------------*/
	
	public void detail2(CartDTO dto) {
		booklistDAO.detail2(dto);
	}

	public List<Map<String, Object>> cart(CartDTO dto) {
		return booklistDAO.cart(dto);
	}

	public int delete(Map<String, Object> map) {
		return booklistDAO.delete(map);
	}
	public int delete2(Map<String, Object> map) {
		return booklistDAO.delete2(map);
	}

	public void cart2(CartDTO dto) {
		booklistDAO.cart2(dto);
	}

	public List<Map<String, Object>> purchase(String mid) {
		
		return booklistDAO.purchase(mid);
	}

	public void stockupdate(Map<String, Object> map) {
		booklistDAO.stockupdate(map);
	}

	public void insert(Map<String, Object> map) {
		booklistDAO.insert(map);
	}

	public void delete3(Map<String, Object> map) {
		booklistDAO.delete3(map);
	}

	public List<Map<String, Object>> coupon(CartDTO dto) {
		return booklistDAO.coupon(dto);
	}

	public void update(Map<String, Object> map) {
		booklistDAO.update(map);
		
	}



	public void delete4(CartDTO cart) {
		booklistDAO.delete4(cart);
		
	}

	public Map<String, Object> rentaldata(int bkno) {
		return booklistDAO.rentaldata(bkno);
	}


	
	
	
	
	
}
