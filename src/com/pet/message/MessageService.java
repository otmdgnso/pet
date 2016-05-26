package com.pet.message;

import java.util.List;
import java.util.Map;

public interface MessageService {
	public int insertMessage(Message dto);
	
	public int dataCountReceive(Map<String, Object> map);
	public List<Message> listReceive(Map<String, Object> map);
}
