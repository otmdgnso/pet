package com.pet.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.FileManager;
import com.pet.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	@Override
	public int insertMemeber(Member dto, String pathname) {
		int result = 0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				String profile=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setProfile(profile);
			}		
			result = dao.insertData("member.insertMember", dto);;
		} catch (Exception e) {
		}

		return result;
	}

	@Override
	public Member readMember(String userId) {
		Member dto=null;
		try {
			dto=dao.getReadData("member.readMember", userId);			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateMember(Member dto, String pathname) {
		int result=0;
		try {			
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				if(dto.getProfile().length()!=0)
					fileManager.doFileDelete(dto.getProfile(), pathname);
				
				String profile=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setProfile(profile);
			}	
			
			result=dao.updateData("member.updateMember", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTheme(Member dto, String pathname) {
		int result=0;
		try {			
			if(dto.getThemeUpload()!=null && !dto.getThemeUpload().isEmpty()){
				String profile=fileManager.doFileUpload(dto.getThemeUpload(), pathname);
				dto.setThemeprofile(profile);
			}	
			result=dao.updateData("member.updateTheme", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
