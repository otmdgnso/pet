package com.pet.pay;

import java.util.Map;

public interface PayService {
	public Pay listHost(Map<String, Object> map);
	public int insertpay(Pay dto);
}
