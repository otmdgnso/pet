package com.pet.photo;

import java.util.List;
import java.util.Map;

public interface PhotoService {
		public int insertPhoto(Photo dto, String pathname);
		public int dataCount(Map<String, Object> map);
		public List<Photo> listPhoto(Map<String, Object> map);
		public Photo readPhoto(int photoNum);
		public int photoHitCount(int photoNum);
		public int updatePhoto(Photo dto, String pathname);
		public int deletePhoto(int photoNum,String pathname, String saveFilename);
		//댓글
		public int insertPhotoReply(Reply dto);
		public int dataCountPhotoReply(Map<String, Object> map);
		public List<Reply> listPhotoReply(Map<String, Object> map);
		public int deletePhotoReply(int replyNum);
		//좋아요
		public int insertPhotoLike(Photo dto);
		public int photoCountLike(Map<String, Object> map);
		public int deletePhotoLike(Photo dto);
		public Photo readPhotoLike(Map<String, Object> map);
		
		//메인 포토 리스트
		public List<Photo> mainListPhoto(Map<String, Object> map);
		
}
