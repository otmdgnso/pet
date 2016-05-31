package com.pet.house;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.common.FileManager;
import com.pet.common.dao.CommonDAO;

@Service("house.houseService")
public class HouseServiceImpl implements HouseService{
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertHouseInfo(House dto, String pathname) {
		int result=0;
		
		try {			
			dto.setAddress(dto.getCategory1()+dto.getCategory2()+dto.getCategory3());
			dao.insertData("house.insertHouseInfo", dto);
			// 파일 업로드
						if (!dto.getUpload().isEmpty()) {
							for (MultipartFile mf : dto.getUpload()) {
								if (mf.isEmpty())
									continue;

								// 업로드한 파일이 존재하는 경우
								String saveFilename = fileManager.doFileUpload(mf, pathname);
								if (saveFilename != null) {
									dto.setSaveFilename(saveFilename);
									insertHostPic(dto);
								}
							}

						}
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertHostPic(House dto) {
		int result=0;
		try {			
			result=dao.insertData("house.insertHousePic", dto);						
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertHostPetInfo(House dto) {
		int result=0;
		try {
			result=dao.insertData("house.insertHostPetInfo", dto);
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
	public List<House> readHouseInfo(int hostNum) {
		List<House> list=null;
		
		try {
			list=dao.getReadData("house.readHouseinfo", hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
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

	@Override
	public int insertReview(Review dto) {
		int result=0;
		
		try {
			dao.insertData("house.insertReview", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list=null;
		
		try {
			list=dao.getListData("house.listReview", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int reviewDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.getIntValue("house.reviewDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteReview(int reviewnum) {
		int result=0;
		
		try {
			result=dao.deleteData("house.deleteReview", reviewnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
}
