package com.lgy.ShoppingMall.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.ShoppingMall.dto.Gu_PQnaDto;
import com.lgy.ShoppingMall.dto.Gu_PQnaReDto;
import com.lgy.ShoppingMall.dto.Gu_PRevCmtDto;
import com.lgy.ShoppingMall.dto.Gu_PRevDto;
import com.lgy.ShoppingMall.service.Gu_SService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class Gu_SMController {
	
	@Autowired
	private Gu_SService service;
	
/* ======================================================
Controller
리뷰
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현                     23-06-21           
====================================================== */ 
//	리뷰목록
	@RequestMapping("Gu_rev_list")
	public String revList(Model model) {
		log.info("@# rev_list start");
		
		ArrayList<Gu_PRevDto> list = service.revList();
		model.addAttribute("rev_list", list);
		
		log.info("@# rev_list end");
		return "Gu_rev_list";
	}

//	리뷰작성
	@RequestMapping("/Gu_rev_writeView")
	public String rev_write_view() {
		log.info("@# rev_writeView");
		return "Gu_rev_writeView";
	}
	
//	리뷰작성
	@RequestMapping("/Gu_rev_write")
	public String rev_write(@RequestParam HashMap<String, String> param) {
		log.info("@# rev_write start");
		
		service.revWrite(param);
		
		log.info("@# rev_write end");
		return "redirect:Gu_rev_list";
	}
	
//	리뷰조회, 조회수올리기
//	리뷰에 단 댓글 조회
	@RequestMapping("/Gu_rev_contentView")
	public String rev_contentView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# rev_contentView start");
		
//		리뷰 수정, 삭제 후 조회수 오류이슈때문에 테스트가 안돼서 주석처리 
//		log.info("@# rev_조회수 start");
//		service.revUpHit(param);
//		log.info("@# rev_조회수 end");
		
		Gu_PRevDto dto = service.revContentView(param);
		model.addAttribute("rev_contentView", dto);
		
		log.info("@# rev_contentView start");
		ArrayList<Gu_PRevCmtDto> RevCmtList = service.revCmtList(param);
		model.addAttribute("RevCmtList", RevCmtList);
		log.info("@# rev_contentView end");		
		
		log.info("@# rev_contentView end");
		
		return "Gu_rev_contentView";
	}
	
//	리뷰수정뷰
	@RequestMapping("/Gu_rev_modifyView")
	public String rev_modifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller rev_modifyView start");
		
		Gu_PRevDto dto = service.revModifyView(param);
		model.addAttribute("rev_modifyView", dto);
		
		log.info("@# controller rev_modifyView end");
		
		return "Gu_rev_modifyView";		
	}
//	리뷰수정
	@RequestMapping("/Gu_rev_modify")
	public String rev_modify(@RequestParam HashMap<String, String> param) {
//	public String rev_modify(@RequestParam HashMap<String, String> param, RedirectAttributes redirectAttributes) {
		log.info("@# controller rev_modify start");
		
		Gu_PRevDto dto = service.revModifyView(param);
		service.revModify(param);
		
		log.info("@# controller rev_modifyView end");
		
		return "redirect:Gu_rev_list";
//		return "redirect:rev_contentView?REVCODE=" + dto.getREVCODE();
//		redirectAttributes.addAttribute("REVCODE", param.get("REVCODE"));
//		return "redirect:rev_contentView";
	}
	
//	리뷰삭제
	@RequestMapping("/Gu_rev_delete")
	public String rev_delete(@RequestParam HashMap<String, String> param) {
		log.info("@# rev_delete start");
		
		service.revDelete(param);
		
		log.info("@# rev_delete end");
		
		return "redirect:Gu_rev_list";
	}
	
//	리뷰 댓글 작성
	@RequestMapping("/Gu_revCmtWrite")
	public String revCmtWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# revCmtWrite start");
		
		service.revCmtWrite(param);
		
		log.info("@# revCmtWrite end");
		
//		리뷰 수정, 삭제 후 조회수 오류이슈때문에 테스트가 안돼서 주석처리 
//		log.info("@# rev_조회수-1 start");
//		service.revDownHit(param);
//		log.info("@# rev_조회수-1 end");
		
//		return "redirect:rev_contentView";
		return "redirect:Gu_rev_contentView?revcode=" + param.get("revcode");
	}
//	리뷰댓글 수정(원글보기) -> 댓글 수정 눌렀을때 원래 작성했던 내용
	@RequestMapping("/Gu_revCmtModifyView")
	public String revCmtModifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller revCmtModifyView start");
		
		Gu_PRevCmtDto dto = service.revCmtModifyView(param);
		model.addAttribute("revCmtModifyView", dto);
		log.info("@# controller rev_modifyView end");
		
		return "Gu_revCmtModifyView";
	}
//	리뷰 댓글 수정
	@RequestMapping("/Gu_revCmtModify")
	public String revCmtModify(@RequestParam HashMap<String, String> param) {
			log.info("@# controller revCmtModify start");
			
			service.revCmtModify(param);
			
			log.info("@# controller revCmtModify end");
			
			return "redirect:Gu_rev_contentView?revcode=" + param.get("revcode");
	}
//	리뷰 댓글 삭제
	@RequestMapping("/Gu_revCmtDelete")
	public String revCmtDelete(@RequestParam HashMap<String, String> param) {
		log.info("@# revCmtDelete start");
		
		service.revCmtDelete(param);
		
		log.info("@# revCmtDelete end");
		
//		return "redirect:rev_list";
		return "redirect:Gu_rev_contentView?revcode=" + param.get("revcode");
	}
/* ======================================================
Controller
문의
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현                      23-06-22           
====================================================== */ 
//	문의목록
	@RequestMapping("Gu_Qna_list")
	public String PQnaList(Model model) {
		log.info("@# PQnaList start");
		
		ArrayList<Gu_PQnaDto> list = service.PQnaList();
		model.addAttribute("PQnaList", list);
		
		log.info("@# PQnaList end");
		return "Gu_Qna_list";
	}

//	문의작성뷰
	@RequestMapping("/Gu_Qna_writeView")
	public String PQnaWriteView() {
		log.info("@# PQnaWriteView");
		return "Gu_Qna_writeView";
	}
	
//	문의작성
	@RequestMapping("/PQnaWrite")
	public String PQnaWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# PQnaWrite start");
		
		service.PQnaWrite(param);
		
		log.info("@# PQnaWrite end");
		return "redirect:Gu_Qna_list";
	}
	
//	문의조회, 조회수올리기
//	문의에 단 댓글 조회
	@RequestMapping("/Gu_Qna_contentView")
	public String PQnaContentView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# PQnaContentView start");
				
		Gu_PQnaDto dto = service.PQnaContentView(param);
		model.addAttribute("PQnaContentView", dto);
		
		log.info("@# PQnaCmtList start");
		ArrayList<Gu_PQnaReDto> QnaCmtList = service.PQnaCmtList(param);
		model.addAttribute("PQnaCmtList", QnaCmtList);
		log.info("@# PQnaCmtList end");		
		
		log.info("@# PQnaContentView end");
		
		return "Gu_Qna_contentView";
	}
	
//	문의수정뷰
	@RequestMapping("/Gu_Qna_modifyView")
	public String PQnaModifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller PQnaModifyView start");
		
		Gu_PQnaDto dto = service.PQnaModifyView(param);
		model.addAttribute("PQnaModifyView", dto);
		
		log.info("@# controller PQnaModifyView end");
		
		return "Gu_Qna_modifyView";		
	}
//	문의수정
	@RequestMapping("/PQnaModify")
	public String PQnaModify(@RequestParam HashMap<String, String> param) {
		log.info("@# controller PQnaModify start");
		
		Gu_PQnaDto dto = service.PQnaModifyView(param);
		service.PQnaModify(param);
		
		log.info("@# controller PQnaModify end");
		
		return "redirect:Gu_Qna_list";
	}
	
//	문의삭제
	@RequestMapping("/PQnaDelete")
	public String PQnaDelete(@RequestParam HashMap<String, String> param) {
		log.info("@# PQnaDelete start");
		
		service.PQnaDelete(param);
		
		log.info("@# PQnaDelete end");
		
		return "redirect:Gu_Qna_list";
	}
	
//	문의댓글 작성
	@RequestMapping("/PQnaCmtWrite")
	public String PQnaCmtWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# PQnaCmtWrite start");
		
		service.PQnaCmtWrite(param);
		
		log.info("@# PQnaCmtWrite end");
		
		
		return "redirect:Gu_Qna_contentView?qnacode=" + param.get("qnacode");
	}
	
//	문의댓글 수정(원글보기) -> 댓글 수정 눌렀을때 원래 작성했던 내용
	@RequestMapping("/Gu_Qna_CmtModifyView")
	public String PQnaCmtModifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller revCmtModifyView start");
		
		Gu_PQnaReDto dto = service.PQnaCmtModifyView(param);
		model.addAttribute("PQnaCmtModifyView", dto);
		log.info("@# controller rev_modifyView end");
		
		return "Gu_Qna_CmtModifyView";
	}
	
//	문의 댓글 수정
	@RequestMapping("/PQnaCmtModify")
	public String PQnaCmtModify(@RequestParam HashMap<String, String> param) {
			log.info("@# controller PQnaCmtModify start");
			
			service.PQnaCmtModify(param);
			
			log.info("@# controller PQnaCmtModify end");
			
			return "redirect:Gu_Qna_contentView?qnacode=" + param.get("qnacode");
	}
	
//	문의 댓글 삭제
	@RequestMapping("/PQnaCmtDelete")
	public String PQnaCmtDelete(@RequestParam HashMap<String, String> param) {
		log.info("@# PQnaCmtDelete start");
		
		service.PQnaCmtDelete(param);
		
		log.info("@# PQnaCmtDelete end");
		
		return "redirect:Gu_Qna_contentView?qnacode=" + param.get("qnacode");
	}
}
