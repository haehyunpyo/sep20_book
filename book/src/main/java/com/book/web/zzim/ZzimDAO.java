package com.book.web.zzim;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ZzimDAO {

	void insertZzim(Map<String, Object> parameters);

	void deleteZzim(Map<String, Object> parameters);

	List<Integer> zzimBooklist(String mid);

}
