package com.pet.pay;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("pay.payService")
public class PayServiceImpl implements PayService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Pay> listHost(Map<String, Object> map) {
		List<Pay> list=null;
		try {
			list=dao.getListData("pay.listHost",map);
			System.out.println(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
