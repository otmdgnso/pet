package com.pet.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("reservation.reservationService")
public class ReservationImpl implements ReservationService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int insertReservation(Reservation dto, String mode) {
		int result=0;
		try {
			result=dao.insertData("pet.insertReservation", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reservation> listReservation(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Reservation readReservation(int reservationNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation preReadReservation(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation nextReadReservation(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReservation(Reservation dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReservation(int reservationNum) {
		// TODO Auto-generated method stub
		return 0;
	}


}
