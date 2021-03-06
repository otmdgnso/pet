package com.pet.house;

import java.util.Iterator;
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
			dto.setAddress(dto.getCategory1()+" "+dto.getCategory2()+" "+dto.getCategory3());
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
	public int updateHouseInfo(House dto, String pathname) {
		int result=0;
		try {
			result=dao.updateData("house.updateHouseInfo", dto);
		
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
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
	public int updateHostPetInfo(House dto) {
		int result=0;
		try {
			result=dao.updateData("house.updateHostPetInfo", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	

	@Override
	public int deleteHousePic(String saveFilename, String pathname) {
		int result=0;
		try {
			result=dao.deleteData("house.deleteHousePic", saveFilename);
			fileManager.doFileDelete(saveFilename, pathname);
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
	public List<House> readHousePhoto(int hostNum) {
		List<House> list=null;
		try {
			list=dao.getListData("house.readHousePhoto",hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int deleteHouseInfo(int hostNum, String pathname) {
		int result=0;
		try {
			//파일지우기
			List<House> readHousePhoto=readHousePhoto(hostNum);
			if(readHousePhoto!=null) {
				Iterator<House> it=readHousePhoto.iterator();
				while(it.hasNext()) {
					House dto=it.next();
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			result=dao.deleteData("house.deleteHouse", hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
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
	public List<House> mainListHouse(Map<String, Object> map) {
			List<House> list=null;
		
		try {
			list=dao.getListData("house.mainListHouse", map);
			for(House vo:list){
				House t=housePhoto(vo.getHostNum());
				if(t!=null)
					vo.setSaveFilename(t.getSaveFilename());
			   double v=avgScore(vo.getHostNum());
				vo.setAvgScore(v);			 
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<House> listHouse(Map<String, Object> map) {
		List<House> list=null;
		
		try {
			list=dao.getListData("house.listHouse", map);
			for(House vo:list){
				House t=housePhoto(vo.getHostNum());
				if(t!=null)
					vo.setSaveFilename(t.getSaveFilename());
			   double v=avgScore(vo.getHostNum());
				vo.setAvgScore(v);			 
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public House housePhoto(int hostNum) {
		House dto=null;
		try {
			dto=dao.getReadData("house.housePhoto",hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int insertReview(Review dto) {
		int result=0;
		
		try {
			result=dao.insertData("house.insertReview", dto);
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

	@Override
	public int hostCheck(int memberNum) {
		int result=0;
		try {
			result=dao.getIntValue("house.hostCheck",memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Review readReview(Map<String, Object> map) {
		Review vo=null;
		try {
			vo=dao.getReadData("house.readReview", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return vo;
	}

	@Override
	public String readHostPetInfo(int hostNum) {
		String st=null;
		try {
			st=dao.getReadData("house.readHostPetInfo",hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return st;
	}

	@Override
	public int countReview(int hostNum) {
		int result=0;
		try {
			result=dao.getIntValue("house.countReview",hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public double avgScore(int hostNum) {
		double result=0;
		try {
			result=dao.getReadData("house.avgScore", hostNum);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}



}
