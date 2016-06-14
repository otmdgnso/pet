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
	
	//���� ����Ʈ
	public List<House> mainListHouse(Map<String, Object> map);
	
	//�ı�
	public int insertReview(Review dto);
	public List<Review> listReview(Map<String, Object> map);
	public int reviewDataCount(Map<String, Object> map);
	public int deleteReview(int reviewnum);
	
	//ȣ���� üũ
	public int hostCheck(int memberNum);
	
	//��� �ۺ���
	public Review readReview(Map<String, Object> map);
	
	//��� ����
	public int countReview(int hostNum);
	//��� ����
	public double avgScore(int hostNum);
}
