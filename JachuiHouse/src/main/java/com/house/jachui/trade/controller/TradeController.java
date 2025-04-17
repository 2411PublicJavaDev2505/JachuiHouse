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
import com.house.jachui.trade.controller.dto.TradeAddRequest;
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

    // 목록,검색
    @GetMapping("/list")
    public String ShowTradeList(
    	@RequestParam(value="page", defaultValue="1") int currentPage,
        Model model,
        HttpSession session) {
    	
    	// 전체 리스트 가져오기 (페이징은 나중에)
       try {
	    	List<Trade> tList = tService.printAllTradeList(currentPage);
	        int totalCount = tService.getTotalCount();
	        System.out.println(totalCount);
	        Map<String, Integer>pageInfo = page.generatePageInfo(totalCount, currentPage);
	        model.addAttribute("maxPage", pageInfo.get("maxPage"));
			model.addAttribute("startNavi", pageInfo.get("startNavi"));
			model.addAttribute("endNavi", pageInfo.get("endNavi"));
			model.addAttribute("tList", tList);
	        return "trade/list";
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	model.addAttribute("errorMsg",e.getMessage());
	    	return "common/error";
	    }
    }


	//등록 화면 요청
	@GetMapping("/insert")
	public String showInsertForm() {
		return "trade/insert"; // → /WEB-INF/views/trade/insert.jsp
	}
	
	

	// 상세페이지
	@GetMapping("/detail/{tradeNo}")
	public String tradeDetail(@PathVariable("tradeNo") int tradeNo, Model model) {
	    Trade trade = tService.selectOneByNo(tradeNo);
	    model.addAttribute("trade", trade);
	    return "trade/detail";
	}

	// 수정페이지
	@GetMapping("/update/{tradeNo}")
	public String showUpdateForm(@PathVariable int tradeNo, Model model) {
	    // 마찬가지로 trade 객체 없이 화면만 보여주기
	    return "trade/update";
	}

	// 채팅페이지
	@GetMapping("/chat/{tradeNo}")
	public String showChatPage(@PathVariable int tradeNo, Model model) {
	    // 채팅방 번호 or 게시물 번호로 매핑
	    return "trade/chat";
	}
}
	    

    
  

//    @GetMapping("/detail/{tradeNo}")
//    public String RecipeDetail(@PathVariable int tradeNo, Model model) {
//        try {
//            Trade trade = tService.selectOneByNo(tradeNo);
//            Integer viewCount = tService.countViewUpdate(tradeNo);
//            model.addAttribute("trade", trade);
//            return "/detail";
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMessage", e.getMessage());
//            return "common/error";
//        }
//    }
//
//    @GetMapping("/search")
//    public String showSearchList(
//            @RequestParam("searchKeyword") String searchKeyword,
//            @RequestParam(value="currentPage", defaultValue="1")int currentPage,
//            Model model) {
//        try {
//            Map<String, String> paramMap = new HashMap<>();
//            System.out.println(searchKeyword);
//            paramMap.put("searchKeyword", searchKeyword);
//            List<Trade> searchList = tService.selectSearchList(paramMap, currentPage);
//            int totalCount = tService.getTotalCount(paramMap);
//            Map<String, Integer> pageInfo = page.generatePageInfo(totalCount, currentPage);
//            model.addAttribute("maxPage", pageInfo.get("maxPage"));
//            model.addAttribute("startNavi", pageInfo.get("startNavi"));
//            model.addAttribute("endNavi", pageInfo.get("endNavi"));
//            model.addAttribute("searchList", searchList);
//            model.addAttribute("searchKeyword", searchKeyword);
//            return "trade/search";
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMsg", e.getMessage());
//            return "common/error";
//        }
//    }
//    
 // 등록 폼
//    @GetMapping("/insert")
//    public String showTradeInsertForm(HttpSession session, Model model) {
//        String userId = (String) session.getAttribute("userId");
//        if (userId == null) {
//            model.addAttribute("errorMsg", "로그인이 필요합니다~!");
//            return "common/error";
//        }
//
//        Trade trade = new Trade();
//        trade.setUserId(userId);  // 로그인한 사용자 userId 설정
//        model.addAttribute("trade", trade);
//
//        return "/trade/tradeInsert";
//    }
//
//    // 등록 처리
//    @PostMapping("/insert")
//    public String insertBoard(@ModelAttribute TradeAddRequest trade,
//                              @RequestParam("uploadFile") MultipartFile uploadFile,
//                              HttpSession session, Model model) {
//        try {
//            String userId = (String) session.getAttribute("userId");
//            if (userId == null) {
//                model.addAttribute("errorMsg", "로그인이 필요합니다~");
//                return "common/error";
//            }
//
//            trade.setUserId(userId);
//
//            if (uploadFile != null && !uploadFile.isEmpty()) {
//                Map<String, String> fileInfo = file.saveFile(uploadFile, session, "trade");
//                trade.setTradeFilename(fileInfo.get("tFilename"));
//                trade.setTradeFileRename(fileInfo.get("tFileRename"));
//                trade.setTradeFilepath(fileInfo.get("tFilepath"));
//            }
//
//            int result = tService.insertTrade(trade);
//            return "redirect:/trade/list";
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMsg", e.getMessage());
//            return "common/error";
//        }
//    }
//}
    
//   
//    // 수정 폼
//    @GetMapping("/update")
//    public String showBoardUpdateForm(@RequestParam("tradeNo") int tradeNo,
//                                      HttpSession session, Model model) {
//        try {
//            String userId = (String) session.getAttribute("userId");
//            if (userId == null) {
//                model.addAttribute("errorMsg", "로그인이 필요합니다~!");
//                return "common/error";
//            }
//
//            Trade trade = tService.selectOneByNo(tradeNo);
//            if (trade == null) {
//                model.addAttribute("errorMsg", "해당 게시글이 존재하지 않습니다.");
//                return "common/error";
//            }
//
//            model.addAttribute("trade", trade);
//            session.setAttribute("userId", tService.getuserId(userId));
//
//            return "/trade/tradeUpdate";
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMsg", e.getMessage());
//            return "common/error";
//        }
//    }
//
//    // 수정 처리
//    @PostMapping("/update")
//    public String updateTrade(@ModelAttribute TradeAddRequest trade,
//                              @RequestParam("reloadFile") MultipartFile reloadFile,
//                              HttpSession session, Model model) {
//        try {
//            String userId = (String) session.getAttribute("userId");
//            if (userId == null) {
//                model.addAttribute("errorMsg", "로그인이 필요합니다.");
//                return "common/error";
//            }
//
//            if (reloadFile != null && !reloadFile.isEmpty()) {
//                Map<String, String> fileInfo = file.saveFile(reloadFile, session, "trade");
//                trade.setTradeFilename(fileInfo.get("tFilename"));
//                trade.setTradeFileRename(fileInfo.get("tFileRename"));
//                trade.setTradeFilepath(fileInfo.get("tFilepath"));
//            }
//
//            int result = tService.updateTrade(trade);
//            if (result > 0) {
//            	return "redirect:/trade/detail/" + trade.getTradeNo();
//            } else {
//                model.addAttribute("errorMsg", "데이터 수정에 실패하였습니다.");
//                return "common/error";
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMsg", e.getMessage());
//            return "common/error";
//        }
//    }
//   
//    // 삭제
//    @GetMapping("/delete")
//    public String deleteTrade(@RequestParam("boardNo") int tradeNo,
//                              HttpSession session, Model model) {
//        try {
//            String userId = (String) session.getAttribute("userId");
//            if (userId == null) {
//                model.addAttribute("errorMsg", "로그인이 필요합니다.");
//                return "common/error";
//            }
//
//            int result = tService.deleteTrade(tradeNo);
//            if (result > 0) {
//                return "redirect:/trade/list";
//            } else {
//                model.addAttribute("errorMsg", "삭제에 실패했습니다.");
//                return "common/error";
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMsg", e.getMessage());
//            return "common/error";
//        }
//    }
//}