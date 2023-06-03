package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.clever.vo.FileVO;
import com.itwillbs.clever.vo.ProductVO;
import com.itwillbs.clever.vo.ReportVO;

public interface ProductMapper {

	int insertProduct(ProductVO product);

	// common.util 공용 패키지의 FileUpload.java 서비스를 불러오는 코드
	void insertFile(Map<String, Object> paramMap);

	int selectMax();

	List<HashMap<String, String>> selectProduct();

	List<HashMap<String, String>> selectProductDetail(int product_idx);

	int insertProductReport(ReportVO report);
	
	List<HashMap<String, Object>> selectProductSameCategory(int product_idx);

	List<HashMap<String, String>> selectFile();

	List<HashMap<String, String>> selectFiles();

	int updateProduct(ProductVO product);

	// 중고상품 파일삭제 (수정중)
	Object deleteFile(FileVO file);






	
}
