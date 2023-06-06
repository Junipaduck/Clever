package com.itwillbs.clever.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.ProductMapper;
import com.itwillbs.clever.vo.DibsVO;
import com.itwillbs.clever.vo.FileVO;
import com.itwillbs.clever.vo.ProductVO;
import com.itwillbs.clever.vo.ReportVO;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;

	// 중고상품 INSERT
	public int insertProduct(Map<String, String> map, String id) {
		return mapper.insertProduct(map, id);
	}
	
//	public void insertFile(Map<String, Object> paramMap) { //리턴 안할때는 void
//		mapper.insertFile(paramMap);
//	}
	
	// file 테이블의 file_num(= product테이블의 product_idx)의 max값을 select함
	public int selectMax() {
		return mapper.selectMax();
	}

	// 중고상품 전체 select
	public List<HashMap<String, String>> selectProduct() {
		return mapper.selectProduct();
	}

	// 중고상품 특정idx만 select 
	public List<HashMap<String, String>> selectProductDetail(int product_idx) {
		return mapper.selectProductDetail(product_idx);
	}

	// 중고 판매자 신고 insert
	public int insertProductReport(ReportVO report) {
		return mapper.insertProductReport(report);
	}

	// 중고상품 카테고리가 같은 연관상품 select
//	public List<HashMap<String, Object>> selectProductSameCategory(int product_idx) {
//		return mapper.selectProductSameCategory(product_idx);
//	}

	
	// 중고상품 사진파일 첫번째업로드한것 select
	public List<HashMap<String, String>> selectFile() {
		return mapper.selectFile();
	}

	// 중고상품 사진파일 전부 select
	public List<HashMap<String, String>> selectFiles() {
		return mapper.selectFiles();
	}

	// 중고상품 수정 update
	public int updateProduct(ProductVO product) {
		return mapper.updateProduct(product);
	}

	// 중고상품 파일삭제 (수정중)
	public Object deleteFile(FileVO file) {
		return mapper.deleteFile(file);
	}

	// 중고상품 삭제 delete
	public int deleteProduct(ProductVO product) {
		return mapper.deleteProduct(product);
	}

	// 찜하기 조회
	public DibsVO selectDibsCheck(DibsVO dibs) {
		return mapper.selectDibsCheck(dibs);
	}
	
	// 찜하기 
	public int insertDibs(DibsVO like) {
		return mapper.insertDibs(like);
	}

	// 찜하기 삭제
	public int deleteDibs(DibsVO like) {
		return mapper.deleteDibs(like);
	}
	
	
}
