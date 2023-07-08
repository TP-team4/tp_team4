package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoppingMall.dao.ProductDao;
import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.ProductDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ProductService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<ProductDto> productList(Criteria cri) {
		log.info("@# ProductServiceImpl.productList(Criteria cri) start");
		log.info("@# cri ===>"+cri);
		
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
//		ArrayList<ProductDto> productlist = dao.productList();
		
		log.info("@# ProductServiceImpl.productlist(Criteria cri) end");
//		return productlist;
		return dao.productList(cri);
	}

	@Override
	public void register(HashMap<String, String> param) {
		log.info("@# ProductServiceImpl.register() start");
		
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		dao.register(param);
		
		log.info("@# ProductServiceImpl.register() end");
	}

	@Override
	public ProductDto productView(HashMap<String, String> param) {
		log.info("@# ProductServiceImpl.productView() start");
		
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		ProductDto dto = dao.productView(param);
		
		log.info("@# ProductServiceImpl.productView() end");
		return dto;
	}

	@Override
	public void productModify(HashMap<String, String> param) {
		log.info("@# ProductServiceImpl.productModify() start");
		
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		dao.productModify(param);
		
		log.info("@# ProductServiceImpl.productModify() end");
	}

	@Override
	public void productDelete(HashMap<String, String> param) {
		log.info("@# ProductServiceImpl.productDelete() start");
		
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		dao.productDelete(param);
		
		log.info("@# ProductServiceImpl.productDelete() end");
	}

	@Override
	public void productOpColorRegister(HashMap<String, String> param) {
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		
		dao.productOpColorRegister(param);
	}

	@Override
	public void productOpSizeRegister(HashMap<String, String> param) {
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		
		dao.productOpSizeRegister(param);
	}

	@Override
	public void productOpColorModify(HashMap<String, String> param) {
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		dao.productOpColorModify(param);
	}

	@Override
	public void productOpSizeModify(HashMap<String, String> param) {
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		dao.productOpSizeModify(param);
	}

	@Override
	public String lastProCode() {
		ProductDao dao = sqlsession.getMapper(ProductDao.class);
		
		return dao.lastProCode();
	}
	
}
