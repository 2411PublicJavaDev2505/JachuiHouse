package com.house.jachui.estate.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.estate.model.vo.EstateFile;

public interface ImageService {

	List<EstateFile> selectImageList(int estateNo);

	void saveNewImages(int estateNo, List<MultipartFile> newImages) throws IllegalStateException, IOException;

	void saveEstateImages(int estateNo, List<MultipartFile> images) throws IllegalStateException, IOException;

	void deleteImageByIdList(List<Integer> deleteImageIds);
}
