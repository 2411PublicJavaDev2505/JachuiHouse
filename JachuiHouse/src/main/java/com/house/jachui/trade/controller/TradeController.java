package com.house.jachui.trade.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.common.FileUtil;
import com.house.jachui.common.PageUtil;
import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.controller.dto.NoticeModifyRequest;
import com.house.jachui.notice.model.vo.NoticeVO;
import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.controller.dto.TradeUpdateRequest;
import com.house.jachui.trade.model.service.TradeService;
import com.house.jachui.trade.model.vo.Trade;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/trade")
public class TradeController {

    private final TradeService tService;
    private final PageUtil page;
    private final FileUtil file;
	private PageUtil pageUtil;
	private FileUtil fileUtil;
	private String toTalCount;
	private List<Trade> searchList;

    // 목록,검색
    @GetMapping("/list")
    public String ShowTradeList(
    	@RequestParam(value="page", defaultValue="1") int currentPage,
        Model model,
        HttpSession session) {
    	
    	// 전체 리스트 가져오기 (페이징은 나중에)
       try {
	    	List<Trade> tList = tService.selectListAll(currentPage);
	        int totalCount = tService.getTotalCount();
	        System.out.println(totalCount);
	        Map<String, Integer>pageInfo = page.generatePageInfo(totalCount, currentPage);
	        
	        if(!tList.isEmpty()) {
		        model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				model.addAttribute("tList", tList);
		        return "trade/list";
	        }else {
				model.addAttribute("errorMessage", "데이터가 존재하지 않습니다.");
				return "common/error";
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	model.addAttribute("errorMsg",e.getMessage());
	    	return "common/error";
	    }
    }
    
    @GetMapping("/search")
    public String tradeSearch(
        @RequestParam("searchKeyword") String searchKeyword,
        @RequestParam("category") String category,
        @RequestParam(value="page", defaultValue="1") int currentPage,
        Model model
    ) {
        try {
            int totalCount = tService.getTotalCount(searchKeyword, category);
            List<Trade> searchList = tService.searchListByKeyword(searchKeyword, category, currentPage);

            if (searchList == null || searchList.isEmpty()) {
                model.addAttribute("searchList", null);
                model.addAttribute("errorMessage", "검색 결과가 없습니다.");
            } else {
                Map<String, Integer> pageInfo = page.generatePageInfo(totalCount, currentPage);
                model.addAttribute("maxPage", pageInfo.get("maxPage"));
                model.addAttribute("startNavi", pageInfo.get("startNavi"));
                model.addAttribute("endNavi", pageInfo.get("endNavi"));
                model.addAttribute("searchList", searchList);
            }

            model.addAttribute("searchKeyword", searchKeyword);
            model.addAttribute("category", category);
            model.addAttribute("currentPage", currentPage);

            return "trade/search";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "검색 중 오류 발생: " + e.getMessage());
            return "common/error";
        }
    }


	//등록 화면 요청
	@GetMapping("/insert")
	public String showInsertForm() {
		return "trade/insert"; // → /WEB-INF/views/trade/insert.jsp
	}
	
	@PostMapping("/insert")
	public String tradeinsert(
			@ModelAttribute TradeAddRequest trade
			, @RequestParam("uploadFile") MultipartFile uploadFile
			, HttpSession session, Model model) {
			try {
				if(uploadFile != null && !uploadFile.getOriginalFilename().isBlank()) {
					Map<String, String> fileInfo = fileUtil.saveFile(uploadFile, session, "trade");
					trade.setTradeFilename(fileInfo.get("tFilename"));
					trade.setTradeFileRename(fileInfo.get("tFileRename"));
					trade.setTradeFilepath(fileInfo.get("tFilepath"));
				}
				int result = tService.insertTrade(trade);
				return "redirect:/trade/list";				
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", e.getMessage());
				return "common/error";
			}
	}
	

	// 상세페이지
	@GetMapping("/detail/{tradeNo}")
	public String tradeDetail(@PathVariable("tradeNo") int tradeNo, Model model) {
	    try {
			Trade trade = tService.selectOneByNo(tradeNo);
		    model.addAttribute("trade", trade);
		    return "trade/detail";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}

	// 수정페이지
	@GetMapping("/update/{tradeNo}")
	public String tradeUpdate(@PathVariable int tradeNo, Model model) {
		try {
			Trade trade = tService.selectOneByNo(tradeNo);
			model.addAttribute("trade", trade);
			return "trade/update";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", e.getMessage());
			return "common/error";
		}
	}
	
	@PostMapping("/update")
	public String tradeUpdate(@ModelAttribute TradeUpdateRequest trade
			, @RequestParam("reloadFile") MultipartFile reloadFile
			, HttpSession session, Model model) {
		try {
			if(reloadFile != null && !reloadFile.getOriginalFilename().isBlank()) {
				Map<String, String> fileInfo = fileUtil.saveFile(reloadFile, session, "trade");
				trade.setTradeFilename(fileInfo.get("nFilename"));
				trade.setTradeFileRename(fileInfo.get("nFileRename"));
				trade.setTradeFilepath(fileInfo.get("nFilepath"));
			}
			int result = tService.updateTrade(trade);
			return "redirect:/trade/detail/"+trade.getTradeNo();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", e.getMessage());
			return "common/error";
		}
	}
	
	@GetMapping("/delete")
	public String noticeDelete(@RequestParam("tradeNo")int tradeNo, Model model) {
		try {
			int result = tService.deleteTrade(tradeNo);
			return "redirect:/trade/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}

	// 채팅페이지
	@GetMapping("/chat/{tradeNo}")
	public String showChatPage(@PathVariable int tradeNo, Model model) {
	    // 채팅방 번호 or 게시물 번호로 매핑
	    return "trade/chat";
	}
}