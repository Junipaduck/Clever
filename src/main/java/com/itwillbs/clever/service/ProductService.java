package com.itwillbs.clever.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ser.std.MapProperty;
import com.itwillbs.clever.mapper.ProductMapper;
import com.itwillbs.clever.vo.DibsVO;
import com.itwillbs.clever.vo.FileVO;
import com.itwillbs.clever.vo.MemberVO;
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
	
	// 중고상품 찜 select
	public int countDibs(int product_idx) {
		return mapper.countDibs(product_idx);
	}

	// 중고 판매자 신고 insert
	public int insertProductReport(ReportVO report) {
		return mapper.insertProductReport(report);
	}

	// 중고상품 카테고리가 같은 연관상품 select
	public List<HashMap<String, Object>> selectProductSameCategory(ProductVO product) {
		return mapper.selectProductSameCategory(product);
	}

	
	// 중고상품 사진파일 첫번째업로드한것 select
	public List<HashMap<String, String>> selectFile() {
		return mapper.selectFile();
	}

	// 중고상품 사진파일 전부 select
	public List<HashMap<String, String>> selectFiles() {
		return mapper.selectFiles();
	}

	// 중고상품 수정 update
	public int updateProduct(Map<String, String> map) {
		return mapper.updateProduct(map);
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

	// 판매자정보 조회
	public String sellerInfoCount(ProductVO product) {
		return mapper.sellerInfoCount(product);
	}
	
	// 카테고리 이동 관련 (7개)
	public List getProductList(String param) {
		return mapper.getProductList(param);
	}

	public String getBigCategory(String param) {
		return mapper.getBigCategory(param);
	}

	public List getMidCategory(String param) {
		return mapper.getMidCategory(param);
	}

	public List getSmallCategory(String param) {
		return mapper.getSmallCategory(param);
	}

	public List getBigCategorys() {
		return mapper.getBigCategorys();
	}

	public List getMidCategorys(String param) {
		return mapper.getMidCategorys(param);
	}

	public List getSmallCategorys(String param) {
		return mapper.getSmallCategorys(param);
	}
	// 카테고리 이동 관련 (7개) 끝

	public List selectProductSearch(String product_search) {
		return mapper.selectProductSearch(product_search);
	}

	// 중고상품 수정 시 파일 삭제
	public int deleteProductFile(int product_idx) {
		return mapper.deleteProductFile(product_idx);
	}

	public int updateSaleStatus(int product_idx) {
		return mapper.updateSaleStatus(product_idx);
	}

	public int buyerWithdraw(String sId, int product_price) {
		return mapper.buyerWithdraw(sId, product_price);
	}

	public int depositAdMoney(String sId, int product_price) {
		return mapper.depositAdMoney(sId, product_price);
	}

	public int withdrawAdMoney(String buy_price, String buy_seller) {
		return mapper.withdrawAdMoney(buy_price, buy_seller);
	}

	public int buyerDeposit(String buy_price, String buy_seller) {
		return mapper.buyerDeposit(buy_price, buy_seller);
	}

	public int updateMemAdMoney(String sId, int product_price) {
		return mapper.updateMemAdMoney(sId, product_price);
	}

	public String selectMemberInterest(String sId, MemberVO member) {
		return mapper.selectMemberInterest(sId, member);
	}

	public List<HashMap<String, String>> selectIntCtgr(String selectMemberInterest, ProductVO product) {
		return mapper.selectIntCtgr(selectMemberInterest, product);
	}

	//0614 보아 시작!!!!!!!!!!!!
	// 찜 순위에 따른 상품 조회
	public List<HashMap<String, String>> selectDibsProduct() {
		return mapper.selectDibsProduct();
	}

	public Object selectMemberInfo(String sId) {
		return mapper.selectMemberInfo(sId);
	}

	// 마이페이지 - 구매확정 시 상태 업데이트
	public int updateStatus(String product_idx) {
		return mapper.updateStatus(product_idx);
	}

	public List<HashMap<String, String>> SellerFileList(String selectSellerId) {
		return mapper.SellerFileList(selectSellerId);
	}

	public String selectSellerId(int product_idx) {
		return mapper.selectSellerId(product_idx);
	}

	public Map<String, String> selectByInfo(int product_idx) {
		return mapper.selectByInfo(product_idx);
	}

	public int insertBuyProduct(Map<String, String> selectByInfo, String sId) {
		return mapper.insertBuyProduct(selectByInfo, sId);
	}

	public int updateBuyerPoint(String sId) {
		return mapper.updateBuyerPoint(sId);
	}

	// 상세 페이지 판매자 리뷰 조회
	public List<HashMap<String, String>> selectReview(int product_idx) {
		
		return mapper.selectReview(product_idx);
	}

	// 상품등록시 계좌인증 여부 확인
	public String selectMemberAccountAuth(String sId) {
		return mapper.selectMemberAccountAuth(sId);
	}

	

}
