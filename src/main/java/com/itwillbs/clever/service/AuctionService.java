package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;

@Service
public class AuctionService {
	
	@Autowired
	private AuctionMapper mapper;
	
	public int insertAutcion(Map<String, String> map, String id) {
		return mapper.insertAutcion(map,id);
	}

	public List selectImminent() {
		return mapper.selectImminent();
	}

	public List selectHotList() {
		return mapper.selectHotList();
	}

	public List selectCurrent() {
		return mapper.selectCurrent();
	}

	public Object selectMax() {
		return mapper.selectMax();
	}

	public List selectFiles() {
		return mapper.selectFiles();
	}
	public Map<String, String> detailList(int auction_idx) {
		return mapper.selectDetailList(auction_idx);
	}

	public List selectProductSearch(String auction_search) {
		return mapper.selectProductSearch(auction_search);
	}

	public List selectMemberSearch(String auction_search) {
		return mapper.selectMemberSearch(auction_search);
	}

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
	
	public void updatePrice(int auction_idx, int auction_final_price) {
		mapper.updatePrice(auction_idx, auction_final_price);
	}

	public List selectFilesIdx(int auction_idx) {
		return mapper.selectFilesIdx(auction_idx);
	}

	public int detailModify(Map<String, String> map) {
		return mapper.detailModify(map);
	}

	public int readCountUp(int auction_idx) {
		return mapper.readCountUp(auction_idx);
	}

	public int dibsCount(int auction_idx) {
		return mapper.dibsCount(auction_idx);
	}

	public int deleteAution(int auction_idx) {
		return mapper.deleteAution(auction_idx);
	}

	public int deleteAutionFile(int auction_idx) {
		return mapper.deleteAutionFile(auction_idx);
	}

	public void updateConfirmed(String buyer_id, int auction_idx) {
		mapper.updateConfirmed(buyer_id, auction_idx);
	}

	public HashMap<String, String> selectAcution(int auctionIdx) {
		// TODO Auto-generated method stub
		return mapper.selectAcution(auctionIdx);
	
	}

	public void updateDate(int auctionIdx, String chatId) {
		mapper.updateDate(auctionIdx, chatId);
	}

}
