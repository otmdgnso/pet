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
			if(dto.getUpload()!=null &&!dto.getUpload().isEmpty()){
				
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
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
		int result=0;
		try {
			result=dao.getIntValue("photo.dataCount",map);		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Photo> listPhoto(Map<String, Object> map) {
		List<Photo> list=null;
		try {
			list=dao.getListData("photo.listPhoto",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Photo readPhoto(int photoNum) {
		Photo dto=null;
		try {
			dto=dao.getReadData("photo.readPhoto", photoNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int photoHitCount(int photoNum) {
		int result=0;
		try {
			result=dao.updateData("photo.photoUpdateHitCount", photoNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updatePhoto(Photo dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
			}
			result=dao.updateData("photo.updatePhoto", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deletePhoto(int photoNum, String pathname, String saveFilename) {
		int result=0;		
		try {
			if(saveFilename!=null){
			fileManager.doFileDelete(saveFilename, pathname);
			}
			result=dao.deleteData("photo.deletePhoto", photoNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertPhotoReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("photo.insertPhotoReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCountPhotoReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("photo.dataCountPhotoReply",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Reply> listPhotoReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.getListData("photo.listPhotoReply",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int deletePhotoReply(int replyNum) {
		int result=0;
		try {
			result=dao.deleteData("photo.deletePhotoReply", replyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertPhotoLike(Photo dto) {
		int result=0;
		try {
			result=dao.insertData("photo.insertLike", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int photoCountLike(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("photo.countLike",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deletePhotoLike(Photo dto) {
		int result=0;
		try {
			result=dao.deleteData("photo.deleteLike", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
