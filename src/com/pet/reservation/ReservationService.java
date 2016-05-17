package com.pet.reservation;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	public int insertReservation(Reservation dto, String mode);
	public List<Reservation> listReservation(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Reservation readReservation(int reservationNum);
	public int updateReservation(Reservation dto);
	public int deleteReservation(int reservationNum);
}
