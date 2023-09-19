package com.book.web.rental;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentalDAO {

	int rental(Map<String, Object> map);
	
	int returnBook(Map<String, Object> map);
	
}
