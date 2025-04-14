package com.house.jachui.common;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Component
public class FileUtil {

	public Map<String, String> saveFile(MultipartFile uploadFile, HttpSession session, String type) throws IllegalStateException, IOException{
		Map<String, String> result = new HashMap<String, String>();
		String folderName = type.equals("board") ? "nUploadFiles":"bUploadFiles";
		String prefix = type.toLowerCase().substring(0,1);
		String tradeFilename = uploadFile.getOriginalFilename();
		String tradeFileRename;
		String tradeFilePath;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String transStr = sdf.format(new Date(System.currentTimeMillis()));
		String ext = tradeFilename.substring(tradeFilename.lastIndexOf(".")+1);
		tradeFileRename = transStr + "." + ext;
		tradeFilePath = "/resources/"+folderName+"/"+tradeFileRename;
		
		String folderPath = session.getServletContext().getRealPath("/resources/"+folderName);
		File dir = new File(folderPath); 
		if (!dir.exists()) { // 디렉토리없을 시 자동생성
			dir.mkdirs();
		}
		
		String savePath = folderPath+"\\"+tradeFileRename;
		uploadFile.transferTo(new File(savePath));
		result.put(prefix+"Filename", tradeFilename);
		result.put(prefix+"FileRename", tradeFileRename);
		result.put(prefix+"FilePath", tradeFilePath);
		return result;
	}
}
