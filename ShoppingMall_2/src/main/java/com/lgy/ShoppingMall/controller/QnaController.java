package com.lgy.ShoppingMall.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.MemDto;
import com.lgy.ShoppingMall.dto.PQnaDto;
import com.lgy.ShoppingMall.dto.PQnaReDto;
import com.lgy.ShoppingMall.dto.pageDto;
import com.lgy.ShoppingMall.service.QnaService;

import lombok.extern.slf4j.Slf4j;

/* ======================================================
	QnaController

  개발자   |				개발내용
  구나현     rev_list에서 write 눌렀을때 로그인 했는지 안했는지 확인
			my페이지-> 리뷰작성할 수 있는 상품 구매 목록
			게시글 작성페이지(값넘김)
			리뷰작성
			전체 리뷰 볼수있는 페이징 목록
			전체 리뷰 검색
			리뷰 보기
			수정, 삭제시 로그인한 아이디와 글아이디가 일치하는지 확인
			리뷰 수정
			리뷰 삭제
			@@@관리자 리뷰 페이징, 검색 리스트 / 리뷰 보기
					리뷰 댓글달기, 댓글수정, 댓글삭제
====================================================== */ 
@Controller
@Slf4j
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
//  로그인여부
	@RequestMapping("/QnaLogincheck")
	public String QnaLogincheck(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
		log.info("@# Qna에서 write 버튼누름");
		
		HttpSession session = request.getSession();
		MemDto dtos = (MemDto) session.getAttribute("dto");
		log.info("@#@#!#! 로그인 세션값 @@@@@@@ dtos ===>>>> "+dtos);
     
		log.info("@# loginCheck 이동전 로그인여부확인");
		String returntype = "";
		
		if (dtos != null) {
			String id = dtos.getId();
			log.info("@#@#!#! dtos id값 내가로그인한아이디 dtos ===>>>> "+id);
			ArrayList<PQnaDto> dto = qnaService.QnaLogincheck(id);
			log.info("@#@#!#! dto값 @@@@@@@ dto ===>>>> "+dto);
			log.info("@# 성공 qna쓸목록으로 이동");
			returntype = "redirect:Qna_writeView?id="+id;
		} else {
			log.info("@# 로그인정보 없음 로그인창으로 이동");
			returntype = "loginRegister/login";
		}
    	log.info("@# loginCheck 이동전 로그인여부확인끝");
    	return returntype;
	}
	
//	문의 전체보기 페이징
	@RequestMapping("/Qna_list")
	public String QnaListPaging(Criteria cri, Model model) {
		log.info("@# Qna_list start");
		log.info("@# Qna cri ===> " + cri);
		
		ArrayList<PQnaDto> list = qnaService.QnaList(cri);
		
		int total = 0;
		try {
			total = Integer.parseInt(list.get(0).getCount());
		} catch (Exception e) {
		}
		
		log.info("@@@### Qna_list"+list);
		model.addAttribute("Qna_list", list);
		model.addAttribute("pageMaker", new pageDto(total, cri));

		log.info("@# Qna_list end");
		return "Qna_list";
	}
	
//	문의 검색 리스트
	@RequestMapping("/QnaSearchList")
	public String QnaSearchList(Model model, Criteria cri) {
		log.info("@# QnaSearchList start");
	      
		ArrayList<PQnaDto> searchList = qnaService.QnaSearchList(cri);
		
		int total = 0;
	    try {
	    	total = Integer.parseInt(searchList.get(0).getCount());
	    } catch (Exception e) {
	    }
	      
	    model.addAttribute("Qna_list", searchList);
	    model.addAttribute("pageMaker", new pageDto(total, cri));
	    
	    log.info("@# QnaSearchList end");
	    return "Qna_list";
	}
	
//	문의 작성페이지(값넘김)
	@RequestMapping("/Qna_writeView")
//	public String PQnaWriteView(@RequestParam HashMap<String, String> param, Model model) {
	public String PQnaWriteView() {
		log.info("@# PQnaWriteView start");
//		model.addAttribute("Qna_writeView", param);
		log.info("@# PQnaWriteView end");
		return "Qna_writeView";
	}
	
//	문의작성
	@RequestMapping("/PQnaWrite")
	public String PQnaWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# PQnaWrite start");
		log.info("@# qwertyy => " + param);
		
		
		qnaService.PQnaWrite(param);
		
		log.info("@# PQnaWrite end");
		return "redirect:Qna_list";
	}
	
//	문의 보기전 아이디 일치하는지 확인
	@ResponseBody
	@RequestMapping("/QnaViewCheck")
	public int QnaViewCheck(@RequestParam("id") String id, HashMap<String, String> param, HttpServletRequest request, Model model) {
		log.info("@# Qna보기누름");
		
		HttpSession session = request.getSession();
		MemDto dtos = (MemDto) session.getAttribute("dto");
		log.info("@#@#!#! 로그인 세션값 @@@@@@@ dtos ===>>>> "+dtos);
		log.info("!@@@### 글 id ajax로 넘어온 값 ==> "+id);
		
		log.info("@# loginCheck 이동전 로그인여부확인");
		int result = 0;
		String userid = "";
		
		if (dtos != null) {
			userid = dtos.getId();
			log.info("@#@#!#! dtos id값 (로그인된 세션 id) ===>>>> "+userid);
//			세션 = 넘어온값
			if (userid.equals(id)) {
				log.info("@# 세션아이디,Qna작성아이디 일치 result2");
				result = 2;
//			세션 != 넘어온값
			}else if (!userid.equals(id)) {
				log.info("@# 아이디 불일치 result1");
				result = 1;
			}
//		로그인정보 없음
		} else {
			log.info("@# 로그인정보 없음 result3");
			result = 3;
		}
    	log.info("@# loginCheck 이동전 로그인여부확인끝");
    	log.info("!!@@### result 값이 0이면 오류 ==> "+result);
    	return result;
	}
	
//	문의보기/문의댓글보기
	@RequestMapping("/Qna_contentView")
	public String PQnaContentView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# PQnaContentView start");
				
		PQnaDto dto = qnaService.PQnaContentView(param);
		model.addAttribute("PQnaContentView", dto);
		
		log.info("@# PQnaCmtList start");
		ArrayList<PQnaReDto> QnaCmtList = qnaService.PQnaCmtList(param);
		model.addAttribute("PQnaCmtList", QnaCmtList);
		log.info("@# PQnaCmtList end");	
		
		model.addAttribute("pageMaker", param);
		
		log.info("@# PQnaContentView end");
		
		return "Qna_contentView";
	}
	
//	문의수정뷰
	@RequestMapping("/Qna_modifyView")
	public String PQnaModifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller PQnaModifyView start");
		
		model.addAttribute("PQnaModifyView", param);
		
		log.info("@# controller PQnaModifyView end");
		
		return "Qna_modifyView";		
	}
	
//	문의수정
	@RequestMapping("/PQnaModify")
	public String PQnaModify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
								RedirectAttributes rttr) {
		log.info("@# controller PQnaModify start");
		log.info("@@@############## 글번호 ==>"+param.get("qnacode"));
		log.info("@@@############## 아이디 ==>"+param.get("id"));
		log.info("@@@############## 제목 ==>"+param.get("qnatitle"));
		log.info("@@@############## 내용 ==>"+param.get("qnacont"));
		
		qnaService.PQnaModify(param);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		log.info("@# controller PQnaModify end");
		
		return "redirect:Qna_list";
	}
	
//	문의삭제
	@RequestMapping("/PQnaDelete")
	public String PQnaDelete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
								RedirectAttributes rttr) {
		log.info("@# PQnaDelete start");
		log.info("@@@############## 글번호 ==>"+param.get("qnacode"));
		log.info("@@@############## 아이디 ==>"+param.get("id"));
		
		qnaService.PQnaDelete(param);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		log.info("@# PQnaDelete end");
		
		return "redirect:Qna_list";
	}
//	@@@관리자
//  Qna페이징목록 관리자
	@RequestMapping("/Qna_list_admin")
	public String QnaListPagingAdmin(Criteria cri, Model model) {
		log.info("@# Qna_list_admin start");
		log.info("@# Qna cri ===> " + cri);
		
		ArrayList<PQnaDto> list = qnaService.QnaList(cri);
		
		int total = 0;
		try {
			total = Integer.parseInt(list.get(0).getCount());
		} catch (Exception e) {
		}
		
		log.info("@@@### Qna_list"+list);
		model.addAttribute("Qna_list", list);
		model.addAttribute("pageMaker", new pageDto(total, cri));

		log.info("@# Qna_list_admin end");
		return "Qna_list_admin";
	}
//	문의검색
	@RequestMapping("/QnaSearchList_admin")
	public String QnaSearchList_admin(Model model, Criteria cri) {
		log.info("@# QnaSearchList start");
	      
		ArrayList<PQnaDto> searchList = qnaService.QnaSearchList(cri);
		
		int total = 0;
	    try {
	    	total = Integer.parseInt(searchList.get(0).getCount());
	    } catch (Exception e) {
	    }
	      
	    model.addAttribute("Qna_list", searchList);
	    model.addAttribute("pageMaker", new pageDto(total, cri));
	    
	    log.info("@# QnaSearchList end");
	    return "Qna_list_admin";
	}
//	문의보기/문의댓글보기
	@RequestMapping("/Qna_contentView_adimn")
	public String PQnaContentView_admin(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# PQnaContentView관리자~ start");
				
		PQnaDto dto = qnaService.PQnaContentView(param);
		model.addAttribute("PQnaContentView", dto);
		
		log.info("@# PQnaCmtList start");
		ArrayList<PQnaReDto> QnaCmtList = qnaService.PQnaCmtList(param);
		model.addAttribute("PQnaCmtList", QnaCmtList);
		log.info("@# PQnaCmtList end");	
		
		model.addAttribute("pageMaker", param);
		
		log.info("@# PQnaContentView관리자~ end");
		
		return "Qna_contentView_admin";
	}

//	문의 댓글 작성
	@RequestMapping("/PQnaCmtWrite")
	public String PQnaCmtWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# PQnaCmtWrite start");
		
		qnaService.PQnaCmtWrite(param);
		
		log.info("@# PQnaCmtWrite end");
		
		
		return "redirect:Qna_contentView_admin?qnacode=" + param.get("qnacode");
	}
	
//	문의 댓글 수정
	@RequestMapping("/PQnaCmtModify")
	public String PQnaCmtModify(@RequestParam HashMap<String, String> param) {
		log.info("@# controller PQnaCmtModify start");
		
		qnaService.PQnaCmtModify(param);
		
		log.info("@# controller PQnaCmtModify end");
		
		return "redirect:Qna_contentView_admin?qnacode=" + param.get("qnacode");
	}
	
//	문의 댓글 삭제
	@RequestMapping("/PQnaCmtDelete")
	public String PQnaCmtDelete(@RequestParam HashMap<String, String> param) {
		log.info("@# PQnaCmtDelete start");
		
		qnaService.PQnaCmtDelete(param);
		
		log.info("@# PQnaCmtDelete end");
		
		return "redirect:Qna_contentView_admin?qnacode=" + param.get("qnacode");
	}
}
