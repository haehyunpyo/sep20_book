package com.book.web.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	public List<Map<String, Object>> stocklist(Map<String, Object> map) {
		return adminDAO.stocklist(map);
	}

	public void updateStock(Map<String, Object> map) {
		adminDAO.updateStock(map);
	}

	public List<Map<String, Object>> boardlist(Map<String, Object> map) {
		return adminDAO.boardlist(map);
	}

	public Map<String, Object> bdetail(int bno) {
		return adminDAO.bdetail(bno);
	}

	public List<Map<String, Object>> comment(int bno) {
		return adminDAO.comment(bno);
	}

	public void memberOut(String mid) {
		adminDAO.memberOut(mid);
	}

	public void bdel(int bno) {
		adminDAO.bdel(bno);
	}

	public List<Map<String, Object>> rentlist(Map<String, Object> map) {
		return adminDAO.rentlist(map);
	}

	public List<Map<String, Object>> tradelist(Map<String, Object> map) {
		return adminDAO.tradelist(map);
	}

	public List<Map<String, Object>> rentalAmount(Map<String, Object> map) {
		return adminDAO.rentalAmount(map);
	}

	public List<Map<String, Object>> notice(Map<String, Object> map) {
		return adminDAO.notice(map);
	}

	public Map<String, Object> ndetail(int bno) {
		return adminDAO.ndetail(bno);
	}

	public List<Map<String, Object>> ncomment(int bno) {
		return adminDAO.ncomment(bno);
	}

}
