package com.book.web.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {

	List<Map<String, Object>> booklist(String mid);

	List<Map<String, Object>> zzimlist(String mid);

	int zdelete(Map<String, Object> map);

	List<Map<String, Object>> buylist(Map<String, Object> map);

	List<Map<String, Object>> rentlist();

	List<Map<String, Object>> boardlist(Map<String, Object> map);

	void bdelete(Map<String, Object> map);

	Map<String, Object> bdetail(int bno);

	List<Map<String, Object>> commentlist(Map<String, Object> map);

	Map<String, Object> cdetail(int cno);

	List<Map<String, Object>> rentlist(Map<String, Object> map);

	Map<String, Object> info(Map<String, Object> map);

	void phoneSave(Map<String, Object> map);

	void infoChange(Map<String, Object> map);

	Map<String, Object> idchk(String id);

	Map<String, Object> emailchk(String email, String mid);

	void returnBook(Map<String, Object> map);

}
