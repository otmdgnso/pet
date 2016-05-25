package com.pet.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("message.messageService")
public class MessageServiceImpl implements MessageService {
	@Autowired
	CommonDAO dao;

	@Override
	public int insertMessage(Message dto) {
		int result=0;
		try {
			result=dao.insertData("message.insertMessage", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCountReceive(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("message.dataCountReceive",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Message> listReceive(Map<String, Object> map) {
		List<Message> list=null;
		try {
			list=dao.getListData("message.listReceive",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
