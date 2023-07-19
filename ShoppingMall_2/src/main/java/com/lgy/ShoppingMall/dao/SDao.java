package com.lgy.ShoppingMall.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.Gu_CartDto;
import com.lgy.ShoppingMall.dto.PQnaDto;
import com.lgy.ShoppingMall.dto.PQnaReDto;
import com.lgy.ShoppingMall.dto.PRevCmtDto;
import com.lgy.ShoppingMall.dto.PRevDto;
import com.lgy.ShoppingMall.dto.CoProductDto;

/* ================================================================
230623 구나현 장바구니, 상품상세페이지 세부기능
================================================================*/
public interface SDao {

//	장바구니 목록
	public ArrayList<Gu_CartDto> cartList();//장바구니 목록
	public int cartAdd(HashMap<String, String> param) throws Exception;//장바구니 추가
	public void cartDelete(Gu_CartDto cartDto);//장바구니 삭제
	public void cartModifyAmount(HashMap<String, String> param);//장바구니 수량 수정
	public List<Gu_CartDto> cartCheck(HashMap<String, String> param);//장바구니 중복상품 확인
//	상품상세페이지 
	public CoProductDto ProductView(HashMap<String, String> param);//상품상세보기
	public List<CoProductDto> productColor(HashMap<String, String> param);//상품옵션 색상
	public List<CoProductDto> productSize(HashMap<String, String> param);//상품옵션 색상
	
//	페이징
	public int getTotalCount();
	public ArrayList<PRevDto> revListPaging(Criteria cri);//Criteria 객체를 이용해서 페이징 처리	
}
