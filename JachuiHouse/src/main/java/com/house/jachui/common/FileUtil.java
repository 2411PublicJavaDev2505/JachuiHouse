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

	public Map<String, String> saveFile(MultipartFile uploadFile, HttpSession session, String type) throws IllegalStateException, IOException {
		Map<String, String> result = new HashMap<String, String>();
		String folderName = type.equals("inflBoard") ? "iUploadFiles" : "cUploadFiles";
		String prefix = type.toLowerCase().substring(0,1);
		//NoticeController에서 가져옴
		String noticeFilename = uploadFile.getOriginalFilename();
		String noticeFileRename = null;
		String noticeFilepath = null;
		
//			>> NoticeController에서 넘어온 부분
			//중복된 파일이름을 다르게 저장하기 위한 FileRename
			//시간을 이용하기 위한 SimpleDateFormat
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			//현재 시간을 내가 원하는 패턴으로 변환
			String transStr = sdf.format(new Date(System.currentTimeMillis()));//20250220173811
			//원본 파일의 확장자 가져오기
			String ext = noticeFilename.substring(noticeFilename.lastIndexOf(".")+1);
			//파일이름 변경완료
			noticeFileRename = transStr + "."+ext;
			noticeFilepath = "/resources/"+folderName+"/" + noticeFileRename;
			String folderPath = session.getServletContext().getRealPath("/resources/"+folderName);
			String savePath = folderPath + "\\" + noticeFileRename;
			
			uploadFile.transferTo(new File(savePath));
//			(여기까지)
			
			result.put(prefix+"Filename", noticeFilename);
			result.put(prefix+"FileRename", noticeFileRename);
			result.put(prefix+"Filepath", noticeFilepath);
			return result;//String과 대치되어 Map<String,String>로 맞춰줘야 한다
	}

}
