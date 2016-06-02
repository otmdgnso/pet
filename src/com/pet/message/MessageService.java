package com.pet.message;

import java.util.List;
import java.util.Map;

public interface MessageService {
	public int insertMessage(Message dto);
	
	// 받은 메시지 리스트
	public int dataCountReceive(Map<String, Object> map);
	public List<Message> listReceive(Map<String, Object> map);
	
	// 보낸 메시지 리스트
	public int dataCountSend(Map<String, Object> map);
	public List<Message> listSend(Map<String, Object> map);
	
	// 시스템 메시지 리스트
	public int dataCountSystem(Map<String, Object> map);
	public List<Message> listSystem(Map<String, Object> map);
	
	// 메시지 보기
	public Message readMessage(int messageNum);
	
	// 메시지 삭제
	public int deleteMessage(Map<String, Object> map);
	// 메시지 확인 날짜
	public int updateConfirmCreated(int messageNum);
	//아이디 체크
	public int userIdCheck(String userId);
	// 읽지 않은 메시지 체크
	public int userMessageCheck(String userId);
}
