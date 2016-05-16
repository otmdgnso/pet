package com.pet.adopt;

import java.util.List;
import java.util.Map;

public interface AdoptService {
	public int insertPreSale(Adopt dto, String pathname);
	public int insertFile(Adopt dto);
	public int dataCount(Map<String, Object> map);
	public List<Adopt> listPreSale(Map<String, Object> map);
	public Adopt listPhoto(int preSaleNum);
}
