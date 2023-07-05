package com.lgy.ShoppingMall.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoppingMall.dto.CheckCartDto;
import com.lgy.ShoppingMall.dto.OrderDto;
import com.lgy.ShoppingMall.dto.ProductDto;
import com.lgy.ShoppingMall.dto.ProductOutDto;

public interface ProductDao {
	//상품선택
	public ProductDto productSelect(HashMap<String, String> param);
	//상품주문
	public void productOrd(HashMap<String, String> param);
	//결제
	public void pay(HashMap<String, String> param);
	//출고
	public void productOut(HashMap<String, String> param);
//	//주문상세
//	public ArrayList<OrderDto> orderView();
//	//출고 상세
//	public ArrayList<ProductOutDto> outView();
	//장바구니 담기
	public void addCart(HashMap<String, String> param);
	//장바구니 체크
	public ArrayList<CheckCartDto> checkCart(HashMap<String, String> param);
	//장바구니 확인 테스트용
	public ArrayList<ProductDto> CartView(HashMap<String, String> param);
}