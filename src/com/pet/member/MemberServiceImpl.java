package com.pet.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertMemeber(Member dto) {
		int result = 0;

		try {
			if (dto.getPhone1() != null && dto.getPhone1().length() != 0 && dto.getPhone2() != null
					&& dto.getPhone2() .length() != 0 && dto.getPhone3()  != null && dto.getPhone3() .length() != 0)
				dto.setPhone(dto.getPhone1()  + "-" + dto.getPhone2()  + "-" + dto.getPhone3() );
			System.out.println(dto.getPhone());
			// 회원정보 저장
		
			dao.insertData("member.insertMember", dto);
			result = 1;
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
