package com.itwillbs.clever.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.MypageMapper;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;

	// 중고거래 판매내역 조회
	public List<HashMap<String, String>> selectProductSellList(String sId) {
		return mapper.selectProductSellList(sId);
	}

	// 중고거래 판매날짜 조회
	public List<HashMap<String, String>> selectProductSellDate(String sId) {
		return mapper.selectProductSellDate(sId);
	}
	
	// 중고거래 구매내역 조회
	public List<HashMap<String, String>> selectProductBuyList(String sId) {
		return mapper.selectProductBuyList(sId);
	}
	
	// 중고거래 찜 조회
	public List<HashMap<String, String>> selectProductDibsList(String sId) {
		return mapper.selectProductDibsList(sId);
	}

	// 경매 등록 내역
	public List<HashMap<String, String>> selectAuctionList(String sId) {
		return mapper.selectAuctionList(sId);
	}
	
	// 경매 낙찰 내역
	public List<HashMap<String, String>> selectAuctionBidList(String sId) {
		return mapper.selectAuctionBidList(sId);
	}
	
	// 경매 찜 조회
	public List<HashMap<String, String>> selectAutionDibsList(String sId) {
		return mapper.selectAutionDibsList(sId);
	}
	
	// 경매 찜 파일 조회
	public List<HashMap<String, String>> selectAuctionFile() {
		return mapper.selectAuctionFile();
	}

	// 굿즈 구매 내역
	public List<HashMap<String, String>> selectGoodsList(String sId) {
		return mapper.selectGoodsList(sId);
	}
	
	// 신고내역 조회
	public List<HashMap<String, String>> selectReportList(String sId) {
		return mapper.selectReportList(sId);
	}

	// 멤버 등급 조회
	public List<HashMap<String, String>> selectMemberGrade(String sId) {
		return mapper.selectMemberGrade(sId);
	}

	// 후기 작성 
	public int insertReview(Map<String, String> map) {
		return mapper.insertReview(map);
	}
	
	// 리뷰 체크?
	public List<HashMap<String, String>> selectReviewCheck(String sId) {
		return mapper.selectReviewCheck(sId);
	}
	
	// 경매 상품 특정idx만 select
	public List<HashMap<String, String>> selectAuctionDetail(int auction_idx) {
		return mapper.selectAuctionDetail(auction_idx);
	}

	public Object selectMemberInfo(String sId) {
		return mapper.selectMemberInfo(sId);
	}

	public int updateAuctionStatus(int auction_idx) {
		return mapper.updateAuctionStatus(auction_idx);
	}

	public int updateMemAdMoney(String sId, int auction_final_price) {
		return mapper.updateMemAdMoney(sId, auction_final_price);
	}

	public int buyerWithdraw(String sId, int auction_final_price) {
		return mapper.buyerWithdraw(sId, auction_final_price);
	}

	public int depositAdMoney(String sId, int auction_final_price) {
		return mapper.depositAdMoney(sId, auction_final_price);
	}

	public Map<String, String> selectByInfo(int auction_idx) {
		return mapper.selectByInfo(auction_idx);
	}

	public int insertBuyAuction(Map<String, String> selectByInfo, String sId) {
		return mapper.insertBuyAuction(selectByInfo, sId);
	}

	public int withdrawAdMoney(String auction_buy_price, String auction_buy_seller) {
		return mapper.withdrawAdMoney(auction_buy_price, auction_buy_seller);
	}

	public int buyerDeposit(String auction_buy_price, String auction_buy_seller) {
		return mapper.buyerDeposit(auction_buy_price, auction_buy_seller);
	}

	// 마이페이지 - 구매확정 시 상태 업데이트
	public int updateStatus(String auction_idx) {
		return mapper.updateStatus(auction_idx);
	}

	public int updateAStatus(String auction_idx) {
		return mapper.updateAStatus(auction_idx);
	}

	public List<HashMap<String, String>> selectGoodsFile() {
		return mapper.selectGoodsFile();
	}
	
	public int deletePDibs(String sId, int type_num) {
		return mapper.deletePDibs(sId, type_num);
	}

	public int deleteADibs(String sId, int type_num) {
		return mapper.deleteADibs(sId, type_num);
	}

	// 멤버 잔액 조회
	public HashMap<String, String> getMemberInfo(String id) {
		
		return mapper.getMemberInfo(id);
	}

	public int deleteGoods(String sId, int buy_idx) {
		return mapper.deleteGoods(sId, buy_idx);
	}

}
