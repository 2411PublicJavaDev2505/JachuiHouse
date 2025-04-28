package com.house.jachui.trade.controller;

import java.util.ArrayList;
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

    // 목록,검색
    @GetMapping("/list")
    public String ShowTradeList(
        @RequestParam(value="page", defaultValue="1") int currentPage,
        Model model,
        HttpSession session) {
        try {
            List<Trade> tList = tService.selectListAll(currentPage);
            int totalCount = tService.getTotalCount();  // 전체 게시글 수
            Map<String, Integer> pageInfo = page.generatePageInfoTrade(totalCount, currentPage);

            if (!tList.isEmpty()) {
                model.addAttribute("maxPage", pageInfo.get("maxPage"));
                model.addAttribute("startNavi", pageInfo.get("startNavi"));
                model.addAttribute("endNavi", pageInfo.get("endNavi"));
                model.addAttribute("currentPage", currentPage);
                model.addAttribute("tList", tList);
                return "trade/list";
            } else {
                model.addAttribute("errorMessage", "데이터가 존재하지 않습니다.");
                return "common/error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            return "common/error";
        }
    }

    // 검색
    @GetMapping("/search")
    public String tradeSearch(
        @RequestParam("searchKeyword") String searchKeyword,
        @RequestParam("category") String category,
        @RequestParam(value="page", defaultValue="1") int currentPage,
        Model model) {
        try {
            // 검색된 총 게시글 수
            int totalCount = tService.getTotalCount(searchKeyword, category);

            // 검색된 게시글 목록
            List<Trade> searchList = tService.searchListByKeyword(searchKeyword, category, currentPage);

            // 검색 결과가 없을 경우
            if (searchList == null || searchList.isEmpty()) {
                searchList = new ArrayList<>(); // 빈 리스트로 초기화
                model.addAttribute("errorMessage", "검색 결과가 없습니다.");
            } else {
                Map<String, Integer> pageInfo = page.generatePageInfo(totalCount, currentPage, 8);
                model.addAttribute("maxPage", pageInfo.get("maxPage"));
                model.addAttribute("startNavi", pageInfo.get("startNavi"));
                model.addAttribute("endNavi", pageInfo.get("endNavi"));
                model.addAttribute("searchList", searchList);

            // 검색어 및 카테고리 모델에 추가
            model.addAttribute("searchKeyword", searchKeyword);
            model.addAttribute("category", category);
            model.addAttribute("currentPage", currentPage);
            }
            return "trade/search";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "검색 중 오류 발생: " + e.getMessage());
            return "common/error";
        }
    }

    // 등록 화면 요청
    @GetMapping("/insert")
    public String showInsertForm() {
        return "trade/insert"; 
    }
    
    // 등록 처리
    @PostMapping("/insert")
    public String tradeinsert(
            @ModelAttribute TradeAddRequest trade,
            @RequestParam("uploadFile") MultipartFile uploadFile,
            HttpSession session, Model model) {
        try {
            if (uploadFile != null && !uploadFile.getOriginalFilename().isBlank()) {
                Map<String, String> fileInfo = file.saveFile(uploadFile, session, "board");
                trade.setTradeFilename(fileInfo.get("bFilename"));
                trade.setTradeFileRename(fileInfo.get("bFileRename"));
                trade.setTradeFilepath("/resources/bUploadFiles/" + fileInfo.get("bFileRename"));
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
            tService.countViewUpdate(tradeNo);  // 조회수 증가
            Trade trade = tService.selectOneByNo(tradeNo);
            model.addAttribute("trade", trade);
            return "trade/detail";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
            return "common/error";
        }
    }

    // 수정 페이지
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
    
    // 수정 처리
    @PostMapping("/update")
    public String tradeUpdate(@ModelAttribute TradeUpdateRequest trade,
            @RequestParam("reloadFile") MultipartFile reloadFile,
            HttpSession session, Model model) {
        try {
            if (reloadFile != null && !reloadFile.getOriginalFilename().isBlank()) {
            	Map<String, String> fileInfo = file.saveFile(reloadFile, session, "board");
                trade.setTradeFilename(fileInfo.get("bFilename"));
                trade.setTradeFileRename(fileInfo.get("bFileRename"));
                trade.setTradeFilepath("/resources/bUploadFiles/" + fileInfo.get("bFileRename"));
            } else {
                // 기존 파일 유지
                Trade origin = tService.selectOneByNo(trade.getTradeNo());
                trade.setTradeFilename(origin.getTradeFilename());
                trade.setTradeFileRename(origin.getTradeFileRename());
                trade.setTradeFilepath(origin.getTradeFilepath());
            }
            int result = tService.updateTrade(trade);
            return "redirect:/trade/detail/" + trade.getTradeNo();
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            return "common/error";
        }
    }

    // 삭제
    @GetMapping("/delete")
    public String tradeDelete(@RequestParam("tradeNo") int tradeNo, Model model) {
        try {
            int result = tService.deleteTrade(tradeNo);
            return "redirect:/trade/list";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
            return "common/error";
        }
    }

    // 거래 상태 변경
    @PostMapping("/updateYn")
    public String updateTradeYn(@RequestParam("tradeNo") int tradeNo, 
	                                 @RequestParam("tradeYn") char tradeYn, // 거래 완료 여부 파라미터 추가
	                                 Model model) {
        try {
            int result = tService.updateTradeYn(tradeNo, tradeYn); // 상태 변경
            if (result > 0) {
                return "redirect:/trade/list"; // 성공 시 목록으로 이동
            } else {
                model.addAttribute("errorMessage", "상태 변경 실패");
                return "common/error"; // 실패 시 에러 페이지로 이동
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
            return "common/error"; // 예외 발생 시 에러 페이지로 이동
        }
    }

    // 채팅페이지
    @GetMapping("/chat/{tradeNo}")
    public String showChatPage(@PathVariable int tradeNo, Model model) {
        return "trade/chat";
    }
}