package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.print.attribute.standard.PrinterMessageFromOperator;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoppingMall.dao.SDao;
import com.lgy.ShoppingMall.dto.*;

import lombok.extern.slf4j.Slf4j;

/* ================================================================
230623 구나현 장바구니, 상품상세페이지 
================================================================*/

@Slf4j
@Service("SService")
public class SServiceImpl implements SService{
	
	@Autowired
	private SqlSession sqlSession;

//	장바구니 추가
	@Override
	public int cartAdd(HashMap<String, String> param) {
		log.info("@# SServiceImpl.cartAdd() start");
		SDao dao = sqlSession.getMapper(SDao.class);
		
		log.info("@# SServiceImpl.cartCheck() start");
		log.info("impl add and check " + param);
		ArrayList<Gu_CartDto> cartCheck = (ArrayList<Gu_CartDto>) dao.cartCheck(param);
//		List<Gu_CartDto> cartCheck = dao.cartCheck(param);
		
//		ArrayList<Gu_CartDto> cartCheck = (ArrayList<Gu_CartDto>) dao.cartCheck(param);
		
//		if (cartCheck.get(0).getUserid().equals(param.get("userid"))
//				&&String.valueOf(cartCheck.get(0).getProcode()).equals(param.get("procode"))
//				&&cartCheck.get(0).getColor().equals(param.get("color"))
//				&&cartCheck.get(0).getPsize().equals(param.get("psize"))) {
		if (cartCheck.isEmpty()) {
			log.info("@# SServiceImpl.cartCheck() end");
			try {
				dao.cartAdd(param);
				log.info("@# SServiceImpl.cartAdd() end");
				return 1;//장바구니에 동일상품 없으면 return 1
			} catch (Exception e) {
				e.printStackTrace();
				return 0;//에러
			}
		}else if (cartCheck.get(0).getUserid().equals(param.get("userid"))
			&&String.valueOf(cartCheck.get(0).getProcode()).equals(param.get("procode"))
			&&cartCheck.get(0).getColor().equals(param.get("color"))
			&&cartCheck.get(0).getPsize().equals(param.get("psize"))){
//				&&cartCheck.get(0).getAmount() != Integer.parseInt(param.get("amount"))) {
				return 2;					
		}else {
			log.info("@# SServiceImpl.cartCheck() end");
			try {
				dao.cartAdd(param);
				log.info("@# SServiceImpl.cartAdd() end");
				return 1;//장바구니에 동일상품 없으면 return 1
			} catch (Exception e) {
				e.printStackTrace();
				return 0;//에러
			}			
		}
	}	
		

//	장바구니 목록
	@Override
	public ArrayList<Gu_CartDto> cartList() {
		log.info("@# SServiceImpl.cartList() start");
		
		SDao dao = sqlSession.getMapper(SDao.class);
		ArrayList<Gu_CartDto> list = dao.cartList();
		for (int i = 0; i < list.size(); i++) {
			log.info("외않데.."+i+"==> "+list+"\n");
		}
		
		log.info("@# SServiceImpl.cartList() end");
		
		return list;
	}
//	장바구니 삭제
	@Override
	public void cartDelete(Gu_CartDto cartDto) {
		log.info("@# SServiceImpl.cartDelete() start");
		
		SDao dao = sqlSession.getMapper(SDao.class);
		dao.cartDelete(cartDto);
		
		log.info("@# SServiceImpl.cartDelete() end");
	}
//	장바구니 수량 수정
	@Override
	public void cartModifyAmount(HashMap<String, String> param) {
		log.info("@# SServiceImpl.cartModifyCount() start");

		SDao dao = sqlSession.getMapper(SDao.class);
		dao.cartModifyAmount(param);
		
		log.info("@# SServiceImpl.cartModifyCount() end");
	}
//	장바구니 확인=> X안씀
//	@Override
//	public Gu_CartDto cartCheck(HashMap<String, String> param) {
//		log.info("@# SServiceImpl.cartCheck start");
//		
//		SDao dao = sqlSession.getMapper(SDao.class);
//		Gu_CartDto dto = dao.cartCheck(param);
//		
//		log.info("@# SServiceImpl.cartCheck() end");
//		
//		return dto;
//	}
//	상세페이지 조회
	@Override
	public CoProductDto ProductView(HashMap<String, String> param) {
		log.info("@# SServiceImpl.ProductView() start");
		SDao dao = sqlSession.getMapper(SDao.class);
		CoProductDto dto = dao.ProductView(param);
		log.info("@# SServiceImpl.ProductView() end");
		return dto;
	}
	@Override
	public List<CoProductDto> productColor(HashMap<String, String> param) {
		log.info("@# SServiceImpl.productColor() start");
		
		SDao dao = sqlSession.getMapper(SDao.class);
		ArrayList<CoProductDto> list = (ArrayList<CoProductDto>) dao.productColor(param);
		
		log.info("@# SServiceImpl.productColor() end");
		
		return list;
	}
	@Override
	public List<CoProductDto> productSize(HashMap<String, String> param) {
		log.info("@# SServiceImpl.productSize() start");
		
		SDao dao = sqlSession.getMapper(SDao.class);
		ArrayList<CoProductDto> list = (ArrayList<CoProductDto>) dao.productSize(param);
		
		log.info("@# SServiceImpl.productSize() end");
		
		return list;
	}
//	페이징
	@Override
	public int getTotalCount() {
		log.info("@# SServiceImpl.getTotalCount() start");
		SDao dao = sqlSession.getMapper(SDao.class);
		return dao.getTotalCount();
	}
	@Override
	public ArrayList<PRevDto> revListPaging(Criteria cri) {
		log.info("@# SServiceImpl.revListPaging() start");
		log.info("@# cri ===>"+cri);
		
		SDao dao = sqlSession.getMapper(SDao.class);
//		ArrayList<PRevDto> list = dao.revList();
		
		log.info("@# SServiceImpl.revListPaging() end");
		
		return dao.revListPaging(cri);
	}
}