package com.pet.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("reservation.reservationService")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int insertReservation(Reservation dto, String mode) {
		int result=0;
		try {
			result=dao.insertData("reservation.insertReservation", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reservation> listReservation(Map<String, Object> map) {
		List<Reservation> list=null;
		try {
			list=dao.getListData("reservation.listReservation", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.getIntValue("reservation.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	
	@Override
	public Reservation readReservation(int reservationNum) {
		Reservation dto=null;
		try {
			dto=dao.getReadData("reservation.readReservation", reservationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateReservation(Reservation dto) {
		int result=0;
		
		try {
			result=dao.updateData("reservation.updateReservation", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReservation(int reservationNum) {
		int result=0;
		
		try {
			result=dao.deleteData("reservation.deleteReservation", reservationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reservation> hostDateRead(int hostNum) {
		List<Reservation> list=null;
		try {
			list=dao.getListData("reservation.hostDateRead",hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
