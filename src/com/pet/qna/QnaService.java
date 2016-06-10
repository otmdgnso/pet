package com.pet.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public int insertQna(Qna dto);
	public List<Qna> listQna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Qna readQna(int qNum);
	public int updateHitCount(int qNum);
	public int updateQna(Qna dto);
	public int deleteQna(int qNum);
}
