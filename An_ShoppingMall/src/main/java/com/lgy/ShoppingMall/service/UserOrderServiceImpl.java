package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoppingMall.dao.UserOrderDao;
import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.ProductOrdDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UserOrderService")
public class UserOrderServiceImpl implements UserOrderService{
	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<ProductOrdDto> userOrderList(Criteria cri) {
		log.info("@# UserOrderServiceImpl.UserOrderDao(Criteria cri) start");
		log.info("@# cri ===>"+cri);
		
		UserOrderDao dao = sqlsession.getMapper(UserOrderDao.class);
		
		log.info("@# UserOrderServiceImpl.UserOrderDao(Criteria cri) end");
		
		return dao.userOrderList(cri);
	}


	@Override
	public ArrayList<ProductOrdDto> userOrderListByProduct(Criteria cri) {
		log.info("@# UserOrderServiceImpl.userOrderListByProduct(Criteria cri) start");
		log.info("@# cri ===>"+cri);
		
		UserOrderDao dao = sqlsession.getMapper(UserOrderDao.class);
		
		log.info("@# UserOrderServiceImpl.userOrderListByProduct(Criteria cri) end");
		
		return dao.userOrderListByProduct(cri);
	}


	
	@Override
	public ProductOrdDto userOrderView(HashMap<String, String> param) {
		log.info("@# MyOrderServiceImpl.userOrderView() start");

		UserOrderDao dao = sqlsession.getMapper(UserOrderDao.class);
		ProductOrdDto dto = dao.userOrderView(param);
		
		log.info("@# MyOrderServiceImpl.userOrderView() end");
		return dto;
	}

	@Override
	public ProductOrdDto userOrderShip(HashMap<String, String> param) {
		log.info("@# MyOrderServiceImpl.userOrderShip() start");

		UserOrderDao dao = sqlsession.getMapper(UserOrderDao.class);
	    ProductOrdDto dto = dao.userOrderShip(param);
	    
	    log.info("@# MyOrderServiceImpl.userOrderShip() end");
	    return dto;
	}

	@Override
	public void userOrderCancel(HashMap<String, String> param) {
		 log.info("@# MyOrderServiceImpl.userOrderCancel() start");

		 UserOrderDao dao = sqlsession.getMapper(UserOrderDao.class);
		 dao.userOrderCancel(param);
		    
		 log.info("@# MyOrderServiceImpl.userOrderCancel() end");
	}


	@Override
	public void userOrderDelete(HashMap<String, String> param) {
		log.info("@# MyOrderServiceImpl.userOrderDelete() start");

		UserOrderDao dao = sqlsession.getMapper(UserOrderDao.class);
		dao.userOrderDelete(param);
		
		log.info("@# MyOrderServiceImpl.userOrderDelete() end");
	}

}
