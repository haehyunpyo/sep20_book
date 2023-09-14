package com.book.web.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

	List<MainDTO> bannerlist();


	
}
