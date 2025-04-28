package com.house.jachui.common;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Component
public class FileUtil {
	
	public Map<String, String> saveFile(MultipartFile uploadFile, HttpSession session, String type) throws IllegalStateException, IOException{
		Map<String, String> result = new HashMap<String, String>();
		result.put("estate", "eUploadFiles");
		result.put("notice", "nUploadFiles");
		result.put("post", "pUploadFiles");
		result.put("realtor", "rUploadFiles");
		result.put("trade", "tUploadFiles");
		String folderName = result.get(type);
		String prefix = type.toLowerCase().substring(0,1);
		String fileName = uploadFile.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String transStr = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		String fileRename = transStr + "." + ext;
		String filePath = "/resources/"+folderName+"/"+fileRename;
		
		String folderPath = session.getServletContext().getRealPath("/resources/"+folderName);
		File dir = new File(folderPath); 
		if (!dir.exists()) { // 디렉토리(폴더) 없을 시 자동생성
			dir.mkdirs();
		}
		
		String savePath = folderPath+"\\"+fileRename;
		uploadFile.transferTo(new File(savePath));
		result.clear();
		result.put(prefix+"Filename", fileName);
		result.put(prefix+"FileRename", fileRename);
		result.put(prefix+"FilePath", filePath);
		return result;

	}
	
	public List<Map<String, String>> saveFiles(List<MultipartFile> uploadFiles, HttpSession session, String type) throws IllegalStateException, IOException {
	    List<Map<String, String>> fileList = new ArrayList<>();

	    for (MultipartFile file : uploadFiles) {
	        if (!file.isEmpty()) {
	            Map<String, String> fileInfo = saveFile(file, session, type); // 기존 메서드 재사용
	            fileList.add(fileInfo);
	        }
	    }

	    return fileList;
	}

	
	public static String fileRename(String originalFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new Date(System.currentTimeMillis()));
//		String str = "_" + String.format("%05d", null);
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		return date + ext;
	}
}
