package com.lgy.ShoppingMall.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoppingMall.dto.CheckCartDto;
import com.lgy.ShoppingMall.dto.OrderDto;
import com.lgy.ShoppingMall.dto.PProductDto;
import com.lgy.ShoppingMall.dto.ProductOutDto;

public interface PurchaseProductDao {
	//상품선택
	public ArrayList<PProductDto> productSelect();
	//상품주문
	public void productOrd(HashMap<String, String> param);
	//결제
	public void pay(HashMap<String, String> param);
	//출고
	public void productOut(HashMap<String, String> param);
	//주문상세
	public ArrayList<OrderDto> orderView();
	//출고 상세
	public ArrayList<ProductOutDto> outView();
	//장바구니 담기
	public void addCart(HashMap<String, String> param);
	//장바구니 체크
	public ArrayList<CheckCartDto> checkCart();
}