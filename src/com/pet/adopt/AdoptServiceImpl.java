package com.pet.adopt;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.common.FileManager;
import com.pet.common.dao.CommonDAO;

@Service("adopt.AdoptService")
public class AdoptServiceImpl implements AdoptService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertPreSale(Adopt dto, String pathname) {
		int result = 0;
		try {
			int seq = dao.getIntValue("adopt.seq");
			dto.setPreSaleNum(seq);
			result = dao.insertData("adopt.insertPreSale", dto);

			// 파일 업로드
			if (!dto.getUpload().isEmpty()) {
				for (MultipartFile mf : dto.getUpload()) {
					if (mf.isEmpty())
						continue;

					// 업로드한 파일이 존재하는 경우
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename != null) {
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
	public int insertFile(Adopt dto) {
		int result = 0;
		try {
			result = dao.insertData("adopt.insertPreSalePhoto", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	

	@Override
	public List<Adopt> listPreSale(Map<String, Object> map) {
		List<Adopt> list=null;
		try {
			list=dao.getListData("adopt.listPreSale",map);
			for(Adopt vo:list) {
				Adopt t=listPhoto(vo.getPreSaleNum());
				if(t!=null)
					vo.setSaveFilename(t.getSaveFilename());
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Adopt listPhoto(int preSaleNum) {
		Adopt dto=null;
		try {
			dto=dao.getReadData("adopt.listPhoto",preSaleNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("adopt.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Adopt readPreSale(int preSaleNum) {
		Adopt dto=null;
		try {
			// 게시물 가져오기
			dto=dao.getReadData("adopt.readPreSale", preSaleNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<Adopt> readPreFile(int preSaleNum) {
		List<Adopt> readPreFile=null;
		try {
			readPreFile=dao.getListData("adopt.readPreFile",preSaleNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return readPreFile;
	}

	

}
