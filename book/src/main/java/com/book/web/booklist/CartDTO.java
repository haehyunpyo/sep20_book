package com.book.web.booklist;

import lombok.Data;

@Data
public class CartDTO {

private String mid, bkimg, bkscontent;
private int cartno, bkno, amount, price, total;
	
	
}
