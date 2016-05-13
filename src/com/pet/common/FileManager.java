package com.pet.common;

import java.io.File;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("fileManager")
public class FileManager {

	// pathname : ������ ������ ���
	// ���� : ������ ����� ���ο� ���ϸ�
	public String doFileUpload(MultipartFile partFile, String pathname) throws Exception {
		String saveFilename = null;

		if(partFile == null || partFile.isEmpty())
			return null;
		
		// Ŭ���̾�Ʈ�� ���ε��� ������ �̸�
		String originalFilename = partFile.getOriginalFilename();
		if (originalFilename == null || originalFilename.length() == 0)
			return null;

		// Ȯ����
		String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
		if (fileExt == null || fileExt.equals(""))
			return null;

		if (partFile == null || partFile.isEmpty())
			return null;

		// ������ ������ ���ο� ���ϸ��� �����.
		saveFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveFilename += System.nanoTime();
		saveFilename += fileExt;
		
		String fullpathname = pathname + File.separator + saveFilename;
		// ���ε��� ��ΰ� �������� �ʴ� ��� ������ ���� �Ѵ�.
		File f = new File(fullpathname);
		if(!f.getParentFile().exists())
			f.getParentFile().mkdirs();
		
		partFile.transferTo(f);
		
		return saveFilename;
	}
}
