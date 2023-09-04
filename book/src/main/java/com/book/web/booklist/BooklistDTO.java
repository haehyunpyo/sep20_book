package com.book.web.booklist;

import lombok.Data;

@Data
public class BooklistDTO {

	private int bkno, bkprice,rcnt,bcnt,bstock,rstock;
	private String bkname, bkwrite, bkcontent, bkimg;
}
