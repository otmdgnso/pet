package com.pet.member;

public interface MemberService {
	 public int insertMemeber(Member dto, String pathname);	
	 public Member readMember(String userId);
	 public int updateMember(Member dto,String pathname);
	 public int updateTheme(Member dto, String pathname);
	 public int deleteMember(String userId);
}
