package com.house.jachui.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class PageUtil {

	public Map<String, Integer> generatePageInfo(int totalCount, int currentPage) {
		Map<String, Integer> pageInfo = new HashMap<String, Integer>();
		int boardLimit = 10;//보여지는 글 갯수
		int maxPage = 0;
		if(totalCount % boardLimit != 0) {
			maxPage = totalCount/boardLimit +1;
		}else {
			maxPage = totalCount/boardLimit;
		}
		
		int naviLimit = 5;//페이지네이션 숫자갯수
		int startNavi = ((currentPage-1)/naviLimit)*naviLimit+1;
		int endNavi = (startNavi-1)+naviLimit;
		if(endNavi>maxPage) {
			endNavi = maxPage;
		}
		pageInfo.put("maxPage", maxPage);
		pageInfo.put("startNavi", startNavi);
		pageInfo.put("endNavi", endNavi);
		return pageInfo;
	}

}
