package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BooklistDAO {

/*--------------------------범식-----------------------------------*/
	List<Map<String, Object>> booklist(Map<String, Object> map);

	Map<String, Object> bookdetail(int bkno);

	List<BooklistDTO> booktop();

	void bookWrite(Map<String, Object> map);

	int bookCount(Map<String, Object> map);

	List<BooklistDTO> bookrtop();

	void bookWrite2(Map<String, Object> map);

/*-----------------------------------------------------------------*/

/*--------------------------상민-----------------------------------*/
	void detail2(CartDTO dto);

	List<Map<String, Object>> cart(CartDTO dto);

	int delete(Map<String, Object> map);

	int delete2(Map<String, Object> map);

	void cart2(CartDTO dto);

	List<Map<String, Object>> purchase(String mid);

	/* List<Map<String, Object>> list(String mid); */
	
	void stockupdate(Map<String, Object> map);
	
	void insert(Map<String, Object> map);

	void delete3(Map<String, Object> map);

	List<Map<String, Object>> coupon(CartDTO dto);


	void update(Map<String, Object> map);

	void delete4(CartDTO cart);


	
/*-----------------------------------------------------------------*/
}
