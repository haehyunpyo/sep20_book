package com.book.web.user;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {

	UserDTO findId(UserDTO dto);

	UserDTO findpw(UserDTO dto);

	int setPw(UserDTO dto);

	int editpw(UserDTO dto);

	UserDTO userinfo(UserDTO dto);

}
