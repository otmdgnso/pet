package com.pet.house;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("house.houseService")
public class HouseServiceImpl implements HouseService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertHouseInfo(House dto) {
		int result=0;
		
		try {
			dao.insertData("house.insertHouseInfo", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int updateHouseInfo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public House readHouseInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteHouseInfo() {
		// TODO Auto-generated method stub
		return 0;
	}

}
