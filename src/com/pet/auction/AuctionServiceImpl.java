package com.pet.auction;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.common.FileManager;
import com.pet.common.dao.CommonDAO;

@Service("auction.AuctionService")
public class AuctionServiceImpl implements AuctionService{

	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager filemanager;
	@Override
	public int insertAuction(Auction dto, String pathname) {
		int result=0;
		try {
			int seq=dao.getIntValue("auction.aucseq");
			dto.setAuctionNum(seq);
			result=dao.insertData("auction.insertAuction", dto);
			
			//파일업로드
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					//업로드한 파일이 있는 경우
					String saveFilename=filemanager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						dto.setSaveFilename(saveFilename);
						insertFile(dto);
					}
				}
			}
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertFile(Auction dto) {
		int result=0;
		try {
			result=dao.insertData("auction.insertAuctionPhoto", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int auctiondataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("auction.auctiondataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Auction> listAuction(Map<String, Object> map) {
		List<Auction> list=null;
		try {
			list=dao.getListData("auction.listAuction", map);
			for(Auction vo:list) {
				Auction t=listPhoto(vo.getAuctionNum());
				if(t!=null)
					vo.setSaveFilename(t.getSaveFilename());
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Auction listPhoto(int auctionNum) {
		Auction dto=null;
		try {
			dto=dao.getReadData("auction.listPhoto", auctionNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	//게시물 가져오기
	@Override
	public Auction readAuction(int auctionNum) {
		Auction dto=null;
		try {
			// 옥션글
			dto=dao.getReadData("auction.readAuction", auctionNum);
			
			// 입찰리스트 
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
//포토 가져오기
	@Override
	public List<Auction> readAuctionFile(int auctionNum) {
		List<Auction> readAuctionFile=null;
		try {
			readAuctionFile=dao.getListData("auction.readAuctionFile", auctionNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return readAuctionFile;
	}

	@Override
	public int auctionUpdateHitCount(int auctionNum) {
		int result=0;
		try {
			result=dao.updateData("auction.auctionUpdateHitCount", auctionNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteAuction(int auctionNum, String pathname) {
		int result=0;
		try {
			//파일 지우기
			List<Auction> readAuctionFile=readAuctionFile(auctionNum);
			if(readAuctionFile!=null) {
				Iterator<Auction> it=readAuctionFile.iterator();
				while(it.hasNext()) {
					Auction dto=it.next();
					filemanager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			result=dao.deleteData("auction.deleteAuction", auctionNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateAuction(Auction dto, String pathname) {
		int result=0;
		try {
			result=dao.updateData("auction.updateAuction", dto);
			
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename=filemanager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						dto.setSaveFilename(saveFilename);
						
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteAuctionFile(String saveFilename, String pathname) {
		int result=0;
		try {
			result=dao.deleteData("auction.deleteAuctionFile", saveFilename);
			filemanager.doFileDelete(saveFilename, pathname);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertBid(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("auction.insertBid", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Auction readMaxBid(int auctionNum) {
		Auction dto=null;
		try {
			dto=dao.getReadData("auction.readMaxBid", auctionNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<Auction> listBid(int auctionNum) {
		List<Auction> list=null;
		try {
			list=dao.getListData("auction.listBid", auctionNum);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Auction> auctionMyList(String userId) {
		List<Auction> list=null;
		try {
			list=dao.getListData("auction.auctionMyList", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
