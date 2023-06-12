package com.itwillbs.clever.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.clever.common.util.FileUpload;
import com.itwillbs.clever.service.BankApiService;
import com.itwillbs.clever.service.BankService;
import com.itwillbs.clever.service.ProductService;
import com.itwillbs.clever.vo.AccountDetailVO;
import com.itwillbs.clever.vo.DibsVO;
import com.itwillbs.clever.vo.FileVO;
import com.itwillbs.clever.vo.ProductVO;
import com.itwillbs.clever.vo.ReportVO;
import com.itwillbs.clever.vo.ResponseUserInfoVO;

import kotlin.reflect.jvm.internal.impl.load.java.JavaClassFinder.Request;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// file테이블 업로드 관련 서비스 호출
	@Autowired
	FileUpload FileUpload;
	
	// 계좌이체 관련 
	@Autowired
	private BankApiService apiService;
	
	// 계좌이체 관련
	@Autowired
	private BankService bankService;
	
	// 로거 코드
	private static final Logger logger = LoggerFactory.getLogger(BankController.class);
	
	
	// 상품 리스트 
	@GetMapping("/product_list")
	public String productList(@RequestParam Map<String, String> map, Model model) {
		List<HashMap<String, String>> productList = productService.selectProduct(); //중고상품 select리스트
		model.addAttribute("productList", productList);

		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
		
		return "product/product_list";
	}
	
	// 상품 상세보기
	@GetMapping("/product_detail")
	public String productDetail(Model model, @RequestParam int product_idx, HttpSession session, ProductVO product) {
		// 중고상품 상세보기 select
		List<HashMap<String, String>> productDetail = productService.selectProductDetail(product_idx);
		model.addAttribute("productDetail", productDetail);
		
		// 중고상품 파일이미지 select
		List<HashMap<String, String>> filesList = productService.selectFiles(); // 중고상품 이미지 모두 select
		model.addAttribute("filesList", filesList);
		
		// 중고상품 같은카테고리의 연관상품 select
		List<HashMap<String, Object>> productSameCategory = productService.selectProductSameCategory(product);
		model.addAttribute("productSameCategory", productSameCategory);
		System.out.println("엠카테고리나와라 " + product.getProduct_Mcategory());
		
		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
		
		// 판매자정보의 판매중인상품 조회 select
		String sellerInfoCount = productService.sellerInfoCount(product);
		model.addAttribute("sellerInfoCount", sellerInfoCount);
		
		// 찜하기
		String sId = (String)session.getAttribute("sId");
		DibsVO dibs = new DibsVO();
		dibs.setDibs_type("product");
		dibs.setType_num(product_idx);
		dibs.setMember_id(sId);		
		
		DibsVO dibsCheck = productService.selectDibsCheck(dibs);
		
		if(dibsCheck != null) {
		} else {
			dibsCheck = new DibsVO();
			dibsCheck.setDibs_check(0);
		} 
		model.addAttribute("result", dibsCheck);
		
		return "product/product_detail";
	}
	
	// 중고상품 카테고리 이동
	@GetMapping(value = "product_category")
	public String product_category(@RequestParam Map<String, String> map, Model model) {
		List productList = productService.getProductList(map.get("param"));
		String bigCategory = productService.getBigCategory(map.get("param"));
		List bigCategorys = productService.getBigCategorys();
		List midCategorys = productService.getMidCategorys(map.get("param"));
		List smallCategorys = productService.getSmallCategorys(map.get("param"));
		List<HashMap<String, String>> fileList = productService.selectFile(); // 첫번째에 등록된 사진파일 가져오기
		
		if(bigCategory == null) { // 만약 대 카테고리가 비어있으면, 중 카테고리를 가져오고, 
			List midCategory = productService.getMidCategory(map.get("param"));
			if(midCategory.size() < 1) { // 그랬을 때 중 카테고리가 비어있으면 , 소 카테고리를 가져온다
				List smallCategory = productService.getSmallCategory(map.get("param"));
				model.addAttribute("smallCategory", smallCategory);
			} else {
				model.addAttribute("midCategory", midCategory);
			}
		} else {
			model.addAttribute("bigCategory", bigCategory);
		}
		
		model.addAttribute("bigCategorys", bigCategorys);
		model.addAttribute("midCategorys", midCategorys);
		model.addAttribute("smallCategorys", smallCategorys);
		model.addAttribute("productList", productList);
		model.addAttribute("categoryParam", map.get("param"));
		model.addAttribute("fileList", fileList); 
		
		return "product/product_category";
	}
	
	// 찜하기 상호작용 ajax 
		@ResponseBody
		@GetMapping("/dibsCheck")
		public int DibsCheck(int type_num, String member_id , HttpSession session, Model model, String dibs_type) {
			System.out.println("시발아!" + dibs_type);
			int result = -1;
			String sId = (String)session.getAttribute("sId");
			if(sId == null) {
				return result;
			}
		
			// 객체 생성 및 값 세팅 후 찜하기 또는 삭제 판별		
			DibsVO like = new DibsVO();
			like.setDibs_type(dibs_type);
			like.setType_num(type_num);
			like.setMember_id(sId);
					
			DibsVO dibsCheck = productService.selectDibsCheck(like);
			
			System.out.println("확인해주세요 " + dibsCheck);
			
			if(dibsCheck == null) {
				result = productService.insertDibs(like);
			} else {
				result = productService.deleteDibs(like);
				result = 0;
			}
			
			session.setAttribute("result", result);
					
			return result;
		}
	
	// 상품 등록하기
	@GetMapping("/product_upload")
	public String productUpload(HttpSession session, Model model) {
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		return "product/product_upload";
	}
	
	// 상품 관리하기
	@GetMapping("/product_management")
	public String productManagement() {
		return "product/product_management";
	}
	
	// 상품 구입 내역
	@GetMapping("/product_buy")
	public String productBuy() {
		return "product/product_buy";
	}
	
	// 상품 판매 내역
	@GetMapping("/product_sell")
	public String productSell() {
		return "product/product_sell";
	}
	
	// 중고 상품 등록 INSERT (썸네일)
//	@PostMapping("/productUploadPro")
//	public String productUproadPro(ProductVO product, HttpSession session, Model model) {
//		System.out.println(product);
//		
//		int insertCount = productService.insertProduct(product);
//		
//		if(insertCount > 0) {
//			model.addAttribute("msg", "등록이 완료되었습니다.");
//			model.addAttribute("target", "product_list");
//			return "success";
//		} else {
//			model.addAttribute("msg", "등록이 실패하였습니다.");
//			return "fail_back";
//		}
//	}
	
	
	// 중고 상품 등록 INSERT 
	@PostMapping("/productUploadPro")
	public String productUproadPro(ProductVO product
									, @RequestParam("image1") MultipartFile file1
									, @RequestParam("image2") MultipartFile file2
									, @RequestParam("image3") MultipartFile file3
									, @RequestParam("image4") MultipartFile file4
									, @RequestParam("image5") MultipartFile file5
									, @RequestParam("image6") MultipartFile file6
									, @RequestParam("image7") MultipartFile file7
									, @RequestParam("image8") MultipartFile file8
									, @RequestParam("image9") MultipartFile file9
									, @RequestParam("image10") MultipartFile file10
									, @RequestParam("image11") MultipartFile file11
									, @RequestParam("image12") MultipartFile file12
									, HttpSession session
									, Model model
									, @RequestParam Map<String, String> map) {
	
		String id = (String)session.getAttribute("sId");
		
//		System.out.println("카테고리 넘어오냐? " + map.get("product_category"));
		
		// 카테고리 분류
		String[] product_categorys = map.get("product_category").split(" > ");
		map.put("product_Lcategory", product_categorys[0]);
		map.put("product_Mcategory", product_categorys[1]);
		map.put("product_Scategory", product_categorys[2]);
		// 카테고리 분류 끝
		
		int insertCount = productService.insertProduct(map, id); //중고상품 insert 후 리턴받아온 int값
		
		MultipartFile[] fArr = {file1,file2,file3,file4,file5,file6,file7,file8,file9,file10,file11,file12};
		ArrayList<MultipartFile> file = new ArrayList<MultipartFile>();
		System.out.println(fArr); 
		for(int i = 0; i < fArr.length; i++) {
			if(!fArr[i].getOriginalFilename().equals("")) {
				file.add(fArr[i]);
			}
		}
		System.out.println(file);
		
		//---------- 파일 업로드 관련 작업 시작 -----------------------------------------------------------
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file_div", "product");
		paramMap.put("file_num", productService.selectMax());
		FileUpload.upload(file, session, paramMap);
		
		//---------- 파일 업로드 관련 작업 끝 ------------------------------------------------------------
		
		String result = "";
		if(insertCount > 0) { // 성공
			model.addAttribute("msg", "등록이 완료되었습니다.");
			model.addAttribute("target", "product_list");
			result = "success";
		} else { // 실패
			model.addAttribute("msg", "등록이 실패하였습니다.");
			result = "fail_back";
		}
		return result;
	}

	
	// 판매자 신고 폼으로 포워딩
	@GetMapping("/productReport")
	public String productReport(HttpSession session, Model model) {
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		} else {
			return "product/product_report";
		}
	}
	
	// 판매자 신고하기 (report 테이블에 insert)
	@PostMapping("/productReportPro")
	public String productReportPro(Model model, ReportVO report) {
		 
		int insertCount = productService.insertProductReport(report);
		
		String result = "";
		if(insertCount > 0) { // 성공
			model.addAttribute("msg", "신고가 완료되었습니다.");
			model.addAttribute("target", "product_list");
			result = "success";
		} else { // 실패
			model.addAttribute("msg", "신고를 실패하였습니다.");
			result = "fail_back";
		}
		return result;
	}
	
	// 중고상품 수정폼으로 포워딩
	@GetMapping("/productModifyForm")
	public String productModifyForm(Model model, @RequestParam int product_idx) {
		// 중고상품 상세보기 select
		List<HashMap<String, String>> productDetail = productService.selectProductDetail(product_idx);
		model.addAttribute("productDetail", productDetail);
		
		// 중고상품 파일이미지 select
		List<HashMap<String, String>> filesList = productService.selectFiles(); // 중고상품 이미지 모두 select
		model.addAttribute("filesList", filesList);
				
		return "product/product_modify_form";
	}
	
	// 중고상품 수정 Pro
	@PostMapping("/productModifyPro")
	public String productModifyPro(Model model, @RequestParam Map<String, String> map, ProductVO product
									, @RequestParam("image1") MultipartFile file1
									, @RequestParam("image2") MultipartFile file2
									, @RequestParam("image3") MultipartFile file3
									, @RequestParam("image4") MultipartFile file4
									, @RequestParam("image5") MultipartFile file5
									, @RequestParam("image6") MultipartFile file6
									, @RequestParam("image7") MultipartFile file7
									, @RequestParam("image8") MultipartFile file8
									, @RequestParam("image9") MultipartFile file9
									, @RequestParam("image10") MultipartFile file10
									, @RequestParam("image11") MultipartFile file11
									, @RequestParam("image12") MultipartFile file12
									, HttpSession session) {
		
		MultipartFile[] fArr = {file1,file2,file3,file4,file5,file6,file7,file8,file9,file10,file11,file12};
		ArrayList<MultipartFile> file = new ArrayList<MultipartFile>();
		System.out.println(fArr); 
		for(int i = 0; i < fArr.length; i++) {
			if(!fArr[i].getOriginalFilename().equals("")) {
				file.add(fArr[i]);
			}
		}
		if(!file.isEmpty()) {
			int product_idx = Integer.parseInt(map.get("product_idx")) ;
			int deleteCnt = productService.deleteProductFile(product_idx);
			System.out.println("이까지 오나?!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			if(deleteCnt > 0) {
				System.out.println("이까지 오나?");
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("file_div", "product");
				paramMap.put("file_num", map.get("product_idx"));
				FileUpload.upload(file, session, paramMap);
			}
		}
		
		// map.get("input태그의 name값")
		map.put("product_subject", map.get("product_subject"));
		map.put("sale_location", map.get("sale_location"));
		map.put("product_status", map.get("product_status"));
		map.put("product_price", map.get("product_price"));
		map.put("product_content", map.get("product_content"));
		map.put("product_idx", map.get("product_idx"));
		
		// 카테고리 분류
		String[] product_categorys = map.get("product_category").split(" > ");
		map.put("product_Lcategory", product_categorys[0]);
		map.put("product_Mcategory", product_categorys[1]);
		map.put("product_Scategory", product_categorys[2]);
		// 카테고리 분류 끝
		
		int updateCount = productService.updateProduct(map);
		
		String result = "";
		if(updateCount > 0) { // 성공
			model.addAttribute("msg", "수정이 완료되었습니다.");
			model.addAttribute("target", "product_detail?product_idx=" + product.getProduct_idx());
			result = "success";
		} else { // 실패
			model.addAttribute("msg", "수정을 실패하였습니다.");
			result = "fail_back";
		}
		return result;
	}
	
	
	//중고수정페이지에서 이미지파일삭제 (아직 안됨ㅠㅠ 쿼리에 하드코딩하면 실행되는데, where 절에 필요한 파라미터를 ajax의 data로 전달받는게 어렵네)
	@PostMapping("/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteQuery(FileVO file, @RequestParam String file_name) {
        // delete 구문 실행
        // 적절한 데이터베이스 연동 로직을 수행하여 해당 데이터를 삭제
		System.out.println("잠좀자자!!!!!!!!!!!!!!" + file_name + ", " + file.getFile_name());
		productService.deleteFile(file);
		
        // delete 구문이 성공적으로 실행되었다고 가정하고 성공 응답 반환
        return ResponseEntity.ok("Delete 구문 실행 성공");
    }
	
	
	// 중고상품 삭제하기
	@GetMapping("/deleteProduct")
	public String deleteProduct(ProductVO product, Model model) {
		int deleteCount = productService.deleteProduct(product);
		if(deleteCount > 0) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("target", "product_list");
			return "success";
		} else {			
			model.addAttribute("msg", "실패");
			return "fail_back";
		}
	}	
	
	
// 중고상품 계좌이체 관련 코드 시작 ========================================================================================	
	// 중고상품 상세페이지에서 [바로구매] 버튼 클릭 시 나오는 새창페이지
	@GetMapping("/payProduct")
	public String buyProduct(Model model, @RequestParam int product_idx, HttpSession session) {
		// 중고상품 상세보기 select
		List<HashMap<String, String>> productDetail = productService.selectProductDetail(product_idx);
		model.addAttribute("productDetail", productDetail);
		
		//파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		List<HashMap<String, String>> fileList = productService.selectFile(); 
		model.addAttribute("fileList", fileList);
		
		// 세션에 저장된 엑세스 토큰 및 사용자 번호 변수에 저장
		String access_token = (String)session.getAttribute("access_token");
		String user_seq_no =  (String)session.getAttribute("user_seq_no");
		System.out.println("access_token : " + access_token);
		System.out.println("user_seq_no : " + user_seq_no);
		
		// access_token 이 null 일 경우 "계좌 인증 필수" 메세지 출력 후 이전페이지로 돌아가기
		if(access_token == null) {
			model.addAttribute("msg", "계좌 인증 필수!");
			return "fail_back";
		}
		
		// 사용자 정보 조회(REST API 요청)		
		// BankApiService - requestUserInfo() 메서드 호출
		// => 파라미터 : 엑세스토큰, 사용자번호   리턴타입 : ResponseUserInfoVO(userInfo)
		ResponseUserInfoVO userInfo = apiService.requestUserInfo(access_token, user_seq_no);
		System.out.println(userInfo);
		
		// Model 객체에 ResponseUserInfoVO 객체 저장
		model.addAttribute("userInfo", userInfo);
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		} else {
			return "product/bank_user_info";
		}
	
	}
	
	// product_pay_form.jsp 에서 [계좌선택] 버튼 클릭 시 나오는 member_bank_accountDetail.jsp
	@PostMapping("member_bank_accountDetail")
	public String getAccountDetail(
			@RequestParam Map<String, String> map, HttpSession session, Model model) {
		// 미로그인 또는 엑세스토큰 없을 경우 "fail_back" 페이지를 통해
		// "권한이 없습니다!" 출력 후 이전페이지로 돌아가기
		if(session.getAttribute("sId") == null || session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "권한이 없습니다!");
			return "fail_back";
		}
		
		// 세션 객체의 엑세스 토큰을 Map 객체에 추가
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ member_bank_accountDetail : " + map);
		
		// BankApiService - requestAccountDetail() 메서드를 호출하여
		// 계좌 상세정보 조회 요청
		// => 파라미터 : Map 객체   리턴타입 : AccountDetailVO(account)
		AccountDetailVO account = apiService.requestAccountDetail(map);
		
		// 응답코드(rsp_code)가 "A0000" 가 아니면 에러 상황이므로 에러 처리
		// => "정보 조회 실패!" 출력 후 이전페이지로 돌아가기(fail_bank)
		// => 출력메세지에 응답메세지(rsp_message) 도 함께 출력
		if(account == null) {
			model.addAttribute("msg", "정보 조회 실패");
			return "fail_back";
		} else if(!account.getRsp_code().equals("A0000")) {
			model.addAttribute("msg", "정보 조회 실패 - " + account.getRsp_message());
			return "fail_back";
		}
		
		System.out.println(account);
		
		// AccountDetailVO 객체 저장
		model.addAttribute("account", account);
		model.addAttribute("account_num_masked", map.get("account_num_masked"));
		model.addAttribute("user_name", map.get("user_name"));
		
		return "product/member_bank_account_detail";
		
	}
	
	
	
	// 중고상품 계좌이체 Pro
//	@PostMapping("/withdrawProduct")
//	public String withdrawProduct(Model model, ProductVO product) {
//		return "product/product_pay_result";
//	}
	
// 중고상품 계좌이체 관련 코드 끝 ========================================================================================	
	
	
} // 컨트롤러 끝



















