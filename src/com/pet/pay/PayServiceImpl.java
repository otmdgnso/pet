package com.pet.pay;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("pay.payService")
public class PayServiceImpl implements PayService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Pay listHost(Map<String, Object> map) {
		Pay dto=null;
		try {
			dto=dao.getReadData("pay.listHost",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
