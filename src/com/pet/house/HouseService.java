package com.pet.house;

public interface HouseService {
	public int insertHouseInfo(House dto);
	public int updateHouseInfo();
	
	public House readHouseInfo();
	
	public int deleteHouseInfo();
}
