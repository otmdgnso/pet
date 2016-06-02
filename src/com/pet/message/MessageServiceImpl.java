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

	@Override
	public int dataCountSend(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("message.dataCountSend",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Message> listSend(Map<String, Object> map) {
		List<Message> list=null;
		try {
			list=dao.getListData("message.listSend",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Message readMessage(int messageNum) {
		Message dto=null;
		try {
			dto=dao.getReadData("message.readMessage",messageNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteMessage(Map<String, Object> map) {
		int result=0;
		try {
			// 삭제 상태를 Y로 변경
			result=dao.updateData("message.updateDeleteState", map);
			// 보낸이와 받은이가 모두 Y이면 DB에서 삭제
			result=dao.deleteData("message.deleteMessage", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateConfirmCreated(int messageNum) {
		int result=0;
		try {
			result=dao.updateData("message.updateConfirmCreated", messageNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int userIdCheck(String userId) {
		int result=0;
		try {
			result=dao.getIntValue("message.userIdCheck",userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int userMessageCheck(String userId) {
		int result=0;
		try {
			result=dao.getIntValue("message.userMessageCheck",userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCountSystem(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("message.dataCountSystem",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Message> listSystem(Map<String, Object> map) {
		List<Message> list=null;
		try {
			list=dao.getListData("message.listSystem",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
