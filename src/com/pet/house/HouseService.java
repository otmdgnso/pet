package com.pet.house;

import java.util.List;
import java.util.Map;

public interface HouseService {
	public int insertHouseInfo(House dto);
	public int insertHostPic(House dto);
	public int insertHostPetInfo(House dto);
	
	public int updateHouseInfo();
	public House readHouseInfo(int hostNum);
	public int deleteHouseInfo();
	public int dataCount(Map<String, Object> map);
	public List<House> listHouse(Map<String, Object> map);
	
	public int insertReview(HouseReview dto);
	public List<HouseReview> listReview(Map<String, Object> map);
	public int reviewDataCount(Map<String, Object> map);
	public int deleteReview(Map<String, Object> map);
}
