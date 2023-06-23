package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoppingMall.dao.Gu_SDao;
import com.lgy.ShoppingMall.dto.Gu_PRevCmtDto;
import com.lgy.ShoppingMall.dto.Gu_PRevDto;

import lombok.extern.slf4j.Slf4j;

/* ======================================================
Gu_SServiceImpl 인터페이스

  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현                     23-06-21           
====================================================== */ 
@Slf4j
@Service("Gu_SService")
public class Gu_SServiceImpl implements Gu_SService{
	
	@Autowired
	private SqlSession sqlSession;
	
//	리뷰목록
	@Override
	public ArrayList<Gu_PRevDto> revList() {
		log.info("@# SServiceImpl.revList() start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		ArrayList<Gu_PRevDto> list = dao.revList();
		
		log.info("@# SServiceImpl.revList() end");
		
		return list;
	}
//	리뷰 작성
	@Override
	public void revWrite(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revWrite() start");

		log.info("************** : " + param.get("id"));
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		dao.revWrite(param);
		
		log.info("@# SServiceImpl.revWrite() end");		
	}

//	리뷰 조회수 올리기
	@Override
	public int revUpHit(HashMap<String, String> param) {
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		return dao.revUpHit(param);
	}
//	조회수 -1(댓작성 후 조회수 안올라가게 임시로 함)
	@Override
	public int revDownHit(HashMap<String, String> param) {
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		return dao.revDownHit(param);
	}
	
//	리뷰보기
	@Override
	public Gu_PRevDto revContentView(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revContentView() start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
//		revUpHit(param); //글 수정하고 돌아갈때마다 조회수가 3씩 증가함
		Gu_PRevDto dto = dao.revContentView(param);
		
		log.info("@# SServiceImpl.revContentView() end");
		
		return dto;
	}

//	리뷰수정(원글보기)
	@Override
	public Gu_PRevDto revModifyView(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revModifyView()리뷰수정(원글보기) start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		Gu_PRevDto dto = dao.revModifyView(param);
		
		log.info("@# SServiceImpl.revModifyView()리뷰수정(원글보기) end");
		
		return dto;
	}
	
//	리뷰수정
	@Override
	public void revModify(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revModify()리뷰수정 start");

		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		dao.revModify(param);
		
		log.info("@# SServiceImpl.revModify()리뷰수정 end");		
	}
	
//	리뷰 삭제
	@Override
	public void revDelete(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revDelete() start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		dao.revDelete(param);
		
		log.info("@# SServiceImpl.revDelete() end");
	}
	
//	리뷰에 단 댓글 조회
	@Override
	public ArrayList<Gu_PRevCmtDto> revCmtList(HashMap<String, String> param) {
log.info("@# SServiceImpl.revCmtList()리뷰댓글조회 start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		ArrayList<Gu_PRevCmtDto> dto = dao.revCmtList(param);
		
		log.info("@# SServiceImpl.revCmtList()리뷰댓글조회 end");
		
		return dto;
	}
	
//	리뷰 댓글 작성
	@Override
	public void revCmtWrite(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revCmtWrite(댓작성) start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		dao.revCmtWrite(param);
		
		log.info("@# SServiceImpl.revCmtWrite(댓작성) end");	
	}
	
//	리뷰댓글 수정(원글보기) -> 댓글 수정 눌렀을때 원래 작성했던 내용
	@Override
	public Gu_PRevCmtDto revCmtModifyView(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revCmtModifyView()리뷰수정원댓보기 start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		Gu_PRevCmtDto dto = dao.revCmtModifyView(param);
		
		log.info("@# SServiceImpl.revModifyView()리뷰수정원댓보기 end");
		System.out.println("댓글내용 ==> "+dto.getCmtcont());
		
		return dto;
	}
	
//	리뷰 댓글 수정
	@Override
	public void revCmtModify(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revCmtModify()댓수정 start");

		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		dao.revCmtModify(param);
		
		log.info("@# SServiceImpl.revCmtModify()댓수정 end");	
		
	}
	
//	리뷰 댓글 삭제
	@Override
	public void revCmtDelete(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revDelete() start");
		
		Gu_SDao dao = sqlSession.getMapper(Gu_SDao.class);
		dao.revCmtDelete(param);
		
		log.info("@# SServiceImpl.revDelete() end");
	}
	
}