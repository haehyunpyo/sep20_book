package com.book.web.zzim;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ZzimService {

    @Autowired
    private ZzimDAO zzimDAO; 

    public void insertZzim(String bkno) {
        try {
        	zzimDAO.insertZzim(bkno);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("찜 추가 중 오류 발생");
        }
    }

    public void deleteZzim(String bkno) {
        try {
        	zzimDAO.deleteZzim(bkno);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("찜 삭제 중 오류 발생");
        }
    }

	public List<Integer> zzimBooklist() {
		return zzimDAO.zzimBooklist();
	}


	
}
