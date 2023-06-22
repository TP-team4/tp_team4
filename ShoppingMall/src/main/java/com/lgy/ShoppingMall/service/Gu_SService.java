package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoppingMall.dto.Gu_PQnaDto;
import com.lgy.ShoppingMall.dto.Gu_PQnaReDto;
import com.lgy.ShoppingMall.dto.Gu_PRevCmtDto;
import com.lgy.ShoppingMall.dto.Gu_PRevDto;

public interface Gu_SService {
/* ======================================================== 
Service 인터페이스
리뷰
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현                      23-06-21  			           
===========================================================*/
//	리뷰목록
	public ArrayList<Gu_PRevDto> revList();
//	리뷰작성
	public void revWrite(HashMap<String, String> param);
//	리뷰이미지파일업로드
//	조회수 증가
	public int revUpHit(HashMap<String, String> param);
//	조회수 -1(댓작성 후 조회수 안올라가게 임시로 함)
	public int revDownHit(HashMap<String, String> param);
//	리뷰보기
	public Gu_PRevDto revContentView(HashMap<String, String> param);
//	리뷰수정(원글보기)
	public Gu_PRevDto revModifyView(HashMap<String, String> param);
//	리뷰수정
	public void revModify(HashMap<String, String> param);
//	리뷰삭제
	public void revDelete(HashMap<String, String> param);
//	리뷰에 단 댓글 조회
	public ArrayList<Gu_PRevCmtDto> revCmtList(HashMap<String, String> param);
//	리뷰 댓글 작성
	public void revCmtWrite(HashMap<String, String> param);
//	리뷰댓글 수정(원글보기) -> 댓글 수정 눌렀을때 원래 작성했던 내용
	public Gu_PRevCmtDto revCmtModifyView(HashMap<String, String> param);
//	리뷰 댓글 수정
	public void revCmtModify(HashMap<String, String> param);
//	리뷰 댓글 삭제
	public void revCmtDelete(HashMap<String, String> param);
//	리뷰 답글(이지만 문의게시판 답글에서 사용 할 예정)
//	public void rev
//	페이지검색
/* ======================================================== 
Service 인터페이스
문의
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현                      23-06-22  			
===========================================================*/
//	문의목록
	public ArrayList<Gu_PQnaDto> PQnaList();
//	문의작성
	public void PQnaWrite(HashMap<String, String> param);
//	문의이미지파일업로드
//	문의보기
	public Gu_PQnaDto PQnaContentView(HashMap<String, String> param);
//	문의수정(원글보기) -> revContentView를 revModify에서 쓰니까 글 수정하고 글보기로 돌아갈때마다 조회수가 1씩 증가해서 추가
	public Gu_PQnaDto PQnaModifyView(HashMap<String, String> param);
//	문의수정
	public void PQnaModify(HashMap<String, String> param);
//	문의삭제
	public void PQnaDelete(HashMap<String, String> param);
//	문의에 단 댓글 조회
	public ArrayList<Gu_PQnaReDto> PQnaCmtList(HashMap<String, String> param);
//	문의 댓글 작성
	public void PQnaCmtWrite(HashMap<String, String> param);
//	문의댓글 수정(원글보기) -> 댓글 수정 눌렀을때 원래 작성했던 내용
	public Gu_PQnaReDto PQnaCmtModifyView(HashMap<String, String> param);
//	문의 댓글 수정
	public void PQnaCmtModify(HashMap<String, String> param);
//	문의 댓글 삭제
	public void PQnaCmtDelete(HashMap<String, String> param);
}
