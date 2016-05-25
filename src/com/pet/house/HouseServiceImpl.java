package com.pet.house;

import java.util.List;
import java.util.Map;

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
	public int insertHostPic(House dto) {
		int result=0;
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertHostPetInfo(House dto) {
		int result=0;
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int updateHouseInfo() {
		int result=0;
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public House readHouseInfo(int hostNum) {
		House dto=null;
		
		try {
			dto=dao.getReadData("house.readHouseinfo", hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int deleteHouseInfo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.getIntValue("house.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<House> listHouse(Map<String, Object> map) {
		List<House> list=null;
		
		try {
			list=dao.getListData("house.listHouse", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
}
