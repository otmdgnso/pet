package com.pet.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	 public int insertMemeber(Member dto, String pathname);	
	 public Member readMember(String userId);
	 public int updateMember(Member dto,String pathname);
	 public int updateTheme(Member dto, String pathname);
	 public int deleteMember(String userId);
	 
	 //ºÏ¸¶Å©
	 public int insertBookmart(Bookmark dto);
	 public List<Bookmark> listBookmark(Map<String, Object> map);
	 public int dataCount(Map<String, Object> map);
	 public int deleteBookmark(int bookmarkNum);
}
