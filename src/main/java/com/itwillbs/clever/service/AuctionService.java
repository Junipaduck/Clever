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
	
}
