package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BooklistDAO {

	List<BooklistDTO> booklist(int bkcate);

	Map<String, Object> bookdetail(int bkno);

	List<BooklistDTO> booktop();


	
}
