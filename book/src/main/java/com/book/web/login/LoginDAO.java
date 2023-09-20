package com.book.web.login;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	Map<String, Object> login(Map<String, Object> map);

	int autoCheck(Map<String, Object> map);

	Map<String, Object> hasKakaoUser(Map<String, Object> kUser);

	Map<String, Object> hasNaverUser(Map<String, Object> nUser);

	Map<String, Object> autologin(String suserID);

	Map<String, Object> hasAuto(Map<String, Object> map);

	int autoLogout(String id);

}
