package com.pet.common;

import java.io.File;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("fileManager")
public class FileManager {

	// pathname : 파일을 저장할 경로
	// 리턴 : 서버에 저장된 새로운 파일명
	public String doFileUpload(MultipartFile partFile, String pathname) throws Exception {
		String saveFilename = null;

		if(partFile == null || partFile.isEmpty())
			return null;
		
		// 클라이언트가 업로드한 파일의 이름
		String originalFilename = partFile.getOriginalFilename();
		if (originalFilename == null || originalFilename.length() == 0)
			return null;

		// 확장자
		String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
		if (fileExt == null || fileExt.equals(""))
			return null;

		if (partFile == null || partFile.isEmpty())
			return null;

		// 서버에 저장할 새로운 파일명을 만든다.
		saveFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveFilename += System.nanoTime();
		saveFilename += fileExt;
		
		String fullpathname = pathname + File.separator + saveFilename;
		// 업로드할 경로가 존재하지 않는 경우 폴더를 생성 한다.
		File f = new File(fullpathname);
		if(!f.getParentFile().exists())
			f.getParentFile().mkdirs();
		
		partFile.transferTo(f);
		
		return saveFilename;
	}
}
