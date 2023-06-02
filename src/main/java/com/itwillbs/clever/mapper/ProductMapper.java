package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itwillbs.clever.vo.ProductVO;

public interface ProductMapper {

	int insertProduct(ProductVO product);

	// common.util 공용 패키지의 FileUpload.java 서비스를 불러오는 코드
	void insertFile(Map<String, Object> paramMap);

	int selectMax();

	List<HashMap<String, String>> selectProduct();

	List<HashMap<String, String>> selectProductDetail(int product_idx);

//	int insertProductReport(int product_idx);

	List<HashMap<String, Object>> selectProductSameCategory(int product_idx);

	List<HashMap<String, String>> selectFile();

	List<HashMap<String, String>> selectFiles();






	
}
