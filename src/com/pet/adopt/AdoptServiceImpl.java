package com.pet.adopt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.common.FileManager;
import com.pet.common.dao.CommonDAO;

@Service("adpot.AdpotService")
public class AdoptServiceImpl implements AdoptService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertPreSale(Adopt dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null&&!dto.getUpload().isEmpty()) {
				// 업로드한 파일이 존재하는 경우
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
			}
			result=dao.insertData("adopt.insertPreSale", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
