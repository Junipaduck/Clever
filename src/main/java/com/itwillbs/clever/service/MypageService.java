package com.itwillbs.clever.service;

import java.util.HashMap;
import java.util.List;

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

	public int updateAuctionStatus(int auction_idx) {
		return mapper.updateAuctionStatus(auction_idx);
	}

	public int buyerWithdraw(String sId, int auction_final_price) {
		return mapper.buyerWithdraw(sId, auction_final_price);
	}

	public int depositAdMoney(String sId, int auction_final_price) {
		return mapper.depositAdMoney(sId, auction_final_price);
	}

	public int withdrawAdMoney(String auction_final_price, String member_id) {
		return mapper.withdrawAdMoney(auction_final_price, member_id);
	}

	public int buyerDeposit(String auction_final_price, String member_id) {
		return mapper.buyerDeposit(auction_final_price, member_id);
	}

	public int updateMemAdMoney(String sId, int auction_final_price) {
		return mapper.updateMemAdMoney(sId, auction_final_price);
	}

	public List<HashMap<String, String>> selectReportList(String sId) {
		return mapper.selectReportList(sId);
	}
	
	
}
