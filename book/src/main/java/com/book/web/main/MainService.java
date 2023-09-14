package com.book.web.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {

	@Autowired
	private MainDAO mainDAO;

	public List<MainDTO> bannerlist() {
		return mainDAO.bannerlist();
	}

	
	
	
	
}
