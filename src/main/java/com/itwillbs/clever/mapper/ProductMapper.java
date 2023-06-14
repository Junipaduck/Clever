package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.clever.vo.DibsVO;
import com.itwillbs.clever.vo.FileVO;
import com.itwillbs.clever.vo.MemberVO;
import com.itwillbs.clever.vo.ProductVO;
import com.itwillbs.clever.vo.ReportVO;

public interface ProductMapper {

	int insertProduct(@Param("map") Map<String, String> map, @Param("id") String id);

	// common.util 공용 패키지의 FileUpload.java 서비스를 불러오는 코드
	void insertFile(Map<String, Object> paramMap);

	int selectMax();

	List<HashMap<String, String>> selectProduct();

	List<HashMap<String, String>> selectProductDetail(int product_idx);
	
	int countDibs(int product_idx);

	int insertProductReport(ReportVO report);
	
	List<HashMap<String, Object>> selectProductSameCategory(ProductVO product);

	List<HashMap<String, String>> selectFile();

	List<HashMap<String, String>> selectFiles();

	int updateProduct(Map<String, String> map);

	// 중고상품 파일삭제 (수정중)
	Object deleteFile(FileVO file);

	int deleteProduct(ProductVO product);
	
	DibsVO selectDibsCheck(DibsVO dibs);

	int insertDibs(DibsVO like);

	int deleteDibs(DibsVO like);

	String sellerInfoCount(ProductVO product);
	
	// 카테고리 관련 (7개)
	List getProductList(String param);

	String getBigCategory(String param);

	List getMidCategory(String param);

	List getSmallCategory(String param);

	List getBigCategorys();

	List getMidCategorys(String param);

	List getSmallCategorys(String param);

	List selectProductSearch(String product_search);

	int deleteProductFile(int product_idx);

//	List<HashMap<String, String>> selectDibsProduct();
	
	//0614 보아 시작!!!!!!!!!!!!
	List<HashMap<String, String>> selectDibsProduct();

	int updateSaleStatus(int product_idx);

	int buyerWithdraw(@Param("sId") String sId, @Param("product_price") int product_price);

	int depositAdMoney(@Param("sId") String sId, @Param("product_price") int product_price);

	int withdrawAdMoney(@Param("buy_price") String buy_price, @Param("buy_seller") String buy_seller);

	int buyerDeposit(@Param("buy_price") String buy_price, @Param("buy_seller") String buy_seller);

	int updateMemAdMoney(@Param("sId") String sId, @Param("product_price") int product_price);

	String selectMemberInterest(@Param("sId") String sId, @Param("member") MemberVO member);

	List<HashMap<String, String>> selectIntCtgr(@Param("selectMemberInterest") String selectMemberInterest, @Param("product") ProductVO product);

	Object selectMemberInfo(String sId);

	int updateStatus(String product_idx);

	List<HashMap<String, String>> SellerFileList(String selectSellerId);

	String selectSellerId(int product_idx);

	Map<String, String> selectByInfo(int product_idx);

	int insertBuyProduct(@Param("selectByInfo") Map<String, String> selectByInfo, @Param("sId") String sId);

	int updateBuyerPoint(String sId);

	// 상세페이지 판매자 리뷰 조회
	List<HashMap<String, String>> selectReview(int product_idx);

	


//	List<HashMap<String, String>> selectMainProduct(List<HashMap<String, String>> selectDibsProduct);
}
