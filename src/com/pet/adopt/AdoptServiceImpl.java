package com.pet.adopt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

}
