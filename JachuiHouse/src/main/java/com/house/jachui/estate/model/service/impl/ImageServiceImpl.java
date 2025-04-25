package com.house.jachui.estate.model.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.estate.model.mapper.EstateFileMapper;
import com.house.jachui.estate.model.service.ImageService;
import com.house.jachui.estate.model.vo.EstateFile;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService{

	private final EstateFileMapper fileMapper;
	private final String uploadDir = "C:/Users/user1/git/JachuiHouse/JachuiHouse/src/main/webapp/resources/images";
		
	@Override
	public List<EstateFile> selectImageList(int estateNo) {
		return fileMapper.selectImageList(estateNo);
	}

	@Override
	 public void saveEstateImages(int estateNo, List<MultipartFile> images) throws IllegalStateException, IOException {
        int order = 1;
        for (MultipartFile image : images) {
            if (!image.isEmpty()) {
                String originalFilename = image.getOriginalFilename();
                String uuid = UUID.randomUUID().toString();
                String saveFileName = uuid + "_" + originalFilename;
                Path filePath = Paths.get(uploadDir, saveFileName);
                image.transferTo(filePath.toFile());
                EstateFile file = new EstateFile();
                file.setEstateNo(estateNo);
                file.setEstateFileName(originalFilename);
                file.setEstateFileRename(saveFileName);
                file.setEstateFilePath("/resources/images/" + saveFileName);

                fileMapper.insertEstateImage(file);
            }
        }
    }

	@Override
	public void saveNewImages(int estateNo, List<MultipartFile> newImages) throws IllegalStateException, IOException {
		for (MultipartFile image : newImages) {
            if (!image.isEmpty()) {
                String originalFilename = image.getOriginalFilename();
                String uuid = UUID.randomUUID().toString();
                String saveFileName = uuid + "_" + originalFilename;
                Path path = Paths.get(uploadDir, saveFileName);
                image.transferTo(path.toFile());

                EstateFile file = new EstateFile();
                file.setEstateNo(estateNo);
                file.setEstateFileName(originalFilename);
                file.setEstateFileRename(saveFileName);
                file.setEstateFilePath("/resources/images/" + saveFileName);

                fileMapper.insertEstateImage(file);
            }
        }
	}

	@Override
	public void deleteImageByIdList(List<Integer> deleteImageIds) {
		    for (int fileNo : deleteImageIds) {
		        EstateFile file = fileMapper.selectFileById(fileNo); // 경로 조회
		        if (file != null) {
		            try {
		                Path path = Paths.get(uploadDir, file.getEstateFileRename());
		                Files.deleteIfExists(path);
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		            fileMapper.deleteFileById(fileNo); // DB 삭제
		        }
		    }
	}
}
