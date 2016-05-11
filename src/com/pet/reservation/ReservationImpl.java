package com.pet.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("reservation.reservationService")
public class ReservationImpl implements ReservationService {


	@Override
	public int insertReservation(Reservation dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
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
	public int updateReservation(Reservation dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReservation(int reservationNum, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

}
