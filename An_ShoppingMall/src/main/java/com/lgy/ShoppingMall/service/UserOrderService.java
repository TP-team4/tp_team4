package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.ProductOrdDto;

public interface UserOrderService {
	//주문목록 조회
	public ArrayList<ProductOrdDto> userOrderList (Criteria cri);
		
	public ArrayList<ProductOrdDto> userOrderListByProduct (Criteria cri);
	
	//주문 상세 조회
	public ProductOrdDto userOrderView(HashMap<String, String> param);
		
	//배송조회 
	public ProductOrdDto userOrderShip(HashMap<String, String> param);
		
	//주문 취소
	public void userOrderCancel(HashMap<String, String> param);
		
	//주문목록 삭제
	public void userOrderDelete(HashMap<String, String> param);
}
