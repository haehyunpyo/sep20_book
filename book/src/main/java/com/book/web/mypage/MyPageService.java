package com.book.web.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

	public List<Map<String, Object>> booklist(String mid) {
		return myPageDAO.booklist(mid);
	}

	public List<Map<String, Object>> zzimlist(String mid) {
		return myPageDAO.zzimlist(mid);
	}

	public int zdelete(Map<String, Object> map) {
		return myPageDAO.zdelete(map);
	}

	public List<Map<String, Object>> buylist(Map<String, Object> map) {
		return myPageDAO.buylist(map);
	}

	public List<Map<String, Object>> rentlist() {
		return myPageDAO.rentlist();
	}

	public List<Map<String, Object>> boardlist(Map<String, Object> map) {
		return myPageDAO.boardlist(map);
	}

	public void bdelete(Map<String, Object> map) {
		myPageDAO.bdelete(map);
	}

	public Map<String, Object> bdetail(int bno) {
		return myPageDAO.bdetail(bno);
	}

	public List<Map<String, Object>> commentlist(Map<String, Object> map) {
		return myPageDAO.commentlist(map);
	}

	public Map<String, Object> cdetail(int cno) {
		return myPageDAO.cdetail(cno);
	}

	public List<Map<String, Object>> rentlist(Map<String, Object> map) {
		return myPageDAO.rentlist(map);
	}

	public Map<String, Object> info(Map<String, Object> map) {
		return myPageDAO.info(map);
	}

	public void phoneSave(Map<String, Object> map) {
		myPageDAO.phoneSave(map);
	}

	public void infoChange(Map<String, Object> map) {
		myPageDAO.infoChange(map);
	}

	public Map<String, Object> idchk(String id) {
		return myPageDAO.idchk(id);
	}

	public Map<String, Object> emailchk(String email, String mid) {
		return myPageDAO.emailchk(email, mid);
	}

	public void returnBook(Map<String, Object> map) {
		myPageDAO.returnBook(map);
	}
	

}
