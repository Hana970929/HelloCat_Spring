package com.hellocat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hellocat.dto.ProductDtoForStore;
import com.hellocat.service.CartServiceImpl;
import com.hellocat.service.MemberServiceImpl;
import com.hellocat.service.ProductServiceImpl;

@RestController
@RequestMapping(value="/infiniteScroll", produces="application/json; charset=utf-8")
public class infiniteScrollController {
	@Autowired
	ProductServiceImpl pdService; 
	@Autowired
	CartServiceImpl cartService;
	@Autowired
	MemberServiceImpl memberService;
	
	@RequestMapping(value = "/t")
	public List<ProductDtoForStore> home() {
		
		return null;
	}
}
