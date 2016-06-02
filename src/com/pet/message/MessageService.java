package com.pet.message;

import java.util.List;
import java.util.Map;

public interface MessageService {
	public int insertMessage(Message dto);
	
	// ���� �޽��� ����Ʈ
	public int dataCountReceive(Map<String, Object> map);
	public List<Message> listReceive(Map<String, Object> map);
	
	// ���� �޽��� ����Ʈ
	public int dataCountSend(Map<String, Object> map);
	public List<Message> listSend(Map<String, Object> map);
	
	// �ý��� �޽��� ����Ʈ
	public int dataCountSystem(Map<String, Object> map);
	public List<Message> listSystem(Map<String, Object> map);
	
	// �޽��� ����
	public Message readMessage(int messageNum);
	
	// �޽��� ����
	public int deleteMessage(Map<String, Object> map);
	// �޽��� Ȯ�� ��¥
	public int updateConfirmCreated(int messageNum);
	//���̵� üũ
	public int userIdCheck(String userId);
	// ���� ���� �޽��� üũ
	public int userMessageCheck(String userId);
}
