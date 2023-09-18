package com.book.web.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

	List<Map<String, Object>> stocklist(Map<String, Object> map);

	void updateStock(Map<String, Object> map);

	List<Map<String, Object>> boardlist(Map<String, Object> map);

	Map<String, Object> bdetail(int bno);

	List<Map<String, Object>> comment(int bno);

	void memberOut(String mid);

	void bdel(int bno);

	List<Map<String, Object>> rentlist(Map<String, Object> map);

	List<Map<String, Object>> tradelist(Map<String, Object> map);

	List<Map<String, Object>> rentalAmount(Map<String, Object> map);

	List<Map<String, Object>> notice(Map<String, Object> map);

	Map<String, Object> ndetail(int bno);

	List<Map<String, Object>> ncomment(int bno);

}
