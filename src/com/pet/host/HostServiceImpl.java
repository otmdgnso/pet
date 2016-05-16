package com.pet.host;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.dao.CommonDAO;

@Service("host.hostService")
public class HostServiceImpl implements HostService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertHost(Host dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Host readHost(String hostNum) {
		Host dto=null;
		try {
			dto=dao.getReadData("host.readHost", hostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHost(Host dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteHost(String hostNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
