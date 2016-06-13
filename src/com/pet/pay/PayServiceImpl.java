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
	public Pay listHost(Map<String, Object> map) {
		Pay dto=null;
		try {
			dto=dao.getReadData("pay.listHost",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int insertpay(Pay dto) {
		int result=0;
		try {
			result=dao.getIntValue("pay.insertpay",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Pay> listReserve(int hostNum) {
		List<Pay> list=null;
		try {
			list=dao.getListData("pay.listReserve",hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int deletePay(int reservationNum) {
		int result=0;
		try {
			result=dao.deleteData("pay.deletePay", reservationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int reserveCount(int hostNum) {
		int result=0;
		try {
			result=dao.getIntValue("pay.reserveCount",hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateReserve(int reservationNum) {
		int result=0;
		try {
			result=dao.updateData("pay.updateReserve", reservationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	

}
