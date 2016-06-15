package com.pet.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("member.bookmarkService")
public class BookmarkServiceImpl implements BookmarkService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertBookmart(Bookmark dto) {
		int result=0;
		
		try {
			result=dao.insertData("bookmark.insertBookmark", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Bookmark> listBookmark(Map<String, Object> map) {
		List<Bookmark> list=null;
		try {
			list=dao.getListData("bookmark.listBookmark", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
int result=0;
		
		try {
			result=dao.getIntValue("bookmark.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteBookmark(int bookmarkNum) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
