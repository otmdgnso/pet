package com.pet.pay;

import java.util.List;
import java.util.Map;

public interface PayService {
	public Pay listHost(Map<String, Object> map);
	public int insertpay(Pay dto);
	public int deletePay(int reservationNum);

	public int reserveCount(int hostNum); 
	
	public List<Pay> listReserve(Map<String, Object> map);
	
	public int updateReserve(int reservationNum);
}
