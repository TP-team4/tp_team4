package com.lgy.ShoppingMall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lgy.ShoppingMall.dao.SDao;
import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.Gu_CartDto;
import com.lgy.ShoppingMall.dto.PQnaDto;
import com.lgy.ShoppingMall.dto.PQnaReDto;
import com.lgy.ShoppingMall.dto.MemDto;
import com.lgy.ShoppingMall.dto.PRevCmtDto;
import com.lgy.ShoppingMall.dto.PRevDto;
import com.lgy.ShoppingMall.dto.CoProductDto;
import com.lgy.ShoppingMall.dto.pageDto;
import com.lgy.ShoppingMall.service.SService;

import lombok.extern.slf4j.Slf4j;

/* ================================================================
230623 구나현 장바구니, 상품상세페이지 세부기능
================================================================*/

@Controller
@Slf4j
public class SMController {
	
	@Autowired
	private SService service;

	@RequestMapping("/Gu_cart")
	public String Gu_cart() {
		log.info("@# controller Gu_cart");		
		return "redirect:Gu_cartList";
	}
	
//	장바구니 목록
	@RequestMapping("/Gu_cartList")
	public String cartList(Model model){
		log.info("@# cartList start");
		
		ArrayList<Gu_CartDto> list = service.cartList();
		model.addAttribute("cartList", list);
		
		log.info("@# cartList end");
		return "Gu_cart";
	}
	
//	장바구니 추가
	@ResponseBody
	@RequestMapping("/cartAdd")
	public String cartAdd(@RequestParam HashMap<String, String> param) {
//		세션으로 로그인 체크 추가 하기
		log.info("@# controller cartAdd start");
		
		log.info("@#$#@$ => " + param);
		int result = service.cartAdd(param);
		
		log.info("@# controller cartAdd end");
		return result + "";//cartAdd int타입을 리턴해서 빈문자열 넣음
	}

//	장바구니 삭제
	@ResponseBody
	@RequestMapping("/cartDelete")
//	public int cartDelete(@RequestParam(value = "removeCh[]") List<String> removeArray, HashMap<String, String> param, Gu_CartDto cartDto) {
	public int cartDelete(@RequestParam(value = "removeCh[]") List<String> removeArray, Gu_CartDto cartDto) {
		log.info("@# controller cartDelete start");
		
		int result = 0;
		String cartcode = "";
		
		for (String i : removeArray) {
//			log.info("####@@@@@@ removeArray ==>"+removeArray);
			cartcode = i;
			cartDto.setCartcode(cartcode);
			log.info("####@@@@@@ cartDto ==>"+cartDto);
			service.cartDelete(cartDto);
			result = 1;
		}
		log.info("@# controller cartDelete end");
//		log.info("####@@@@@@  result==>"+result);
		return result;	
	}
//	장바구니 수량 수정
	@ResponseBody
	@RequestMapping("/cartModifyAmount")
	public int cartModifyAmount(@RequestParam HashMap<String, String> param) {
		log.info("@# controller cartModifyAmount start");
		int result = 1;
		
		service.cartModifyAmount(param);
//		result = 1;
		
		log.info("result   "+result);
		log.info("@# controller cartModifyAmount end");
		return result;
	}
//	장바구니 확인
//	public String cartCheck(HashMap<String, String> param) {
//		
//		return "";
//	}
//	상품상세보기2306
	@RequestMapping("/Gu_ProductView")
	public String ProductView(@RequestParam HashMap<String, String> param, Model model, HttpSession  session) {
		log.info("@# controller ProductView start");
		CoProductDto dto = service.ProductView(param);
		
//		아이디값 받아오기
		MemDto getid = (MemDto) session.getAttribute("dto");
//		log.info("@# id =>"+param.get("id"));
//		model.addAttribute("idValue", param.get("id"));
		if (getid != null) {
	        model.addAttribute("idValue", getid.getId());
	    } 
		
		
		log.info("@# controller productColor start");
//		List<CoProductDto> colorDtoList = service.productColor(param);
		ArrayList<CoProductDto> colorDtoList = (ArrayList<CoProductDto>) service.productColor(param);
		dto.setColorOptions(colorDtoList);
		log.info("@# controller productColor end");
				
		log.info("@# controller productSize start");
//		List<CoProductDto> SizeDtoList = service.productSize(param);
		ArrayList<CoProductDto> SizeDtoList = (ArrayList<CoProductDto>) service.productSize(param);
		dto.setSizeOptions(SizeDtoList);
		log.info("@# controller productSize end");
		
		model.addAttribute("Gu_ProductView", dto);
		log.info("@# ProductView end");
		
		return "Gu_ProductView";
	}
}
