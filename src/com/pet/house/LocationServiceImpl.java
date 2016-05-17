package com.pet.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("location.locationService")
public class LocationServiceImpl implements LocationService{
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Location> listCategory1() {
		List<Location> list = null;
		try {
			list=dao.getListData("location.listCategory1");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Location> listCategory2(String category1) {
		List<Location> list = null;
		try {
			list=dao.getListData("location.listCategory2", category1);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
