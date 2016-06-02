package com.pet.house;

import java.util.List;
import java.util.Map;

public interface HouseService {
	public int insertHouseInfo(House dto, String pathname);
	public int insertHostPic(House dto);
	public int insertHostPetInfo(House dto);
	
	public int updateHouseInfo();
	public House readHouseInfo(int hostNum);
	public List<House> readHousePhoto(int hostNum);
	public int deleteHouseInfo();
	public int dataCount(Map<String, Object> map);
	public List<House> listHouse(Map<String, Object> map);
	public House housePhoto(int hostNum);
	
	//후기
	public int insertReview(Review dto);
	public List<Review> listReview(Map<String, Object> map);
	public int reviewDataCount(Map<String, Object> map);
	public int deleteReview(int reviewnum);
	
	//호스팅 체크
	public int hostCheck(int memberNum);
}
