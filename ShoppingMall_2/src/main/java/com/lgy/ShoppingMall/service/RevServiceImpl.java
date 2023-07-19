package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.ShoppingMall.dao.RevDao;
import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.PRevCmtDto;
import com.lgy.ShoppingMall.dto.PRevDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("RevService")
public class RevServiceImpl implements RevService{
	
	@Autowired
	private SqlSession sqlSession;
	
//	로그인유무
	@Override
//	public ArrayList<PRevDto> logincheck(HashMap<String, String> param) {
	public ArrayList<PRevDto> logincheck(String id) {
		log.info("@# RevServiceImpl.revLoginyn() start");
//		log.info("@@@@@ id ===>" + param.get("id"));
//	    log.info("@@@@@ cartcode ===>" + param.get("cartcode"));
//	    log.info("@@@@@ status ===>" + param.get("status"));
	      
	    RevDao dao = sqlSession.getMapper(RevDao.class);
//	    PRevDto dto = dao.logincheck(param);
	    ArrayList<PRevDto> list = dao.logincheck(id);
	      
	    log.info("@@@@@ daolist ===>" + list);

	    log.info("@# RevServiceImpl.revLoginyn() end");
	    return list;
	}
	
//	my페이지-> 리뷰작성할 수 있는 상품 구매 목록
	@Override
	public ArrayList<PRevDto> userRevWriteList(String id) {
		log.info("@# RevServiceImpl.reviewQnaList() start");
		
		RevDao dao = sqlSession.getMapper(RevDao.class);
		log.info("@# RevServiceImpl.reviewQnaList() @@@@@@@@@@@22 어디서");
		
		ArrayList<PRevDto> list = dao.userRevWriteList(id);
		log.info("@# RevServiceImpl.reviewQnaList() @@@@@@@@@@@22 막히는지list "+list);
		
		log.info("@# RevServiceImpl.reviewQnaList() end");
		
		return list;
	}

//	리뷰작성
	@Override
	public void revWrite(HashMap<String, String> param) {
		log.info("@# RevServiceImpl.revWrite() start");
		
		RevDao dao = sqlSession.getMapper(RevDao.class);
		dao.revWrite(param);
		
		log.info("@# RevServiceImpl.revWrite() end");
		
	}
//	총 갯수
	@Override
	public int getTotalCount() {
		log.info("@# RevServiceImpl.getTotalCount() start");
		RevDao dao = sqlSession.getMapper(RevDao.class);
		return dao.getTotalCount();
	}
//	리뷰 전체보기 페이징
	@Override
	public ArrayList<PRevDto> revList(Criteria cri) {
		log.info("@# RevServiceImpl.revList() start");
		log.info("@# cri ===>" + cri);

		RevDao dao = sqlSession.getMapper(RevDao.class);

		log.info("@# RevServiceImpl.revList() end");

		return dao.revListPaging(cri);
	}
//	검색
	@Override
	public ArrayList<PRevDto> searchList(Criteria cri) {
		log.info("@# RevServiceImpl.searchList() start");

		RevDao dao = sqlSession.getMapper(RevDao.class);
	    ArrayList<PRevDto> searchList = dao.searchList(cri);
	    log.info("@@@@@ 검색리스트 ==> "+searchList);
	    
	    log.info("@# RevServiceImpl.searchList() end");
	      
	    return searchList;
	}
//	조회수 증가
	@Override
	public int revUpHit(HashMap<String, String> param) {
		RevDao dao = sqlSession.getMapper(RevDao.class);
	    return dao.revUpHit(param);
	}
	
//	리뷰보기
	@Override
	public PRevDto revContentView(HashMap<String, String> param) {
		log.info("@# RevServiceImpl.revContentView() start");

		RevDao dao = sqlSession.getMapper(RevDao.class);
		PRevDto dto = dao.revContentView(param);

	    log.info("@# RevServiceImpl.revContentView() end");

	    return dto;
	}

//	리뷰수정
	@Override
	public void revModify(HashMap<String, String> param) {
		log.info("@# RevServiceImpl.revModify()리뷰수정 start");

	    RevDao dao = sqlSession.getMapper(RevDao.class);
	    dao.revModify(param);

	    log.info("@# RevServiceImpl.revModify()리뷰수정 end");
	}

//	리뷰삭제
	@Override
	public void revDelete(HashMap<String, String> param) {
		log.info("@# RevServiceImpl.revDelete() start");

	    RevDao dao = sqlSession.getMapper(RevDao.class);
	    dao.revDelete(param);

	    log.info("@# RevServiceImpl.revDelete() end");
	}

//	리뷰에달린 댓글 조회
	@Override
	public ArrayList<PRevCmtDto> revCmtList(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revCmtList()리뷰댓글조회 start");

	    RevDao dao = sqlSession.getMapper(RevDao.class);
	    ArrayList<PRevCmtDto> dto = dao.revCmtList(param);

	    log.info("@# SServiceImpl.revCmtList()리뷰댓글조회 end");

	    return dto;
	}
	
//  리뷰 댓글 작성
	@Override
	public void revCmtWrite(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revCmtWrite(댓작성) start");

		RevDao dao = sqlSession.getMapper(RevDao.class);
		dao.revCmtWrite(param);

		log.info("@# SServiceImpl.revCmtWrite(댓작성) end");
	}

//  리뷰 댓글 수정
	@Override
	public void revCmtModify(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revCmtModify()댓수정 start");

		RevDao dao = sqlSession.getMapper(RevDao.class);
		dao.revCmtModify(param);

		log.info("@# SServiceImpl.revCmtModify()댓수정 end");
	}

//  리뷰 댓글 삭제
	@Override
	public void revCmtDelete(HashMap<String, String> param) {
		log.info("@# SServiceImpl.revDelete() start");

		RevDao dao = sqlSession.getMapper(RevDao.class);
		dao.revCmtDelete(param);

		log.info("@# SServiceImpl.revDelete() end");
	}
}
