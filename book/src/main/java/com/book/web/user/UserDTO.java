package com.book.web.user;

import lombok.Data;

@Data
public class UserDTO {
	private int mno, count;
	private String mname, mid, mpw, maddr, mbrith, memail, mphone;
}
