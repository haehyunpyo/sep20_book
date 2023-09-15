package com.book.web.zzim;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ZzimDAO {

	void insertZzim(String bkno);

	void deleteZzim(String bkno);

	List<Integer> zzimBooklist();

}
