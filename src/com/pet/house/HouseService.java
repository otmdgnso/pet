package com.pet.house;

import java.util.List;
import java.util.Map;

public interface HouseService {
	public int insertHouseInfo(House dto, String pathname);
	public int insertHostPic(House dto);
	public int insertHostPetInfo(House dto);
	
	public int updateHouseInfo(House dto, String pathname);
	public int updateHostPetInfo(House dto);
	
	public String readHostPetInfo(int hostNum);
	
	public int deleteHousePic(String saveFilename, String pathname);
	
	public House readHouseInfo(int hostNum);
	public List<House> readHousePhoto(int hostNum);
	public int deleteHouseInfo(int hostNum, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<House> listHouse(Map<String, Object> map);
	public House housePhoto(int hostNum);
	
	//ÈÄ±â
	public int insertReview(Review dto);
	public List<Review> listReview(Map<String, Object> map);
	public int reviewDataCount(Map<String, Object> map);
	public int deleteReview(int reviewnum);
	
	//È£½ºÆÃ Ã¼Å©
	public int hostCheck(int memberNum);
	
	//´ñ±Û ±Ûº¸±â
	public Review readReview(Map<String, Object> map);
	
	//´ñ±Û °¹¼ö
	public int countReview(int hostNum);
	//´ñ±Û ÆòÁ¡
	public float avgScore(int hostNum);
}
