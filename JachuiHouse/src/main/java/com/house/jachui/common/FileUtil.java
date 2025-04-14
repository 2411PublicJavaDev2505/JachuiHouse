package com.house.jachui.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Component
public class FileUtil {
	
	public Map<String, String> saveFile(MultipartFile uploadFile,HttpSession session, String type) throws IllegalStateException, IOException {
		Map<String, String> result = new HashMap<String, String>();
		//아래 ()안에 notice이름을 바꿔줬음!"bUploadFiles"는 바꿔줘야함!(c는 이력서!?)
		String folderName = type.equals("employ")? "eUploadFiles": "cUploadFiles";
		String prefix = type.toLowerCase().substring(0,1);
		String employFileName = uploadFile.getOriginalFilename();
		String employFileRename = null;
		String employFilePath = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String transStr = sdf.format(new Date(System.currentTimeMillis())); 
		String ext = employFileName.substring(employFileName.lastIndexOf(".")+1);
		employFileRename = transStr +"." +ext;
		employFilePath ="/resources/"+folderName+"/"+employFileRename;
		String folderPath = session.getServletContext().getRealPath("/resources/"+folderName);
		String savePath = folderPath +"\\"+ employFileRename;
		uploadFile.transferTo(new File(savePath));
		result.put(prefix+"Filename", employFileName);
		result.put(prefix+"FileRename", employFileRename);
		result.put(prefix+"Filepath", employFilePath);
		return result;
	}
}
