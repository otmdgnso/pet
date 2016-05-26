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
}
