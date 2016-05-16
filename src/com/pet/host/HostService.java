package com.pet.host;

public interface HostService {
	public int insertHost(Host dto, String pathname);
	public Host readHost(String hostNum);
	public int updateHost(Host dto);
	public int deleteHost(String hostNum);
}
