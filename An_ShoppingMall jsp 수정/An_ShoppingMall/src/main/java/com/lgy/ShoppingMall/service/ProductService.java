package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.ProductDto;

public interface ProductService {
		//상품목록
		public ArrayList<ProductDto> productList(Criteria cri);

		// 상품등록
		public void register(HashMap<String, String> param);	
		
		//상품 조회
		public ProductDto productView (HashMap<String, String> param);
		
		//상품 수정
		public void productModify(HashMap<String, String> param);
		
		//상품 삭제
		public void productDelete(HashMap<String, String> param);
		
		public void productOpColorRegister(HashMap<String, String> param);

		public void productOpSizeRegister(HashMap<String, String> param);
		
		public void productOpColorModify(HashMap<String, String> param);

		public void productOpSizeModify(HashMap<String, String> param);
		
		//마지막 proCode 조회
		public String lastProCode();
		
}