package com.pet.auction;

import java.util.List;
import java.util.Map;

public interface AuctionService {
	public int insertAuction(Auction dto, String pathname);
	public int insertFile(Auction dto);
	public int auctiondataCount(Map<String, Object> map);
	public List<Auction> listAuction(Map<String, Object> map);
	public Auction listPhoto(int auctionNum);
	public Auction readAuction(int auctionNum);
	public List<Auction> readAuctionFile(int auctionNum);
	public int auctionUpdateHitCount(int auctionNum);
	public int deleteAuction(int auctionNum, String pathname);
	public int updateAuction(Auction dto, String pathname);
	public int deleteAuctionFile(String saveFilename, String pathname);

}
