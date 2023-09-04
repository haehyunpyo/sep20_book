package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BooklistDAO {

	List<BooklistDTO> list();

	Map<String, Object> detail(int bkno);


	
}
