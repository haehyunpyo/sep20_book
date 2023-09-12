package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BooklistDAO {

	List<Map<String, Object>> booklist(Map<String, Object> map);

	Map<String, Object> bookdetail(int bkno);

	List<BooklistDTO> booktop();

	void bookWrite(Map<String, Object> map);

	int bookCount(Map<String, Object> map);


	
}
