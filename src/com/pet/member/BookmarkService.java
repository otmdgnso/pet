package com.pet.member;

import java.util.List;
import java.util.Map;

public interface BookmarkService {

	 public int insertBookmart(Bookmark dto);
	 public List<Bookmark> listBookmark(Map<String, Object> map);
	 public int dataCount(Map<String, Object> map);
	 public int deleteBookmark(int bookmarkNum);
}
