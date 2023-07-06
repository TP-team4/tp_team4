package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoppingMall.dao.PurchaseProductDao;
import com.lgy.ShoppingMall.dto.CheckCartDto;
import com.lgy.ShoppingMall.dto.OrderDto;
import com.lgy.ShoppingMall.dto.PProductDto;
import com.lgy.ShoppingMall.dto.ProductOutDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ProductService")
public class PurchaseProductServiceImpl implements PurchaseProductService{
	@Autowired
	private SqlSession sqlSession;
	
	//상품선택
	@Override
	public ArrayList<PProductDto> productSelect() {//상품상세페이지
		log.info("@# ProductServiceImpl.productSelect start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		ArrayList<PProductDto> list = dao.productSelect();
		log.info("@# ProductServiceImpl.productSelect end");
		return list;
	}
	//상품주문
	@Override
	public void productOrd(HashMap<String, String> param) {//상품주문
		log.info("@# ProductServiceImpl.productOrd start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		dao.productOrd(param);
		log.info("@# ProductServiceImpl.productOrd end");
	}
	//결제
	@Override
	public void pay(HashMap<String, String> param) {
		log.info("@# ProductServiceImpl.pay start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		dao.pay(param);
		log.info("@# ProductServiceImpl.pay end");
		
	}
	//출고
	@Override
	public void productOut(HashMap<String, String> param) {
		log.info("@# ProductServiceImpl.productOut start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		dao.productOut(param);
		log.info("@# ProductServiceImpl.productOut end");
	}
	//주문상세
	@Override
	public ArrayList<OrderDto> orderView() {
		log.info("@# ProductServiceImpl.orderView start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		ArrayList<OrderDto> list = dao.orderView();
		log.info("@# ProductServiceImpl.orderView end");
		return list;
	}
	//출고상세
	@Override
	public ArrayList<ProductOutDto> outView() {
		log.info("@# ProductServiceImpl.outView start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		ArrayList<ProductOutDto> list = dao.outView();
		log.info("@# ProductServiceImpl.outView end");
		return list;
	}
//	장바구니 담기
	@Override
	public void addCart(HashMap<String, String> param) {
		log.info("@# ProductServiceImpl.addCart start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		dao.addCart(param);
		log.info("@# ProductServiceImpl.addCart end");
	}
//	장바구니 비어있는지 확인
	@Override
	public ArrayList<CheckCartDto> checkCart() {
		log.info("@# ProductServiceImpl.checkCart start");
		PurchaseProductDao dao = sqlSession.getMapper(PurchaseProductDao.class);
		ArrayList<CheckCartDto> list = dao.checkCart();
		return list;
	}
}
