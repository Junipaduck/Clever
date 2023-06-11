package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.*;

@Service
public class GoodsService {

	@Autowired
	GoodsMapper mapper;

	public int insertGoods(GoodsVO goods) {
		
		return mapper.insertGoods(goods);
	}

	//file 테이블의 file_num의 max값 select
	public int selectMax() {
		
		return mapper.selectMax();
	}

	// 굿즈 목록 조회
	public List<HashMap<String, String>> getGoodsList() {
		
		return mapper.selectGoodsList();
	}

	// 굿즈 수정용 굿즈 목록 조회
	public HashMap<String, String> getGoods(int goods_idx) {
		
		return mapper.selectGoods(goods_idx);
	}

	// 굿즈 수정 
	public int updateGoods(GoodsVO goods) {
		
		return mapper.updateGoods(goods);
	}

	// 파일테이블에서 굿즈 이미지 조회
	public List<HashMap<String, String>> selectFile() {
		
		return mapper.selectFile();
	}

	// 굿즈 파일 삭제
	public int deleteGoodsFile(FileVO file) {
		return mapper.deleteGoodsFile(file);
	}

	// 굿즈 파일 셀렉트
	public List<HashMap<String, String>> selectGoodsFiles() {
		
		return mapper.selectGoodsFiles();
	}

	// 굿즈 상세페이지
	public List<HashMap<String, String>> getGoodsDetail(int goods_idx) {
		
		return mapper.selectGoodsDetail(goods_idx);
	}

	// 굿즈 파일 이미지 전체 셀렉트
	public List<HashMap<String, String>> selectFiles() {
		
		return mapper.selectFiles();
	}

	// 굿즈 포인트 결제창에서 정보 조회
	public MemberVO getMemberInfo(String id) {
		
		return mapper.selectMemberInfo(id);
	}

	
}
