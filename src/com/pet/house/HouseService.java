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
	
	//메인 리스트
	public List<House> mainListHouse(Map<String, Object> map);
	
	//후기
	public int insertReview(Review dto);
	public List<Review> listReview(Map<String, Object> map);
	public int reviewDataCount(Map<String, Object> map);
	public int deleteReview(int reviewnum);
	
	//호스팅 체크
	public int hostCheck(int memberNum);
	
	//댓글 글보기
	public Review readReview(Map<String, Object> map);
	
	//댓글 갯수
	public int countReview(int hostNum);
	//댓글 평점
	public double avgScore(int hostNum);
}
