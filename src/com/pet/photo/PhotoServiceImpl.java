package com.pet.photo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.FileManager;
import com.pet.common.dao.CommonDAO;

@Service("pet.photoService")
public class PhotoServiceImpl implements PhotoService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertPhoto(Photo dto, String pathname) {
		int result=0;
		try {
			int seq=dao.getIntValue("photo.seq");
			dto.setPhotoNum(seq);			
			
			if(dto.getPhotoUpload()!=null&& !dto.getPhotoUpload().isEmpty()){
				String saveFilename=fileManager.doFileUpload(dto.getPhotoUpload(), pathname);
				dto.setSaveFilename(saveFilename);
			}
			result=dao.insertData("photo.insertPhoto", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Photo> listPhoto(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Photo readPhoto(int photoNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int photoHitCount(int photoNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePhoto(Photo dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePhoto(int photoNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
