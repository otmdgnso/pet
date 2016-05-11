package com.pet.adopt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("adpot.AdpotService")
public class AdoptServiceImpl implements AdoptService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertPreSale(Adopt dto, String pathname) {
		int result=0;
		try {
			result=dao.insertData("adopt.insertPreSale", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
