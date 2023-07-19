package com.lgy.ShoppingMall.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletRequest;
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
import com.lgy.ShoppingMall.dto.PRevCmtDto;
import com.lgy.ShoppingMall.dto.PRevDto;
import com.lgy.ShoppingMall.dto.pageDto;
import com.lgy.ShoppingMall.service.RevService;

import lombok.extern.slf4j.Slf4j;

/* ======================================================
	RevController

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
public class RevController {
	
	@Autowired
	private RevService revService;
	
//  로그인여부
	@RequestMapping("/loginCheck")
	public String loginCheck(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
		log.info("@# revPage에서 write 버튼누름");
		
		
		HttpSession session = request.getSession();
		MemDto dtos = (MemDto) session.getAttribute("dto");
		log.info("@#@#!#! 로그인 세션값 @@@@@@@ dtos ===>>>> "+dtos);
     
		log.info("@# loginCheck 이동전 로그인여부확인");
		String returntype = "";
		
		if (dtos != null) {
			String id = dtos.getId();
			log.info("@#@#!#! dtos id값 @@@@@@@ dtos ===>>>> "+id);
			ArrayList<PRevDto> dto = revService.logincheck(id);
			log.info("@#@#!#! dto값 @@@@@@@ dto ===>>>> "+dto);
			log.info("@# 성공 리뷰쓸목록으로 이동");
			returntype = "redirect:userRevWriteList";	
		} else {
			log.info("@# 로그인정보 없음 로그인창으로 이동");
			returntype = "loginRegister/login";
		}
    	log.info("@# loginCheck 이동전 로그인여부확인끝");
    	return returntype;
	}


	
//	my페이지-> 리뷰작성할 수 있는 상품 구매 목록
	@RequestMapping("/userRevWriteList")
//	public String userRevWriteList(@RequestParam HashMap<String, String> param, Model model, HttpSession session) {
	public String userRevWriteList(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request) {
		log.info("@# userRevWriteList start");
		
		HttpSession session = request.getSession();
		MemDto dtos = (MemDto) session.getAttribute("dto");
		String id = dtos.getId();
		ArrayList<PRevDto> list = revService.userRevWriteList(id);
		model.addAttribute("userRevWriteList", list);
		
		log.info("@# userRevWriteList end");
		return "userRevWriteList";
	}
	
//	게시글 작성페이지(값넘김)
	@RequestMapping("/rev_writeView")
	public String rev_writeView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# rev_writeView start");
		model.addAttribute("rev_writeView", param);
		log.info("@# rev_writeView end");
		return "rev_writeView";
	}
	
//	리뷰작성
	@RequestMapping("/rev_write")
	public String rev_write(@RequestParam HashMap<String, String> param) {
		log.info("@# rev_write start");
		
		revService.revWrite(param);
		
		log.info("@# rev_write end");
		return "redirect:rev_list";
	}
	
//  리뷰페이징목록
	@RequestMapping("/rev_list")
	public String revListPaging(Criteria cri, Model model) {
		log.info("@# rev_list start");
		log.info("@# cri ===> " + cri);

		ArrayList<PRevDto> list = revService.revList(cri);
     
		int total = 0;
		try {
			total = Integer.parseInt(list.get(0).getCount());
		} catch (Exception e) {
		}
     
		log.info("@@@### rev_list"+list);
		model.addAttribute("rev_list", list);
		model.addAttribute("pageMaker", new pageDto(total, cri));

		log.info("@# rev_list end");
		return "rev_list";
	}

	
//	리뷰 검색
	@RequestMapping("/searchList")
	public String searchList(Model model, Criteria cri) {
		log.info("@# searchList start");
	      
		ArrayList<PRevDto> searchList = revService.searchList(cri);
		
		int total = 0;
	    try {
	    	total = Integer.parseInt(searchList.get(0).getCount());
	    } catch (Exception e) {
	    }
	      
	    model.addAttribute("rev_list", searchList);
	    model.addAttribute("pageMaker", new pageDto(total, cri));
	    
	    log.info("@# searchList end");
	    return "rev_list";
	}
	
//	리뷰 보기
	@RequestMapping("/rev_contentView")
		public String rev_contentView(@RequestParam HashMap<String, String> param, Model model) {
	    	log.info("@# rev_contentView start");

//	      	리뷰 수정, 삭제 후 조회수 오류이슈때문에 테스트가 안돼서 주석처리 
//	      	log.info("@# rev_조회수 start");
	    	revService.revUpHit(param);
//	      	log.info("@# rev_조회수 end");

	    	PRevDto dto = revService.revContentView(param);
	    	model.addAttribute("rev_contentView", dto);

	      	log.info("@# revContent start");
	      	ArrayList<PRevCmtDto> RevCmtList = revService.revCmtList(param);
	      	model.addAttribute("RevCmtList", RevCmtList);
	      	log.info("@# revContent end");

	    	model.addAttribute("pageMaker", param);// 페이징

	    	log.info("@# revContent end");

	    	return "rev_contentView";
	   }
	
//	수정, 삭제 아이디 일치하는지 확인
	@ResponseBody
	@RequestMapping("/EDloginCheck")
	public int EDloginCheck(@RequestParam("id") String id, HashMap<String, String> param, HttpServletRequest request, Model model) {
		log.info("@# 리뷰보기에서 delete or edit 버튼누름");
		
		HttpSession session = request.getSession();
		MemDto dtos = (MemDto) session.getAttribute("dto");
		log.info("@#@#!#! 로그인 세션값 @@@@@@@ dtos ===>>>> "+dtos);
		log.info("!@@@### ajax로 넘어온 값 ==> "+id);
		
		log.info("@# loginCheck 이동전 로그인여부확인");
		int result = 0;
		String userid = "";
		
		if (dtos != null) {
			userid = dtos.getId();
			log.info("@#@#!#! dtos id값 (세션)@@@@@@@ dtos ===>>>> "+userid);
//			세션 = 넘어온값
			if (userid.equals(id)) {
				log.info("@# 세션아이디,리뷰아이디 일치 result2");
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
	
//  리뷰수정뷰
	@RequestMapping("/rev_modifyView")
		public String rev_modifyView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller rev_modifyView start");

//     	RevDto dto = service.revModifyView(param);
//     	model.addAttribute("rev_modifyView", dto);
		model.addAttribute("rev_modifyView", param);

		log.info("@# controller rev_modifyView end");

		return "rev_modifyView";
	}
//	리뷰수정
	@RequestMapping("/rev_modify")
	public String rev_modify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
        RedirectAttributes rttr) {

		log.info("@# controller rev_modify start");
		log.info("@@@############## 글번호 ==>"+param.get("revcode"));
		log.info("@@@############## 아이디 ==>"+param.get("id"));
		log.info("@@@############## 제목 ==>"+param.get("revtitle"));
		log.info("@@@############## 내용 ==>"+param.get("revcont"));
		revService.revModify(param);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		log.info("@# controller rev_modify end");

		return "redirect:rev_list";
	}
	
//  리뷰삭제
	@RequestMapping("/rev_delete")
	public String rev_delete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
								RedirectAttributes rttr) {
		log.info("@# rev_delete start");
		
		log.info("@@@############## 글번호 ==>"+param.get("revcode"));
		log.info("@@@############## 아이디 ==>"+param.get("id"));
		revService.revDelete(param);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		log.info("@# rev_delete end");

		return "redirect:rev_list";
	}
//	@@@관리자
//  리뷰페이징목록 관리자
	@RequestMapping("/rev_list_admin")
	public String revListPagingAdmin(Criteria cri, Model model) {
		log.info("@# rev_list_admin start");
		log.info("@# cri ===> " + cri);
		
		ArrayList<PRevDto> list = revService.revList(cri);
		
		int total = 0;
		try {
			total = Integer.parseInt(list.get(0).getCount());
		} catch (Exception e) {
		}
		
		log.info("@@@### rev_list_admin"+list);
		model.addAttribute("rev_list", list);
		model.addAttribute("pageMaker", new pageDto(total, cri));
		
		log.info("@# rev_list_admin end");
		return "rev_list_admin";
	}
//	리뷰 검색
	@RequestMapping("/searchList_admin")
	public String searchList_admin(Model model, Criteria cri) {
		log.info("@# searchList_admin start");
	      
		ArrayList<PRevDto> searchList = revService.searchList(cri);
		
		int total = 0;
	    try {
	    	total = Integer.parseInt(searchList.get(0).getCount());
	    } catch (Exception e) {
	    }
	      
	    model.addAttribute("rev_list", searchList);
	    model.addAttribute("pageMaker", new pageDto(total, cri));
	    
	    log.info("@# searchList_admin end");
	    return "rev_list_admin";
	}
	
//	리뷰 보기
	@RequestMapping("/rev_contentView_admin")
	public String rev_contentView_admin(@RequestParam HashMap<String, String> param, Model model) {
    	log.info("@# rev_contentView_admin start");

    	PRevDto dto = revService.revContentView(param);
    	model.addAttribute("rev_contentView", dto);
    	
    	log.info("@# revContent start");
      	ArrayList<PRevCmtDto> RevCmtList = revService.revCmtList(param);
      	model.addAttribute("RevCmtList", RevCmtList);
      	log.info("@# revContent end");

    	model.addAttribute("pageMaker", param);// 페이징

    	log.info("@# rev_contentView_admin end");

    	return "rev_contentView_admin";
	}
//  리뷰 댓글 작성
	@RequestMapping("/revCmtWrite")
	public String revCmtWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# revCmtWrite start");

		revService.revCmtWrite(param);

		log.info("@# revCmtWrite end");

     return "redirect:rev_contentView_admin?revcode=" + param.get("revcode");
  	}
//  리뷰 댓글 수정
	@RequestMapping("/revCmtModify")
	public String revCmtModify(@RequestParam HashMap<String, String> param) {
		log.info("@# controller revCmtModify start");

		revService.revCmtModify(param);

		log.info("@# controller revCmtModify end");

		return "redirect:rev_contentView_admin?revcode=" + param.get("revcode");
	}

//  리뷰 댓글 삭제
	@RequestMapping("/revCmtDelete")
	public String revCmtDelete(@RequestParam HashMap<String, String> param) {
		log.info("@# revCmtDelete start");

		revService.revCmtDelete(param);

		log.info("@# revCmtDelete end");

//     	return "redirect:rev_list";
		return "redirect:rev_contentView_admin?revcode=" + param.get("revcode");
	}

}
