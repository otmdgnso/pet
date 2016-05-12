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
	public int updateMember(Member dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
