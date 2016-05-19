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
	
	// ´ñ±Û
	public int insertPreReply(Reply dto);
	public int dataCountPreReply(Map<String, Object> map);
	public List<Reply> listPreReply(Map<String, Object> map);
}
