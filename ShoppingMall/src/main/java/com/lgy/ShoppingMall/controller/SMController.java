package com.lgy.ShoppingMall.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.ShoppingMall.dto.PRevCmtDto;
import com.lgy.ShoppingMall.dto.PRevDto;
import com.lgy.ShoppingMall.service.SService;

import lombok.extern.slf4j.Slf4j;

/* ======================================================
SMController

  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현                     23-06-21           
====================================================== */ 
@Controller
@Slf4j
public class SMController {
	
	@Autowired
	private SService service;
	
//	리뷰목록
	@RequestMapping("/rev_list")
	public String revList(Model model) {
		log.info("@# rev_list start");
		
		ArrayList<PRevDto> list = service.revList();
		model.addAttribute("rev_list", list);
		
		log.info("@# rev_list end");
		return "rev_list";
	}

//	리뷰작성
	@RequestMapping("/rev_writeView")
	public String rev_write_view() {
		log.info("@# rev_writeView");
		return "rev_writeView";
	}
	
//	리뷰작성
	@RequestMapping("/rev_write")
	public String rev_write(@RequestParam HashMap<String, String> param) {
		log.info("@# rev_write start");
		log.info("************** : " + param.get("procode"));
		log.info("************** : " + param.get("revtitle"));
		log.info("************** : " + param.get("revcont"));
		log.info("************** : " + param.get("id"));
		service.revWrite(param);
		
		log.info("@# rev_write end");
		return "redirect:rev_list";
	}
	
//	리뷰조회, 조회수올리기
//	리뷰에 단 댓글 조회
	@RequestMapping("/rev_contentView")
	public String rev_contentView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# rev_contentView start");
		
//		리뷰 수정, 삭제 후 조회수 오류이슈때문에 테스트가 안돼서 주석처리 
//		log.info("@# rev_조회수 start");
//		service.revUpHit(param);
//		log.info("@# rev_조회수 end");
		
		PRevDto dto = service.revContentView(param);
		model.addAttribute("rev_contentView", dto);
		
		log.info("@# rev_contentView start");
		ArrayList<PRevCmtDto> RevCmtList = service.revCmtList(param);
		model.addAttribute("RevCmtList", RevCmtList);
		log.info("@# rev_contentView end");		
		
		log.info("@# rev_contentView end");
		
		return "rev_contentView";
	}
	
//	리뷰수정뷰
	@RequestMapping("/rev_modifyView")
	public String rev_modifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller rev_modifyView start");
		
		PRevDto dto = service.revModifyView(param);
		model.addAttribute("rev_modifyView", dto);
		
		log.info("@# controller rev_modifyView end");
		
		return "rev_modifyView";		
	}
//	리뷰수정
	@RequestMapping("/rev_modify")
	public String rev_modify(@RequestParam HashMap<String, String> param) {
//	public String rev_modify(@RequestParam HashMap<String, String> param, RedirectAttributes redirectAttributes) {
		log.info("@# controller rev_modify start");
		
		PRevDto dto = service.revModifyView(param);
		service.revModify(param);
		
		log.info("@# controller rev_modifyView end");
		
		return "redirect:rev_list";
//		return "redirect:rev_contentView?REVCODE=" + dto.getREVCODE();
//		redirectAttributes.addAttribute("REVCODE", param.get("REVCODE"));
//		return "redirect:rev_contentView";
	}
	
//	리뷰삭제
	@RequestMapping("/rev_delete")
	public String rev_delete(@RequestParam HashMap<String, String> param) {
		log.info("@# rev_delete start");
		
		service.revDelete(param);
		
		log.info("@# rev_delete end");
		
		return "redirect:rev_list";
	}
	
//	리뷰 댓글 작성
	@RequestMapping("/revCmtWrite")
	public String revCmtWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# revCmtWrite start");
		
		service.revCmtWrite(param);
		
		log.info("@# revCmtWrite end");
		
//		리뷰 수정, 삭제 후 조회수 오류이슈때문에 테스트가 안돼서 주석처리 
//		log.info("@# rev_조회수-1 start");
//		service.revDownHit(param);
//		log.info("@# rev_조회수-1 end");
		
//		return "redirect:rev_contentView";
		return "redirect:rev_contentView?revcode=" + param.get("revcode");
	}
//	리뷰댓글 수정(원글보기) -> 댓글 수정 눌렀을때 원래 작성했던 내용
	@RequestMapping("/revCmtModifyView")
	public String revCmtModifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller revCmtModifyView start");
		
		PRevCmtDto dto = service.revCmtModifyView(param);
		model.addAttribute("revCmtModifyView", dto);
		log.info("@# controller rev_modifyView end");
		
		return "rev_CmtModifyView";
	}
//	리뷰 댓글 수정
	@RequestMapping("/revCmtModify")
	public String revCmtModify(@RequestParam HashMap<String, String> param) {
			log.info("@# controller revCmtModify start");
			
			service.revCmtModify(param);
			
			log.info("@# controller revCmtModify end");
			
			return "redirect:rev_contentView?revcode=" + param.get("revcode");
	}
//	리뷰 댓글 삭제
	@RequestMapping("/revCmtDelete")
	public String revCmtDelete(@RequestParam HashMap<String, String> param) {
		log.info("@# revCmtDelete start");
		
		service.revCmtDelete(param);
		
		log.info("@# revCmtDelete end");
		
//		return "redirect:rev_list";
		return "redirect:rev_contentView?revcode=" + param.get("revcode");
	}
}
