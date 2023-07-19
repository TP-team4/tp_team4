package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoppingMall.dao.QnaDao;
import com.lgy.ShoppingMall.dao.RevDao;
import com.lgy.ShoppingMall.dao.SDao;
import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.PQnaDto;
import com.lgy.ShoppingMall.dto.PQnaReDto;
import com.lgy.ShoppingMall.dto.PRevDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("QnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSession sqlSession;

//	로그인유무
	@Override
	public ArrayList<PQnaDto> QnaLogincheck(String id) {
		log.info("@# QnaServiceImpl.revLoginyn() start");
	      
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
	    ArrayList<PQnaDto> list = dao.QnaLogincheck(id);
	      
	    log.info("@@@@@ daolist ===>" + list);

	    log.info("@# QnaServiceImpl.revLoginyn() end");
	    return list;
	}

//	총갯수
	@Override
	public int getTotalCount() {
		log.info("@# QnaServiceImpl.getTotalCount() start");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		return dao.getTotalCount();
	}

//	문의 전체보기 페이징
	@Override
	public ArrayList<PQnaDto> QnaList(Criteria cri) {
		log.info("@# QnaServiceImpl.revList() start");
		log.info("@# Qnacri ===>" + cri);

		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		log.info("@# QnaServiceImpl.revList() end");

		return dao.QnaListPaging(cri);
	}
	
//	문의 검색 리스트
	@Override
	public ArrayList<PQnaDto> QnaSearchList(Criteria cri) {
		log.info("@# QnaServiceImpl.searchList() start");

		QnaDao dao = sqlSession.getMapper(QnaDao.class);
	    ArrayList<PQnaDto> searchList = dao.QnaSearchList(cri);
	    log.info("@@@@@ 검색리스트 ==> "+searchList);
	    
	    log.info("@# QnaServiceImpl.searchList() end");
	      
	    return searchList;
	}

//	문의작성
	@Override
	public void PQnaWrite(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaWrite() start");
		log.info("$$$ 문의작성param : " + param);
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.PQnaWrite(param);
		
		log.info("@# QnaServiceImpl.PQnaWrite() end");
	}

//	문의보기
	@Override
	public PQnaDto PQnaContentView(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaContentView() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		PQnaDto dto = dao.PQnaContentView(param);
		
		log.info("@# QnaServiceImpl.PQnaContentView() end");
		
		return dto;
	}

//	문의수정
	@Override
	public void PQnaModify(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaModify()문의수정 start");

		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.PQnaModify(param);
		
		log.info("@# QnaServiceImpl.PQnaModify()문의수정 end");
	}
	
//	문의삭제
	@Override
	public void PQnaDelete(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaDelete() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.PQnaDelete(param);
		
		log.info("@# QnaServiceImpl.PQnaDelete() end");
	}
	
//	문의에 단 댓글 조회
	@Override
	public ArrayList<PQnaReDto> PQnaCmtList(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaCmtList()문의댓글조회 start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		ArrayList<PQnaReDto> dto = dao.PQnaCmtList(param);
		
		log.info("@# QnaServiceImpl.PQnaCmtList()문의댓글조회 end");
		
		return dto;
	}

//	문의 댓글 작성
	@Override
	public void PQnaCmtWrite(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaCmtWrite(댓작성) start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.PQnaCmtWrite(param);
		
		log.info("@# QnaServiceImpl.PQnaCmtWrite(댓작성) end");	
	}
	
//	문의 댓글 수정
	@Override
	public void PQnaCmtModify(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaCmtModify()댓수정 start");

		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.PQnaCmtModify(param);
		
		log.info("@# QnaServiceImpl.PQnaCmtModify()댓수정 end");
	}
	
//	문의 댓글 삭제
	@Override
	public void PQnaCmtDelete(HashMap<String, String> param) {
		log.info("@# QnaServiceImpl.PQnaCmtDelete() start");
		
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.PQnaCmtDelete(param);
		
		log.info("@# QnaServiceImpl.PQnaCmtDelete() end");
	}
}
