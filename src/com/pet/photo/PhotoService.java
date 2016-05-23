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
}
