package com.house.jachui.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class PageUtil {
	public static Map<String, Integer> generatePageInfo(int totalCount, int currentPage, int boardLimit) {
		Map<String, Integer> pageInfo = new HashMap<String, Integer>();
		int maxPage = 0;
		//현서님도 컨트롤러에서 이부분을 3으로 고치세요
		//Map<String, Integer> pageInfo = PageUtil.generatePageInfo(totalCount, currentPage, 3);
		if(totalCount % boardLimit !=0) {
			maxPage = totalCount /boardLimit +1;
		}else {
			maxPage = totalCount /boardLimit;
		}
		int naviLimit = 5;
		
		int startNavi = ((currentPage-1)/naviLimit)*naviLimit+1;
		int endNavi = (startNavi-1)+naviLimit;
		if(endNavi > maxPage ) {
			endNavi = maxPage;
		
		}
		pageInfo.put("maxPage", maxPage);
		pageInfo.put("startNavi", startNavi);
		pageInfo.put("endNavi", endNavi);
		return pageInfo;
	}
	
	public Map<String, Integer> generatePageInfoTrade(int totalCount, int currentPage) {
		Map<String, Integer> pageInfo = new HashMap<String, Integer>();
		int boardLimit = 8;
		int maxPage = 0;
		if(totalCount % boardLimit !=0) {
			maxPage = totalCount /boardLimit +1;
		}else {
			maxPage = totalCount /boardLimit;
		}
		int naviLimit = 5;				// 페이지수를 10페이지로 바꾸고 싶으면 10으로 바꾸면 됨 현재는 5페이지까지만 나옴
		
		int startNavi = ((currentPage-1)/naviLimit)*naviLimit+1;
		int endNavi = (startNavi-1)+naviLimit;
		if(endNavi > maxPage ) {
			endNavi = maxPage;
		
		}
		pageInfo.put("maxPage", maxPage);
		pageInfo.put("startNavi", startNavi);
		pageInfo.put("endNavi", endNavi);
		return pageInfo;
	}
	
	public Map<String, Integer> generatePageInfoSearch(int totalCount, int currentPage, int recordsPerPage) {
	    Map<String, Integer> pageInfo = new HashMap<>();

		int boardLimit = 8;
		int maxPage = 0;
		if(totalCount % boardLimit !=0) {
			maxPage = totalCount /boardLimit +1;
		}else {
			maxPage = totalCount /boardLimit;
		}
		int naviLimit = 5;				// 페이지수를 10페이지로 바꾸고 싶으면 10으로 바꾸면 됨 현재는 5페이지까지만 나옴
		
		int startNavi = ((currentPage-1)/naviLimit)*naviLimit+1;
		int endNavi = (startNavi-1)+naviLimit;
		if(endNavi > maxPage ) {
			endNavi = maxPage;
		
		}
		pageInfo.put("maxPage", maxPage);
		pageInfo.put("startNavi", startNavi);
		pageInfo.put("endNavi", endNavi);
		return pageInfo;
	}
	
}
