package com.pet.adopt;

import java.util.List;
import java.util.Map;

public interface AdoptService {
	public int insertPreSale(Adopt dto, String pathname);
	public int insertFile(Adopt dto);
	public int dataCount(Map<String, Object> map);
	public List<Adopt> listPreSale(Map<String, Object> map);
	public Adopt listPhoto(int preSaleNum);
	public Adopt readPreSale(int preSaleNum);
	public List<Adopt> readPreFile(int preSaleNum);
	public int preUpdateHitCount(int preSaleNum);
	public int deletePreSale(int preSaleNum, String pathname);
	public int updatePreSale(Adopt dto, String pathname);
	public int deletePreFile(String saveFilename, String pathname);
	
	// 댓글
	public int insertPreReply(Reply dto);
	public int dataCountPreReply(Map<String, Object> map);
	public List<Reply> listPreReply(Map<String, Object> map);
	public int deletePreReply(int replyNum);
	
	// 신청
	public int insertPreSaleRequest(Adopt dto);
	public List<Adopt> listPreSaleRequest(int num);
	public int requestDelete(int requestNum);
	// 분양 결제
	public int payCompleteAdopt(Adopt dto);
}
